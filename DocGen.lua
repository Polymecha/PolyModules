local DocGen = {}

-- Automatic Documentation Creation ModuleScript

-- Function that takes a function's parameters and generates a Lua table containing names, types and any additional information 
local function generateParameterTable(params)
	local paramKeys = {"name", "type", "info"}
	local parameterTable = {}

	for _, param in ipairs(params) do
		local currentParam = {}

		for _, key in ipairs(paramKeys) do
			local paramName = param[key]
			currentParam[key] = paramName
		end

		table.insert(parameterTable, currentParam)
	end

	return parameterTable
end

-- Function that parses a string of source code and extracts comment blocks with associated functions 
local function extractCommentBlocks(source)
	local commentBlocks = {}

	for line in source:gmatch("[^\r\n]+") do
		if line:match("^%-%-") then -- each comment started with a double dash
			local currentBlock = line:match("%-(.-)")
			table.insert(commentBlocks, currentBlock)
		end
	end

	return commentBlocks
end

-- Function that takes a comment block and parses out the function parameter information
local function parseFunctionParams(commentBlock)
	-- Break comment block into individual lines
	local lines = {}
	for line in commentBlock:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	-- Look for @param lines and parse the key/value pairs out
	local params = {}
	for _, line in ipairs(lines) do
		if line:match("@param") then
			local paramName = line:match("@param%s+(.-)%s")
			local paramSuffix = line:match("@param%s+.-%s+(.*)$")

			local paramType, info
			if paramSuffix then
				paramType = paramSuffix:match("^(.-):")
				info = paramSuffix:match(":(.*)$")
			end

			table.insert(params, {
				name = paramName, 
				type = paramType, 
				info = info
			})
		end		
	end

	return params
end	

-- Function that takes a comment block and parses out the function description
local function parseFunctionDescription(commentBlock)
	-- Break comment block into individual lines
	local lines = {}
	for line in commentBlock:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	-- Look for a blank line, trim everything before it as the function description
	local functionDescription
	for i = #lines, 1, -1 do
		if lines[i] == "" then
			functionDescription = ""
			for j = 1, i - 1 do
				functionDescription = functionDescription .. lines[j] .. "\n"
			end
			break
		end
	end

	return functionDescription
end

-- Function that takes a string of source code and generates a table of functions, their associated parameters and descriptions
local function generateFunctionTable(source)
	local functions = {}

	local commentBlocks = extractCommentBlocks(source)
	for _, commentBlock in ipairs(commentBlocks) do
		local functionName = commentBlock:match("@name%s+(.+)$")
		if functionName then
			local functionParams = parseFunctionParams(commentBlock)
			local functionDescription = parseFunctionDescription(commentBlock)

			table.insert(functions, {
				name = functionName,
				params = generateParameterTable(functionParams),
				description = functionDescription
			})
		end
	end

	return functions
end

-- Function that takes a list of function tables and compiles them into a table of every function name and documentation
local function compileFunctionData(functions)
	local functionData = {}

	for _, functionData in ipairs(functions) do
		local functionName = functionData.name
		local functionParams = functionData.params
		local functionDescription = functionData.description

		functionData[functionName] = {
			params = functionParams, 
			description = functionDescription
		}
	end

	return functionData
end

-- Function that takes a string of source code and generates a table containing function documentation
local function generateFunctionDocumentation(source)
	local functions = generateFunctionTable(source)
	local functionData = compileFunctionData(functions)

	return functionData
end

-- Function that takes a string of source code and generates a Markdown formatted block containing a table of functions and documentation
local function generateDocumentationTable(source)
	local functionData = generateFunctionDocumentation(source)

	local output = "## Functions\n"
	output = output .. "| Name | Parameters | Description |\n"
	output = output .. "| ---- | ---------- | ----------- |\n"

	-- Create a row in the table for each function
	for functionName, data in pairs(functionData) do
		output = output .. string.format("| %s | %s | %s |\n", functionName, serializeArguments(data.params), data.description)
	end

	return output
end

-- Function that takes a list of function parameter data tables and compiles them into a Markdown formatted string
local function serializeArguments(parameters)
	local output = ""

	for _, paramData in ipairs(parameters) do
		output = output .. string.format("`%s` (%s)%s", paramData.name, paramData.type, (paramData.info and ": " .. paramData.info or ""))
		if _ ~= #parameters then
			output = output .. ", "
		end
	end

	return output
end

return DocGen
