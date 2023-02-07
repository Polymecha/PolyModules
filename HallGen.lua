local HallGen = {}

-- This function will add staircases at random locations on the walls
function RandomStaircases(sizeX)
	staircaseModel = Instance.new("Model", workspace)
	staircaseModel.Name = "HallwayStaircases"
	local randnum = math.random(2,sizeX - 1)
	local offset = -math.floor(sizeX/2) + 1

	for i = 0, randnum do
		local leftStairs = Instance.new("WedgePart", staircaseModel)
		leftStairs.Name = "LeftStairs"
		leftStairs.Anchored = true
		leftStairs.BrickColor = BrickColor.new(-2)
		leftStairs.Material = "Grass"
		leftStairs.Orientation = Vector3.new(0, 180, 0)
		leftStairs.Size = Vector3.new(1,2,2)
		leftStairs.CFrame = CFrame.new(i + offset, 0, 1)

		local rightStairs = Instance.new("WedgePart", staircaseModel)
		rightStairs.Name = "RightStairs"
		rightStairs.Anchored = true
		rightStairs.BrickColor = BrickColor.new(-2)
		rightStairs.Material = "Grass"
		rightStairs.Orientation = Vector3.new(0, 180, 0)
		rightStairs.Size = Vector3.new(1,2,2)
		rightStairs.CFrame = CFrame.new(-i * -1 - offset, 0, -1)
	end
end

-- This function will create walls and a floor for the hallway 
function MakeHallway(sizeX, sizeY, distance)
	local walls = Instance.new("Model", workspace)
	walls.Name = "HallwayPart"

	for i=1, sizeX do
		local left = Instance.new("Part", walls)
		left.Name = "LeftWall"
		left.Anchored = true
		left.BrickColor = BrickColor.new(-1)
		left.Material = "Grass"
		left.Size = Vector3.new(2,sizeY,2)
		left.CFrame = CFrame.new(i + distance, 1, 0)

		local right = Instance.new("Part", walls)
		right.Name = "RightWall"
		right.Anchored = true
		right.BrickColor = BrickColor.new(-1)
		right.Material = "Grass"
		right.Size = Vector3.new(2,sizeY,2)
		right.CFrame = CFrame.new(-i - distance, 1, 0)
	end    

	local floor = Instance.new("Part", walls)
	floor.Name = "Floor"
	floor.Anchored = true
	floor.BrickColor = BrickColor.new(-3)
	floor.Material = "Grass"
	floor.Size = Vector3.new(sizeX,2,2)
	floor.CFrame = CFrame.new(0, 1, 0)
end

-- This function will randomly introduce doors in the hallway 
function RandomDoors(sizeX, className)
	local randnum = math.random(1,sizeX)

	for i = 1, randnum do
		local doors = Instance.new(className, staircaseModel)
		doors.Name = "HallwayDoor"
		doors.Anchored = true
		doors.Position = Vector3.new((math.random(1, sizeX)),0.3,0)
	end
end

-- This function will add windows in the walls at random locations 
function AddWindows(sizeX)
	local windowModel = Instance.new("Model", workspace)
	windowModel.Name = "HallwayWindows"
	local randnum = math.random(2,sizeX - 1)
	local offset = -math.floor(sizeX/2) + 1

	for i=0, randnum do
		local leftWindow = Instance.new("WedgePart", windowModel)
		leftWindow.Name = "LeftWindow"
		leftWindow.Anchored = true
		leftWindow.BrickColor = BrickColor.new(3)
		leftWindow.Material = "Glass"
		leftWindow.Orientation = Vector3.new(0, 180, 0)
		leftWindow.Size = Vector3.new(1,2,2)
		leftWindow.CFrame = CFrame.new(i + offset, 4, 1)

		local rightWindow = Instance.new("WedgePart", windowModel)
		rightWindow.Name = "RightWindow"
		rightWindow.Anchored = true
		rightWindow.BrickColor = BrickColor.new(3)
		rightWindow.Material = "Glass"
		rightWindow.Orientation = Vector3.new(0, 180, 0)
		rightWindow.Size = Vector3.new(1,2,2)
		rightWindow.CFrame = CFrame.new(-i * -1 - offset, 4, -1)
	end
end
-- This function will generate the hallway using the previous functions 
function GenerateHallway(sizeX, sizeY)
	MakeHallway(sizeX, sizeY, 1)
	AddWindows(sizeX)
	RandomStaircases(sizeX)
end

return HallGen
