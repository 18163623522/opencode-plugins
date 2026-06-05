"""
Computer Use Helper - Cross-platform desktop control via Python.

Based on cc-haha's mac_helper.py architecture, adapted for opencode.
Supports macOS (pyobjc) and Windows/Linux (pyautogui).
"""

import sys
import json
import platform
import base64
import io
import argparse
from typing import Any, Dict, Optional

# Lazy imports for faster startup
_mss = None
_pyautogui = None
_Image = None

def get_mss():
    global _mss
    if _mss is None:
        import mss
        _mss = mss
    return _mss

def get_pyautogui():
    global _pyautogui
    if _pyautogui is None:
        import pyautogui
        pyautogui.FAILSAFE = True  # Move mouse to corner to abort
        pyautogui.PAUSE = 0.01
        _pyautogui = pyautogui
    return _pyautogui

def get_pil():
    global _Image
    if _Image is None:
        from PIL import Image
        _Image = Image
    return _Image


def json_output(data: Any) -> None:
    """Output JSON result to stdout."""
    print(json.dumps({"ok": True, "result": data}))

def error_output(message: str) -> None:
    """Output JSON error to stdout."""
    print(json.dumps({"ok": False, "error": {"message": message}}))


def cmd_screenshot(payload: Dict) -> Dict:
    """Take a screenshot and return base64 encoded JPEG."""
    mss_lib = get_mss()
    Image = get_pil()

    with mss_lib.mss() as sct:
        region = payload.get("region")
        if region:
            monitor = {
                "left": region["x"],
                "top": region["y"],
                "width": region["width"],
                "height": region["height"],
            }
        else:
            monitor = sct.monitors[0]  # Entire screen

        screenshot = sct.grab(monitor)

        # Convert to JPEG
        img = Image.frombytes("RGB", screenshot.size, screenshot.bgra, "raw", "BGRX")

        # Resize if too large (max 1568px on longest side)
        max_dim = 1568
        w, h = img.size
        if max(w, h) > max_dim:
            scale = max_dim / max(w, h)
            img = img.resize((int(w * scale), int(h * scale)), Image.LANCZOS)

        buf = io.BytesIO()
        img.save(buf, format="JPEG", quality=80)
        b64 = base64.b64encode(buf.getvalue()).decode("ascii")

        return {
            "base64": b64,
            "width": img.size[0],
            "height": img.size[1],
            "displayWidth": monitor.get("width", screenshot.size[0]),
            "displayHeight": monitor.get("height", screenshot.size[1]),
        }


def cmd_click(payload: Dict) -> bool:
    """Click at the specified position."""
    pag = get_pyautogui()
    x = int(payload["x"])
    y = int(payload["y"])
    button = payload.get("button", "left")
    clicks = int(payload.get("clicks", 1))

    if clicks == 2:
        pag.doubleClick(x, y, button=button)
    elif clicks == 3:
        pag.tripleClick(x, y, button=button)
    else:
        pag.click(x, y, button=button)
    return True


def cmd_type(payload: Dict) -> bool:
    """Type text at current cursor position."""
    pag = get_pyautogui()
    text = payload["text"]
    interval = float(payload.get("interval", 0.008))
    pag.write(text, interval=interval)
    return True


def cmd_key(payload: Dict) -> bool:
    """Press a keyboard key or shortcut."""
    pag = get_pyautogui()
    key = payload["key"]

    # Handle key combinations (e.g., "ctrl+c", "command+shift+a")
    if "+" in key:
        parts = [k.strip() for k in key.split("+")]
        # Map common names
        key_map = {
            "ctrl": "ctrl", "control": "ctrl",
            "cmd": "command", "command": "command",
            "alt": "alt", "option": "alt",
            "shift": "shift",
            "enter": "enter", "return": "enter",
            "tab": "tab", "space": "space",
            "esc": "escape", "escape": "escape",
            "backspace": "backspace", "delete": "delete",
            "up": "up", "down": "down", "left": "left", "right": "right",
            "home": "home", "end": "end",
            "pageup": "pageup", "pagedown": "pagedown",
        }
        mapped = [key_map.get(k.lower(), k) for k in parts]
        pag.hotkey(*mapped)
    else:
        key_map = {
            "enter": "enter", "return": "enter",
            "tab": "tab", "space": "space",
            "esc": "escape", "escape": "escape",
            "backspace": "backspace", "delete": "delete",
            "up": "up", "down": "down", "left": "left", "right": "right",
        }
        pag.press(key_map.get(key.lower(), key))
    return True


