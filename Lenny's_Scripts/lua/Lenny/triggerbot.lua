CreateClientConVar("lenny_triggerbot", 0, true, false)

function triggeerbot()
	if GetConVarNumber("lenny_triggerbot") == 1 then
		target = LocalPlayer():GetEyeTrace().Entity
		if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and (target:IsPlayer() or target:IsNPC()) then
			if !Firing then
            	RunConsoleCommand( "+attack" )
            	LocalPlayer():GetActiveWeapon().SetNextPrimaryFire( LocalPlayer():GetActiveWeapon() ) // We need it to stop and start shooting, luckily weapons have delay already coded.
           		Firing = true
        	else
            	RunConsoleCommand( "-attack" )
            	Firing = false
            end
		end
	end
end


hook.Add("Think", "Triggeerbothook", triggeerbot)