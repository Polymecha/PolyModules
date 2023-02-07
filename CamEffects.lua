local CamEffects = {}

-- This function turns Camera Effects on 
function TurnEffectsOn()
	workspace.CurrentCamera:ClearAllChildren()
	local cameraScript = Instance.new("CameraScript")
	cameraScript.CameraSubject = workspace.CurrentCamera
	cameraScript.Parent = workspace.CurrentCamera
	local customEffects = Instance.new("StringValue", cameraScript)
	customEffects.Name = "Effects"
	customEffects.Value = "true"
	return true
end

-- This function creates a Fish Eye Lens Camera Effect 
function FishLensEffect()
	local fishLensFX = Instance.new("FishEyeModifier", workspace.CurrentCamera)
	fishLensFX.Name = "FishLens-FX"
	fishLensFX.BothAxisStrength = 1.5
	fishLensFX.HorizontalStartPoint = 0.65
	fishLensFX.VerticalStartPoint = 0.3
	fishLensFX.RadialDistortion = 0.2
	return true
end

-- This function removes a Fish Eye Lens Camera Effect 
function RemoveFishLensEffect()
	local fishLensFX = workspace.CurrentCamera:FindFirstChild("FishLens-FX")
	if fishLensFX ~= nil then
		fishLensFX:Destroy()
		return true
	else
		return false
	end
end

-- This function creates a Chromatic Aberration Camera Effect 
function ChromaticEffect()
	local chromFX = Instance.new("ChromaticAberrationEffect", workspace.CurrentCamera)
	chromFX.Name = "Chromatic-FX"
	chromFX.Intensity = 0.5
	chromFX.Offset = 0.2
	return true
end

-- This function removes a Chromatic Aberration Camera Effect 
function RemoveChromaticEffect()
	local chromFX = workspace.CurrentCamera:FindFirstChild("Chromatic-FX")
	if chromFX ~= nil then
		chromFX:Destroy()
		return true
	else
		return false
	end
end 

-- This function creates a Black and White Camera Effect 
function BWEffect()
	local bwFX = Instance.new("BrightnessContrastEffect", workspace.CurrentCamera)
	bwFX.Name = "BlackWhite"
	bwFX.Brightness = 0
	bwFX.Contrast = 0.2
	return true
end

-- This function removes a Black and White Camera Effect 
function RemoveBWEffect()
	local bwFX = workspace.CurrentCamera:FindFirstChild("BlackWhite")
	if bwFX ~= nil then
		bwFX:Destroy()
		return true
	else
		return false
	end
end

return CamEffects
