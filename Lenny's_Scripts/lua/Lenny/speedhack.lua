require("cvar3")
CreateClientConVar("lenny_speedv", 10)

concommand.Add("+lenny_speed", function()
	GetConVar("sv_cheats"):SetValue(1)
	GetConVar("host_timescale"):SetValue(GetConVarNumber("lenny_speedv"))
end)

concommand.Add("-lenny_speed", function()
	GetConVar("host_timescale"):SetValue(1)
end)