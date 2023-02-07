local AutoBuilder = {}

-- Automatic Building ModuleScript

-- Determines the maximum size of a building
function getMaxBuildingSize (length, width, height)
	-- calculate the maximum length and width
	local maxLength = length * 0.9
	local maxWidth = width * 0.9

	-- calculate the maximum height
	local maxHeight = 0

	-- set the maximum height according to the length and width
	if maxLength <= 5 and maxWidth <= 5 then
		maxHeight = 15
	else 
		maxHeight = 10
	end

	-- return the maximum size of the building
	return maxLength, maxWidth, maxHeight
end

-- Auto-adjusts the components of a building to fit the maximum size
function adjustBuildingSize (length, width, height)
	-- calculate the maximum size
	local maxLength, maxWidth, maxHeight = getMaxBuildingSize(length, width, height)

	-- adjust the length and width
	local adjustedLength = math.min(length, maxLength)
	local adjustedWidth = math.min(width, maxWidth)

	-- adjust the height
	local adjustedHeight = 0
	if adjustedLength < 5 and adjustedWidth < 5 then
		adjustedHeight = math.min(height, maxHeight)
	else
		adjustedHeight = math.min(height, 5)
	end

	-- return the adjusted sizes
	return adjustedLength, adjustedWidth, adjustedHeight
end

-- Determines the dimensions of a building
function getBuildingDimensions (length, width, height)
	-- adjust the size of the building
	local adjustedLength, adjustedWidth, adjustedHeight = adjustBuildingSize(length, width, height)

	-- determine the total volume of the building
	local totalVolume = adjustedLength * adjustedWidth * adjustedHeight

	return adjustedLength, adjustedWidth, adjustedHeight, totalVolume
end

-- Generates a flat terrain of the specified size
function generateFlatTerrain (length, width)
	-- generate a flat terrain
	local flatTerrain = game.Workspace:FindFirstChild('Terrain'):Clone()
	flatTerrain.Size = Vector3.new(length, width, 5)
	flatTerrain.Parent = game.Workspace

	-- return the generated terrain
	return flatTerrain
end

-- Creates a floor for a building on the given terrain
function generateBuildingFloor (flatTerrain, length, width)
	-- create the building floor part
	local floorPart = Instance.new('Part', game.Workspace)
	floorPart.Orientation = Vector3.new(0, 0, 0)
	floorPart.Position = flatTerrain.Position + Vector3.new(0, 0, 5)
	floorPart.Size = Vector3.new(length, width, 0.1)
	floorPart.BrickColor = BrickColor.White()
	floorPart.Friction = 0

	-- return the generated floor
	return floorPart
end

-- Generates the walls for the building
function generateBuildingWalls (floorPart, length, width, height)
	-- generate the walls of the building
	local wallPart = Instance.new('Part', game.Workspace)
	wallPart.Orientation = Vector3.new(0, 0, 0)
	wallPart.Position = floorPart.Position + Vector3.new(0, 0, height)
	wallPart.Size = Vector3.new(length, 0.1, height)
	wallPart.BrickColor = BrickColor.White()
	wallPart.Friction = 0

	-- rotate and generate the four walls
	for i = 1, 4 do
		local wallCopy = wallPart:Clone()
		wallCopy.Position = wallPart.Position + Vector3.new((i-1)*length/2 - length/4, (i%2-1)*width/2 - width/4, 0)
		wallCopy.Orientation = Vector3.new(0, 0, (i - 1) * 90)
	end
end

-- Generates a roof for the building
function generateBuildingRoof (flatTerrain, length, width)
	-- generate the roof of the building
	local roofPart = Instance.new('Part', game.Workspace)
	roofPart.Orientation = Vector3.new(0, 0, 0)
	roofPart.Position = flatTerrain.Position + Vector3.new(0, 0, 10)
	roofPart.Size = Vector3.new(length, width, 0.1)
	roofPart.BrickColor = BrickColor.White()
	roofPart.Friction = 0

	-- return the generated roof
	return roofPart
end

-- Generates a window on the building
function generateBuildingWindow (wallPart, length, height)
	-- generate the window
	local windowPart = Instance.new('Part', game.Workspace)
	windowPart.Orientation = Vector3.new(0, 0, 0)
	windowPart.Position = wallPart.Position + Vector3.new(-length/4, 0, (height/2)+1)
	windowPart.Size = Vector3.new(length/2, 0.1, height/2)
	windowPart.BrickColor = BrickColor.DarkGray()

	-- add an open indicator
	windowPart.Transparency = 0.8

	-- return the generated window
	return windowPart
end

-- Generates the stairs for the building
function generateBuildingStairs (floorPart, height)
	-- determine the number of steps
	local numSteps = math.ceil(height/2)

	-- generate the first step
	local stepPart = Instance.new('Part', game.Workspace)
	stepPart.Orientation = Vector3.new(0, 0, 0)
	stepPart.Position = floorPart.Position + Vector3.new(0, 0, height-1)
	stepPart.Size = Vector3.new(2, 0.1, 1)
	stepPart.BrickColor = BrickColor.White()

	-- generate the remaining steps
	local stepCopy = stepPart:Clone()
	for i = 2, numSteps do
		stepCopy.Position = stepPart.Position + Vector3.new(0, 0, -(i-1))
	end
end

return AutoBuilder
