print('|cff55DFFFBugg|r|cff29D5C5Addon|r|cffFF1212 WARNING|r|cffF9F9F7: The users of this addon are professionals, imaginary or just plain kooks. DO NOT ATTEMPT any of these maneuvers without proper supervision. VIOLATORS WILL BE SMACKED!|r')

local frame = CreateFrame("Frame")

r = {
	"takes name on the Jerry Springer show and beats his ass legally.",
	"bangs name's mom.",
	"let name know that if he ever gave a fuck he'd shave his nuts, tuck his dick in between his legs and cluck.",
	"is sorry to hear about name's genital warts.",
	"let name know that he can grow up and be just like him.",
	"ball so hard!",
	"LOLOLOLOLOLOLs at name.",
	"is the worst thing since Elvis Presley.",
	"make name disappear like his ex-wife.",
	"doesn't give a fuck. God sent him to piss the world off!",
	"signs name an autograph. Thanks for the support, ASSHOLE!",
	"hits name with the cancer satellite.",
	"slaps name, eat shroomz, then OD.",
	"has been with ten women who got HIV. name wanna grow up and be just like him!",
	"is dying his hair pink and start caring about what name thinks.",
	"wipes his tears with money.",
	"probably got a couple of screws up in his head loose, but no worse than what's going on in name's parents bedroom.",
	"is the boss, just to get that across.",
	"flashes his Blizzard trampstamp for name.",
	"has shoveled shit all his life, and now he's dumping it on name.",
	"bouncing on name's D.",
	"IS 11 AND WAIT TIL HIS DAD GOES TO BED THEN HE TAKES HIS IPAD INTO THE ATTIC AND HANG UPSIDE DOWN LIKE A BAT BUSTIN PEE OUT HIS NUTS.",
	"came here for Nirvana.",
	"infects name with some virus from a third world country like Norway or UK.",
	"thanks name for the lube.",
	"tells name TBC is not suitable for those suffering from a weak heart.",
}
rs = table.getn(r)

d = {
	"Hellfire Ramparts",
	"The Blood Furnace",
	"The Shattered Halls",
	"Mana-Tombs",
	"Auchenai Crypts",
	"Sethekk Halls",
	"Shadow Labyrinth",
	"The Slave Pens",
	"The Underbog",
	"The Steamvault",
	"Old Hillsbrad Foothills",
	"The Black Morass",
	"The Arcatraz",
	"The Botanica",
	"The Mechanar",
}
ds = table.getn(d)

local whoami = UnitName("player"):gmatch("%w+")()

fs = "fFuUvVaA4lL1eE3"
c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-:_"

function GenAchievementData(len)
	local s = ""
	for i=1, len do
		local ci = math.random(1, string.len(c))
		s = s .. string.sub(c, ci, ci)
	end
	return s
end

function GenAchievementFVMsg(...)
	local s = ""
	local indexes = { ... }
	for i=1, table.getn(indexes), 2 do
		local index = math.random(indexes[i], indexes[i+1])
		s = s .. string.sub(fs, index, index)
		if i == 3 then
			s = s .. '-'
		end
	end
	return s
end

function GenComeback(name)
	local i = math.random(rs)
	local msg = string.gsub(r[i], "name", name)
	return msg
end

function GenDungeonSuggestion()
	local i = math.random(ds)
	return "suggests " .. d[i] .. "."
end

function BuggPrint(msg)
	print('|cff55DFFFBugg|r|cff29D5C5Addon|r|cffF9F9F7: ' .. msg .. ' n00b!|r')
end

frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_EMOTE")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:SetScript("OnEvent", function (self, event, ...)
	local args = { ... }
	if event == "CHAT_MSG_TEXT_EMOTE" then
		local question = string.match(args[1], "questions you")

		if question then
			local msg = GenDungeonSuggestion()
			SendChatMessage(msg, "EMOTE")
		end
	elseif event == "CHAT_MSG_EMOTE" then
		local emote = args[1]
		local name = args[2]:gmatch("%w+")()
		local sy = string.match(emote, "spits? on you")
		local sn = string.match(string.lower(emote), "spits? on " .. string.lower(whoami))

		if name ~= whoami then
			if sy or sn then
				local msg = GenComeback(name)
				SendChatMessage(msg, "EMOTE")
			end
		end
	elseif event == "CHAT_MSG_GUILD" then
		local gmsg = args[1]
		local who = args[2]:gmatch("%w+")()
		local msg = string.lower(gmsg)
		if whoami ~= who and msg == "gn" or msg == "good night" or msg == "goodnight" or msg == "g n" or msg == "g.n" then
			SendChatMessage(gmsg .. ' ' .. who, "GUILD")
		end
	end
end)

---

SLASH_BUGG1 = '/bugg'
function SlashCmdList.BUGG(msg, ...)
	local t = {}
	for a in msg:gmatch('[^ ]+') do
		table.insert(t, a)
	end
	local ts = table.getn(t)

	if ts == 0 then
		return
	end

	local cmd = t[1]:lower()

	if cmd == "help" then
		BuggPrint('Documentation can be found at https://github.com/buggorm/BuggAddon')
	elseif cmd == "m" or cmd == "macro" then
		local name = t[2]
		local args = ''
		for i=3,ts do
			if args == '' then
				args = t[i]
			else
				args = args .. ' ' .. t[i]
			end
		end

		local icon = 'INV_MISC_QUESTIONMARK'

		local macroId = EditMacro(name, name, icon, args, nil)
		local macroCount = GetNumMacros()

		if macroId > macroCount then
			CreateMacro(name, icon, args, nil)
		end
	elseif cmd == "a" or cmd == "achievement" then
		local lang = t[2]
		local li = 1
		local lt = {
			"Je viens d'obtenir le haut fait", -- french
			"Cefais y cyflawniad yn unig", -- welsh
			"I just got the achievement", -- english
			"Я только что получил достижение", -- russian
		}

		if lang == "welsh" then
			li = 2
		elseif lang == "english" then
			li = 3
		elseif lang == "russian" then
			li = 4
		elseif lang == "random" then
			li = math.random(1, table.getn(lt))
		else
			li = 1
		end

		local s = lt[li] .. " [ClassicAchievements:" .. GenAchievementData(4) .. ':' .. GenAchievementData(8) .. ':' .. GenAchievementFVMsg(1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13, 15) .. ':' .. GenAchievementData(4) .. ']'
		SendChatMessage(s, "GUILD")
	elseif cmd == "i" or cmd == "item" then
		local url = "https://tbc.wowhead.com/search?q="
		local query = ''
		for i=2,ts,1 do
			if query == '' then
				query = t[i]
			else
				query = query .. '+' .. t[i]
			end
		end

		if query == '' then
			return
		end

		SendChatMessage(url .. query, "WHISPER", nil, whoami)
	elseif cmd == "qc" then
		local url = t[2]

		if url == nil then
			return
		end
		if not string.match(url, "^https?:\/\/tbc\.wowhead\.com\/quest=[0-9]+\/.*") then
			BuggPrint('Invalid URL')
		end

		local questId = string.match(string.match(url, "quest=[0-9]+"), "[0-9]+")
		if questId == nil then
			return
		end

		RunScript("print(C_QuestLog.IsQuestFlaggedCompleted(" .. questId .. "))")
	elseif cmd == "version" or cmd == "--version" or cmd == "-v" then
		BuggPrint('1.3')
	else
		BuggPrint('Invalid command')
	end
end
