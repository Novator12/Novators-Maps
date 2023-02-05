-- Include globals
Script.Load("data/script/maptools/main.lua");
Script.Load("data/script/maptools/mapeditortools.lua");

-- Load library
gvBasePath = "data/maps/externalmap/";
Script.Load(gvBasePath.. "qsb/core/loader.lua");
Script.Load(gvBasePath.. "qsb/lib/loader.lua");
Script.Load(gvBasePath.. "qsb/ext/loader.lua");
Script.Load(gvBasePath.. "qsb/questbehavior.lua");
Script.Load(gvBasePath.. "qsb/treasure.lua");

-- Include main mapscript
Script.Load(gvBasePath.. "behaviors.lua");
Script.Load(gvBasePath.. "mainmapscript.lua");
--
-- Füge in dieser Funktion deine eigenen Inhalte hinzu. Diese Funktion wird
-- aufgerufen, sobald alle Voreinstellungen gemacht wurden.
--
function PreperationDone()
QuestSystem.GameSpeedSwitch:SetSpeedUpAllowed(true)
end

-- Platz für deine Funktionen...

function VerbietenLeicht()

StartSummer(60*60*24*7*12*100)
ForbidTechnology( Technologies.B_StoneMason, 1 )
ForbidTechnology( Technologies.B_Market, 1 )
ForbidTechnology( Technologies.GT_Trading, 1 )
ForbidTechnology( Technologies.GT_Mathematics, 1 )
ForbidTechnology( Technologies.B_Bridge, 1 )
ForbidTechnology( Technologies.B_MasterBuilderWorkshop, 1 )


ForbidTechnology( Technologies.B_Alchemist, 1 )
ForbidTechnology( Technologies.B_Bank, 1 )
ForbidTechnology( Technologies.B_GunsmithWorkshop, 1 )
ForbidTechnology( Technologies.B_Stables, 1 )
ForbidTechnology( Technologies.B_PowerPlant, 1 )
ForbidTechnology( Technologies.B_Tavern, 1 )
ForbidTechnology( Technologies.B_Weathermachine, 1 )
ForbidTechnology( Technologies.GT_Binocular, 1 )
ForbidTechnology( Technologies.GT_ChainBlock, 1 )
ForbidTechnology( Technologies.GT_Chemistry, 1 )
ForbidTechnology( Technologies.GT_Library, 1 )
ForbidTechnology( Technologies.GT_Matchlock, 1 )
ForbidTechnology( Technologies.GT_Printing, 1 )
ForbidTechnology( Technologies.GT_PulledBarrel, 1 )

ForbidTechnology( Technologies.GT_Strategies, 1 )
ForbidTechnology( Technologies.GT_Tactics, 1 )
ForbidTechnology( Technologies.GT_Architecture, 1 )
ForbidTechnology( Technologies.UP1_Barracks, 1 )
ForbidTechnology( Technologies.T_UpgradeBow3, 1 )
ForbidTechnology( Technologies.T_UpgradeSpear3, 1 )
ForbidTechnology( Technologies.T_UpgradeSword3, 1 )
ForbidTechnology( Technologies.UP1_Alchemist, 1 )
ForbidTechnology( Technologies.UP1_Foundry, 1)


TowerCheckJob = StartSimpleHiResJobEx(CheckUnitOrBuildingLimit, 1, UpgradeCategories.Tower, 10);


DestroyEntity("leicht1");
DestroyEntity("leicht2");
DestroyEntity("leicht3");
DestroyEntity("leicht4");
DestroyEntity("leicht5");
DestroyEntity("leicht6");
DestroyEntity("leicht7");
DestroyEntity("leicht8");
DestroyEntity("leicht9");
DestroyEntity("leicht10");
DestroyEntity("leicht11");
DestroyEntity("leicht12");
DestroyEntity("leicht13");
DestroyEntity("leicht14");
DestroyEntity("leicht15");
DestroyEntity("leicht16");
DestroyEntity("leicht17");
DestroyEntity("leicht18");
DestroyEntity("leicht19");
DestroyEntity("leicht20");
DestroyEntity("leicht21");
DestroyEntity("leicht22");
DestroyEntity("leicht23");
DestroyEntity("leicht24");
DestroyEntity("leicht25");
DestroyEntity("leicht26");
DestroyEntity("leicht27");
DestroyEntity("leicht28");
DestroyEntity("leicht29");
DestroyEntity("leicht30");
DestroyEntity("leicht31");
DestroyEntity("leicht32");
DestroyEntity("leicht33");
DestroyEntity("leicht34");
DestroyEntity("leicht35");





