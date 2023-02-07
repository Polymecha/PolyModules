local UIAssistant = {}

-- Module Script // UI Framework

-- Part 1: Create UIs

-- function 1: createMainGUI
-- this function creates a main GUI window with properties
-- input: width, height, title
-- return: main_gui object

function createMainGUI(width, height, title)
	local main_gui = Instance.new("ScreenGui")
	main_gui.Name = "MainGui"
	main_gui.Size = UDim2.new(0, width, 0, height)
	main_gui.ResetOnSpawn = false

	local main_frame = Instance.new("Frame")
	main_frame.Name = "MainFrame"
	main_frame.Parent = main_gui
	main_frame.Position = UDim2.new(0.5,-(width/2),0.5,-(height/2))
	main_frame.Size = UDim2.new(0, width, 0, height)
	main_frame.BackgroundTransparency = 0.5
	main_frame.BorderSizePixel = 0

	local title_text = Instance.new("TextLabel")
	title_text.Name = "TitleText"
	title_text.Parent = main_frame
	title_text.Text = title
	title_text.Size = UDim2.new(1, 0, 0, 25)
	title_text.Position = UDim2.new(0, 0, 0, 0)
	title_text.BackgroundTransparency = 0.5
	title_text.BorderSizePixel = 0
	title_text.TextXAlignment = Enum.TextXAlignment.Left

	return main_gui
end

-- function 2: createToggleButton
-- this function creates a button that toggles a bool value 
-- input: parent, width, height, position, boolValue
-- return: toggle_btn object

function createToggleButton(parent, width, height, position, boolValue)
	local toggle_btn = Instance.new("TextButton")
	toggle_btn.Name = "ToggleButton"
	toggle_btn.Parent = parent
	toggle_btn.Size = UDim2.new(0, width, 0, height)
	toggle_btn.Position = position
	toggle_btn.BackgroundTransparency = 0.5
	toggle_btn.BorderSizePixel = 0
	toggle_btn.Text = boolValue and "Enabled" or "Disabled"

	toggle_btn.MouseButton1Click:Connect(function()
		boolValue = not boolValue
		toggle_btn.Text = boolValue and "Enabled" or "Disabled"
	end)

	return toggle_btn
end

-- function 3: createDropdown
-- this function creates a dropdown selection with options
-- input: parent, position, width, height, options
-- return: dropdown object

function createDropdown(parent, position, width, height, options)
	local dropdown = Instance.new("TextButton")
	dropdown.Name = "Dropdown"
	dropdown.Parent = parent
	dropdown.Size = UDim2.new(0, width, 0, height)
	dropdown.Position = position
	dropdown.BackgroundTransparency = 0.5
	dropdown.BorderSizePixel = 0

	local currentSelection = options[1]
	dropdown.Text = currentSelection

	dropdown.MouseButton1Click:Connect(function()
		-- display a list of options
		local optionListFrame = Instance.new("Frame")
		optionListFrame.Name = "OptionListFrame"
		optionListFrame.Parent = parent
		optionListFrame.Position = UDim2.new(dropdown.Position.X.Scale, dropdown.Position.X.Offset, dropdown.Position.Y.Scale, dropdown.Position.Y.Offset + height)
		optionListFrame.Size = UDim2.new(0, width, 0, #options * height)
		optionListFrame.BackgroundTransparency = 0.5
		optionListFrame.BorderSizePixel = 0

		local optionListScroll = Instance.new("ScrollingFrame")
		optionListScroll.Name = "OptionListScroll"
		optionListScroll.Parent = optionListFrame
		optionListScroll.CanvasSize = UDim2.new(0, width, 0, #options * height)
		optionListScroll.Size = optionListFrame.Size
		optionListScroll.BackgroundTransparency = 0.5
		optionListScroll.BorderSizePixel = 0

		for index, value in ipairs(options) do
			local optionButton = Instance.new("TextButton")
			optionButton.Name = "OptionButton"
			optionButton.Parent = optionListScroll
			optionButton.Size = UDim2.new(1, 0, 0, height)
			optionButton.Position = UDim2.new(0, 0, 0, index * height - height)
			optionButton.Text = value
			optionButton.BackgroundTransparency = 0.5
			optionButton.BorderSizePixel = 0

			optionButton.MouseButton1Click:Connect(function()
				currentSelection = value
				dropdown.Text = currentSelection
				optionListFrame:Destroy()
			end)
		end
	end)

	return dropdown
end

-- Part 2: Handle Interactions

-- function 4: interactWithButton
-- this function listens to button events and calls a callback
-- input: button, callback
-- return: void

function interactWithButton(button, callback)
	button.MouseButton1Click:Connect(function()
		callback(button)
	end)
end

-- function 5: interactWithToggleButton
-- this function listens to toggle button events and calls a callback
-- input: button, callback
-- return: void

function interactWithToggleButton(button, callback)
	button.MouseButton1Click:Connect(function()
		callback(button)
	end)
end

return UIAssistant
