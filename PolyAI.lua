local PolyAI = {}

--Roblox Lua ModuleScript with functions centered around AI Creation and Training

--Function to generate a generic AI
function CreateAI()
	--create a folder instance
	local aiFolder = Instance.new("Folder")
	--name it "AI"
	aiFolder.Name = "AI"
	--create the brain AI
	local brain = Instance.new("RemoteFunction")
	brain.Name = "Brain"
	brain.Parent = aiFolder
	--create the memory
	local memory = Instance.new("NumberValue")
	memory.Name = "Memory"
	memory.Value = 0
	memory.Parent = aiFolder
end

--Function to modify the AI's brain
function EditBrain(aiFolder, newBrainFunction)
	--get remote function from aiFolder
	local brain = aiFolder:FindFirstChild("Brain")
	--modify remote function
	brain.Function = newBrainFunction
end

--Function to increase AI's memory
function IncreaseMemory(aiFolder, value)
	--get the memory object from aiFolder
	local memory = aiFolder:FindFirstChild("Memory")
	--increase memory
	memory.Value = memory.Value + value
end

--Function to decrease AI's memory
function DecreaseMemory(aiFolder, value)
	--get the memory object from aiFolder
	local memory = aiFolder:FindFirstChild("Memory")
	--decrease memory
	memory.Value = memory.Value - value
end

--Function to reset AI's memory
function ResetMemory(aiFolder)
	--get the memory object from aiFolder
	local memory = aiFolder:FindFirstChild("Memory")
	--reset memory
	memory.Value = 0
end

--Function to train AI
function TrainAI(aiFolder, dataTable)
	--iterate over each element in dataTableTable
	for _, data in pairs(dataTable) do
		--get the brain object from aiFolder
		local brain = aiFolder:FindFirstChild("Brain")
		--execute the brain
		brain:InvokeServer(data)
		--increase AI's memory
		IncreaseMemory(aiFolder, 1)
	end
end 

--Function to test AI
function TestAI(aiFolder, dataTable)
	--counter for correct predictions
	local correctPredictions = 0
	--iterate over each element in dataTableTable
	for _, data in pairs(dataTable) do
		--get the brain object from aiFolder
		local brain = aiFolder:FindFirstChild("Brain")
		--execute the brain 
		local prediction = brain:InvokeServer(data)
		--check if prediction is correct 
		if prediction == dataTable.expectedResult then 
			--increment counter
			correctPredictions = correctPredictions + 1
		end
	end
	--return accuracy 
	return (correctPredictions / #dataTable) * 100
end

--Function to clone existing AI
function CloneAI(aiFolder)
	--create new folder for AI clone
	local aiCloneFolder = Instance.new("Folder")
	--name it "AI clone"
	aiCloneFolder.Name = "AI clone" 
	--copy all the children from original AI to clone
	for _, child in pairs(aiFolder:GetChildren()) do
		--copy child
		child:Clone().Parent = aiCloneFolder
	end
	--return clone
	return aiCloneFolder 
end

--Function to compare two AIs
function CompareAI(aiFolder, clonesFolder)
	--get all the children from both folders
	local aiFolderChildren = aiFolder:GetChildren()
	local clonesFolderChildren = clonesFolder:GetChildren()
	--iterate over each element in aiFolderChildren and clonesFolderChildren
	for _, c1 in pairs(aiFolderChildren) do
		for _, c2 in pairs(clonesFolderChildren) do
			--check if names match
			if c1.Name == c2.Name then 
				--check if values match
				if c1.Value ~= c2.Value then 
					--AI's differ 
					return false 
				end
			end
		end
	end
	--AI's are the same 
	return true 
end 

--Function to save AI
function SaveAI(aiFolder, filePath)
	--create string of AI's values 
	local aiDataString = "" 
	--iterate over each element in aiFolder
	for _, child in pairs(aiFolder:GetChildren()) do
		--save value to string 
		aiDataString = aiDataString .. child.Name .. " " .. child.Value 
	end
	--open or create file at filePath
	local file = io.open(filePath, "w+")
	--write aiDataString to file 
	file:write(aiDataString)
	--close file
	file:close()
end 

--Function to load AI
function LoadAI(aiDataString)
	--split aiDataString by " "
	local aiDataTable = string.split(aiDataString, " ")
	--create folder for AI
	local aiFolder = Instance.new("Folder")
	aiFolder.Name = "AI"
	--iterate over each element in aiDataTable
	for i = 1, #aiDataTable - 1, 2 do
		--create value object
		local value = Instance.new("NumberValue")
		--name object
		value.Name = aiDataTable[i]
		--set value
		value.Value = tonumber(aiDataTable[i+1])
		--add object to aiFolder
		value.Parent = aiFolder
	end 
	--return aiFolder
	return aiFolder
end 

--Function to delete AI
function DeleteAI(aiFolder)
	--iterate over each element in aiFolder
	for _, child in pairs(aiFolder:GetChildren()) do
		--delete child
		child:Destroy()
	end
	--delete aiFolder
	aiFolder:Destroy()
end

return PolyAI
