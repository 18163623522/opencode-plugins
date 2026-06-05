@echo off
REM Computer Use - Python Environment Setup
REM Run this once to install dependencies for desktop control

echo [ComputerUse] Setting up Python virtual environment...

set VENV_DIR=%USERPROFILE%\.config\opencode\mcp-servers\computer-use\.venv
set REQ_FILE=%~dp0requirements.txt

REM Create venv
if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo [ComputerUse] Creating virtual environment...
    python -m venv "%VENV_DIR%"
    if errorlevel 1 (
        echo [ERROR] Failed to create venv. Make sure Python 3.8+ is installed.
        exit /b 1
    )
) else (
    echo [ComputerUse] Virtual environment already exists.
)

REM Install dependencies
echo [ComputerUse] Installing dependencies...
"%VENV_DIR%\Scripts\pip.exe" install -r "%REQ_FILE%" --quiet
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies.
    exit /b 1
)

echo [ComputerUse] Setup complete!
echo [ComputerUse] Python: %VENV_DIR%\Scripts\python.exe
echo.
echo You can now use /screenshot and /desktop commands in opencode.
