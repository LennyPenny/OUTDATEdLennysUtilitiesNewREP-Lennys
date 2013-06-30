local whon
CreateClientConVar("lenny_wallhack_drawprops", 1, true, false)
CreateClientConVar("lenny_wallhack_distance", 400)
local function draw3d()
	if whon == true then
		cam.Start3D()
			for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), GetConVarNumber("lenny_wallhack_distance"))) do
				if v:IsPlayer() then
					if v != LocalPlayer() and v:Alive() then
						render.SetColorModulation( 255, 0, 0, 0)
						render.MaterialOverride(Material("models/debug/debugwhite"))
						render.SetBlend(.75)
						v:DrawModel()
					end
				elseif GetConVarNumber("lenny_wallhack_drawprops") == 1 and v:GetClass() == "prop_physics" then
					render.SetColorModulation( 0, 255, 0)
					v:SetColor(Color(255,255,255))
					render.SetBlend( .1 )
					v:DrawModel()
				end
			end
		cam.End3D()
	end
end

hook.Add("HUDPaint", "draw3d", draw3d)

concommand.Add("lenny_wallhack", function()
	if whon != true then
		whon = true
	elseif whon == true then
		whon = false
	end
end)