CreateClientConVar("lenny_aimbot", 0, true, false)
CreateClientConVar("lenny_aimbotadv", 0, true, false)

local function aimbot()
	if GetConVarNumber("lenny_aimbot") == 1 then
		local ply = LocalPlayer()
		local trace = util.GetPlayerTrace( ply )
		local traceres = util.TraceLine( trace )
		if traceres.HitNonWorld then
			local target = traceres.Entity
			if target:IsPlayer() or target:IsNPC() then
				local head = target:LookupBone("ValveBiped.Bip01_Head1")
				local headpos,headang = target:GetBonePosition(head)
				ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
			end
		end
	end
end
local function aimbotadv()





	if GetConVarNumber("lenny_aimbotadv") == 1 then
		for k, v in pairs(player.GetAll()) do
			if LocalPlayer():Alive() and v:Alive() then
				vdis = (v:GetPos() - LocalPlayer():GetPos()):Length()
			else
				vdis = nil
			end

			if (vdis != nil) and (vdis <= 400) then
				local ply = LocalPlayer()
				local head = v:LookupBone("ValveBiped.Bip01_Head1")
				local headpos,headang = v:GetBonePosition(head)
				ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
			end
			
		end
	end
end



hook.Add("Think", "Aimbotty", aimbot)
hook.Add("Think", "Aimbott2y", aimbotadv)