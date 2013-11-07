function doa180()
	aim = ply:GetAimVector():Angle()
	ply:SetEyeAngles(aim1 - Angle(0, 180, 0))
end

concommand.Add("lenny_180", doa180)

