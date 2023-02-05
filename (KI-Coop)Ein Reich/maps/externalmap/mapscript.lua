 --------------------------------------------------------------------------------
-- MapName: Krieg der Inseln
--
-- Author: Novator12
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
IncludeGlobals("MapEditorTools")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
SetFriendly(1,2)
SetHostile(1,3)
SetHostile(1,6)
SetHostile(2,6)
SetHostile(1,4)
SetHostile(2,3)
SetHostile(2,4)
SetPlayerName(1, "Dunkler Herrscher" )
SetPlayerName(2, "Mary" )
SetPlayerName(3, "Erec" )
SetPlayerName(4, "Dario" )
SetPlayerName(6, "Banditen" )
SetPlayerName(8, "Ergebene" )
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
    -- set some resources
    AddGold  (0)
    AddSulfur(0)
    AddIron  (0)
    AddWood  (0)	
    AddStone (0)	
    AddClay  (0)	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()
	SetupNormalWeatherGfxSet()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()
	AddPeriodicSummer(460)
  AddPeriodicRain(120)
  AddPeriodicWinter(80)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
 Display.SetPlayerColorMapping(1,ROBBERS_COLOR)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()
  Display.SetPlayerColorMapping(1,ROBBERS_COLOR)
 ActivateShareExploration(1,2,true)


StartCountdown( 60 * 60, OnCountdownFinished, true )

local mercTent = GetEntityId( "MercTent" );
Logic.AddMercenaryOffer( mercTent, Entities.CU_Barbarian_LeaderClub1, 20, ResourceType.Gold, 500, ResourceType.Iron, 300 );
Logic.AddMercenaryOffer( mercTent, Entities.CU_BlackKnight_LeaderMace1, 20, ResourceType.Gold, 800, ResourceType.Iron, 500 );
Logic.AddMercenaryOffer( mercTent, Entities.CU_BanditLeaderBow1, 20, ResourceType.Gold, 500, ResourceType.Wood, 800 );
Logic.AddMercenaryOffer( mercTent, Entities.CU_BanditLeaderSword1, 20, ResourceType.Gold, 1500, ResourceType.Iron, 100 );


SetFriendly(1,2)
SetHostile(1,3)
SetHostile(1,6)
SetHostile(2,6)
SetHostile(1,4)
SetHostile(2,3)
SetHostile(2,4)
SetPlayerName(1, "Dunkler Herrscher" )
SetPlayerName(2, "Mary" )
SetPlayerName(3, "Erec" )
SetPlayerName(4, "Dario" )
SetPlayerName(6, "Banditen" )