end

function VerbietenSchwer()

	StartSummer(60*60*24*7*12*100)
	ForbidTechnology( Technologies.GT_GearWheel, 1 )
	ForbidTechnology( Technologies.B_StoneMason, 1 )
	ForbidTechnology( Technologies.B_Blacksmith, 1 )
	ForbidTechnology( Technologies.B_Market, 1 )
	ForbidTechnology( Technologies.GT_Trading, 1 )
	ForbidTechnology( Technologies.GT_Mathematics, 1 )
	ForbidTechnology( Technologies.B_Bridge, 1 )
	ForbidTechnology( Technologies.B_MasterBuilderWorkshop, 1 )
	
	
	ForbidTechnology( Technologies.B_Alchemist, 1 )
	ForbidTechnology( Technologies.B_Bank, 1 )
	ForbidTechnology( Technologies.B_Foundry, 1 )
	ForbidTechnology( Technologies.B_GunsmithWorkshop, 1 )
	ForbidTechnology( Technologies.B_Stables, 1 )
	ForbidTechnology( Technologies.B_PowerPlant, 1 )
	ForbidTechnology( Technologies.B_Tavern, 1 )
	ForbidTechnology( Technologies.B_Weathermachine, 1 )
	ForbidTechnology( Technologies.GT_Binocular, 1 )
	ForbidTechnology( Technologies.GT_ChainBlock, 1 )
	ForbidTechnology( Technologies.GT_Chemistry, 1 )
	ForbidTechnology( Technologies.GT_Library, 1 )
	ForbidTechnology( Technologies.GT_Matchlock, 1 )
	ForbidTechnology( Technologies.GT_Metallurgy, 1 )
	ForbidTechnology( Technologies.GT_Printing, 1 )
	ForbidTechnology( Technologies.GT_PulledBarrel, 1 )
	
	ForbidTechnology( Technologies.GT_Strategies, 1 )
	ForbidTechnology( Technologies.GT_Tactics, 1 )
	ForbidTechnology( Technologies.GT_Architecture, 1 )
	ForbidTechnology( Technologies.UP1_Barracks, 1 )
	ForbidTechnology( Technologies.T_UpgradeBow3, 1 )
	ForbidTechnology( Technologies.T_UpgradeSpear3, 1 )
	ForbidTechnology( Technologies.T_UpgradeSword3, 1 )
	ForbidTechnology( Technologies.UP1_Alchemist, 1 )
	ForbidTechnology( Technologies.B_Tower, 1)
	ForbidTechnology( Technologies.UP1_Market, 1)
	ForbidTechnology( Technologies.UP1_Foundry, 1)
	
	
	
	
	end

function HQ_Life()
	SetHealth("burg", 5)
end


function DestroyWache()
	DestroyEntity("wache")
end

function CreateChestSparkles()
	CreateEntity(1, Entities.XD_Sparkles, GetPosition("kiste"), "pointer1")
end

function MoveDarioToKiste()
	Move("dario","kiste",100)
end

function DestroyKiste()
	DestroyEntity("pointer1")
end

function MoveDarioToGate()
	Move("dario","gate",200)
	StartSimpleJob("NearGate")
end

function NearGate()
	if IsNear("dario","gate", 900) then
		ReplaceEntity("gate", Entities.XD_DarkWallStraightGate)
		return true
	end
end

function Goal_IsBanditCampDefeated()
	-- All buildings have been destroyed
	if not IsExisting("t1") and not IsExisting("t2") and not IsExisting("t3") and not IsExisting("kaserne") then
		return true;
	end
	-- Check all allied
    if Logic.GetEntityHealth(GetID("dario")) > 0 then
        return;
    end
    if Logic.GetEntityHealth(GetID("ari")) > 0 then
        return;
    end
    for i= 1, 4, 1 do
        if IsExisting("Trupp" ..i) then
            return;
        end
	end
	-- Return if they are all dead
    return false;
end

function ControleArmyBandit()
	for i= 1, 3, 1 do
		 AddAIPlayerPatrolPoint(2, "bandit_punkt" ..i);
	end
end

function DestroyControleArmyBandit()
	for i= 1, 3, 1 do
		RemoveAIPlayerPatrolPoint(2, "bandit_punkt" ..i);
	end
