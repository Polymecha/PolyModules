local ChatAI = {}

--This function will take the user input in the "ChatFunction" function and process it through the bot's given AI framework.
function processText(rawInput) 
	local input = string.lower(rawInput)
	local splitInput = string.split(input, "%s")

--This function will use predetermined model responses by the user to generate a reply based on the input.
function generateResponse()
	local responseList = {
		"Sorry, I don't understand that.",
		"That seems strange, can you tell me more?",
		"Can you explain that differently?",
		"I don't understand, can you say that in a different way?"
	}

	return responseList[math.random(1, 4)]
end

--This function will loop through each of the splits in the user input and check if it matches a given command in the chatbot's database.
function checkForCommand()
	local commandPredicates = {
		"help",
		"discord",
		"name"
	}

	for i = 1, #splitInput do
		for j = 1, #commandPredicates do
			if splitInput[i] == commandPredicates[j] then
				return true
			end
		end
	end

	return false
end

--This function will define how the bot will respond to a command.
function executeCommand()
	if splitInput[1] == "help" then
		sendMessage("Hello, I'm a chatbot here to help answer your questions!")
	elseif splitInput[1] == "name" then 
		sendMessage("My name is Robo."))
		end
		end

		--This function will allow the chatbot to send the generated messages to the chat.
function sendMessage(message)
local chatChatbotSpeaker = game:GetService("Chat"):Chat(game.Players.LocalPlayer.Character, message)
end

--This function will be the main logic for the chatbot. It will take in user input and speak the response based on it.
function ChatFunction(message)
	local result = processText(message)

	if checkForCommand() then
		executeCommand()
	else
		sendMessage(generateResponse())
	end
	end
end

return ChatAI
