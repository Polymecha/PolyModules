local TweenAnims = {}

--Creates a Body Tween with a body part, position, and how quickly it moves
--takes three inputs: BodyPart, Position, and Speed
function BodyTween(BodyPart, Position, Speed)        
	local part = BodyPart
	local endposition = Position
	local speed = Speed
	local tweenvalue = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
	local tween = game:GetService("TweenService")
	local tweenposition = tween:Create(part, tweenvalue, {CFrame = endposition})
	tweenposition:Play()
end

--Creates a Color Tween with a part, color, and how quickly it moves
--takes three inputs: Part, Color, and Speed
function ColorTween(Part, Color, Speed)
	local part = Part
	local endcolor = Color
	local speed = Speed
	local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
	local tween = game:GetService("TweenService")
	local tweencolor = tween:Create(part, tweeninfo, {Color = endcolor})
	tweencolor:Play()
end

--Creates a Size Tween with a part, size, and how quickly it moves
--takes three inputs: Part, Size, and Speed
function SizeTween(Part, Size, Speed)
	local part = Part
	local endsize = Size
	local speed = Speed
	local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
	local tween = game:GetService("TweenService")
	local tweensize = tween:Create(part, tweeninfo, {Size = endsize})
	tweensize:Play()
end

--Creates an Image Tween with a part, image, and how quickly it moves
--takes three inputs: Part, Image, and Speed
function ImageTween(Part, Image, Speed)
	local part = Part
	local endimage = Image
	local speed = Speed
	local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
	local tween = game:GetService("TweenService")
	local tweenimage = tween:Create(part, tweeninfo, {Image = endimage})
end

--Creates a Transparency Tween with a part, transparency value, and how quickly it moves
--takes three inputs: Part, Transparency, and Speed
function TransparencyTween(Part, Transparency, Speed)
	local part = Part
	local endtransparency = Transparency
	local speed = Speed
	local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0)
	local tween = game:GetService("TweenService")
	local tweentransparency = tween:Create(part, tweeninfo, {Transparency = endtransparency})
	tweentransparency:Play()
end

return TweenAnims
