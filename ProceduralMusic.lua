local ProceduralMusic = {}

-- This function will generate a random note, octave and duration and returns a string representing the note and its properties.
local function RandomNote() 
	local noteName = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"} 
	local octaves = {0, 1, 2, 3, 4, 5, 6, 7, 8}
	local durations = {1, 2, 4, 8, 16, 32, 64}
	local noteRand = math.random(#noteName)
	local octRand = math.random(#octaves)
	local durRand = math.random(#durations)
	local note = noteName[noteRand] .. octaves[octRand]
	local dur = durations[durRand]
	return note, dur
end 

-- This function generates a list of randomly-generated Notes and their durations.
local function RandomNoteList(numNotes) 
	local noteList = {}
	for i=1, numNotes do 
		local note, dur = RandomNote()
		noteList[i] = {}
		noteList[i]["note"] = note
		noteList[i]["duration"] = dur
	end 
	return noteList 
end

-- This function takes a Note-list and turns it into a Clip consisting of the notes
local function NoteList2Clip(noteList) 
	local clip = Instance.new("Sound")
	clip.Format = Enum.AudioFormat.Beat 
	local noteTable = ""
	for i,v in pairs(noteList) do 
		noteTable = noteTable .. v["note"] .. '=' .. v["duration"] .. ';'
	end 
	clip.SoundId = "rbxassetid://" .. game.SoundService:GenerateLegacySound({
		Notes = noteTable,
		Tempo = 120,
	})
	clip.Name = "RandomNoteClip"
	return clip
end

-- This function returns a List of Keys whose values are in an arbitrary range 
local function RandomRangeList(listData, lower, upper) 
	local rangeList = {}
	for k,v in pairs(listData) do 
		rangeList[k] = {}
		local startRange = math.random((lower + 1) * 8) 
		local endRange = math.random((upper + 1) * 8) 
		rangeList[k]["startRange"] = startRange
		rangeList[k]["endRange"] = endRange
	end 
	return rangeList 
end

-- This function takes a List of Randomly-Generated Ranges and applies them to a Clip
local function SetClipRanges(rangeList, clip) 
	if clip.Format == Enum.AudioFormat.Beat then 
		local track = clip.Track 
		local start = 0 
		for k, v in ipairs(track.Tracks) do 
			local endRange = rangeList[k]["endRange"]
			track.Tracks[k].Range = Range.new(start, endRange) 
			start = endRange
		end 
	end 
end

-- This function repeatedly plays a Randomly-Generated Clip for a given duration
local function PlayRandomClip(clip, duration)
	local musicTimer
	local sC = game:GetService("ContextActionService")
	local handles = {
		sC:BindAction("playClip", function(actionName, userInputState, inputObject)
			if userInputState == Enum.UserInputState.End then
				musicTimer = game:GetService("RunService").RenderStepped:Wait()
				clip:Play()
				wait(duration * 0.95)
			end 
		end, false,Enum.KeyCode.C)
	}
	sC:BindActionAtPriority("playClip", 3, true)
	repeat 
		wait(musicTimer - tick())
		clip:Play()
	until tick() - musicTimer > duration
	for _, handle in pairs(handles) do 
		sC:UnbindAction(handle)
	end 
end

return ProceduralMusic
