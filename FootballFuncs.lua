local FootballFuncs = {}

-- This function creates a new football object in Roblox
function CreateFootball() 
	local football = Instance.new("Part")
	football.Name = "Football"
	football.Size = Vector3.new(4,4,4)
	football.Material = "Neon"
	football.Anchored = true
	football.CanCollide = true
	football.BrickColor = BrickColor.new("White")
	football.Friction = 0.3
	football.Parent = workspace
	return football
end

-- This function applies forces to the football so that it can be kicked
function KickFootball(football)
	local force = Instance.new("BodyForce")
	force.force = Vector3.new(0,200,0)
	force.Parent = football
	wait(1)
	force:Destroy()
end

-- This function applies forces to the football so that it can be thrown
function ThrowFootball(football)
	local force = Instance.new("BodyForce")
	force.force = Vector3.new(0,500,0)
	force.Parent = football
	wait(1)
	force:Destroy()
end

-- This function checks for any collisions between the football and other objects or players
function CheckCollision(football)
	local result = false
	repeat 
		for _, character in ipairs(workspace:GetChildren()) do
			if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") ~= nil then
				if football.Position.Y <= 0 then 
					result = true 
				end
			end
		end
		wait()
	until result == true
end

-- This function is used to reset the football after it has collided with an object
function ResetFootball(football)
	football.Position = Vector3.new(0,30,0)
end

-- This function sets up a tag which is used to identify the football
function SetTag(football)
	local tag = Instance.new("StringValue")
	tag.Name = "Football"
	tag.Value = "Football"
	tag.Parent = football
end

return FootballFuncs
