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

local whoami = UnitName("player")

function genInsult(args)
	local i = math.random(rs)
	local name = args:gmatch("%w+")()
	local msg = string.gsub(r[i], "name", name)
	return msg
end

function genDungeonSuggestion(args)
	local i = math.random(ds)
	return "suggests " .. d[i] .. "."
end

frame:RegisterEvent("CHAT_MSG_EMOTE")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:SetScript("OnEvent", function (self, event, ...)
	if event == "CHAT_MSG_TEXT_EMOTE" then
		local args = tostring(...)
		local spit = string.match(args, "spits on you")
		local lol = string.match(args, "laughs at you")
		local rofl = string.match(args, "rolls on the floor laughing at you")
		local question = string.match(args, "questions you")

		local hostile = spit or lol or rofl

		if hostile then
			local msg = genInsult(args)
			SendChatMessage(msg, "EMOTE")
		elseif question then
			local msg = genDungeonSuggestion(args)
			SendChatMessage(msg, "EMOTE")
		end
	elseif event == "CHAT_MSG_EMOTE" then
		local args = tostring(...)
		local myName = UnitName("player")
		local spit = string.match(args, "spits on " .. myName)
		local lol = string.match(args, "laughs at " .. myName)
		local rofl = string.match(args, "rolls on the floor laughing at " .. myName)

		local hostile = spit or lol or rofl

		if hostile then
			local msg = genInsult(args)
			-- TODO fix name
--			SendChatMessage(msg, "EMOTE")
		end
	end
end)

---

SLASH_BUGG1 = '/bugg'
function SlashCmdList.BUGG(msg, ...)
	local t = {}
	for a in msg:gmatch('[a-zA-Z0-9-_/?!]+') do
		table.insert(t, a)
	end
	local ts = table.getn(t)

	if ts == 0 then
		return
	end

	local cmd = t[1]:lower()

	if cmd == "m" or m == "macro" then
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
		-- Je viens d'obtenir le haut fait [ClassicAchievements:223-fU-V4l3-2-39.69]
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
		-- https://tbc.wowhead.com/search?q=black+lotus
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
	else
		print('|cff55DFFFBugg|r|cff29D5C5Addon|r|cffF9F9F7: Invalid command n00b!|r')
	end
end
