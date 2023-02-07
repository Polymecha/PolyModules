local IdeaGen = {}

-- Game Idea Generation ModuleScript

-- Function 1: RandomizeGame
-- This function will generate a random game idea, based on specific game "themes"
local function RandomizeGame()

	-- List of possible game genres/themes
	local gameThemes = {"Space Exploration", "Survival Horror", "Fantasy Adventure", "Ice Age Platformer",
		"Futuristic Racer", "City Builder", "MMORPG", "2D Platformer", 
		"Brawler", "Psychological Thriller"}

	-- Generate random index based off the length of gameThemes
	local ranIndex = math.random(1, #gameThemes)

	-- Return the game theme from the list with the random index
	return gameThemes[ranIndex]

end

-- Function 2: IdeasForGenre
-- This function will generate specific game ideas for a given game genre/theme
local function IdeasForGenre(genre)

	-- Check if the given genre is valid
	if (genre == "Space Exploration") then
		-- List of game ideas for the Space Exploration theme
		local spaceIdeas = {"Interspace Conflict", "Exploring Alien Planets", "Realistic Space Sim",
			"Space Combat Arena", "Resource Management Strategy", "Space Exploration Sim"}

		-- Generate random index based off the length of spaceIdeas
		local ranIndex = math.random(1, #spaceIdeas)

		-- Return the game idea from the list with the random index
		return "Space Exploration: " .. spaceIdeas[ranIndex]

	elseif (genre == "Survival Horror") then
		-- List of game ideas for the Survival Horror theme
		local horrorIdeas = {"Haunted Mansion Horror Exploration", "Surviving Mysterious Illness", 
			"Stylized Horror FPS", "Retro Horror Adventure", "Richly Atmospheric Horror", 
			"Co-op Survival Horror"}

		-- Generate random index based off the length of horrorIdeas
		local ranIndex  = math.random(1, #horrorIdeas)

		-- Return the game idea from the list with the random index
		return "Survival Horror: " .. horrorIdeas[ranIndex]

	elseif (genre == "Fantasy Adventure") then
		-- List of game ideas for the Fantasy Adventure theme
		local fantasyIdeas = {"Medieval Combat Platformer", "Time Traveling Adventure RPG", 
			"Fairy World Adventure", "Dragon Riding Platformer", "Turn-based Fantasy Strategy", 
			"Retro Action Adventure"}

		-- Generate random index based off the length of fantasyIdeas
		local ranIndex = math.random(1, #fantasyIdeas)

		-- Return the game idea from the list with the random index
		return "Fantasy Adventure: " .. fantasyIdeas[ranIndex]

	elseif (genre == "Ice Age Platformer") then
		-- List of game ideas for the Ice Age Platformer theme
		local iceIdeas = {"Sliding Ice Platformer", "Prehistoric Tactics Platformer", "Snowmobile Racing Platformer", 
			"Ice Age Beat-em-up", "Ice Cave Exploration Platformer", "Mammoth Herding Action Platformer"}

		-- Generate random index based off the length of iceIdeas
		local ranIndex = math.random(1, #iceIdeas)

		-- Return the game idea from the list with the random index
		return "Ice Age Platformer: " .. iceIdeas[ranIndex]

	elseif (genre == "Futuristic Racer") then
		-- List of game ideas for the Futuristic Racer theme
		local raceIdeas = {"High-Speed Racing Sim", "360-Degree Racing Platformer", "Obstacle Course Racing", 
			"Car Combat Racing", "Jet-Surfing Racing Sim", "Neon Future Racing"}

		-- Generate random index based off the length of raceIdeas
		local ranIndex = math.random(1, #raceIdeas)

		-- Return the game idea from the list with the random index
		return "Futuristic Racer: " .. raceIdeas[ranIndex]

	elseif (genre == "City Builder") then
		-- List of game ideas for the City Builder theme
		local cityIdeas = {"Fantasy City Simulation", "Post-Apocalyptic Town Building", "Tower Defense City Builder", 
			"Block Building Tycoon", "Co-op City Builder", "Top-Down City Sim"}

		-- Generate random index based off the length ofcityIdeas
		local ranIndex = math.random(1, #cityIdeas)

		-- Return the game idea from the list with the random index
		return "City Builder: " .. cityIdeas[ranIndex]

	elseif (genre == "MMORPG") then
		-- List of game ideas for the MMORPG theme
		local mmorpgIdeas = {"Sandbox Fantasy World", "Gothic Horror MMORPG", "Neon Futuristic MMORPG", 
			"2D Platformer MMORPG", "High-Speed Racing MMORPG", "Cooperative Universe Exploration"}

		-- Generate random index based off the length of mmorpgIdeas
		local ranIndex = math.random(1, #mmorpgIdeas)

		-- Return the game idea from the list with the random index
		return "MMORPG: " .. mmorpgIdeas[ranIndex]

	elseif (genre == "2D Platformer") then
		-- List of game ideas for the 2D Platformer theme
		local platIdeas = {"Retro Platformer Adventure", "Painting Platformer", "Shadow Platformer", 
			"Multiplayer Platformer Co-op", "Metroidvania Platformer", "Unique Platformer Puzzle Game"}
		-- Generate random index based off the length of platIdeas
		local ranIndex = math.random(1, #platIdeas)
		
		-- Return the game idea from the list with the random index
		return "Platformer: " .. platIdeas[ranIndex]
	end
end

return IdeaGen
