

-- DarkRP NameChanger

local names = {        -- Simply add/remove/modify this list if you want more/less/other names
"Peter Maffai", 
"Michael Jackson", 
"Thomas McGee", 
"Clint Westwood", 
"Jonathan Bumble", 
"Tom Oblus", 
"Lennart Hupple", 
"Harry Kuss", 
"Willhelm Dumble", 
"Christopher Game", 
"Paul MacCardnay", 
"Elton Yon",
"Ashton Kitingson",
"Mick Momnay", 
"Dirk Dauer", 
"Ian Meow", 
"Ronald McGayben", 
"Gabe Oldwell", 
"Domnik Klein", 
"Lennerd Bearenhart", 
"Griffin Konst", 
"Plumber Jack", 
"Jack Black", 
"Grufer Hump", 

}



concommand.Add( "lenny_namechange" , function()
LocalPlayer():ConCommand("say /rpname " ..table.Random(names).. "")




end )

