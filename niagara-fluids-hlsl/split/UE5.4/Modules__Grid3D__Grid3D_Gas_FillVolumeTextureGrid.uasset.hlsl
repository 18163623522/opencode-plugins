int IGNORE = 0;
Grid.SetVectorValue<Attribute="Velocity">(IndexX, IndexY, IndexZ, Velocity);
Grid.SetFloatValue<Attribute="Density">(IndexX, IndexY, IndexZ, Density);
Grid.SetFloatValue<Attribute="Temperature">(IndexX, IndexY, IndexZ, Temperature);
Grid.SetGridValue(IndexX, IndexY, IndexZ, 0, Velocity.x, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, 0, Velocity.y, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, 0, Velocity.z, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, 0, Density, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, 0, Temperature, IGNORE);