local aiID = 2;
local strength = 2;
local range = 100000;
local techlevel = 2;
local position = "Mary";
local aggressiveness = 3;
local peacetime = 0;
MapEditor_SetupAI( aiID, strength, range, techlevel, position, aggressiveness, peacetime );
SetupPlayerAi( aiID, { extracting = 1 } );
SetupPlayerAi( aiID, { repairing = 1 } );
SetupPlayerAi( aiID, { serfLimit = 20 } );
SetPlayerName( aiID, "Mary" );
SetFriendly(1,2);
SetupPlayerAi( 2, { constructing = true } );
        local constructionplan = {

        { type = Entities.PB_VillageCenter1, pos = GetPosition("hq") },
        
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm"), level = 2 },
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("lehm") },
        { type = Entities.PB_Residence3,  pos = GetPosition("lehm") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("lehm"), level = 2 },

       
        { type = Entities.PB_Tower1,  pos = GetPosition("tower"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("tower"), level = 2 },


        { type = Entities.PB_University1, pos = GetPosition("u"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("u"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("u"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },

        { type = Entities.PB_Barracks1, pos = GetPosition("kaserne"), level = 1 },
        { type = Entities.PB_Archery1, pos = GetPosition("kaserne"), level = 1 },
        { type = Entities.PB_Foundry1, pos = GetPosition("kaserne"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("kaserne"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("kaserne"), level = 2 },
        { type = Entities.PB_Stable1, pos = GetPosition("kaserne"), level = 1 },


        { type = Entities.PB_Tower1,  pos = GetPosition("t"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("t"), level = 2 },


        { type = Entities.PB_Tower1,  pos = GetPosition("to"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("to"), level = 2 },


        { type = Entities.PB_Sawmill1,  pos = GetPosition("n"), level = 1 },
        { type = Entities.PB_StoneMason1, pos = GetPosition("n"), level = 1 },
        { type = Entities.PB_Market1, pos = GetPosition("n"), level = 1 },
        { type = Entities.PB_Monastery1, pos = GetPosition("n"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },


        { type = Entities.PB_IronMine1, pos = GetPosition("iron"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("iron") },
        { type = Entities.PB_Residence3,  pos = GetPosition("iron") },
        { type = Entities.PB_Tower1,  pos = GetPosition("iron"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("iron"), level = 2 },

        { type = Entities.PB_StoneMine1, pos = GetPosition("stone"), level = 2 },
        { type = Entities.PB_StoneMine1, pos = GetPosition("stone"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("stone") },
        { type = Entities.PB_Residence3,  pos = GetPosition("stone") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("stone"), level = 2 },
        { type = Entities.PB_Tower1,  pos = GetPosition("stone"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("stone"), level = 2 },

        { type = Entities.PB_SulfurMine1, pos = GetPosition("sulfur") },
        { type = Entities.PB_Farm1,  pos = GetPosition("sulfur") },
        { type = Entities.PB_Residence3,  pos = GetPosition("sulfur") },
        { type = Entities.PB_Tower1,  pos = GetPosition("sulfur"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("sulfur"), level = 2 },

        { type = Entities.PB_Tower1,  pos = GetPosition("turm"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("turm"), level = 2 },



    };

       FeedAiWithConstructionPlanFile( aiID, constructionplan );

   
local aiID = 3;
local strength = 2;
local range = 100000;
local techlevel = 3;
local position = "Erec";
local aggressiveness = 3;
local peacetime = 0;
MapEditor_SetupAI( aiID, strength, range, techlevel, position, aggressiveness, peacetime );
SetupPlayerAi( aiID, { extracting = 1 } );
SetupPlayerAi( aiID, { repairing = 1 } );
SetupPlayerAi( aiID, { serfLimit = 20 } );
SetPlayerName( aiID, "Erec" );
SetFriendly(3,4);
SetupPlayerAi( 3, { constructing = true } );
        local constructionplan = {

        { type = Entities.PB_VillageCenter1, pos = GetPosition("hq1") },
        
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm1"), level = 2 },
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm1"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("lehm1") },
        { type = Entities.PB_Residence3,  pos = GetPosition("lehm1") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("lehm1"), level = 2 },

       
        { type = Entities.PB_Tower1,  pos = GetPosition("tower1"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("tower1"), level = 2 },


        { type = Entities.PB_University1, pos = GetPosition("u1"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("u1"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("u1"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },

        { type = Entities.PB_Barracks1, pos = GetPosition("kaserne1"), level = 1 },
        { type = Entities.PB_Archery1, pos = GetPosition("kaserne1"), level = 1 },
        { type = Entities.PB_Foundry1, pos = GetPosition("kaserne1"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("kaserne1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("kaserne1"), level = 2 },
        { type = Entities.PB_Stable1, pos = GetPosition("kaserne1"), level = 1 },

        { type = Entities.PB_Tower1,  pos = GetPosition("t1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("t1"), level = 2 },


        { type = Entities.PB_Tower1,  pos = GetPosition("to1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("to1"), level = 2 },


        { type = Entities.PB_Sawmill1,  pos = GetPosition("n1"), level = 1 },
        { type = Entities.PB_StoneMason1, pos = GetPosition("n1"), level = 1 },
        { type = Entities.PB_Market1, pos = GetPosition("n1"), level = 1 },
        { type = Entities.PB_Monastery1, pos = GetPosition("n1"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },


        { type = Entities.PB_IronMine1, pos = GetPosition("iron1"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("iron1") },
        { type = Entities.PB_Residence3,  pos = GetPosition("iron1") },
        { type = Entities.PB_Tower1,  pos = GetPosition("iron1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("iron1"), level = 2 },

        { type = Entities.PB_StoneMine1, pos = GetPosition("stone1"), level = 2 },
        { type = Entities.PB_StoneMine1, pos = GetPosition("stone1"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("stone1") },
        { type = Entities.PB_Residence3,  pos = GetPosition("stone1") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("stone1"), level = 2 },
        { type = Entities.PB_Tower1,  pos = GetPosition("stone1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("stone1"), level = 2 },

        { type = Entities.PB_SulfurMine1, pos = GetPosition("sulfur1") },
        { type = Entities.PB_Farm1,  pos = GetPosition("sulfur1") },
        { type = Entities.PB_Residence3,  pos = GetPosition("sulfur1") },
        { type = Entities.PB_Tower1,  pos = GetPosition("sulfur1"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("sulfur1"), level = 2 },

        { type = Entities.PB_Tower1,  pos = GetPosition("turm1"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("turm1"), level = 2 },



    };

       FeedAiWithConstructionPlanFile( aiID, constructionplan );


       	
local aiID = 4;
local strength = 3;
local range = 100000;
local techlevel = 3;
local position = "Dario";
local aggressiveness = 3;
local peacetime = 0;
MapEditor_SetupAI( aiID, strength, range, techlevel, position, aggressiveness, peacetime );
SetupPlayerAi( aiID, { extracting = 1 } );
SetupPlayerAi( aiID, { repairing = 1 } );
SetupPlayerAi( aiID, { serfLimit = 20 } );
SetPlayerName( aiID, "Dario" );
SetFriendly(3,4);
SetupPlayerAi( 4, { constructing = true } );
        local constructionplan = {

        { type = Entities.PB_VillageCenter1, pos = GetPosition("hq2") },
        
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm2"), level = 2 },
        { type = Entities.PB_ClayMine1, pos = GetPosition("lehm2"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("lehm2") },
        { type = Entities.PB_Residence3,  pos = GetPosition("lehm2") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("lehm2"), level = 2 },

       
        { type = Entities.PB_Tower1,  pos = GetPosition("tower2"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("tower2"), level = 2 },


        { type = Entities.PB_University1, pos = GetPosition("u2"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("u2"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("u2"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },

        { type = Entities.PB_Barracks1, pos = GetPosition("kaserne2"), level = 1 },
        { type = Entities.PB_Archery1, pos = GetPosition("kaserne2"), level = 1 },
        { type = Entities.PB_Foundry1, pos = GetPosition("kaserne2"), level = 1 },
        { type = Entities.PB_Tower1,  pos = GetPosition("kaserne2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("kaserne2"), level = 2 },
        { type = Entities.PB_Stable1, pos = GetPosition("kaserne2"), level = 1 },

        { type = Entities.PB_Tower1,  pos = GetPosition("t2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("t2"), level = 2 },


        { type = Entities.PB_Tower1,  pos = GetPosition("to2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("to2"), level = 2 },


        { type = Entities.PB_Sawmill1,  pos = GetPosition("n2"), level = 1 },
        { type = Entities.PB_StoneMason1, pos = GetPosition("n2"), level = 1 },
        { type = Entities.PB_Market1, pos = GetPosition("n2"), level = 1 },
        { type = Entities.PB_Monastery1, pos = GetPosition("n2"), level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Farm1, pos = invalidPosition, level = 2 },
        { type = Entities.PB_Residence1, pos = invalidPosition, level = 2 },


        { type = Entities.PB_IronMine1, pos = GetPosition("iron2"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("iron2") },
        { type = Entities.PB_Residence3,  pos = GetPosition("iron2") },
        { type = Entities.PB_Tower1,  pos = GetPosition("iron2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("iron2"), level = 2 },

        { type = Entities.PB_StoneMine1, pos = GetPosition("stone2"), level = 2 },
        { type = Entities.PB_StoneMine1, pos = GetPosition("stone2"), level = 2 },
        { type = Entities.PB_Farm1,  pos = GetPosition("stone2") },
        { type = Entities.PB_Residence3,  pos = GetPosition("stone2") },
        { type = Entities.PB_VillageCenter1, pos = GetPosition("stone2"), level = 2 },
        { type = Entities.PB_Tower1,  pos = GetPosition("stone2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("stone2"), level = 2 },

        { type = Entities.PB_SulfurMine1, pos = GetPosition("sulfur2") },
        { type = Entities.PB_Farm1,  pos = GetPosition("sulfur2") },
        { type = Entities.PB_Residence3,  pos = GetPosition("sulfur2") },
        { type = Entities.PB_Tower1,  pos = GetPosition("sulfur2"), level = 1 },
        { type = Entities.PB_Tower1, pos = GetPosition("sulfur2"), level = 2 },

        { type = Entities.PB_Tower1,  pos = GetPosition("turm2"), level = 2 },
        { type = Entities.PB_Tower1, pos = GetPosition("turm2"), level = 2 },



    };

       FeedAiWithConstructionPlanFile( aiID, constructionplan );


  MapEditor_SetupAI(5, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(6, 3, 3, 3, "1", 3, 3)
	MapEditor_SetupAI(7, 0, 0, 0, "", 0, 0)
	MapEditor_SetupAI(8, 0, 0, 0, "", 0, 0)

	-- HQ Defeat Condition
	MapEditor_CreateHQDefeatCondition()


  StartSimpleJob("VictoryJob");

  ActivateBriefingsExpansion()
  
  EnableNpcMarker(GetEntityId("pilgrim"))

  PilgrimBrief_1() 

  createBriefingHermit()

  createBriefingHermit1() 

  createBriefingHermit2() 

  createBriefingHermit3()

  createBriefingHermit4()

  createBriefingHermit5()

  createBriefingHermit6()


  CreateChestOpener("pilgrim")

  StartChestQuest()

  CreateChest(GetPosition("chest1"), chestCallbackWood)
  CreateChest(GetPosition("chest2"), chestCallbackGold)

end

-----------------------------------------------------------------------------
--------------------------FirstMapAction-ENDE--------------------------------
-----------------------------------------------------------------------------

function chestCallbackWood()
 Message("Ihr habt eure einen Vorrat an Rohstoffen gefunden. Heureka")
 AddWood(800)
 AddGold(1000)
 AddSulfur(250)
 AddStone(800)
 AddIron(500)
 AddClay(800)
end

-----------------------------------------------------------
-----------------------------------------------------------

function chestCallbackGold()
 Message("Ihr habt Salims großen Schatz gefunden. @ (Ihr erhaltet 3000 Gold und von jedem Rohstoff 1000)")
 AddWood(1000)
 AddGold(3000)
 AddSulfur(1000)
 AddStone(1000)
 AddIron(1000)
 AddClay(1000)
end

-----------------------------------------------------------
-----------------------------------------------------------
function createBriefingHermit6() 

BriefingHermit6 = {} 
BriefingHermit6.restoreCamera = true

-- call on end of biefing
BriefingHermit6.finished = BriefingHermit6Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit6[page] ={}
BriefingHermit6[page].title = "Söldnerwache" 
BriefingHermit6[page].text = "Ich hab, wie ihr befohlen habt das Söldnerquatier blockiert." 
BriefingHermit6[page].position = GetPosition("Hermit6") 
BriefingHermit6[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit6[page] ={}
BriefingHermit6[page].title = "Kerberos" 
BriefingHermit6[page].text = "Sehr gut, aber es ist Krieg ausgebrochen und wir brauchen alle Soldaten, die wir auftreiben können." 
BriefingHermit6[page].position = GetPosition("Hermit6") 
BriefingHermit6[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit6[page] ={}
BriefingHermit6[page].title = "Söldnerwache" 
BriefingHermit6[page].text = "Ich entferne die Blockade.Gebt mir einen Moment. So fertig."
BriefingHermit6[page].position  =  GetPosition("grid")
BriefingHermit6[page].action = function() 
                              ReplaceEntity ("grid", Entities.XD_ScriptEntity ) 
                              end

local npcHermit6 = {} 
npcHermit6.name = "Hermit6" 
npcHermit6.briefing = BriefingHermit6
-- create npc
CreateNPC(npcHermit6) 
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------
function createBriefingHermit5() 

BriefingHermit5 = {} 
BriefingHermit5.restoreCamera = true

-- call on end of biefing
BriefingHermit5.finished = BriefingHermit5Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Lasst mich euch eine Geschichte erzählen...." 
BriefingHermit5[page].position = GetPosition("Hermit5") 
BriefingHermit5[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Einst herrschte hier ein alter König...Sein Name lautete Salim!!!" 
BriefingHermit5[page].position = GetPosition("Geschichte2") 
BriefingHermit5[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Die Götter selbst huldigten ihm..." 
BriefingHermit5[page].position = GetPosition("Salim") 
BriefingHermit5[page].dialogCamera = true
-- page #4
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Und deswegen schlossen sich ihm die besten Krieger des Landes an." 
BriefingHermit5[page].position = GetPosition("Geschichte1") 
BriefingHermit5[page].dialogCamera = true
-- page #5
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Darunter befanden sich Kanoniere mit ihren stärksten Kanonen." 
BriefingHermit5[page].position = GetPosition("Geschichte3") 
BriefingHermit5[page].dialogCamera = true
-- page #6
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Als sowohl auch die besten Scharfschützen des Landes weit und breit..." 
BriefingHermit5[page].position = GetPosition("Geschichte4") 
BriefingHermit5[page].dialogCamera = true
-- page #7
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Alter Greiss" 
BriefingHermit5[page].text = "Drum seit gewarnt und meidet das sich auf der Straße hinter mir befindene Tor..." 
BriefingHermit5[page].position = GetPosition("BT") 
BriefingHermit5[page].dialogCamera = true
-- page #8
page = page + 1 
BriefingHermit5[page] ={}
BriefingHermit5[page].title = "Kerberos" 
BriefingHermit5[page].text = "(Denkt): Ach...diesen Winzling werden ich vernichten. (Kerberos gab dem Alten Greiss ein Stück Gold)" 
BriefingHermit5[page].position = GetPosition("Hermit5") 
BriefingHermit5[page].dialogCamera = true



local npcHermit5 = {} 
npcHermit5.name = "Hermit5" 
npcHermit5.briefing = BriefingHermit5
-- create npc
CreateNPC(npcHermit5) 
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------

function createBriefingHermit4() 

BriefingHermit4 = {} 
BriefingHermit4.restoreCamera = true

-- call on end of biefing
BriefingHermit4.finished = BriefingHermit4Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit4[page] ={}
BriefingHermit4[page].title = "Tor-Wache" 
BriefingHermit4[page].text = "Guten Tag. mein dunkler Fürst. Was führt euch zu mir?..." 
BriefingHermit4[page].position = GetPosition("Hermit4") 
BriefingHermit4[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit4[page] ={}
BriefingHermit4[page].title = "Kerberos" 
BriefingHermit4[page].text = "Öffne das Tor!!" 
BriefingHermit4[page].position = GetPosition("BT") 
BriefingHermit4[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit4[page] ={}
BriefingHermit4[page].title = "Tor-Wache" 
BriefingHermit4[page].text = "Sehr wohl, aber seit gewarnt, dort lauert eine dunkle Gefahr...."
BriefingHermit4[page].position  =  GetPosition("Hermit4")
BriefingHermit4[page].action = function() 
                              ReplaceEntity ("BT", Entities.XD_WallStraightGate ) 
                              end

local npcHermit4 = {} 
npcHermit4.name = "Hermit4" 
npcHermit4.briefing = BriefingHermit4
-- create npc
CreateNPC(npcHermit4) 
end

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

function createBriefingHermit() 

BriefingHermit = {} 
BriefingHermit.restoreCamera = true

-- call on end of biefing
BriefingHermit.finished = BriefingHermitFinished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit[page] ={}
BriefingHermit[page].title = "Tor-Wache" 
BriefingHermit[page].text = "Was sind eure Befehle mein Herrscher." 
BriefingHermit[page].position = GetPosition("Hermit") 
BriefingHermit[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit[page] ={}
BriefingHermit[page].title = "Kerberos" 
BriefingHermit[page].text = "Öffne das Tor!!" 
BriefingHermit[page].position = GetPosition("HG") 
BriefingHermit[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit[page] ={}
BriefingHermit[page].title = "Tor-Wache" 
BriefingHermit[page].text = "Sehr wohl."
BriefingHermit[page].position  =  GetPosition("Hermit")
BriefingHermit[page].action = function() 
                              ReplaceEntity ("HG", Entities.XD_WallStraightGate ) 
                              end

local npcHermit = {} 
npcHermit.name = "Hermit" 
npcHermit.briefing = BriefingHermit
-- create npc
CreateNPC(npcHermit) 
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------

function createBriefingHermit3() 

BriefingHermit3 = {} 
BriefingHermit3.restoreCamera = true

-- call on end of biefing
BriefingHermit3.finished = BriefingHermit3Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Doppelgaenger" 
BriefingHermit3[page].text = "Ich konnte mich als Vargs Doppelgaenger ausgeben." 
BriefingHermit3[page].position = GetPosition("Hermit3") 
BriefingHermit3[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Kerberos" 
BriefingHermit3[page].text = "Und wo ist Varg nun!" 
BriefingHermit3[page].position = GetPosition("Hermit3") 
BriefingHermit3[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Doppelgaenger" 
BriefingHermit3[page].text = "Er hat sich im Wald versteckt. KOMM RAUS VARG!"
BriefingHermit3[page].position  =  GetPosition("Varg1")
BriefingHermit3[page].action = function() 
                              CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("Versteck"), "Varg1")
                               end
-- page #4
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Varg" 
BriefingHermit3[page].text = "Hallo mein Freund.Wie geht es dir!" 
BriefingHermit3[page].position = GetPosition("Varg1") 
BriefingHermit3[page].dialogCamera = true

-- page #5
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Kerberos" 
BriefingHermit3[page].text = "Mir geht es besser den jeh (IRONIEEEEEEEE)!Dario will uns vernichten." 
BriefingHermit3[page].position = GetPosition("Hermit3") 
BriefingHermit3[page].dialogCamera = true

-- page #6
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Varg" 
BriefingHermit3[page].text = "WAS???HAR HAR!! Dann lass uns mal Dario gewaltig in den Hintern treten!" 
BriefingHermit3[page].position = GetPosition("Varg1") 
BriefingHermit3[page].dialogCamera = true
-- page #7
page = page + 1 
BriefingHermit3[page] ={}
BriefingHermit3[page].title = "Doppelgaenger" 
BriefingHermit3[page].text = "Bevor ich es vergesse... Ich hab euch eine Abkürzung zum Fronttor geöffnet"
BriefingHermit3[page].position  =  GetPosition("palisade")
BriefingHermit3[page].action = function() 
                              ReplaceEntity ("palisade", Entities.XD_PalisadeGate2 ) 
                               end


local npcHermit3 = {} 
npcHermit3.name = "Hermit3" 
npcHermit3.briefing = BriefingHermit3
-- create npc
CreateNPC(npcHermit3) 
end

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

function createBriefingHermit2() 

BriefingHermit2 = {} 
BriefingHermit2.restoreCamera = true

-- call on end of biefing
BriefingHermit2.finished = BriefingHermit2Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit2[page] ={}
BriefingHermit2[page].title = "Tor-Wache" 
BriefingHermit2[page].text = "Was sind eure Befehle mein Herrscher." 
BriefingHermit2[page].position = GetPosition("Hermit2") 
BriefingHermit2[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit2[page] ={}
BriefingHermit2[page].title = "Kerberos" 
BriefingHermit2[page].text = "Öffne das Tor!!" 
BriefingHermit2[page].position = GetPosition("HG2") 
BriefingHermit2[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit2[page] ={}
BriefingHermit2[page].title = "Hermit2" 
BriefingHermit2[page].text = "Sehr wohl."
BriefingHermit2[page].position  =  GetPosition("Hermit2")
BriefingHermit2[page].action = function() 
                              ReplaceEntity ("HG2", Entities.XD_WallStraightGate ) 
                              end

local npcHermit2 = {} 
npcHermit2.name = "Hermit2" 
npcHermit2.briefing = BriefingHermit2
-- create npc
CreateNPC(npcHermit2) 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function createBriefingHermit1() 

BriefingHermit1 = {} 
BriefingHermit1.restoreCamera = true

-- call on end of biefing
BriefingHermit1.finished = BriefingHermit1Finished 

local page = 0 
-- page #1
page = page + 1 
BriefingHermit1[page] ={}
BriefingHermit1[page].title = "Garek" 
BriefingHermit1[page].text = "Ich habe euch, wie ihr Befohlen habt @ einen Söldner angeheuert." 
BriefingHermit1[page].position = GetPosition("Hermit1") 
BriefingHermit1[page].dialogCamera = true
-- page #2
page = page + 1 
BriefingHermit1[page] ={}
BriefingHermit1[page].title = "Kerberos" 
BriefingHermit1[page].text = "Das ist wunderbar, wo ist er!!" 
BriefingHermit1[page].position = GetPosition("Hermit1") 
BriefingHermit1[page].dialogCamera = true
-- page #3
page = page + 1 
BriefingHermit1[page] ={}
BriefingHermit1[page].title = "Garek" 
BriefingHermit1[page].text = "Komm her Drake."
BriefingHermit1[page].position  =  GetPosition("hero")
BriefingHermit1[page].action = function() 
                               CreateEntity(1, Entities.PU_Hero10, GetPosition("hero"), "Drake")
                               end

local npcHermit1 = {} 
npcHermit1.name = "Hermit1" 
npcHermit1.briefing = BriefingHermit1
-- create npc
CreateNPC(npcHermit1) 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function VictoryJob()
    if IsDead("Dario") and IsDead("Erec") and IsDead("Dario1") and IsDead("Erec1") then
        Victory();
        return true;
    end
end  

------------------------------------------------------------------------------
------------------------------------------------------------------------------

function PilgrimBrief_1() 
     if 	IsNear("dario","pilgrim",600) then 
		LookAt("dario","pilgrim"); LookAt("pilgrim","dario")
		DisableNpcMarker(GetEntityId("pilgrim"))
		local briefing = {}
		BRIEFING_TIMER_PER_CHAR = 1.2 
		local AP, ASP = AddPages(briefing);
    ASP("Dario1",nDari,"TAKTIKER: Hallo Kerberos. Dario attackiert uns -,-", true)
    ASP("pilgrim",nPille,"KERBEROS: Dieser Wurm.Ich werde ihn zerquetschen. Was will er gegen mich ausrichten!!!", true)
    ASP("Erec1",nDari,"TAKTIKER: Er hat Erec mitgebracht und euren Vater Helias. @cr "..
                       "Da ist seine Festung.", false)
    ASP("g2",nPille,"KERBEROS:Mein Schutzzauber wird uns fürs erste beschützen.", true)
    ASP("Bandit",nDari,"TAKTIKER:Das ist gut, mein Herr. @cr "..
	                  "Es haben sich dunkle Truppen gegen euch gerichtet und Varg entführt.", true)
    ASP("pilgrim",nPille,"KERBEROS:GUTTTTT.Endlich kann ich wieder töten.HAR HAR HAR...@cr "..  
	                  "Schick deine Kundschafter und lass, all ihre Bewegungen mir mitteilen.", true)
	ASP("dario",nDari,"TAKTIKER: Sehr wohl mein dunkler Fürst! Auf meine Freunde @ wir machen uns auf den Weg.", true)
    ASP("pilgrim",nDari,"INFO: -Befreit Varg. @cr -Errichtet eine Stadt. @cr -Vernichtet Dario´s Freunde und ihn selber. @cr Viel Spaß bei der Map wünscht Novator12.", false)
    briefing.finished = function()
		end
		StartBriefing(briefing);
		return true
   end
end

----------------------------------------------------------------------------
----------------------------------------------------------------------------

function OnCountdownFinished()
        ReplaceEntity ("g1", Entities.XD_WallStraightGate ) 
        ReplaceEntity ("g2", Entities.XD_WallStraightGate ) 
        ReplaceEntity ("g3", Entities.XD_WallStraightGate ) 
        ReplaceEntity ("g4", Entities.XD_WallStraightGate ) 
        Message( "Der Schutzzauber von Kerberos @dem Hexenmeister ist nun aufgehoben!" )
end

---------------------------------------------------------------------------
----------------Comfort-Funktionen-----------------------------------------
--Diese Funtionen sind wichtig für die Auführung der Funktionen------------
---------------------------------------------------------------------------

function ZurEntity(_entity, _range, _currPos)  -- neu geschrieben
	if type (_entity) == "table" then 
		Message("Keine Position sondern Entity angeben")
		return nil
	end
	if type (_entity) == "string" then
		_entity = GetEntityId(_entity);
	end
	local tPos = GetPosition(_entity)
	if _currPos == nil then
		_currPos = tPos
	elseif type (_currPos) == "string" or type (_currPos) == "number"  then
		_currPos = GetPosition(_currPos)
	end
	local nEntityAngle=Logic.GetEntityOrientation(_entity);
	local nSin=math.sin((math.rad(nEntityAngle)));
	local nCos=math.cos((math.rad(nEntityAngle)));
	local tPos = GetPosition(_entity)
	return {X=_currPos.X-nCos*_range,Y=_currPos.Y-nSin*_range}; -- Rückgabe=neue Position
end
--**
function GetQuestId()
	gvMission.QuestId = (gvMission.QuestId or 0)+1
	return gvMission.QuestId
end
--**
function AddPages( _briefing )
    local AP = function(_page) table.insert(_briefing, _page); return _page; end
    local ASP = function(_entity, _title, _text, _dialog, _explore) return AP(CreateShortPage(_entity, _title, _text, _dialog, _explore)); end
    return AP, ASP;
end
--**
function CreateShortPage( _entity, _title, _text, _dialog, _explore) 
    local page = {
        title = _title,
        text = _text,
        position = GetPosition( _entity ),
		action = function ()Display.SetRenderFogOfWar(0) end
    };
    if _dialog then 
            if type(_dialog) == "boolean" then
                  page.dialogCamera = true; 
            elseif type(_dialog) == "number" then
                  page.explore = _dialog;
            end
      end
    if _explore then 
            if type(_explore) == "boolean" then
                  page.dialogCamera = true; 
            elseif type(_explore) == "number" then
                  page.explore = _explore;
            end
      end
    return page;
end
--**
function ActivateBriefingsExpansion()
    if not unpack{true} then 
        local unpack2;
        unpack2 = function( _table, i )
                            i = i or 1;
                            assert(type(_table) == "table");
                            if i <= table.getn(_table) then
                                return _table[i], unpack2(_table, i);
                            end
                        end
        unpack = unpack2;
    end
    
    Briefing_ExtraOrig = Briefing_Extra;
    
    Briefing_Extra = function( _v1, _v2 )
                         for i = 1, 2 do
                             local theButton = "CinematicMC_Button" .. i;
                             XGUIEng.DisableButton(theButton, 1);
                             XGUIEng.DisableButton(theButton, 0);
                         end
                         
                         if _v1.action then
                             assert( type(_v1.action) == "function" );
                             if type(_v1.parameters) == "table" then 
                                 _v1.action(unpack(_v1.parameters));
                             else
                                 _v1.action(_v1.parameters);
                             end
                         end
                         
                         Briefing_ExtraOrig( _v1, _v2 );
                     end;
    
    GameCallback_EscapeOrig = GameCallback_Escape;
    StartBriefingOrig = StartBriefing;
    EndBriefingOrig = EndBriefing;
    MessageOrig = Message;
    CreateNPCOrig = CreateNPC;

    StartBriefing = function(_briefing)
                        assert(type(_briefing) == "table");
                        if _briefing.noEscape then
                            GameCallback_Escape = function() end;
                            briefingState.noEscape = true;
                        end
                        
                        StartBriefingOrig(Umlaute(_briefing));
                    end
    
    EndBriefing = function()
                      if briefingState.noEscape then
                          GameCallback_Escape = GameCallback_EscapeOrig;
                          briefingState.noEscape = nil;
                      end
                      
                      EndBriefingOrig();
                  end;
    
    Message = function(_text)
                  MessageOrig(Umlaute(tostring(_text)));
              end;

	BugUmlaut = function(_text)
                  local texttype = type(_text);
                  if texttype == "string" then
                      _text = string.gsub( _text, "ä", "ae" );
                      _text = string.gsub( _text, "ö", "oe" );
                      _text = string.gsub( _text, "ü", "ue" );
                      _text = string.gsub( _text, "ß", "ss" );
                      _text = string.gsub( _text, "Ä", "Ae" );
                      _text = string.gsub( _text, "Ö", "Oe" );
                      _text = string.gsub( _text, "Ü", "Ue" );
                      return _text;
                  elseif texttype == "table" then
                      for k, v in _text do
                          _text[k] = Umlaute( v );
                      end
                      return _text;
                  else return _text;
                  end
              end;
	
    CreateNPC = function(_npc)
                    CreateNPCOrig(Umlaute(_npc));
                end;
    
Umlaute = function(_text)
                  local texttype = type(_text);
                  if texttype == "string" then
                      _text = string.gsub( _text, "ä", "\195\164" );
                      _text = string.gsub( _text, "ö", "\195\182" );
                      _text = string.gsub( _text, "ü", "\195\188" );
                      _text = string.gsub( _text, "ß", "\195\159" );
                      _text = string.gsub( _text, "Ä", "\195\132" );
                      _text = string.gsub( _text, "Ö", "\195\150" );
                      _text = string.gsub( _text, "Ü", "\195\156" );
                      return _text;
                  elseif texttype == "table" then
                      for k, v in _text do
                          _text[k] = Umlaute( v );
                      end
                      return _text;
                  else return _text;
                  end
              end;
end

function SetupAI(_aiTable)
 
    -- check input data:
    local ai = _aiTable;
    ai.position = ai.position or ai.headquarters or "";
    assert(ai.id and type(ai.id) == "number");
    assert(type(ai.headquarters) == "table" or "string");
    
    ai.strength = ai.strength or 0;
    ai.range = ai.range or 2500;
    ai.techlevel = ai.techlevel or 0;
    ai.aggressiveness = ai.aggressiveness or 0;
    ai.peacetime = ai.peacetime or 0;
    
    -- setup!
    MapEditor_SetupAI(ai.id, ai.strength, ai.range, ai.techlevel, ai.position, ai.aggressiveness, ai.peacetime);
    if ai.extracting then
        SetupPlayerAi(ai.id, {extracting = 1});
    end
    if _aiTable.repairing then
        SetupPlayerAi(ai.id, {repairing = 1});
    end
 
    -- relationships:
    local notNeutral = {};
    local settings = {};
    if ai.friends then
        table.insert(settings, {setRelation = SetFriendly, input = ai.friends});
    end
    if ai.enemies then
        table.insert(settings, {setRelation = SetHostile, input = ai.enemies});
    end
    if table.getn(settings) == 0 then
        SetNeutral(1, ai.id)
    end
    
    for i = 1, table.getn(settings) do
        if settings[i].input then
            if type(settings[i].input) == "table" then
                for p = 1, table.getn(settings[i].input) do
                    settings[i].setRelation(ai.id, settings[i].input[p]);
                    table.insert(notNeutral, settings[i].input[p]);
                end
            elseif type(settings[i].input) == "number" then
                settings[i].setRelation(ai.id, settings[i].input);
                table.insert(notNeutral, settings[i].input);
            else
                settings[i].setRelation(1, ai.id);
                table.insert(notNeutral, 1);
            end
        end
    end
    for i = 1, table.getn(notNeutral) do
        local neutral = true;
        for p = 1, 8 do
            if notNeutral[i] == p then
                neutral = false;
            end
        end
        if neutral then
            SetNeutral(ai.id, p);
        end
    end
    
    -- optical settings:
    if ai.name and type(ai.position) == "string" then 
        SetPlayerName(ai.id, ai.name); 
    end
    if ai.color then
        local colorTable = {
            blue = PLAYER_COLOR,
            orange = FRIENDLY_COLOR1, 
            yellow = FRIENDLY_COLOR2, 
            white = FRIENDLY_COLOR3, 
            violet = ENEMY_COLOR1, 
            cyan = ENEMY_COLOR2, 
            red = NEPHILIM_COLOR, 
            green = EVIL_GOVERNOR_COLOR, 
            grey = KERBEROS_COLOR, 
            black = ROBBERS_COLOR, 
            beige = NPC_COLOR,
        };
        local color = colorTable[ai.color] or ai.color;
        assert(type(color) == "number", "SetupAI(): color have to be type string! \n Please pay attention to correct spelling! Available Colors: blue, orange, yellow, white, violet, cyan, red, green, grey, black, beige. \n Or use the global variables if you like.");
        Display.SetPlayerColorMapping(ai.id, color);
    end
    if ai.explore then
        Logic.SetShareExplorationWithPlayerFlag(1, ai.id, 1);
    elseif ai.explore == false then
        Logic.SetShareExplorationWithPlayerFlag(1, ai.id, 0);
    end
    
end

OrigMission_OnSaveGameLoaded = Mission_OnSaveGameLoaded
function Mission_OnSaveGameLoaded()
    OrigMission_OnSaveGameLoaded()
    UpdatePlayerColors()
end
 
function UpdatePlayerColors()
    if type(ChangedPlayerColors) ~= "nil" then
        for i=1, 8 do
            if ChangedPlayerColors[i] ~= nil then
                Display.SetPlayerColorMapping(i,ChangedPlayerColors[i])
            end
        end
    end
end
 
function ChangePlayerColor(_playerId, _color)
    if type(ChangedPlayerColors) == "nil" then
        ChangedPlayerColors = {}
    end
    Display.SetPlayerColorMapping(_playerId,_color)
    ChangedPlayerColors[_playerId] = _color
end
function ActivateShareExploration(_player1, _player2, _both)
    assert(type(_player1) == "number" and type(_player2) == "number" and _player1 <= 8 and _player2 <= 8 and _player1 >= 1 and _player2 >= 1)
    if _both == false then
        Logic.SetShareExplorationWithPlayerFlag(_player1, _player2, 1)
    else
        Logic.SetShareExplorationWithPlayerFlag(_player1, _player2, 1)
        Logic.SetShareExplorationWithPlayerFlag(_player2, _player1, 1)
    end
end

function StartCountdown(_Limit, _Callback, _Show)
    assert(type(_Limit) == "number")
    assert( not _Callback or type(_Callback) == "function" )
 
    Counter.Index = (Counter.Index or 0) + 1
    
    if _Show and CountdownIsVisisble() then
        assert(false, "StartCountdown: A countdown is already visible")
    end
    
    Counter["counter" .. Counter.Index] = {Limit = _Limit, TickCount = 0, Callback = _Callback, Show = _Show, Finished = false}
    
    if _Show then
        MapLocal_StartCountDown(_Limit)
    end
    
    if Counter.JobId == nil then
        Counter.JobId = StartSimpleJob("CountdownTick")
    end
    
    return Counter.Index
end
 
function StopCountdown(_Id)
    if Counter.Index == nil then
        return
    end
 
    if _Id == nil then
        for i = 1, Counter.Index do
            if Counter.IsValid("counter" .. i) then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
                Counter["counter" .. i] = nil
            end
        end
    else
        if Counter.IsValid("counter" .. _Id) then
            if Counter["counter" .. _Id].Show then
                MapLocal_StopCountDown()
            end
            Counter["counter" .. _Id] = nil
        end
    end
end
 
function CountdownTick()
    local empty = true
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) then
            if Counter.Tick("counter" .. i) then
                Counter["counter" .. i].Finished = true
            end
            
            if Counter["counter" .. i].Finished and not IsBriefingActive() then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
                
                -- callback function
                if type(Counter["counter" .. i].Callback) == "function" then
                    Counter["counter" .. i].Callback()
                end
                
                Counter["counter" .. i] = nil
            end
            
            empty = false
        end
    end
    
    if empty then
        Counter.JobId = nil
        Counter.Index = nil
        return true
    end
end
 
function CountdownIsVisisble()
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) and Counter["counter" .. i].Show then
            return true
        end
    end
    
    return false
end
function ZurEntity(_entity, _range, _currPos)  -- neu geschrieben
	if type (_entity) == "table" then 
		Message("Keine Position sondern Entity angeben")
		return nil
	end
	if type (_entity) == "string" then
		_entity = GetEntityId(_entity);
	end
	local tPos = GetPosition(_entity)
	if _currPos == nil then
		_currPos = tPos
	elseif type (_currPos) == "string" or type (_currPos) == "number"  then
		_currPos = GetPosition(_currPos)
	end
	local nEntityAngle=Logic.GetEntityOrientation(_entity);
	local nSin=math.sin((math.rad(nEntityAngle)));
	local nCos=math.cos((math.rad(nEntityAngle)));
	local tPos = GetPosition(_entity)
	return {X=_currPos.X-nCos*_range,Y=_currPos.Y-nSin*_range}; -- Rückgabe=neue Position
end

-- Quest data
MapEditor_QuestTitle				= "Das Paradies:"
MapEditor_QuestDescription 	= "Diese Idylle....einfach zerstÃ¶rt @cr Darion und seine Freunde sorgen fÃ¼r Unruhen in Kerberos Ruhestand. @cr Dazu greifen sie auch noch seine Verlobte an. @cr Das wird Ã„rger geben." 