end

function BarriereBurg()
	DestroyEntity("bar1")
	DestroyEntity("bar2")

end


function MoveLeonardo()
	Move("leo","spotleo");
end

function MoveGarek()
	Move("garek","spotgarek");
	Move("dario","spotdario");
	StartSimpleJobEx(function()
		if IsNear("garek", "spotgarek", 100) and IsNear("dario", "spotdario", 100) then
			LookAt("dario","garek");
			LookAt("leo","bau_dz");
			LookAt("garek","dario");
			return true;
		end
	end);
end

-------------------------------------------------------Barmecia Bandit Namen--------------------------------------------------------

function CreateAiNameBanditBarmecia()
	-- AI nach CreateAIPlayer (_PlayerID, _TechLevel, _SerfAmount, _HomePosition, _Strength, _Construct, _Rebuild)
	-- CreateAIPlayer( 3 , 4 , 8 , "banditen_main", 2 , true, true)
	SetPlayerName(3, "Banditen Aussenposten")
	SetPlayerName(8, "Barmecias Hilfstruppen")
end	

--------------------------------------------------------Barmecia Army Controle------------------------------------------------------

function CreateBarmeciaAttack()
	 AddAIPlayerAttackTarget(8, "barmecia_attack");
end

function DestroyBarmeciaAttack()
	RemoveAIPlayerAttackTarget(8,"barmecia_attack");
end


--------------------------------------------------------Bandit Outpost Army Controle-------------------------------------------------

function CreateBanditAttack()
	 AddAIPlayerAttackTarget(3, "bandit_goal");
end

function DestroyBanditAttack()
	RemoveAIPlayerAttackTarget(3, "bandit_goal");
end




function DestroyBarmeciaSupport()
	DestroyEntity("bergpass")
	CreateEntity(1, Entities.XD_RockMedium7, GetPosition("steinschlag1"), "steinbarmecia1")
	CreateEntity(1, Entities.XD_RockMedium7, GetPosition("steinschlag2"), "steinbarmecia2")
end

--------------------------------------------------------------------------------------------------------------

------------------------------------------Technologien Brueckenbau-------------------------------------
function TechnologienFreischaltung()


	if QuestSystem.CustomVariables["difficulty"] == 1 then
	AllowTechnology( Technologies.UP1_Headquarter, 1 )
	AllowTechnology( Technologies.B_StoneMason, 1 )
	AllowTechnology( Technologies.B_Market, 1 )
	AllowTechnology( Technologies.GT_Trading, 1 )
	AllowTechnology( Technologies.GT_Mathematics, 1 )
	AllowTechnology( Technologies.B_Bridge, 1 )
	AllowTechnology( Technologies.B_MasterBuilderWorkshop, 1 )
	AllowTechnology( Technologies.UP1_Barracks, 1 )
	end

	if QuestSystem.CustomVariables["difficulty"] == 0 then
	AllowTechnology( Technologies.UP1_Headquarter, 1 )
	AllowTechnology( Technologies.GT_GearWheel, 1 )
	AllowTechnology( Technologies.B_StoneMason, 1 )
	AllowTechnology( Technologies.B_Blacksmith, 1 )
	AllowTechnology( Technologies.B_Market, 1 )
	AllowTechnology( Technologies.GT_Trading, 1 )
	AllowTechnology( Technologies.GT_Mathematics, 1 )
	AllowTechnology( Technologies.B_Bridge, 1 )
	AllowTechnology( Technologies.B_MasterBuilderWorkshop, 1 )
	AllowTechnology( Technologies.UP1_Barracks, 1 )
	end
end
-----------------------------------------------------------------------------------------------------


----------------------------------------Gefangene bewegen--------------------------------------------

function MovePrisoner()
	Move("gefangener1","spotgefangener2");
	Move("gefangener2","spotdario");
	StartSimpleJobEx(function()
		if IsNear("gefangener1", "spotgefangener2", 100) and IsNear("gefangener2", "spotdario", 100) then
			LookAt("gefangener1","gefangener2");
			return true;
		end
	end);
end
-----------------------------------------------------------------------------------------------------



------------------------------------Haendler Kaufoptionen-------------------------------------------

function Tribute1()
	local tribute =  {}
	tribute.playerId = 1;
	tribute.text = "Zahle 3500 Gold und 2500 Eisen fuer die Schwefelmine.";
	tribute.cost = { Gold = 3500, Iron = 2500 };
   tribute.Entity = "schwefel";
	tribute.Callback = OnTestTributePaid;
	AddTribute( tribute )
