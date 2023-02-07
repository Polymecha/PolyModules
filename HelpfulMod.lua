local HelpfulMod = {}

-- Function to check the length of the given table
function HelpfulMod.tableLength(tab)
	local count = 0
	for _ in pairs(tab) do count = count + 1 end
	return count
end

-- Function to check if a value exists in the given table
function HelpfulMod.tableContains(tab, val) 
	for i = 1, HelpfulMod.tableLength( tab ) do
		if tab[i] == val then
			return true
		end
	end
	return false
end

-- Function to check if a key exists in the given table
function HelpfulMod.tableHasKey(tab, key)
	for k, _ in pairs(tab) do
		if k == key then
			return true
		end
	end
	return false
end

-- Function to get the max value in the given table
function HelpfulMod.tableMaxValue(tab)
	local maxValue = tab[1]
	for _, v in pairs(tab) do
		if v > maxValue then
			maxValue = v
		end
	end
	return maxValue
end

-- Function to get the min value in the given table
function HelpfulMod.tableMinValue(tab)
	local minValue = tab[1]
	for _, v in pairs(tab) do
		if v < minValue then
			minValue = v
		end
	end
	return minValue
end

-- Function to get the sum of all the values in the given table
function HelpfulMod.tableSumValue(tab)
	local sum = 0
	for _, v in pairs(tab) do
		sum = sum + v
	end
	return sum
end

-- Function to get the average of all the values in the given table
function HelpfulMod.tableAverageValue(tab)
	return HelpfulMod.tableSumValue(tab) / HelpfulMod.tableLength(tab)
end

-- Function to get a random value from the given table
function HelpfulMod.tableRandomValue(tab)
	return tab[math.random(1, HelpfulMod.tableLength(tab))]
end

-- Function to shuffle the given table
function HelpfulMod.tableShuffle(tab)
	local len = HelpfulMod.tableLength(tab)
	for i = len, 1, -1 do
		local j = math.random(len)
		tab[i], tab[j] = tab[j], tab[i]
	end
end

-- Function to get the deepest level reached by you in the game
function HelpfulMod.getMaxLevelReached(player)
	return player:GetRankInGroup(game.CreatorId)
end

-- Function to get the time since you first joined the game
function HelpfulMod.getTimeInGame(player)
	return os.time() - player.AccountAge
end

-- Function to get the position of the given object in the world
function HelpfulMod.getObjectWorldPosition(object)
	return object.CFrame.Position
end

-- Function to teleport the given object to the given position
function HelpfulMod.teleportObject(object, position)
	object:SetPrimaryPartCFrame(CFrame.new(position))
end

-- Function to get the parent of the given object
function HelpfulMod.getObjectParent(object)
	return object.Parent
end

-- Function to get the ancestor of the given object
function HelpfulMod.getObjectAncestor(object)
	local parent = HelpfulMod.getObjectParent(object)
	while parent do
		object = parent
		parent = HelpfulMod.getObjectParent(object)
	end 
	return object
end

-- Function to get all the descendants of the given object
function HelpfulMod.getObjectDescendants(object)
	local descendants = {}
	for _, v in pairs(object:GetDescendants()) do
		table.insert(descendants, v)
	end
	return descendants
end

-- Function to get the absolute URL given the relative URL
function HelpfulMod.getAbsoluteUrl(relativeUrl)
	return string.format("https://www.roblox.com%s", relativeUrl)
end

-- Function to redirect to the given URL
function HelpfulMod.redirect(url)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Redirecting...",
		Text = "Redirecting to "..url
	})
	game:GetService("GuiService"):OpenBrowserWindow(url)
end

-- Function to show a message and redirect to the given URL
function HelpfulMod.showRedirectMessageAndUrl(message, url)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Redirecting...",
		Text = message.."\nRedirecting to "..url
	})
	game:GetService("GuiService"):OpenBrowserWindow(url)
end

-- Function to check if the given user is a friend
function HelpfulMod.isFriend(player, userId)
	for i = 1, #player.Friends do
		if player.Friends[i].UserId == userId then
			return true
		end
	end
	return false
end

-- Function to get the age of the user with the given userId
function HelpfulMod.getUserAge(userId)
	local user = game.Players:GetUserById(userId)
	if user then
		return user.AccountAge
	end
	return nil
end

-- Function to find the parent Folder of the given Instance
function HelpfulMod.findParentFolder(instance)
	local parent = instance.Parent
	while parent do
		if parent:IsA("Folder") then
			return parent
		end
		parent = parent.Parent
	end
end

-- Function to clone the given Instance
function HelpfulMod.cloneObject(object) 
	local objectCloneModel = Instance.new("Model")
	objectCloneModel.Parent = game.Workspace

	local objectClone = object:Clone()
	objectClone.Parent = objectCloneModel

	return objectCloneModel
end

return HelpfulMod
