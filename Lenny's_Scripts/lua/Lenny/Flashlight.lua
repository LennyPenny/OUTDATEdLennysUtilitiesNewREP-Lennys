CreateClientConVar("lenny_flashlight", 0, true, false)

function Flashspam()
	if GetConVar("lenny_flashlight"):GetInt() == 1 then
		if input.IsKeyDown(KEY_H) then
			RunConsoleCommand("impulse", "100")
			return end
	end
end

hook.Add("Think", "Flspam", Flashspam )
local flchatoff

hook.Add("StartChat", "FLashChatDisabler", function()
	if GetConVarNumber("lenny_flashlight") == 1 then
		RunConsoleCommand("lenny_flashlight", 0)
		flchatoff = true
	else
		flchatoff = false
	end
end)

hook.Add("FinishChat", "FLashchatenabler", function()
	if flchatoff then
		RunConsoleCommand("lenny_flashlight", 1)
		flchatoff = false
	end
end)
