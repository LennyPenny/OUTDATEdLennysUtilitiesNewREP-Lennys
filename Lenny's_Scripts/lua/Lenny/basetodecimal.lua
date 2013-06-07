local function commandargs(player, command, args)
	base = args[1]
	number = args[2]
	ns = #args[2]

	result = 0

	print("Base: "..base.."\nNumber: "..number.."\nLength: "..ns)

	for i = 0, ns - 1, 1 do
		n = string.GetChar(number, i)
		if i == 0 and n ~= nil then
			n = 0
		end
		result2  = n * math.pow(base, i)
		result = result + result2
	end
	print(result)
end

concommand.Add("lenny_test", commandargs)