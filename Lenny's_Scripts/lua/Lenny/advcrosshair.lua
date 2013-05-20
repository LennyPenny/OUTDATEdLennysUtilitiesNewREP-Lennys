CreateClientConVar("lenny_advcrosshair", 1, true, false)
CreateClientConVar("lenny_advcrosshair_hitmarker", 1, true, false)
CreateClientConVar("lenny_advcrosshair_info", 1, true, false)


function advcrosshair()
	if GetConVarNumber("lenny_advcrosshair") == 1 then
		local x = ScrW() / 2
		local y = ScrH() / 2
			target = LocalPlayer():GetEyeTrace().Entity
		if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and (target:IsPlayer() or target:IsNPC()) then
			crosscolor = Color(220,60,90, 150)
			surface.SetDrawColor(crosscolor)
			if GetConVarNumber("lenny_advcrosshair_info") == 1 then
				draw.DrawText("Heath: "..target:Health(), "Trebuchet18", x, y +25, Color(255,255,255, 150), 1)

			end
			if GetConVarNumber("lenny_advcrosshair_hitmarker") == 1 then
				if LocalPlayer():KeyDown(IN_ATTACK) and LocalPlayer():GetActiveWeapon():Clip1() > 0 then
					surface.SetDrawColor(255,255,255)
					surface.DrawLine(x+15, y+15, x+8, y+8)
					surface.DrawLine(x-15, y-15, x-8, y-8)
					surface.DrawLine(x-15, y+15, x-8, y+8)
					surface.DrawLine(x+15, y-15, x+8, y-8)
				end
			end

		else
			crosscolor = Color(255,255,255, 150)
		end

		/*for _, v in pairs(player.GetAll()) do
			vtarget = v:GetEyeTrace().Entity
			if vtarget:IsPlayer() then
				if LocalPlayer():Alive() and v:GetActiveWeapon():Clip1() > 0 then
					if vtarget:Name() == LocalPlayer():Name() then
						draw.DrawText(vtarget:Name().." is aiming a weapon at you", "Trebuchet18", x, y +35, Color(255,255,255, 150), 1)
					end
				end
			end
		end*/


	
		surface.SetDrawColor(crosscolor)
		local gap = 15
		local length = gap + 10
		surface.DrawLine( x - length, y, x - gap, y )
		surface.DrawLine( x + length, y, x + gap, y )
		surface.DrawLine( x, y - length, x, y - gap )
		surface.DrawLine( x, y + length, x, y + gap )
		surface.SetDrawColor(0, 255, 0)
		surface.DrawLine( x +2 , y, x -2, y)
		surface.DrawLine( x , y +2, x , y-2)
	end
end
hook.Add("HUDPaint", "advcrosshair", advcrosshair)