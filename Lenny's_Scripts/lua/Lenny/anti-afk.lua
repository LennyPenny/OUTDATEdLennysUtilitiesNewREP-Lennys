CreateClientConVar("lenny_antiafktimer", 5)
local aafkon = 0
local function aafkm()
	draw.SimpleText("ANTI AFK MODE IS ON! \n Run the consolecommand lenny_antiafk to turn it off", "HUDNumber5", ScrW()*.1, ScrH()*.5, Color(255,0,0))
end

local movements = {
1,
2,
3,
4,
5,
6,
7
}

local function move1()
	RunConsoleCommand("+forward")
	timer.Simple(.5, function()
		RunConsoleCommand("-forward")
	end)
end

local function move2()
	RunConsoleCommand("+left")
	RunConsoleCommand("+back")
	timer.Simple(.5, function()
		RunConsoleCommand("-left")
		RunConsoleCommand("-back")
	end)
end

local function move3()
	RunConsoleCommand("+back")
	timer.Simple(.5, function()
		RunConsoleCommand("-back")
	end)
end

local function move4()
	RunConsoleCommand("+right")
	RunConsoleCommand("+forward")
	timer.Simple(.5, function()
		RunConsoleCommand("-right")
		RunConsoleCommand("-forward")
	end)
end

local function move5()
	RunConsoleCommand("+moveright")
	timer.Simple(.5, function()
		RunConsoleCommand("-moveright")
	end)
end


local function move6()
	RunConsoleCommand("+back")
	timer.Simple(.5, function()
		RunConsoleCommand("-back")
	end)
end

local function move7()
	RunConsoleCommand("+right")
	RunConsoleCommand("+moveleft")
	timer.Simple(.5, function()
		RunConsoleCommand("-right")
		RunConsoleCommand("-moveleft")
	end)
end


local function antiafk()
	if aafkon == 0 then
		timer.Create("antiafk", GetConVarNumber("lenny_antiafktimer"), 0, function()
			local rdm = table.Random(movements)
			if rdm == 1 then
				move1()
			elseif rdm == 2 then
				move2()
			elseif rdm == 3 then
				move3()
			elseif rdm == 4 then
				move4()
			elseif rdm == 5 then
				move5()
			elseif rdm == 6 then
				move6()
			elseif rdm == 7 then
				move7()
			end
		end)
		hook.Add("HUDPaint","aafkpaint", aafkm)
		aafkon = 1
	elseif aafkon == 1 then
		timer.Destroy("antiafk")
		hook.Remove("HUDPaint", "aafkpaint")
		aafkon = 0
	end
end
concommand.Add("lenny_antiafk", antiafk)
