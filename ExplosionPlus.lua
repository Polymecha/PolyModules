local ExplosionPlus = {}

-- Function to create an explosion based on position, type, size, and power
-- Inputs: pos (Vector3), type (String), size (Number), power (Number)
function createExplosion(pos, type, size, power)
	-- Store parameter values into local variables
	local pos = pos
	local type = type
	local size = size
	local power = power

	-- Create a new instance of the Explosion class
	local explosion = Instance.new("Explosion")
	-- Set its properties based on function parameters
	explosion.Position = pos
	explosion.BlastType = type
	explosion.BlastRadius = size
	explosion.BlastPressure = power
	-- Activate blast
	explosion.DestroyJointRadiusPercent = 1
	-- Return instance
	return explosion
end

-- Function to create a standard explosion 
-- Inputs: pos (Vector3)
function createStdExplosion(pos)
	-- Create a new instance of the Explosion class
	local explosion = Instance.new("Explosion")
	-- Set its properties
	explosion.Position = pos
	explosion.BlastType = "Default"
	explosion.BlastRadius = 4
	explosion.BlastPressure = 10
	-- Activate blast
	explosion.DestroyJointRadiusPercent = 1
	-- Return instance
	return explosion
end

-- Function to create an explosion shockwave
-- Inputs: pos (Vector3), power (Number)
function createShockwave(pos, power)
	-- Create a new instance of the Explosion class
	local explosion = Instance.new("Explosion")
	-- Set its properties
	explosion.Position = pos
	explosion.BlastType = "Shockwave"
	explosion.BlastRadius = 25
	explosion.BlastPressure = power
	-- Activate blast
	explosion.DestroyJointRadiusPercent = 1
	-- Return instance
	return explosion
end

-- Function to create an explosion with a radial force effect
-- Inputs: pos (Vector3), power (Number)
function createRadialForce(pos, power)
	-- Create a new instance of the Explosion class
	local explosion = Instance.new("Explosion")
	-- Set its properties
	explosion.Position = pos
	explosion.BlastType = "Default"
	explosion.BlastRadius = 6
	explosion.BlastPressure = power
	-- Activate blast
	explosion.DestroyJointRadiusPercent = 0
	-- Activate radial force
	explosion.ExplosionType = Enum.ExplosionType.RadialForce
	-- Return instance
	return explosion
end

-- Function to create a delayed explosion
-- Inputs: pos (Vector3), delay (Number)
function createDelayedExplosion(pos, delay)
	-- Create a new instance of the Explosion class
	local explosion = Instance.new("Explosion")
	-- Set its properties
	explosion.Position = pos
	explosion.BlastType = "Default"
	explosion.BlastRadius = 4
	explosion.BlastPressure = 10
	-- Activate blast
	explosion.DestroyJointRadiusPercent = 1
	-- Set timer
	explosion.Parent = game:GetService("Lighting")
	game:GetService("Lighting").TimeOfDay = delay
	-- Return instance
	return explosion
end

return ExplosionPlus
