function doa180()
	aim1 = ply:GetAimVector():Angle()
	print(aim1)
	ply:SetEyeAngles(aim1 - Angle(0, 180, 0))
	//local ang = (vec1 - vec2):Angle()
	print(vec1)

	//ply:SetEyeAngles(ang)
end

concommand.Add("lenny_180", doa180)

