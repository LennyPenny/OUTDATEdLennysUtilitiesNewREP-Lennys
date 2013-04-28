CreateClientConVar("lenny_triggerbot", 0, true, false)

function triggerbot()
	if GetConVarNumber("lenny_triggerbot") == 1 then
		target = LocalPlayer():GetEyeTrace().Entity
		if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and (target:IsPlayer() or target:IsNPC()) then
				RunConsoleCommand("+attack")
		 		timer.Create("Shooter", 0, 0.01, function()
		 		RunConsoleCommand("-attack")
		 		end)

			end
	end
end


hook.Add("Think", "Triggerbothook", triggerbot)