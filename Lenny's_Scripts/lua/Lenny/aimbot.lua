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
				if LocalPlayer():KeyDown(IN_ATTACK) then
					ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
				end
			end
		end
	end
end


local function aimbotadv()
	if GetConVarNumber("lenny_aimbotadv") == 1 then
		function TableSortByDistance( former, latter )
			return latter:GetPos():Distance( LocalPlayer():GetPos() ) > former:GetPos():Distance( LocalPlayer():GetPos() ) 
		end
		playerss = {}
		function GetPlayersByDistance( )
		local players = player.GetAll()
		table.sort( players, TableSortByDistance )
		return players
		end

		if GetPlayersByDistance()[2]:Health() > 0 and GetPlayersByDistance()[2]:Alive() then
			local ply = LocalPlayer()
			local head = GetPlayersByDistance()[2]:LookupBone("ValveBiped.Bip01_Head1")
			local headpos,headang = GetPlayersByDistance()[2]:GetBonePosition(head)
			ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
		end
		/*
		if (vdis <= 800) and vdis != 0 then
			local ply = LocalPlayer()
			local head = players[1]:LookupBone("ValveBiped.Bip01_Head1")
			local headpos,headang = players[1]:GetBonePosition(head)
			ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle()) )
		end */
	end
end



hook.Add("Think", "Aimbotty", aimbot)
hook.Add("Think", "Aimbott2y", aimbotadv)

