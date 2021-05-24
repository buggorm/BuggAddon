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
	"IS 11 AND WAIT TIL HIS DAD GOES TO BED THEN HE TAKES HIS IPAD INTO THE ATTIC AND HANG UPSIDE DOWN LIKE A BAD BUSTIN PEE OUT HIS NUTS.",
	"came here for Nirvana.",
	"infects name with some virus from a third world country like Norway or UK.",
	"thanks name for the lube.",
	"tells name TBC is not suitable for those suffering from a weak heart.",
}
rs = table.getn(r)

frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:SetScript("OnEvent", function (self, event, ...)
	if event == "CHAT_MSG_TEXT_EMOTE" then
		local args = tostring(...)
		local spit = string.match(args, "spits on you")
		local lol = string.match(args, "laughs at you")

		local respond = spit or lol

		if respond then
			local i = math.random(rs)
			local name = args:gmatch("%w+")()
			local msg = string.gsub(r[i], "name", name)

			SendChatMessage(msg, "EMOTE")
		end
	end
end)