def cmd_scroll(payload: Dict) -> bool:
    """Scroll the mouse wheel."""
    pag = get_pyautogui()
    dx = int(payload.get("dx", 0))
    dy = int(payload.get("dy", 0))
    x = payload.get("x")
    y = payload.get("y")

    if x is not None and y is not None:
        pag.moveTo(int(x), int(y))

    if dy != 0:
        pag.scroll(dy)
    if dx != 0:
        pag.hscroll(dx)
    return True


def cmd_mouse_move(payload: Dict) -> bool:
    """Move the mouse cursor."""
    pag = get_pyautogui()
    x = int(payload["x"])
    y = int(payload["y"])
    duration = float(payload.get("duration", 0.1))
    pag.moveTo(x, y, duration=duration)
    return True


def cmd_drag(payload: Dict) -> bool:
    """Drag from current position to target."""
    pag = get_pyautogui()
    x = int(payload["x"])
    y = int(payload["y"])
    duration = float(payload.get("duration", 0.2))
    pag.dragTo(x, y, duration=duration)
    return True


def cmd_list_running_apps(payload: Dict) -> list:
    """List currently running applications."""
    system = platform.system()

    if system == "Darwin":
        try:
            from AppKit import NSWorkspace
            workspace = NSWorkspace.sharedWorkspace()
            apps = workspace.runningApplications()
            result = []
            for app in apps:
                if app.activationPolicy() == 0:  # Regular applications
                    result.append({
                        "name": str(app.localizedName()),
                        "bundleId": str(app.bundleIdentifier() or ""),
                        "pid": app.processIdentifier(),
                        "active": bool(app.isActive()),
                    })
            return result
        except ImportError:
            pass

    # Fallback for Windows/Linux
    try:
        import psutil
        result = []
        for proc in psutil.process_iter(["pid", "name"]):
            try:
                name = proc.info["name"]
                if name and not name.startswith("System") and name != "svchost.exe":
                    result.append({"name": name, "pid": proc.info["pid"]})
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                pass
        return result[:50]  # Limit to 50
    except ImportError:
        return [{"error": "psutil not available"}]


def cmd_frontmost_app(payload: Dict) -> Dict:
    """Get the currently active/focused application."""
    system = platform.system()

    if system == "Darwin":
        try:
            from AppKit import NSWorkspace
            workspace = NSWorkspace.sharedWorkspace()
            app = workspace.frontmostApplication()
            return {
                "name": str(app.localizedName()),
                "bundleId": str(app.bundleIdentifier() or ""),
                "pid": app.processIdentifier(),
            }
        except ImportError:
            pass

    # Fallback
    return {"name": "unknown", "bundleId": "", "pid": 0}


def cmd_check_permissions(payload: Dict) -> Dict:
    """Check system permissions for Computer Use."""
    system = platform.system()

    if system == "Darwin":
        try:
            import subprocess
            # Check accessibility
            result = subprocess.run(
                ["osascript", "-e", 'tell application "System Events" to return "ok"'],
                capture_output=True, text=True, timeout=5
            )
            accessibility = result.returncode == 0
        except Exception:
            accessibility = False

        return {
            "accessibility": accessibility,
            "screenRecording": True,  # Hard to check programmatically
            "platform": "macOS",
        }

    return {"accessibility": True, "screenRecording": True, "platform": system}


def dispatch(command: str, payload: Dict) -> Any:
    """Dispatch command to the appropriate handler."""
    handlers = {
        "screenshot": cmd_screenshot,
        "click": cmd_click,
        "type": cmd_type,
        "key": cmd_key,
        "scroll": cmd_scroll,
        "mouse_move": cmd_mouse_move,
        "drag": cmd_drag,
        "list_running_apps": cmd_list_running_apps,
        "frontmost_app": cmd_frontmost_app,
        "check_permissions": cmd_check_permissions,
    }

    handler = handlers.get(command)
    if not handler:
        raise ValueError(f"Unknown command: {command}")

    return handler(payload)


def main():
    parser = argparse.ArgumentParser(description="Computer Use Helper")
    parser.add_argument("command", help="Command to execute")
    parser.add_argument("--payload", type=str, default="{}", help="JSON payload")
    args = parser.parse_args()

    try:
        payload = json.loads(args.payload)
        result = dispatch(args.command, payload)
        json_output(result)
    except Exception as e:
        error_output(str(e))


if __name__ == "__main__":
    main()
