

-- DarkRP NameChanger

/*local names!!!!OLD!!!! = {        -- Simply add/remove/modify this list if you want more/less/other names
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
*/

local firstnames = {
	
"Nickolas",
"Geoffrey",
"Chauncey",
"Kendall",
"Timothy",
"Anthony",
"Enrique",
"Gonzalo",
"Winford",
"Hilton",
"Jimmie",
"Claude",
"Lavern",
"Danial",
"Milton",
"Alonzo",
"Leland",
"Arnold",
"Genaro",
"Jamaal",
"Morris",
"Rodger",
"Barney",
"Lyman",
"Abdul",
"Dante",
"Ethan",
"Julio",
"Jimmy",
"Vince",
"Elton",
"Cyril",
"Rocky"
}

local lastnames = {
"Hambarzumjan-landry",
"Kelley-milburn",
"Pagliaricci",
"Thierfelder",
"Wanderstock",
"Chakravarti",
"Rudenstine",
"Peregrino",
"Hallowell",
"Roskowick"
}



concommand.Add( "lenny_namechange" , function()
LocalPlayer():ConCommand("say /rpname " ..table.Random(firstnames).. " " .. table.Random(lastnames))




end )