end

function Tribute2()
	local tribute2 =  {}
	tribute2.playerId = 1;
	tribute2.text = "Tausche 1000 Gold fuer 1000 Eisen.";
   tribute2.cost = {Gold = 1000};
   tribute2.Resources = { iron = 1000 };
	tribute2.Callback =  OnTestTributePaid2;
	AddTribute( tribute2 )
end
----------------------------------------------------------------------------------------------------------

------------------------------------Name Banditen 4 Lager--------------------------------------------------
function BanditenOsten()
SetPlayerName(4, "Grosslager der Banditen")
end
-----------------------------------------------------------------------------------------------------------


--------------------------------Banditen Armee ID 4---------------------------------------------------------

-----Bandit1
function CreateSideBanditAttack1()
	 AddAIPlayerAttackTarget(4, "sidebandit_goal");
end

function DestroySideBanditAttack1()
	RemoveAIPlayerAttackTarget(4, "sidebandit_goal");
end
-----Bandit2

function CreateSideBanditAttack2()
	 AddAIPlayerAttackTarget(4, "tuerkis1");
end

function DestroySideBanditAttack2()
	RemoveAIPlayerAttackTarget(4, "tuerkis1");
end
---Bandit3

function CreateSideBanditAttack3()
	 AddAIPlayerAttackTarget(4, "tuerkis2");
end

function DestroySideBanditAttack3()
	RemoveAIPlayerAttackTarget(4, "tuerkis2");
end

------Bandit4
function CreateSideBanditAttack4()
	 AddAIPlayerAttackTarget(4, "tuerkis3");
end

function DestroySideBanditAttack4()
	RemoveAIPlayerAttackTarget(4, "tuerkis3");
end


-------------------------------------------------------------------------------------------------------------



----------------------------------Palisaden Tor Banditen-----------------------------------------------

function DoorBanditen()
	
	CreateMilitaryGroup(4,Entities.PU_LeaderSword4,8,GetPosition("tod1"))
	CreateMilitaryGroup(4,Entities.PU_LeaderBow4,8,GetPosition("tod2"))
	CreateMilitaryGroup(4,Entities.PU_LeaderPoleArm4,8,GetPosition("tod3"))
	CreateMilitaryGroup(4,Entities.PU_LeaderSword4,8,GetPosition("tod4"))
	CreateMilitaryGroup(4,Entities.PU_LeaderBow4,8,GetPosition("tod5"))
	
end
	

-----------------------------------------------------------------------------------------------------------

---------------------------------------Hoehle Anfang-----------------------------------------------------------
function HoehleAnfangFun()
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("cave1"), "dario")
	CreateEntity(1, Entities.PU_Hero5, GetPosition("cave2"), "ari")
	CreateMilitaryGroup(1,Entities.PU_LeaderBow4,0,GetPosition("cavesupp1"),"help1")
	CreateMilitaryGroup(1,Entities.PU_LeaderPoleArm4,0,GetPosition("cavesupp2"),"help2")
	CreateMilitaryGroup(1,Entities.PU_LeaderSword4,0,GetPosition("cavesupp4"),"help3")
	CreateMilitaryGroup(1,Entities.PU_LeaderBow4,0,GetPosition("cavesupp3"),"help4")
end

---------------------------------------------------------------------------------------------------------------



-------------------------------------Varg Hoehle + Ausgang-------------------------------------------------

function VargLife()
	if GetHealth("varg") < 25 then
		return true;
	end
end

function ExitHoehle()
	ChangePlayer("ari",7)
	ChangePlayer("dario",7)
	Move("dario","exit")
	Move("ari","exit")
	if QuestSystem.CustomVariables["VargLebt"] == 1 then
        ChangePlayer("varg",7)
        Move("varg","exit")
    end
	StartSimpleJobEx(function()
		if IsNear("dario", "exit", 300) and IsNear("ari", "exit", 300)  then
			DestroyEntity("dario")
			DestroyEntity("ari")
			CreateEntity(1, Entities.PU_Hero1c, GetPosition("exit1"), "dario")
			CreateEntity(1, Entities.PU_Hero5, GetPosition("exit2"), "ari")
			if QuestSystem.CustomVariables["VargLebt"] == 1 then
				DestroyEntity("varg")
				CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("vargspawn"), "varg")
			end
			DestroyEntity("help1")
			DestroyEntity("help2")
			DestroyEntity("help3")
			DestroyEntity("help4")
			return true;
		end
	end);
