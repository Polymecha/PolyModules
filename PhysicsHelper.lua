local PhysicsHelper = {}

--Function 1--
--This function sets up the custom physics engine.
function setPhysicsEngine()
	local PhysicsService = game:GetService("PhysicsService")
	local engine = PhysicsService:CreatePhysicsWorld()
	PhysicsService:SetProperty('Gravity', Vector3.new(0, -8, 0))
	PhysicsService:SetProperty('Sleep', true)
	local bind = Instance.new('BindConstraint')
	bind.Name = 'NoCollide'
	bind.Parent = workspace

	local p0 = Instance.new('Part')
	p0.Material = Enum.Material.Air
	p0.Size = Vector3.new(999, 999, 0.10)
	p0.Name = 'NoCollideBlocker'
	p0.Anchored = true
	p0.CanCollide = false
	p0.Locked = true
	p0.Parent = workspace
	bind.Part0 = p0
end

--
--Function 2--
--This function sets the mass of a Part object.
function setMass(obj, mass)
	local body = obj:FindFirstChild('BodyVelocity')
	if not body then
		body = Instance.new('BodyVelocity', obj)
	end
	body.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	body.Mass = mass
end

--
--Function 3--
--This function applies an explosive force to a Part object.
function applyExplosionForce(obj, magnitude)
	local body = obj:FindFirstChild('BodyForce')
	if not body then
		body = Instance.new('BodyForce', obj)
	end
	body.Force = obj.CFrame.lookVector * magnitude
	body:Destroy()
end

--
--Function 4--
--This function applies a directional force to an object.
function applyDirectionalForce(obj, direction, magnitude)
	local body = obj:FindFirstChild('BodyForce')
	if not body then
		body = Instance.new('BodyForce', obj)
	end
	body.Force = direction * magnitude
end

--
--Function 5--
--This function applies a torque force to a Part object.
function applyTorqueForce(obj, magnitude)
	local body = obj:FindFirstChild('BodyAngularVelocity')
	if not body then
		body = Instance.new('BodyAngularVelocity', obj)
	end
	body.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	body.P = math.huge
	body.Velocity = Vector3.new(0, 1, 0) * magnitude
end

return PhysicsHelper
