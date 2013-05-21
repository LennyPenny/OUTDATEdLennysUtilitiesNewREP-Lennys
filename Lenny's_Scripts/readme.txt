This is a constantly updated pack of my scripts. 

Disclaimer:

YOU ARE ALLOWED TO USE THE CODE OF THESE SCRIPTS FOR PRIVATE USE.
HOWEVER, IF YOU WANT USE THEM IN A PULBICLY AVAILABLE !NON COMMERCIAL! RELEASE, GIVE CREDIT: http://steamcommunity.com/id/LennyPenny
YOU ARE NOT ALLOWED TO USE THESE SCRIPTS IN ANY COMMERCIAL WAY.

Features (as of yet):
- simple ESP with admin recognition and distance depended additional info
	-additional costumizable Printer/Entitiy finder
- an andvanced crosshair showing usefull information
- wall-, fullbright-, speedhack and sv_cheats/allowcslua bypasser (works only if you have cvar3 installed -  instructions to that will follow on a later date)
- Chat- and Console Commandspammer
- bunnyhop script
- flashlight spammer
- DarkRP Namechanger: Generating a random fullname or uses a library of "gamer nicknames"
- Buggy triggerbot and aimbot (no fix for the aimbot planned)
- weak anti-anti cheat
- Witness script (shows the amount of player which currently see you
- darkRP godmode (only if /buyhealth is enabled and weapondamage < 100)
- Simple to use menu (will add new the features to it when I feel like doing so)

How to run the script?
Type "lua_openscript_cl autorun/client/lenny.lua" in the console to run the scripts. 
To open the configuration menu run the command "lenny_menu". 

Note:
If the Menu doesn't open up, try running the command "lenny_reload" a few times. It's helpfull to fix a lot of bugs. So everytime something doesn't do what it's supposed to, spam the console with it.

To change your name quickly in DarkRP type "lenny_namechange". (Binding this to a key is a good idea)

Available commands:
lenny_menu --opens the configuration menu (incomplete)
lenny_reload --reloads the script (usefull to fix errors, bugs, etc...)
lenny_namechange --runs the chatcommand "/rpname" in DarkRP and changes it to a random one. (Lookup the sourecode to modify them.)
lenny_180 --turns you around by 180°

cvar3 dependend:
lenny_fullbright --toggels fullbright
+lenny_speed --bind it to a key and hold it to activate the speedhack
lenny_wireframe --toggles wireframe wallhack
lenny_speed+ --adds 0.5 to the current speedhack velocity
lenny_speed --subtracts 0.5 from the current speedhack velocity

Available cvars:
lenny_esp -- enables/disables the ESP
lenny_esp_entities -- enables/disables the Entity ESP
lenny_esp_additionals --enables/disables distance dependend info
lenny_gamernicks -- 0 = use fully randomly generated names 1 = use a set of preset "gamer nicknames"
lenny_advcrosshair --enables/disables the adv crosshar
lenny_advcrosshair_hitmarker --enables/disables the adv crosshair hitmarker
lenny_advcrosshair_info --enables/disables the additional info of the adv crosshair
lenny_bunnyhop -- enables/disables the bunnyshop script
lenny_flashlight -- enables/disables the flashlight spammer
lenny_chatspam -- enables/disables the chat/command spam
lenny_spamchatorcommand -- 1 = Spam a chatmessage, 0 = spam a console command
lenny_aimbot --enables/disables a basic aimbot(you need to aim at a player to make you snap to his head)
lenny_aimbotadv --enables/disables a shitty autoaimbot
lenny_drpgod --enables/disables a script which spams "/buyhealth" if your health drops below 75
lenny_triggerbot --enables/disables a triggerbot, you need to rejoin if you want to completly disable it

cvar3 dependend:
lenny_speedv --sets the multiple of your current speed when you enable the speedhack

Sourcecode is available here: 
https://github.com/LennyPenny/LennysUtilities/tree/master/Lenny's_Scripts