end


-------------------------------------------------------------------------------------------------------------


--------------------------------------------Hilfstruppen Johann-------------------------------------------------------

function HelpJohann()
	CreateMilitaryGroup(1,Entities.PU_LeaderSword1,4,GetPosition("johanntrupp1"),"jhelp1")
	CreateMilitaryGroup(1,Entities.PU_LeaderBow1,4,GetPosition("johanntrupp2"),"jhelp2")
end


function ChangePille()
	Move("pille","johann")
	StartSimpleJobEx(function()
		if IsNear("pille", "johann", 300)  then
			ChangePlayer("pille",1)
			return true;
		end
	end);
end

--------------------------------------------------------------------------------------------------------------

-----------------------------Leuchtturm Teleport----------------------------------------------------------

function TeleportSchiff()
	DestroyEntity("dario")
	DestroyEntity("ari")
	DestroyEntity("pille")
	if QuestSystem.CustomVariables["VargLebt"] == 1 then
		DestroyEntity("varg")
    end
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("boot1"), "dario")
	CreateEntity(1, Entities.PU_Hero5, GetPosition("boot2"), "ari")
	CreateEntity(1, Entities.PU_Hero2, GetPosition("boot3"), "pille")

	if QuestSystem.CustomVariables["VargLebt"] == 1 then
		CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("boot4"), "varg")
	end
end


function TeleportLand()
	DestroyEntity("dario")
	DestroyEntity("ari")
	DestroyEntity("pille")
	if QuestSystem.CustomVariables["VargLebt"] == 1 then
		DestroyEntity("varg")
    end
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("arrive1"), "dario")
	CreateEntity(1, Entities.PU_Hero5, GetPosition("arrive2"), "ari")
	CreateEntity(1, Entities.PU_Hero2, GetPosition("arrive3"), "pille")

	if QuestSystem.CustomVariables["VargLebt"] == 1 then
		CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("arrive4"), "varg")
	end
	DestroyEntity("jhelp1")
	DestroyEntity("jhelp2")
end


---------------------------------------------Wachen Hauptmann Moven------------------------------------------------

function WachenMovenHin()

		Move("wache1","posi3")
		Move("wache2","posi4")
		StartSimpleJobEx(function()
			if IsNear("wache1", "posi3", 100)  then
				LookAt("wache1","dario");
				LookAt("wache2","dario");
				return true;
			end
		end);
end

function WachenMovenWeg()
	Move("wache1","posi1")
	Move("wache2","posi2")
end





-----------------------------------------------------------------------------------------------------------------


-------------------------------------Name Hauptstadt--------------------------------------------------------------

function NameHauptstadt()
	SetPlayerName(7,"Die Hauptstadt")
end


-----------------------------------------------------------------------------------------------------------------


-----------------------------------Koordinierung Angriff Hauptstadt----------------------------------------------

------Castle1-------------------------------------------------------------

function CreateMainCastleAttack1()
	 AddAIPlayerAttackTarget(7, "goal_ID7");
end

function DestroyMainCastleAttack1()
	RemoveAIPlayerAttackTarget(7, "goal_ID7");
end

------Castle2-------------------------------------------------------------


function CreateMainCastleAttack2()
	 AddAIPlayerAttackTarget(7, "goal1_ID7");
end

function DestroyMainCastleAttack2()
	RemoveAIPlayerAttackTarget(7, "goal1_ID7");
end


------Castle3-------------------------------------------------------------

function CreateMainCastleAttack3()
	 AddAIPlayerAttackTarget(7, "goal2_ID7");
end

function DestroyMainCastleAttack3()
	RemoveAIPlayerAttackTarget(7, "goal2_ID7");
end

------Castle4-------------------------------------------------------------

function CreateMainCastleAttack4()
	 AddAIPlayerAttackTarget(7, "goal3_ID7");
end

function DestroyMainCastleAttack4()
	RemoveAIPlayerAttackTarget(7, "goal3_ID7");
end



---------------------------------Hauptbanditenlager ID2----------------------------------------------------------

-----------HauptBandit1

function CreateHauptBanditenAttack1()
	 AddAIPlayerAttackTarget(2, "hauptb1");
end

function DestroyHauptBanditenAttack1()
	RemoveAIPlayerAttackTarget(2, "hauptb1");
