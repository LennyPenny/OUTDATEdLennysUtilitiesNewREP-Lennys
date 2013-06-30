concommand.Add("lenny_morbus", function()
	for k, v in pairs(player.GetAll()) do
		for k2, v2 in pairs(v:GetWeapons()) do
			if string.find(v2:GetPrintName(), "Alien") then
				print(v:Name().." is an Alien!")
			end
		end
	end
end)