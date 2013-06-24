concommand.Add( "atm_getmoney", function(ply, cmd, args)

	local name = args[1]
	local money = args[2]

	if not money or not name then
		chat.AddText( nil, cmd.." name money" )
		return
	end

	local vict
	for k,v in pairs(player.GetAll()) do
		if string.find( v:Nick(), name ) then
			vict = v
			break
		end
	end

	if not IsValid(vict) then
		chat.AddText( nil, "No player found with "..name.." in their name." )
                return
	end

	chat.AddText( nil, "Attempting to take $"..money.." from "..vict:Nick().."." )
	RunConsoleCommand( "rp_atm_withdraw", "", vict:UniqueID(), money )

end )

concommand.Add("atm_takemoney", function(players, command, args)
	for k, v in pairs(player.GetAll()) do
		RunConsoleCommand("atm_getmoney", ""..v:GetName().."", args[1])
	end
end)

local function shorten(numb)
	newnumb = numb*0.1
	return newnumb
end
local function shorten2(numb, times)
	for i = 0, times-1, 1 do
		numb = shorten(numb)
		--print("Numb = ".. numb)
	end
	return numb
end


concommand.Add("atm_takeallmoney", function(players, command, args)
	
	for i = 0, #args[1], 1 do
		lol = shorten2(args[1], i-1)
		for i = lol, shorten(lol), lol*(-1) do
			for k, v in pairs(player.GetAll()) do
				RunConsoleCommand("atm_getmoney", ""..v:GetName().."", i)
			end
	end

	end
end)