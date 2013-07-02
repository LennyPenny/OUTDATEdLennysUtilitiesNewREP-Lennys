			-- originally by Hermy11, fixed for Gmod 13 by Lenny.
    local Cap = math.cos(math.rad(45))
    local Offset = Vector(0, 0, 32)
    local Trace = {}


    timer.Create("lol", .5, 0, function()
        Witnesses = 0
        BeingWitnessed = false
        for k, pla in pairs(player.GetAll()) do
            if pla:IsValid() and pla != LocalPlayer() then
                Trace.start  = LocalPlayer():EyePos() + Offset
                Trace.endpos = pla:EyePos() + Offset
                Trace.filter = {pla, LocalPlayer()}
                TraceRes = util.TraceLine(Trace)
                if !TraceRes.Hit then
                    if (pla:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - pla:EyePos())) > Cap) then
                        Witnesses = Witnesses + 1
                        BeingWitnessed = true
                    end
                end
            end
        end
    end)


    function Draw()
    	surface.SetFont("BudgetLabel")
    	if BeingWitnessed then
    		surface.SetTextColor(255, 000, 000, 255)
    		Texture = surface.GetTextureID("gui/silkicons/exclamation")
    	else
    		surface.SetTextColor(000, 255, 000, 255)
    		Texture = surface.GetTextureID("gui/silkicons/emoticon_smile")
    	end
    	local Text = "Witnesses: "..tostring(Witnesses)
    	local Width, Height = surface.GetTextSize(Text)

    	surface.SetDrawColor(80, 80, 80, 180)
    	surface.DrawRect(ScrW()/2 - (Width/2 + 24), 4, Width + 28, Height + 8)
    	surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawOutlinedRect(ScrW()/2 - (Width/2 + 24), 4, Width + 28, Height + 8)

    	surface.SetTexture(Texture)
    	surface.SetDrawColor(255, 255, 255, 255)
    	surface.DrawTexturedRect(ScrW()/2 - (Width/2 + 20), 8, 16, 16)
    	surface.SetTextPos(ScrW()/2 - Width/2, 8)
    	surface.DrawText(Text)
    end
    hook.Add("HUDPaint", "WitnessesBox", Draw)