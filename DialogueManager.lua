local DialogueManager = {}

--Function to create a new dialogue with a given character and dialogue

function createDialogue(characterName, dialogueText)
	local newDialogue = Instance.new("Dialog")
	newDialogue.Name = characterName.."'s Dialogue"
	newDialogue.Text = dialogueText

	return newDialogue
end

--Function to add a new line of dialogue for a given character

function addLine(dialogue, characterName, lineText)
	local currentDialogue = dialogue:Clone()
	currentDialogue.Name = characterName.."'s Dialogue"
	currentDialogue.Parent = dialogue.Parent

	local dialogueLine = Instance.new("DialogLine")
	dialogueLine.Line = lineText
	dialogueLine.Parent = currentDialogue
end

--Function to remove a given line of dialogue

function removeLine(dialogue, lineNumber)
	if dialogue:FindFirstChild("DialogLine") then
		local children = dialogue:GetChildren()

		if lineNumber <= #children then
			children[lineNumber]:Destroy()
		end
	end
end

--Function to modify an existing line of dialogue

function modifyLine(dialogue, lineNumber, newText)
	if dialogue:FindFirstChild("DialogLine") then
		local children = dialogue:GetChildren()

		if lineNumber <= #children then
			children[lineNumber].Line = newText
		end
	end
end

--Function to delete an entire dialogue

function deleteDialogue(dialogue)
	dialogue:Destroy()
end

return DialogueManager
