require("cvar3")
CreateClientConVar("lenny_speedv", 2)


concommand.Add("lenny_speed+", function()
	RunConsoleCommand("lenny_speedv", ""..GetConVarNumber("lenny_speedv") + 0.5)
	timer.Simple(0.25, function()
	 	chat.AddText("Speed is: "..GetConVarNumber("lenny_speedv").."x normal")
	 end) 
end)
concommand.Add("lenny_speed-", function()
	RunConsoleCommand("lenny_speedv", ""..GetConVarNumber("lenny_speedv") - 0.5)
	timer.Simple(0.25, function()
	 	chat.AddText("Speed is: "..GetConVarNumber("lenny_speedv").."x normal")
	 end) 
end)


concommand.Add("+lenny_speed", function()
	GetConVar("sv_cheats"):SetValue(1)
	GetConVar("host_timescale"):SetValue(GetConVarNumber("lenny_speedv"))
end)

concommand.Add("-lenny_speed", function()
	GetConVar("host_timescale"):SetValue(1)
end)