end

-----------HauptBandit2

function CreateHauptBanditenAttack2()
	 AddAIPlayerAttackTarget(2, "hauptb2");
end

function DestroyHauptBanditenAttack2()
	RemoveAIPlayerAttackTarget(2, "hauptb2");
end

-----------HauptBandit3

function CreateHauptBanditenAttack3()
	AddAIPlayerAttackTarget(2, "hauptb3");
end

function DestroyHauptBanditenAttack3()
	RemoveAIPlayerAttackTarget(2,"hauptb3");
end

-----------HauptBandit4

function CreateHauptBanditenAttack4()
	 AddAIPlayerAttackTarget(2, "hauptb4");
end

function DestroyHauptBanditenAttack4()
	RemoveAIPlayerAttackTarget(2, "hauptb4");
end
-----------------------------------------------------------------------------------------------------------------



-----------------------------------------------Salim Regenerate---------------------------------------------------------
function SalimTech()

	if QuestSystem.CustomVariables["difficulty"] == 1 then
	AllowTechnology( Technologies.B_Alchemist, 1 )
	AllowTechnology( Technologies.B_Bank, 1 )
	AllowTechnology( Technologies.B_GunsmithWorkshop, 1 )
	AllowTechnology( Technologies.B_Stables, 1 )
	AllowTechnology( Technologies.B_Tavern, 1 )
	AllowTechnology( Technologies.GT_Binocular, 1 )
	AllowTechnology( Technologies.GT_ChainBlock, 1 )
	AllowTechnology( Technologies.GT_Chemistry, 1 )
	AllowTechnology( Technologies.GT_Library, 1 )
	AllowTechnology( Technologies.GT_Matchlock, 1 )
	AllowTechnology( Technologies.GT_Printing, 1 )
	AllowTechnology( Technologies.GT_PulledBarrel, 1 )
	AllowTechnology( Technologies.GT_Strategies, 1 )
	AllowTechnology( Technologies.GT_Tactics, 1 )
	AllowTechnology( Technologies.GT_Architecture, 1 )
	AllowTechnology( Technologies.T_UpgradeBow3, 1 )
	AllowTechnology( Technologies.T_UpgradeSpear3, 1 )
	AllowTechnology( Technologies.T_UpgradeSword3, 1 )
	AllowTechnology( Technologies.UP1_Foundry, 1)
	end


	if QuestSystem.CustomVariables["difficulty"] == 0 then
		AllowTechnology( Technologies.B_Alchemist, 1 )
		AllowTechnology( Technologies.B_Bank, 1 )
		AllowTechnology( Technologies.B_Foundry, 1 )
		AllowTechnology( Technologies.B_GunsmithWorkshop, 1 )
		AllowTechnology( Technologies.B_Stables, 1 )
		AllowTechnology( Technologies.B_Tavern, 1 )
		AllowTechnology( Technologies.GT_Binocular, 1 )
		AllowTechnology( Technologies.GT_ChainBlock, 1 )
		AllowTechnology( Technologies.GT_Chemistry, 1 )
		AllowTechnology( Technologies.GT_Library, 1 )
		AllowTechnology( Technologies.GT_Matchlock, 1 )
		AllowTechnology( Technologies.GT_Metallurgy, 1 )
		AllowTechnology( Technologies.GT_Printing, 1 )
		AllowTechnology( Technologies.GT_PulledBarrel, 1 )
		AllowTechnology( Technologies.GT_Strategies, 1 )
		AllowTechnology( Technologies.GT_Tactics, 1 )
		AllowTechnology( Technologies.GT_Architecture, 1 )
		AllowTechnology( Technologies.T_UpgradeBow3, 1 )
		AllowTechnology( Technologies.T_UpgradeSpear3, 1 )
		AllowTechnology( Technologies.T_UpgradeSword3, 1 )
		end


end

function RegenSalim()
	SetHealth("salim", 1)
	Move("salim", "spotsalim")
	StartSimpleJobEx(function()
		if GetHealth("salim") == 100 then
			ChangePlayer("salim",1)
			return true;
		end
	end);
end
------------------------------------------------------------------------------------------------------------------------






---------------------------------------------------Mary Angriff Controle----------------------------------------------
function NameMary()
	SetPlayerName(6,"Mary")
end


-------Blau-Mary1------------------------------------------------------------------------

function CreateMaryCastleAttack1()
 AddAIPlayerAttackTarget(7, "goal_maryhq");
