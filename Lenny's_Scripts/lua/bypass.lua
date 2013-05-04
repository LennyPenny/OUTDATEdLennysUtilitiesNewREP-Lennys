require("cvar3")

GetConVar("sv_allowcslua"):SetFlags(0)
GetConVar("sv_cheats"):SetFlags(0)

GetConVar("sv_allowcslua"):SetValue(1)
GetConVar("sv_cheats"):SetValue(1)
if CLIENT and GetConVarNumber("sv_allowcslua") == 1 then
chat.AddText(
Color(255,69,0,255), "~BYPASS~ Suceeded ")

end