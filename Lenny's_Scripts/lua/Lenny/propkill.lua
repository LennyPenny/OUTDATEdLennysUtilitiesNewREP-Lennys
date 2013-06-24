local down = 0
function pkillpress ()
	if input.IsKeyDown(KEY_J) then
		RunConsoleCommand("+attack")
		if down == 0 then
			RunConsoleCommand("gm_spawn", "models/props_c17/furnitureStove001a.mdl")
			down = 1
		end
		timer.Simple(1, function()
			RunConsoleCommand("-attack")
			down = 0
			timer.Simple(1, function() RunConsoleCommand("undo")
			end)
		end)
	end
end
 
hook.Add( "Think", "pkillpress", pkillpress )