end

function DestroyMaryCastleAttack1()
	RemoveAIPlayerAttackTarget(7, "goal_maryhq");
end

-------Blau-Mary2------------------------------------------------------------------------

function CreateMaryCastleAttack2()
 AddAIPlayerAttackTarget(7, "goal_maryhq1");
end

function DestroyMaryCastleAttack2()
	RemoveAIPlayerAttackTarget(7,"goal_maryhq1");
end

-------Blau-Mary3------------------------------------------------------------------------

function CreateMaryCastleAttack3()
 AddAIPlayerAttackTarget(7, "goal_maryhq2");
end

function DestroyMaryCastleAttack3()
	RemoveAIPlayerAttackTarget(7,"goal_maryhq2");
end

-------Blau-Mary4------------------------------------------------------------------------

function CreateMaryCastleAttack4()
 AddAIPlayerAttackTarget(7, "goal_maryhq3");
end

function DestroyMaryCastleAttack4()
	RemoveAIPlayerAttackTarget(7,  "goal_maryhq3");
end




------Mary1-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack1()
 AddAIPlayerAttackTarget(6, "goal_marytarget");
end

function DestroyMaryHauptstadtAttack1()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget");
end

------Mary2-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack2()
 AddAIPlayerAttackTarget(6, "goal_marytarget1");
end

function DestroyMaryHauptstadtAttack2()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget1");
end

------Mary3-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack3()
 AddAIPlayerAttackTarget(6, "goal_marytarget2");
end

function DestroyMaryHauptstadtAttack3()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget2");
end

------Mary4-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack4()
AddAIPlayerAttackTarget(6, "goal_marytarget3");
end

function DestroyMaryHauptstadtAttack4()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget3");
end

------Mary5-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack5()
 AddAIPlayerAttackTarget(6, "goal_marytarget4");
end

function DestroyMaryHauptstadtAttack5()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget4");
end

------Mary6-----------------------------------------------------------------------------

function CreateMaryHauptstadtAttack6()
 AddAIPlayerAttackTarget(6, "goal_marytarget5");
end

function DestroyMaryHauptstadtAttack6()
	RemoveAIPlayerAttackTarget(6, "goal_marytarget5");
end


----------Barmecia Attack-----------------------------------------------------------------

function CreateBarmeciaHauptstadtAttack()
 AddAIPlayerAttackTarget(8, "barmecia_target");
end

function DestroyBarmeciaHauptstadtAttack()
	RemoveAIPlayerAttackTarget(8, "barmecia_target");
end
-----------------------------------------------------------------------------------------------------------------------

----------------------------------------------Finale Cutscene generieren-----------------------------------------------
function ClearAllHeroes()
	DestroyEntity("dario")
	DestroyEntity("ari")
	DestroyEntity("pille")
	DestroyEntity("erec_1")
	DestroyEntity("helias_1")
	DestroyEntity("salim")
	DestroyEntity("mary")	
		if QuestSystem.CustomVariables["VargLebt"] == 1 then
			DestroyEntity("varg")
    	end
	CreateEntity(1, Entities.PU_Hero1c, GetPosition("findario"), "dario")
	CreateEntity(1, Entities.PU_Hero5, GetPosition("finari"), "ari")
	CreateEntity(1, Entities.PU_Hero2, GetPosition("finpille"), "pille")
	CreateEntity(1, Entities.PU_Hero4, GetPosition("finerec"), "erec_1")
	CreateEntity(1, Entities.PU_Hero6, GetPosition("finhelias"), "helias_1")
	CreateEntity(1, Entities.PU_Hero3, GetPosition("finsalim"), "salim")
	CreateEntity(6, Entities.CU_Mary_de_Mortfichet, GetPosition("finmary"), "mary")
		if QuestSystem.CustomVariables["VargLebt"] == 1 then
			CreateEntity(1, Entities.CU_Barbarian_Hero, GetPosition("finvarg"), "varg")
   		end
	LookAt("dario","mary");
	LookAt("ari","mary");
	LookAt("pille","mary");
	LookAt("erec_1","mary");
	LookAt("helias_1","mary");
	LookAt("salim","mary");
		if QuestSystem.CustomVariables["VargLebt"] == 1 then
			LookAt("varg","mary");
	    end
	LookAt("mary","dario");
end


