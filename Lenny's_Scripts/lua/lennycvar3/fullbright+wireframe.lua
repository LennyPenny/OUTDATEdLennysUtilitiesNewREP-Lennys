require("cvar3")
fullbrighton = 0
alreadyprinted = 0

concommand.Add("lenny_fullbright", function()
	if fullbrighton == 0 then
		GetConVar("sv_cheats"):SetValue(1)
		RunConsoleCommand("mat_fullbright", "1")
		fullbrighton = 1
		if alreadyprinted == 0 then
			Msg("enter command again, to disable fullbright")
			alreadyprinted = 1
		end	
	else
		RunConsoleCommand("mat_fullbright", "0")
		fullbrighton = 0
	end
end)