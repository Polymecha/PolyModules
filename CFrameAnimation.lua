local CFrameAnimation = {}

-- ModuleScript: CFrameAnimation

-- Function 1: createCFrameAnimation
-- Purpose: Create a CFrame Animation

function createCFrameAnimation(name, frames, speed)
	local cframeAnimation = Instance.new("Animation")
	cframeAnimation.Name = name
	local keys = {}
	for i, v in pairs(frames) do
		table.insert(keys, {Time = i * speed, Value = v})
	end
	cframeAnimation.KeyframeReel:SetKeyframeReel(keys)
	return cframeAnimation
end

-- Function 2: startCFrameAnimation
-- Purpose: Play a CFrame Animation

function startCFrameAnimation(char, animation, track)
	local animationTrack = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(animation)
	if track then
		animationTrack.Priority = Enum.AnimationPriority[track]
	end
	animationTrack:Play()
	return animationTrack
end

-- Function 3: pauseCFrameAnimation
-- Purpose: Pause a CFrame Animation

function pauseCFrameAnimation(animationTrack, time)
	if not time then
		animationTrack:Pause()
	else
		animationTrack:SetPauseTime(time)
	end
end

-- Function 4: stopCFrameAnimation
-- Purpose: Stop a CFrame Animation

function stopCFrameAnimation(animationTrack, time)
	if not time then 
		animationTrack:Stop()
	else
		animationTrack:SetEndTime(time)
		animationTrack:Stop(time)
	end
end

-- Function 5: resetCFrameAnimation
-- Purpose: Reset the CFrame Animation

function resetCFrameAnimation(animationTrack)
	animationTrack:Reset()
end

return CFrameAnimation