function ReviveKerberos()
	CreateEntity(6, Entities.CU_BlackKnight, GetPosition("finkerberos"), "kerberos")
	LookAt("kerberos","mary");
	LookAt("mary","kerberos");
end

function Fliehen()
	Move("kerberos","extraction")
	Move("mary","extraction")
end


-------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------Wetterfunktionen--------------------------------------------------------------------
function MoveSmith()
	Move("smith","movesmith")
end


function Snow()
	StartWinter(60*60*24)
end

function Schmelze()
	StartSummer(60*60*24)
end
--------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Comfort function zum Abfragen der Health einer Entity                   by Chromix
------------------------------------------------------------------------------------------------------------------------------------------------------------
function GetHealth( _entity )
    local entityID = GetEntityId( _entity );
    if not Tools.IsEntityAlive( entityID ) then
        return 0;
    end
    local MaxHealth = Logic.GetEntityMaxHealth( entityID );
    local Health = Logic.GetEntityHealth( entityID );
    return ( Health / MaxHealth ) * 100
end
 

DEFAULT_COLOR = -1;
PLAYER_COLOR = 1;
NEPHILIM_COLOR = 2;
FRIENDLY_COLOR1 = 3;
FRIENDLY_COLOR2 = 4;
ENEMY_COLOR2 = 5;
MERCENARY_COLOR = 6;
ENEMY_COLOR3 = 7;
FARMER_COLOR = 8;
EVIL_GOVERNOR_COLOR = 9;
TRADER_COLOR = 10;
NPC_COLOR = 11;
KERBEROS_COLOR = 12;
ENEMY_COLOR1 = 13;
ROBBERS_COLOR = 14;
SAINT_COLOR = 15;
FRIENDLY_COLOR3 = 16;

------------ Comfort function for adding Tributes----------------------------------------------------------
	function AddTribute( _tribute )
		assert( type( _tribute ) == "table", "Tribut mu� ein Table sein" );
		assert( type( _tribute.text ) == "string", "Tribut.text mu� ein String sein" );
		assert( type( _tribute.cost ) == "table", "Tribut.cost mu� ein Table sein" );
		assert( type( _tribute.playerId ) == "number", "Tribut.playerId mu� eine Nummer sein" );
		assert( not _tribute.Tribute , "Tribut.Tribute darf nicht vorbelegt sein");
		
		uniqueTributeCounter = uniqueTributeCounter or 1;
		_tribute.Tribute = uniqueTributeCounter;
		uniqueTributeCounter = uniqueTributeCounter + 1;
		
		local tResCost = {};
		for k, v in pairs( _tribute.cost ) do
			assert( ResourceType[k] );
			assert( type( v ) == "number" );
			table.insert( tResCost, ResourceType[k] );
			table.insert( tResCost, v );
		end
		
		Logic.AddTribute( _tribute.playerId, _tribute.Tribute, 0, 0, _tribute.text, unpack( tResCost ) );
		SetupTributePaid( _tribute );
		
		return _tribute.Tribute;
	end




	--------------------------Baulimit--------------------------------------------
	EntityTypeToTechnologyType = {
		[Entities.PB_Tower1] = Technologies.B_Tower,
	}
	
	function CheckUnitOrBuildingLimit(_PlayerID, _UpgradeCategory, _Limit)
		local Players = QuestSync:GetActivePlayers();
		local Amount = 0;
		local Members = {Logic.GetBuildingTypesInUpgradeCategory(_UpgradeCategory)};
		if Members[1] > 0 and EntityTypeToTechnologyType[Members[2]] then
			if _Limit >= 0 then
				for i= 2, Members[1]+1, 1 do
					Amount = Amount + Logic.GetNumberOfEntitiesOfTypeOfPlayer(_PlayerID, Members[i]);
				end
				if Amount >= _Limit then
					if Logic.GetTechnologyState(_PlayerID, EntityTypeToTechnologyType[Members[2]]) > 0 then
						ForbidTechnology(EntityTypeToTechnologyType[Members[2]], _PlayerID);
						if _PlayerID == GUI.GetPlayerID() then
							GameCallback_GUI_SelectionChanged();
						end
					end
				else
					if Logic.GetTechnologyState(_PlayerID, EntityTypeToTechnologyType[Members[2]]) < 1 then
						AllowTechnology(EntityTypeToTechnologyType[Members[2]], _PlayerID);
						if _PlayerID == GUI.GetPlayerID() then
							GameCallback_GUI_SelectionChanged();
						end
					end
				end
			end
		end
	end