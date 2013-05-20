CreateClientConVar("lenny_drpgod", 0, true, false)
local function buyhealth()
	if GetConVarNumber("lenny_drpgod") == 1 then
		if LocalPlayer():Alive() and LocalPlayer():Health() < 75 then
			RunConsoleCommand("say", "/buyhealth")
		end
	end
end

hook.Add("Think", "buyhealththing", buyhealth)