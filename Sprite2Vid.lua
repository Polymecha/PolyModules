local Sprite2Vid = {}

-- ModuleScript - Video Creation using Spritesheet Decals

-- Function that sets spritesheet decal using the base ID
local function setDecal(baseId)
	local spriteSheetDecal = Instance.new("Decal")
	spriteSheetDecal.Texture = "http://www.roblox.com/asset/?id="..baseId
	spriteSheetDecal.Parent = workspace
	return spriteSheetDecal
end

-- Function that finds spritesheet decal in workspace
local function findDecal(id)
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj.ClassName == "Decal" and obj.Texture ~= nil and obj.Texture:find("http://www.roblox.com/asset/?"..id) then
			return obj
		end
	end
	return nil
end

-- Fucntion that frames spritesheet decal between start and end frames
local function frameDecal(decalId, startFrame, endFrame)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		spriteSheetDecal.ClipsDesc = "m "..startFrame.." "..endFrame
	end
end



-- Function that moves spritesheet decal along the x-axis
local function moveSpriteSheetDecal(decalId, x)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		spriteSheetDecal:SetPrimaryPartCFrame(CFrame.new(Vector3.new(x, spriteSheetDecal.PrimaryPart.Position.y, spriteSheetDecal.PrimaryPart.Position.z)))
	end
end

-- Function that crops spritesheet decal
local function cropSpriteSheetDecal(decalId, size, position)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		spriteSheetDecal.Size = size
		spriteSheetDecal.CoordinateFrame = CFrame.new(position)
	end
end

-- Function that cycles through frames of spritesheet decal
local function cycleDecalFrames(decalId, frameSpeed, startFrame, endFrame)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		local currentFrame = startFrame
		local direction = 1
		repeat
			currentFrame = currentFrame + (frameSpeed * direction)
			spriteSheetDecal.ClipsDesc = "m "..startFrame.." "..endFrame.." "..currentFrame
			wait(frameSpeed)
			if currentFrame == endFrame then
				direction = -1
			elseif currentFrame == startFrame then
				direction = 1
			end
		until not spriteSheetDecal or not spriteSheetDecal.Parent
	end
end

-- Function that makes a spritesheet decal invisible
local function invisSpriteSheetDecal(decalId)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		spriteSheetDecal.Visible = false
	end
end 

-- Function that makes a spritesheet decal visible
local function visiSpriteSheetDecal(decalId)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		spriteSheetDecal.Visible = true
	end
end

-- Function that toggles the visibility of spritesheet decal
local function toggleSpriteSheetDecal(decalId)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal and spriteSheetDecal.Parent then
		spriteSheetDecal.Visible = not spriteSheetDecal.Visible
	end
end

-- Function that triggers another spritesheet decal at a given frame
local function triggerSpriteSheetDecal(decalId, frame, triggerDecalId)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		local triggerDecal = setDecal(triggerDecalId)
		if triggerDecal ~= nil then
			spawn(function()
				while spriteSheetDecal and spriteSheetDecal.Parent do
					if spriteSheetDecal.ClipsInfo.CurrentClipIndex == frame then
						triggerDecal:Destroy()
						return
					end
					wait(spriteSheetDecal.ClipsInfo.SampleRate/2)
				end
			end)
		end
	end
end

-- Function that zooms in on a spritesheet decal
local function zoomInSpriteSheetDecal(decalId, zoomSpeed, maxZoom)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		local startSize = spriteSheetDecal.Size
		spawn(function()
			local zoomAmount = 0
			repeat
				zoomAmount = zoomAmount + zoomSpeed
				spriteSheetDecal.Size = Vector2.new(startSize.X + zoomAmount, startSize.Y + zoomAmount)
				wait(0.1)
			until not spriteSheetDecal or not spriteSheetDecal.Parent or startSize.X + zoomAmount > maxZoom
		end)
	end
end

-- Function that zooms out on a spritesheet decal
local function zoomOutSpriteSheetDecal(decalId, zoomSpeed, minZoom)
	local spriteSheetDecal = findDecal(decalId)
	if spriteSheetDecal ~= nil then
		local startSize = spriteSheetDecal.Size
		spawn(function()
			local zoomAmount = 0
			repeat
				zoomAmount = zoomAmount + zoomSpeed
				spriteSheetDecal.Size = Vector2.new(startSize.X + zoomAmount, startSize.Y + zoomAmount)
				wait(0.1)
			until not spriteSheetDecal or not spriteSheetDecal.Parent or startSize.X + zoomAmount > minZoom
		end)
	end
end

return Sprite2Vid
