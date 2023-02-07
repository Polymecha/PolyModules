local ProceduralTerrain = {}

-- Client-Side Procedural Terrain Generation ModuleScript

-- Function 1: Generate Heightmap

function generateHeightmap(minHeight, maxHeight)
	-- Create a list to store heightmap
	local heightmap = {}

	-- Populate heightmap loop
	for x = 1, 100 do
		-- Create a row
		heightmap[x] = {}

		-- Populate row loop
		for y = 1, 100 do
			-- Generate a random map height
			heightmap[x][y] = math.random(minHeight, maxHeight)
		end
	end

	-- Return the heightmap
	return heightmap
end

-- Function 2: Generate Perlin Noise
function generatePerlinNoise(width, height, seed)
	-- Create a list to store noise
	local noise = {}

	-- Calculate the number of octaves used
	local octaves = 6

	-- Establish seed
	math.randomseed(seed)

	-- Set the initial frequency and amplitude
	local frequency = 1 / 16
	local amplitude = 1

	-- Populate noise loop
	for x = 1, width do
		-- Create a row
		noise[x] = {}

		-- Populate row loop
		for y = 1, height do
			-- Set noise values to 0
			noise[x][y] = 0
		end
	end

	-- Loop through octaves
	for i = 1, octaves do
		-- Create PerlinNoise map
		local perlinNoise = generatePerlinNoiseMap(width, height,math.random(1, 10000))

		-- Populate noise loop
		for x = 1, width do
			-- Populate row loop
			for y = 1, height do
				-- Calculate the total noise
				noise[x][y] = noise[x][y] + perlinNoise * frequency * amplitude

				-- Increase frequency and reduce amplitude for the next octave
				frequency = frequency * 2
				amplitude = amplitude / 2
			end
		end
	end

	-- Return final noise
	return noise
end

-- Function 3: Generate Perlin Noise Map

function generatePerlinNoiseMap(width, height, seed)
	-- Create a list to store noise
	local noiseMap = {}

	-- Calculate the number of octaves used
	local octaves = 6

	-- Generate the noise with seed
	math.randomseed(seed)

	-- Populate noiseMap loop
	for x = 1, width do
		-- Create a row
		noiseMap[x] = {}

		-- Populate row loop
		for y = 1, height do
			-- Generate random between 0 and 1
			noiseMap[x][y] = math.random()
		end
	end

	-- Loop through octaves
	for i = 1, octaves do
		-- Create a placeholder map and store the noise map there
		local noiseMap2 = {}

		for x = 1, width do
			noiseMap2[x] = {}

			for y = 1, height do
				noiseMap2[x][y] = 0
			end
		end

		-- Create a range of intervals per octave
		local sampleSize = 2 ^ i
		local sampleStep = sampleSize / 2

		-- Iterate over the noise map with the intervals
		for i = 0, width - 1, sampleStep do
			local x = math.floor(i)

			for j = 0, height - 1, sampleStep do
				local y = math.floor(j)

				-- Get the 4 random numbers from the noise map
				local p1 = noiseMap[x][y]
				local p2 = noiseMap[x+1][y]
				local p3 = noiseMap[x][y+1]
				local p4 = noiseMap[x+1][y+1]

				-- Calculate the average of the 4 numbers
				noiseMap2[x][y] = (p1 + p2 + p3 + p4) / 4
			end
		end

		noiseMap = noiseMap2
	end

	return noiseMap
end

-- Function 4: Generate Mountain Terrain

function generateMountainTerrain(heightmap)
	-- Get the width and height of the heightmap
	local width = #heightmap
	local height = #heightmap[1]

	-- Create a list to store grain heights
	local grainHeights = {}

	-- Populate heightmap loop
	for x = 1, width do
		-- Create row
		grainHeights[x] = {}

		-- Populate row loop
		for y = 1, height do
			-- Generate a random number from 1-100 to determine the center grain height
			local centerGrainHeight = math.random(1, 100)

			-- Calculate the grain heights around the center
			local topGrainHeight = centerGrainHeight + math.random(-10, 10)
			local bottomGrainHeight = centerGrainHeight + math.random(-10, 10)
			local leftGrainHeight = centerGrainHeight + math.random(-10, 10)
			local rightGrainHeight = centerGrainHeight + math.random(-10, 10)

			-- Calculate the overall grain height
			local grainHeight = (topGrainHeight + bottomGrainHeight + leftGrainHeight + rightGrainHeight) / 4

			-- Clamp the grain height
			grainHeight = math.clamp(grainHeight, 1, 100)

			-- Store the grain height
			grainHeights[x][y] = grainHeight
		end
	end	
end

return ProceduralTerrain
