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
	"signs name and autograph. Thanks for the support, ASSHOLE!",
	"hits name with the cancer satellite.",
	"slaps name, eat shroomz, then OD.",
	"has been with ten women who got HIV. name wanna grow up and be just like him!",
	"is dying his hair pink and start caring about what name thinks.",
	"wipes his tears with money.",
}
rs = table.getn(r)

frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:SetScript("OnEvent", function (self, event, ...)
	if event == "CHAT_MSG_TEXT_EMOTE" then
		local args = tostring(...)
		local spit = string.match(args, "spits on you")
		if spit then
			local i = math.random(rs)
			local name = args:gmatch("%w+")()
			local msg = string.gsub(r[i], "name", name)

			SendChatMessage(msg, "EMOTE")
		end
	end
end)
