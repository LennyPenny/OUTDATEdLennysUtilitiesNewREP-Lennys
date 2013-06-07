CreateClientConVar("lenny_bunnyhop", 1, true, false)

function Bunnyhop()
	if GetConVar("lenny_bunnyhop"):GetInt() == 1 then
	 	if input.IsKeyDown(KEY_SPACE) then
	 		if LocalPlayer():IsOnGround() then
	 			RunConsoleCommand("+jump")
	 			timer.Create("Bhop", 0, 0.01, function()
	 		 	RunConsoleCommand("-jump")
	 		 	
	 		 	end)
	 		end
	 	end
	end
end

hook.Add("Think", "Hoppy", Bunnyhop )
local bhopoff
hook.Add("StartChat", "Bhpdisbaker", function()
	if GetConVarNumber("lenny_bunnyhop") == 1 then
		RunConsoleCommand("lenny_bunnyhop", 0)
		bhopoff = true
	else
		bhopoff = false
	end
end)

hook.Add("FinishChat", "bhpenabler", function()
	if bhopoff then
		RunConsoleCommand("lenny_bunnyhop", 1)
		bhopoff = false
	end
end)
