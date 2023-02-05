--------------------------------------------------------------------------------
-- MapName: XXX
--
-- Author: XXX
--
--------------------------------------------------------------------------------
-- Include main function


Script.Load("data/script/maptools/main.lua");
Script.Load("data/script/maptools/mapeditortools.lua");
Script.Load("data/maps/externalmap/mainmapscript.lua");

gvBasePath = "data\\maps\\externalmap";

TriggerFixCppLogicExtension_UseRecommendedFixes = true;



Script.Load(gvBasePath.."\\s5CommunityLib\\packer\\devLoad.lua")
-- table.insert(mcbPacker.Paths, {"data\\maps\\user\\"..Framework.GetCurrentMapName().."\\", ".lua"}) für Ordnerform
Script.Load(gvBasePath.."\\s5CommunityLib\\lib\\UnlimitedArmySpawnGenerator.lua")
Script.Load(gvBasePath.."\\s5CommunityLib\\lib\\UnlimitedArmyRecruiter.lua")
Script.Load(gvBasePath.."\\extraGUI.lua")
Script.Load(gvBasePath.."\\barb_tower.lua")
Script.Load(gvBasePath.."\\polygon.lua")
Script.Load(gvBasePath.."\\modus.lua")
Script.Load(gvBasePath.."\\blende.lua")
Script.Load(gvBasePath.."\\extractBuildings.lua")
Script.Load(gvBasePath.."\\daily_cycle.lua")
Script.Load(gvBasePath.."\\daily_cycle_rain.lua")
Script.Load(gvBasePath.."\\chapter1.lua")
Script.Load(gvBasePath.."\\chapter2.lua")
Script.Load(gvBasePath.."\\chapter3.lua")
Script.Load(gvBasePath.."\\chapter4.lua")
Script.Load(gvBasePath.."\\cutscenes.lua")
Script.Load(gvBasePath.."\\barb_walls.lua")
Script.Load(gvBasePath.."\\briefings.lua")
Script.Load(gvBasePath.."\\buildingSelection.lua")
Script.Load(gvBasePath.."\\chain_construction.lua")
Script.Load(gvBasePath.."\\Debug.lua")



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
	-- Friendly = 1
	-- Hostile = 3
	-- Neutral = 2
	--Logic.SetDiplomacyState(_player1, _player2, _diplSat)

	Logic.SetDiplomacyState(1, 6, 3)
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

	--InstallS5Hook()
    CppLogic_ResetGlobal()
    GUI_Initialize()
    
	--WeatherSetup
	InitDaylyCycleGFXRain()
	InitDaylyCycleGFX()

	LocalMusic.UseSet = HIGHLANDMUSIC
	--LocalMusic.UseSet = EVELANCEMUSIC

	CppLogic.Logic.ReloadCutscene()


	CppLogic.Logic.SetStringTableText("names/CB_Barbarian_Castle1", "Burg")
	CppLogic.Logic.SetStringTableText("names/CB_Barbarian_Castle2", "Festung")
	CppLogic.Logic.SetStringTableText("names/CB_Barbarian_Castle3", "Zitadelle")
    CppLogic.Logic.SetStringTableText("names/CB_Signalfire_Base", "Signalfeuer")
    CppLogic.Logic.SetStringTableText("names/CB_Signalfire_Fire", "Entzündetes Signalfeuer")
    CppLogic.Logic.SetStringTableText("names/PB_VillageCenterBarbarian", "Barbarenlager")
    CppLogic.Logic.SetStringTableText("names/XD_VillageCenter_Building", "Siedlungsbaustelle")
    CppLogic.Logic.SetStringTableText("names/PB_Watchtower_Barb", "Wachturm")
    CppLogic.Logic.SetStringTableText("names/PB_Watchtower_Barb2", "Grenzposten")
    CppLogic.Logic.SetStringTableText("names/XD_WoodPit1", "Holzvorkommen")
    CppLogic.Logic.SetStringTableText("names/PB_WoodMine1", "Holzwerk")
    CppLogic.Logic.SetStringTableText("names/PB_WoodMine2", "Holzwerkstatt")
    CppLogic.Logic.SetStringTableText("names/PB_WoodMine3", "Holzmanufaktur")
	CppLogic.Logic.SetStringTableText("names/CB_Barbarian_Arena", "Barbarenarena")
	CppLogic.Logic.SetStringTableText("names/CB_EvilBoat", "Nebelkriegerschiff")
	CppLogic.Logic.SetStringTableText("names/XD_EvilBoat_Wreckage", "Schiffswrack")
	CppLogic.Logic.SetStringTableText("names/CU_BanditLeaderSword1", "Banditen")
	CppLogic.Logic.SetStringTableText("names/CU_BanditLeaderSword2", "Banditen")
	CppLogic.Logic.SetStringTableText("names/CU_BanditLeaderBow1", "Banditenschützen")
	CppLogic.Logic.SetStringTableText("names/CU_BanditLeaderBow2", "Banditenschützen")
	
	CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\b_select_varg.png")
    CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\b_statistics.png")
	CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\bg_bottom.dds")
	CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\bg_bottom_left.dds")
	CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\bg_top.png")
	CppLogic.ModLoader.ReloadGUITexture("data\\graphics\\textures\\gui\\bg_top_heros.png")



    BarbName1 = "Helgar der Barbar"
    BarbName2 = "Wolfgang der Barbar"
    BarbName3 = "Rüdiger der Barbar"
    
    for i=1,3,1 do
        if IsExisting(_G["trupp"..i]) then
        CppLogic.Entity.SetDisplayName(_G["trupp"..i], _G["BarbName"..i])
        end
    end

    if IsExisting(guard) then
    CppLogic.Entity.SetDisplayName(guard, "Mijörn")
    SetEntityOverheadWidget(guard,1)
    end

	XGUIEng.ShowWidget("ChapterInfo", 1)
	Update_GUIUpdate_HeroFindButtons() --Update GUIUpdate_HeroButton
	--Check für Leonardo Research Chapter 3

	if LeonardoResearch == true then
            XGUIEng.ShowWidget("DefendProgressContainer", 1)
	end
	---Check für THief Quest Chapter 4

	if ThiefQuest == true and XGUIEng.IsWidgetShown("ThiefCollectables") == 0 then
        XGUIEng.ShowWidget("ThiefCollectables", 1)
        GUI.SetControlledPlayer(2)
        Logic.ActivateUpdateOfExplorationForAllPlayers()
        if IsDestroyed("vulc_water") then
            XGUIEng.ShowWidget("Collectable1Done", 1)
        end
        if IsDestroyed("vulc_glut") then
            XGUIEng.ShowWidget("Collectable2Done", 1)
        end
        if IsDestroyed("sheep_hair") then
            XGUIEng.ShowWidget("Collectable3Done", 1)
        end
        if IsDestroyed("scratch_parts") then
            XGUIEng.ShowWidget("Collectable4Done", 1)
        end
		if IsDestroyed("Kurbel1_1") then
            XGUIEng.ShowWidget("KurbelADone", 1)
        end
		if IsDestroyed("Kurbel2_1") then
            XGUIEng.ShowWidget("KurbelBDone", 1)
        end
    end


	--Endboss Safe
	if IsExisting("Endgegner") then
		--Setup Endboss
		CppLogic.Entity.SetDamage(GetID("Endgegner"), 30)
		CppLogic.Entity.SetArmor(GetID("Endgegner"), 20)
		CppLogic.Entity.Leader.SetTroopHealth(GetID("Endgegner"), 1000)
		--
	end

	if BridgeSystemActive == true then
		XGUIEng.ShowWidget("BridgeCooldown", 1)
		XGUIEng.SetText("CountdownBridgeNorth", "@center @color:124,252,0 Fertig!", 1)
		XGUIEng.SetText("CountdownBridgeLava", "@center @color:124,252,0 Fertig!", 1)
		XGUIEng.SetText("CountdownGateSouth", "@center @color:124,252,0 Fertig!", 1)
	end
	
	Input.KeyBindDown(Keys.Back, "GUI.SellBuilding(GUI.GetSelectedEntity())", 2); --Löschen mit Backspace Taste 
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()
	 --WeatherSetup
        
    --2 * Sommertage (16min = 1 Tag)
	for i = 1,2,1 do
		AddPeriodicSummer(6*60);
		AddPeriodicTransitionSunrise(60);
		AddPeriodicSunrise(60)
		AddPeriodicNight(6*60);
		AddPeriodicSunrise(60)
		AddPeriodicTransitionSunrise(60);
	end
	
    --Regentage (11min = 1 Tag)
    AddPeriodicNormalRain(4*60);
    AddPeriodicTransitionSunriseRain(60);
    AddPeriodicSunriseRain(60)
    AddPeriodicNightRain(4*60);
    AddPeriodicSunriseRain(60)
    AddPeriodicTransitionSunriseRain(60);
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
    Logic.SetPlayerRawName(1, "Varg")
	Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
    Display.SetPlayerColorMapping(8, ENEMY_COLOR2)
	Display.SetPlayerColorMapping(4, KERBEROS_COLOR)
	Display.SetPlayerColorMapping(5, ENEMY_COLOR1)
	Display.SetPlayerColorMapping(6, EVIL_GOVERNOR_COLOR)
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()
    TriggerFix.AllScriptsLoaded()
	InitEntityTrigger()
	Display.SetRenderLandscapeDebugInfo(0)   --Debug
    ActivateBriefingsExpansion()
    StartSimpleJob("BarbCounter")  --CounterJob für kaufbare Barbaren im BarbarenHQ
    InitBuildingSelection() --Aktivierung der Selectionsüberarbeitung für neue Gebäude
    InitalizeBarbTower()  --Aktivierung der Barbarentürme
	UpgradeNewTroops() --Aktivierung der neuen Truppenupgrades
	
	--Logic.SetTechnologyState(1,Technologies.GT_BarbarianBuildings,3) --Aktivierung der Selektierbarkeit des Baumenüs von Serfs
	Update_GUIUpdate_HeroFindButtons() --Update GUIUpdate_HeroButton
	Tribute_Comforts() --Aktivierung der Tribut Comfort

	--Anzahl UAs
	NumberUA = 30

	--CC aktivieren
	ActivateCC()
    --Vulkanfeuer 
	x_vulc,y_vulc = Logic.EntityGetPos(GetID("vulc_middle"))

	local x 
	local y 
	for r = 200,800,100 do
		for a = 0,360, 10 do
		local x = r * math.cos(a) + x_vulc
		local y = r * math.sin(a) + y_vulc
		local id_fire =  GetID(Logic.CreateEntity(Entities.XD_Rock1, x,  y, 0, 0))
		Logic.SetModelAndAnimSet(id_fire ,Models.Effects_XF_HouseFire,nil);
		end
	end
	
	--Leonardos Hütte
	Logic.SetModelAndAnimSet(GetID("leo_hut") ,Models.CB_InventorsHut1,nil);


    --MapStart Funcs
    CreateDynamicFog("Nebel", 0 ); --Nebel am Spawn
	CreateDynamicFog("fog", 0 );  --Nebel NV-Camp
	CreateDynamicFog("seafog", 0 );  --Nebel NV-Camp
    Start_Chapter1()
    StartSimpleJob("GetSystemTime")


	---Gebäude auf Spieler 0 
	MapTools.WallsToPlayerZero(Entities.XD_DarkWallStraightGate,
		Entities.XD_DarkWallStraightGate_Closed, 
		Entities.XD_DarkWallCorner, 
		Entities.XD_DarkWallStraight, 
		Entities.XD_DarkWallDistorted,
		Entities.XD_WallStraightGate,
		Entities.XD_WallStraightGate_Closed, 
		Entities.XD_WallCorner, 
		Entities.XD_WallStraight, 
		Entities.XD_WallDistorted)

	--Trigger für neue Comforts	
    StartReplaceOnNextTick() --Startet den ReplaceOnNextTick-Job
	StartGateChangerJob() --Startet den GateJob

	--Wetterwechselverbot
	Logic.SetTechnologyState(1,Technologies.B_PowerPlant,0)

	--WoodPiles
	CreateWoodPile( "woodpile1", 50000 )
	CreateWoodPile( "woodpile2", 50000 )

	--Lava Damage auf SecretPath
	CreateSecretPolygon()

	---Stadtwachenfix
	GameCallback_OnTechnologyResearchedOriginal = GameCallback_OnTechnologyResearched
    function GameCallback_OnTechnologyResearched( _PlayerID, _TechnologyType )
        GameCallback_OnTechnologyResearchedOriginal( _PlayerID,_TechnologyType)
        if _TechnologyType == Technologies.T_TownGuard then
        Logic.SetTechnologyState(_PlayerID,Technologies.T_CityGuard, 3)
        end
    end


	---Ruinenabbau aktivieren
	ActivateRuinExtraction()

	--Holzmine (verbleibende Ressourcen)
	StartSimpleJob("WoodMineState")

	--Kanonen und Leibis heilen HP
	ComfortsStartHeal()

	--HandelBalancing
	Trigger.RequestTrigger(Events.LOGIC_EVENT_GOODS_TRADED,nil,"TransactionDetails",1,nil,nil) 

	--Savegame Trigger
	Trigger.RequestTrigger(Events.SCRIPT_EVENT_ON_PRE_SAVE,nil,"NormalizeSaveGameSpeed",1,nil,nil)
end

function NormalizeSaveGameSpeed()
	Game.GameTimeSetFactor(1)
    speedMode = 2
	currentMode = 1
    GUITooltip_GenericSpeedButton()
end



function ThiefLimiter()
	if mode ==2 and Logic.GetPlayerEntities(1,Entities.PU_Thief,48) >= 2 then
		Logic.SetTechnologyState(1,Technologies.MU_Thief,0) 
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	elseif mode ==2 then
		Logic.SetTechnologyState(1,Technologies.MU_Thief,2) 
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	end

	if mode ==3 and Logic.GetPlayerEntities(1,Entities.PU_Thief,48) >= 1 then
		Logic.SetTechnologyState(1,Technologies.MU_Thief,0) 
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	elseif mode == 3 then
		Logic.SetTechnologyState(1,Technologies.MU_Thief,2) 
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
	end
end

---------------------------------------Cutscene Fix----------------------------------------------------------

StartCutscene = function(_Name, _Callback)

	-- Remember callback
	CutsceneCallback = _Callback

	-- -- Stop trigger system
	-- Trigger.DisableTriggerSystem(1)

	-- Invulnerability for all entities
	Logic.SetGlobalInvulnerability(1)

	--	forbid feedback sounds

	GUI.SetFeedbackSoundOutputState(0)

	-- no shapes during cutscene
	Display.SetProgramOptionRenderOcclusionEffect(0)

	-- cutscene input mode
	Input.CutsceneMode()

	-- Start cutscene
	Cutscene.Start(_Name)

	assert(cutsceneIsActive ~= true)
	cutsceneIsActive = true

	LocalMusic_UpdateMusic()

	--	backup
	Cutscene.Effect = Sound.GetVolumeAdjustment(3)
	Cutscene.Ambient = Sound.GetVolumeAdjustment(5)
	Cutscene.Music = Music.GetVolumeAdjustment()

	--	half volume
	Sound.SetVolumeAdjustment(3, Cutscene.Effect * 0.5)
	Sound.SetVolumeAdjustment(5, Cutscene.Ambient * 0.5)
	Music.SetVolumeAdjustment(Cutscene.Music * 0.5)

	--	stop feedback sounds
	Sound.PlayFeedbackSound(0,0)
end
---------------------------------------Ressourcenmenge Holz--------------------------------------------------

function WoodMineState()
	local woodID = GetID("holzschacht")
	if IsExisting(woodID) then
		woodmineAmount = Logic.GetResourceDoodadGoodAmount(woodID)
		XGUIEng.SetText("WoodMineAmount", "@center @color:143,91,64 Holzmenge: @color:255,255,255  "..woodmineAmount, 1)
		return false
	else
		return true
	end
end


-----------------------------------MoveStaticEntity----------------------------------------------------------
MoveEntityData = {}
MoveEntityData_TriggerID = nil
function MoveStaticEntity(_entity,_posX,_posY,_dirX,_dirY)
	assert(type(_entity) == "number" or "string", "_entity muss eine Number oder ein String sein.") 
	assert(type(_posX) == "number" or "string", "_posX muss eine Number oder ein String sein.")
	assert(type(_posY) == "number" or "string", "_posY muss eine Number oder ein String sein.")
	assert(type(_dirX) == "boolean", "_dirX muss ein Boolean sein")
	assert(type(_dirY) == "boolean", "_dirY muss ein Boolean sein")

	
	if not MoveEntityData_TriggerID then
		MoveEntityData_TriggerID = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN,nil,"MoveAndDestroy",1)
	end

	local helper = {
		id = GetID(_entity),
	 	x = _posX,
	 	y = _posY,
	 	dirX = _dirX,
	 	dirY = _dirY,
	 	newY = 0,
		newX = 0,
	}
	table.insert(MoveEntityData,helper)
end

function MoveAndDestroy()
	for i = table.getn(MoveEntityData),1,-1 do
		local data = MoveEntityData[i]
		if data.dirY == true and data.y >= data.newY then --in positive Y-Richtung
			local _,entityY = Logic.GetEntityPosition(data.id)
			local ori = Logic.GetEntityOrientation(data.id)
			local playerId = Logic.EntityGetPlayer(data.id)
			local newY = entityY +31
			local type = Logic.GetEntityType(data.id)
			DestroyEntity(data.id)
			local newId = Logic.CreateEntity(type,data.x,newY,ori,playerId)
			data.newY = newY
			data.id = newId
		elseif data.dirX == true and data.x >= data.newX then --in positive X-Richtung
			local entityX,_ = Logic.GetEntityPosition(data.id)
			local ori = Logic.GetEntityOrientation(data.id)
			local playerId = Logic.EntityGetPlayer(data.id)
			local newX = entityX +31
			local type = Logic.GetEntityType(data.id)
			DestroyEntity(data.id)
			local newId = Logic.CreateEntity(type,newX,data.y,ori,playerId)
			data.newX = newX
			data.id = newId
		elseif data.dirY == false and data.y <= data.newY then  --in negative Y-Richtung
			local _,entityY = Logic.GetEntityPosition(data.id)
			local ori = Logic.GetEntityOrientation(data.id)
			local playerId = Logic.EntityGetPlayer(data.id)
			local newY = entityY -31
			local type = Logic.GetEntityType(data.id)
			DestroyEntity(data.id)
			local newId = Logic.CreateEntity(type,data.x,newY,ori,playerId)
			data.newY = newY
			data.id = newId
		elseif data.dirX == false and data.x <= data.newX then --in negative X-Richtung
			local entityX,_ = Logic.GetEntityPosition(data.id)
			local ori = Logic.GetEntityOrientation(data.id)
			local playerId = Logic.EntityGetPlayer(data.id)
			local newX = entityX -31
			local type = Logic.GetEntityType(data.id)
			DestroyEntity(data.id)
			local newId = Logic.CreateEntity(type,newX,data.y,ori,playerId)
			data.newX = newX
			data.id = newId
		else 
			table.remove(MoveEntityData,i)
		end
	end
end


-----------------------------------ReplaceEntityNextTick-----------------------------------------------------
ReplaceData = {}

function ReplaceEntityOnNextTick(_id,_type, _name)  --name = Name des neuen Gebäudes
	table.insert(ReplaceData, {id = _id, type = _type, name = _name})
end

function StartReplaceOnNextTick()
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN, nil, "ReplaceEntityJob",1) --Trigger für Replacen auf nächsten Tick
end

function ReplaceEntityJob()
	for i= table.getn(ReplaceData),1,-1 do
		local replaceID = ReplaceData[i].id
		local replaceType = ReplaceData[i].type
		local replaceName = ReplaceData[i].name
		local newID = ReplaceEntity(replaceID,replaceType)
		if replaceName then
			Logic.SetEntityName(newID,replaceName)
		end
		table.remove(ReplaceData, i)
	end
end
-----------------------------------GateChanger---------------------------------------------------------------

GatesData = {};

function AddChangeGate(_point, _radius, _type1, _type2, _gatename)
    table.insert(GatesData, {point=_point,radius=_radius,type1=_type1,type2=_type2,gate= _gatename})
end;

function RemoveChangeGate(_gatename)
    for i = 1,table.getn(GatesData) do
        if GatesData[i].gate == _gatename then
            table.remove(GatesData, i);
            break;
        end;
    end;
end;

function StartGateChangerJob()
   gateTrigger = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"GateChangerJob",1) --gateTrigger beenden wenn alle Tore weg sind
end;

function GateChangerJob()  --wechselt den Zustand eines Objektes (Tor,Zugbrücke,etc.)
    for i = table.getn(GatesData), 1, -1 do
        local changeParams = GatesData[i];
        local _tp = GetID(changeParams.point) --gibt den Punkt an von dem die Triggerrange ausgeht (Objekt, welches seinen Zustand wechseln soll nicht weiter als 500 von diesem Punkt weg)
        local _tr = changeParams.radius --Radius, bei dem das Objekt seinen Zustand wechselt, wenn Truppen in der Nähe sind
        local _et1 = changeParams.type1 --Truppen Typ 1
        local _et2 = changeParams.type2--Truppen Typ 2

        local _,gateOpenID = Logic.GetEntitiesInArea(Entities.XD_DarkWallStraightGate,GetPosition(_tp).X,GetPosition(_tp).Y,500,1)
        local _,gateClosedID = Logic.GetEntitiesInArea(Entities.XD_DarkWallStraightGate_Closed,GetPosition(_tp).X,GetPosition(_tp).Y,500,1)
        if Logic.GetEntitiesInArea(_et1,GetPosition(_tp).X,GetPosition(_tp).Y, _tr,1) >0
        or Logic.GetEntitiesInArea(_et2,GetPosition(_tp).X,GetPosition(_tp).Y, _tr,1) >0 
        then
            if Logic.GetEntityTypeName(Logic.GetEntityType(gateClosedID)) == "XD_DarkWallStraightGate_Closed" then
                ReplaceEntity(gateClosedID, Entities.XD_DarkWallStraightGate)
            end
        elseif Logic.GetEntitiesInArea(_et1,GetPosition(_tp).X,GetPosition(_tp).Y, _tr,1) <= 0 
        or Logic.GetEntitiesInArea(_et2,GetPosition(_tp).X,GetPosition(_tp).Y, _tr,1) <= 0  
        then
            if Logic.GetEntityTypeName(Logic.GetEntityType(gateOpenID)) == "XD_DarkWallStraightGate" then
                ReplaceEntity(gateOpenID, Entities.XD_DarkWallStraightGate_Closed)
            end
        end
    end;
end




-----------------------------------UpdateHeroAnzeige (oben-rechts)--------------------------------
function Update_GUIUpdate_HeroFindButtons()
	function
		GUIUpdate_HeroFindButtons()
		
			local PlayerID = GUI.GetPlayerID()
			
			--XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.HeroFindContainer,0)	
			
			
			--Create Table with all heroes
			
			local Hero = {}

			if IsExisting(varg) then
				local pId_varg = Logic.EntityGetPlayer(varg)
				if pId_varg == 1 then
					local hero1_id = GetID(varg)
					table.insert(Hero,hero1_id)
				else
					Hero[1] = nil
				end
			end

			--local j = 1
			
			for j=1,6
			do
			
				if  Hero[j] ~= nil and GetID(Hero[j]) ~= GetID(trupp1) and GetID(Hero[j]) ~= GetID(trupp2) and GetID(Hero[j]) ~= GetID(trupp3) then
					
					XGUIEng.ShowWidget(gvGUI_WidgetID.HeroFindButtons[j],1)	
					
					--AddOn: Show also BG
					XGUIEng.ShowWidget(gvGUI_WidgetID.HeroBGIcon[j],1)	
					
					XGUIEng.SetBaseWidgetUserVariable(gvGUI_WidgetID.HeroFindButtons[j], 0,Hero[j])
					
					
					--XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.HeroDeadIconContainer,0)	
					local Health = Logic.GetEntityHealth(Hero[j]) 
					if Logic.GetEntityHealth(Hero[j]) == 0 then
						XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],1)	
					else
						XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],0)	
					end
					
					--j = j + 1
				else
					XGUIEng.ShowWidget(gvGUI_WidgetID.HeroFindButtons[j],0)	
					--AddOn: disbale also BG
					XGUIEng.ShowWidget(gvGUI_WidgetID.HeroBGIcon[j],0)	
					XGUIEng.ShowWidget(gvGUI_WidgetID.HeroDeadIcon[j],0)
				end
				
			end
			
	end
end

--------------------------------------------------------------------------------------------------

-----------------------------------RefreshDisplayNames--------------------------------------------
function RefreshDisplayNames()
	BarbName1 = "Helgar der Barbar"
    BarbName2 = "Wolfgang der Barbar"
    BarbName3 = "Rüdiger der Barbar"
    
    for i=1,3,1 do
        if IsExisting(_G["trupp"..i]) then
        CppLogic.Entity.SetDisplayName(_G["trupp"..i], _G["BarbName"..i])
		SetEntityOverheadWidget(_G["trupp"..i],1)
        end
    end

    if IsExisting(guard) then
    CppLogic.Entity.SetDisplayName(guard, "Mijörn")
    SetEntityOverheadWidget(guard,1)
	end
end

-----------------------------------ResetQuestBook-------------------------------------------------
function ResetQuestBook(_player) --resets all Quests
	local questlist = {}
	local id = _player
	questlist = {Logic.GetAllQuests(id)}
	
	for i = 2, table.getn(questlist) do
		Logic.RemoveQuest(id,i,nil)
	end
end


-----------------------------------LoseCondition--------------------------------------------------
function AllHerosDead()
	if IsDead(guard) and IsDead(varg) and IsDead(trupp1) and IsDead(trupp2) and IsDead(trupp3) then
		Defeat()
	end
end

function CastleDestroyed()
	if IsDead("barb_castle") then
		Defeat()
	end
end

---------------------------------------------------------------------------------------------------


------------------------------------MainCharacterCheckForResurrect---------------------------------
function ResurrectMainCharakters()
	if IsExisting(trupp1) then
		if IsDead(trupp1) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(trupp1))
		end
	end
	if IsExisting(trupp2) then
		if IsDead(trupp2) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(trupp2))
		end
	end
	if IsExisting(trupp3) then
		if IsDead(trupp3) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(trupp3))
		end
	end
	if IsExisting(guard) then
		if IsDead(guard) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(guard))
		end
	end
	if IsExisting(varg) then
		if IsDead(varg) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(varg))
		end
	end
end

-------------------------------------Neue Truppen-Upgraden------------------------------------

function UpgradeNewTroops()
    GameCallback_OnTechnologyResearchedNewTroops = GameCallback_OnTechnologyResearched
    function GameCallback_OnTechnologyResearched( _PlayerID, _TechnologyType )
        GameCallback_OnTechnologyResearchedNewTroops( _PlayerID, _TechnologyType )

        if _TechnologyType == Technologies.T_UpgradeBanditSword1 then
            --should be LOGIC not GUI
            GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderBandit,_PlayerID)
            GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierBandit,_PlayerID)

        elseif _TechnologyType == Technologies.T_UpgradeBanditBow1 then
             --should be LOGIC not GUI
            GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderBanditBow,_PlayerID)
            GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierBanditBow,_PlayerID)
        end
    end
end

---------------------------Auslesen SystemTime------------------------------------------------
function GetSystemTime()

    local Seconds = Logic.GetTime()
	
	local TotalMinutes = math.floor( Seconds / 60 )
	local Hours = math.floor( TotalMinutes / 60 )
	local Minutes = math.mod( TotalMinutes, 60 )
	local TotalSeconds = math.mod( math.floor(Seconds), 60 )
		
	local String = " "
	
	if Hours > 0 then		
		if Hours < 10 then
			String = String .. "0" .. Hours .. ":"
		else
			String = String .. Hours .. ":"
		end
	elseif Hours == 0 then
		String = String .. "00".. ":"
	end
	
	if Minutes == 0 then
		String = String .. "00" .. ":"
	else
		if Minutes <10 then
			String = String .. "0" .. Minutes .. ":"
		else
			String = String .. Minutes .. ":"
		end
	end
	
	
	if TotalSeconds < 10 then		
		String = String .. "0" .. TotalSeconds	
	else		
		String = String .. TotalSeconds	
	end
    systemtime = String
end














------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Comfort function to setup AIs comfortable		Version 1.00						by Tenji
------------------------------------------------------------------------------------------------------------------------------------------------------------
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
		
			if neutral then
				SetNeutral(ai.id, p);
			end
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


function GetDistance(_a, _b)
	if type(_a) ~= "table" then
		_a = GetPosition(_a); 
	end
	if type(_b) ~= "table" then
		_b = GetPosition(_b); 
	end
	return math.sqrt((_a.X - _b.X)^2+(_a.Y - _b.Y)^2)
end



---Tools aus EMS

MapTools = {};

function MapTools.WallsToPlayerZero(...)
    for _,id in ipairs(CppLogic.Entity.EntityIteratorTableize(CppLogic.Entity.Predicates.OfAnyEntityType(unpack(arg)))) do
        MapTools.ReplaceEntity(id, Logic.GetEntityType(id), 0)
    end
end


function MapTools.ReplaceEntity(_eId, _replaceType, _playerId)
	local pos, ori, name, newEntity, player;
	pos = GetPosition(_eId);
	ori = Logic.GetEntityOrientation(_eId);
	name = Logic.GetEntityName(_eId);
	playerId = Logic.EntityGetPlayer(_eId);
	DestroyEntity(_eId);
	newEntity = Logic.CreateEntity(_replaceType, pos.X, pos.Y, ori, _playerId or playerId);
	if name then
		SetEntityName(newEntity, name);
	end
end

----------------------------------------------Tribute Comfort---------------------------------------------------------------

function Tribute_Comforts()
 
	AddTribute = function( _tribute )
		assert( type( _tribute ) == "table", "Tribut muß ein Table sein" );
		assert( type( _tribute.text ) == "string", "Tribut.text muß ein String sein" );
		assert( type( _tribute.cost ) == "table", "Tribut.cost muß ein Table sein" );
		assert( type( _tribute.pId ) == "number", "Tribut.pId muß eine Nummer sein" );
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
 
		Logic.AddTribute( _tribute.pId, _tribute.Tribute, 0, 0, _tribute.text, unpack( tResCost ) );
		SetupTributePaid( _tribute );
		return _tribute.Tribute;
	end
 
	CreateATribute = function(_pId, _text, _cost, _callback)
		local tribute =  {};
		tribute.pId = _pId;
		tribute.text = _text;
		tribute.cost = _cost;
		tribute.Callback = _callback;
		return tribute
	end
 
	GameCallback_FulfillTribute = function()
		return 1
	end
 
 
end




---SVLIB-------------------------------by schmeling&mcb

-- User script -------------------------------------------------------------- 


SVLib = {}

--Test auf HistoryEdition oder GoldEdition
if XNetwork.Manager_IsNATReady then
	SVLib.HistoryFlag =  1
else
	SVLib.HistoryFlag =  0
end

--Setzt ein Entity unsichtbar/sichtbar
function SVLib.SetInvisibility(_id,_flag)
	if _flag then
		if SVLib.HistoryFlag == 1 then
			Logic.SetEntityScriptingValue(_id, -26, 513)
		elseif SVLib.HistoryFlag == 0 then
			Logic.SetEntityScriptingValue(_id, -30, 513)
		end
	else
		if SVLib.HistoryFlag == 1 then
			Logic.SetEntityScriptingValue(_id, -26, 65793)
		elseif SVLib.HistoryFlag == 0 then
			Logic.SetEntityScriptingValue(_id, -30, 65793)
		end
	end
end

--Gibt zurück ob eine Entity unsichtbar ist
--return true/false
function SVLib.GetInvisibility(_id)
	if SVLib.HistoryFlag == 1 then
		if Logic.GetEntityScriptingValue(_id,-26) == 513 then
			return true
		else
			return false
		end
	elseif SVLib.HistoryFlag == 0 then
		if Logic.GetEntityScriptingValue(_id,-30) == 513 then
			return true
		else
			return false
		end
	end
end

--Setzt die Höhe von Gebäuden in %
function SVLib.SetHightOfBuilding(_id,_float)
	Logic.SetEntityScriptingValue(_id,18,Float2Int(_float))
end

--Gibt die Höhe von Gebäuden zurück in %
--return float
function SVLib.GetHightOfBuilding(_id)
	return Int2Float(Logic.GetEntityScriptingValue(_id,18))
end

--Gibt den Leader eines Soldiers im Trupp zurück
function SVLib.GetLeaderOfSoldier(_SoldierID)
	if SVLib.HistoryFlag == 1 then
		return Logic.GetEntityScriptingValue(_SoldierID, 66)
	elseif SVLib.HistoryFlag == 0 then
		return Logic.GetEntityScriptingValue(_SoldierID, 69)
	end
end

--Setzt die Leben einer Entity. Mehr als maximale HP möglich.
--Funktioniert durch Unverwundbarkeit durch
function SVLib.SetHPOfEntity(_id,_HPNumber)
	Logic.SetEntityScriptingValue(_id,-8,_HPNumber)
end

--Gibt die Leben einer Entity zurück
--return Ganzzahl
function SVLib.GetHPOfEntity(_id)
	return Logic.GetEntityScriptingValue(_id,-8)
end

--Setzt den Index in der Tasklist einer Entity
function SVLib.SetTaskSubIndexNumber(_id,_index)
	if SVLib.HistoryFlag == 1 then
		Logic.SetEntityScriptingValue(_id,-18,_index)
	elseif SVLib.HistoryFlag == 0 then
		Logic.SetEntityScriptingValue(_id,-21,_index)
	end
end

--Gibt den momentanen Index in der Tasklist einer Entity
--return Ganzzahl
function SVLib.GetTaskSubIndexNumber(_id)
	if SVLib.HistoryFlag == 1 then
		return Logic.GetEntityScriptingValue(_id,-18)
	elseif SVLib.HistoryFlag == 0 then
		return Logic.GetEntityScriptingValue(_id,-21)
	end
end

--Setzt die Größe einer Entity in % realtiv zur Normalgröße; Nur das Model, nicht da Blocking
function SVLib.SetEntitySize(_id,_float)
	if SVLib.HistoryFlag == 1 then
		Logic.SetEntityScriptingValue(_id,-29,Float2Int(_float))
	elseif SVLib.HistoryFlag == 0 then
		Logic.SetEntityScriptingValue(_id,-33,Float2Int(_float))
	end
end

--Gibt die Größe einer Entity in % relativ zur Normalgröße zurück
--return float
function SVLib.GetEntitySize(_id)
	if SVLib.HistoryFlag == 1 then
		return Int2Float(Logic.GetEntityScriptingValue(_id,-29))
	elseif SVLib.HistoryFlag == 0 then
		return Int2Float(Logic.GetEntityScriptingValue(_id,-33))
	end
end

--Setzt die Resource, die beim Abbauen erhalten wird (ResourceType = ResourceType.<Resourcenname>)
--Ja, man kann damit z.B. Taler oder Wetterenergie oder Glauben haken.
function SVLib.SetResourceType(_id,_ResourceType)
	Logic.SetEntityScriptingValue(_id,8,_ResourceType)
end

--Gibt den ResourcenTyp der Resource zurück
--return Ganzzahl
function SVLib.GetResourceType(_id)
	return Logic.GetEntityScriptingValue(_id,8)
end

--Setzt die Prozentanzahl welche in der Mitte der Gebäude-Entity sichtbar ist (Forschung, Ausbau, etc)
--float 0 <= _float <= 1
function SVLib.SetPercentageInBuilding(_id,_float)
	Logic.SetEntityScriptingValue(_id,20,Float2Int(_float))
end


--Gibt die Prozentanzeige in der Mitte des Gebäudes bzw. des Balkens unten in der GUI zurück
--return 0 <= float <= 1
function SVLib.GetPercentageAtBuilding(_id)
	return Int2Float(Logic.GetEntityScriptingValue(_id,20))
end

--Setzt die SpielerID einer Entity. Ändert NICHT die EntityID. Farbe der Entity wird nicht verändert, nur Lebensbalkenfarbe
-- _playerID PlayerID 0 <= int <= 8/16(Kimis Server)
-- mcb: verwenden auf eigene gefahr: listen im player object werden nicht aktualisiert, kann zu unvorhergesehenem verhalten führen!
function SVLib.SetPlayerID(_id,_playerID)
	if SVLib.HistoryFlag == 1 then
		return Logic.SetEntityScriptingValue(_id,-44,_playerID)
	else
		return Logic.SetEntityScriptingValue(_id,-52,_playerID)
	end
end

--Gibt den Spieler einer Entity zurück
--return PlayerID 0 <= int <= 8/16(Kimis Server)
function SVLib.GetPlayerID(_id)
	if SVLib.HistoryFlag == 1 then
		return Logic.GetEntityScriptingValue(_id,-44)
	else
		return Logic.GetEntityScriptingValue(_id,-52)
	end
end


--Utility Funktionen

---@diagnostic disable-next-line: lowercase-global
function qmod(a, b)
	return a - math.floor(a/b)*b
end

function Int2Float(num)
	if(num == 0) then
		return 0
	end

	local sign = 1

	if(num < 0) then
		num = 2147483648 + num
		sign = -1
	end

	local frac = qmod(num, 8388608)
	local headPart = (num-frac)/8388608
	local expNoSign = qmod(headPart, 256)
	local exp = expNoSign-127
	local fraction = 1
	local fp = 0.5
	local check = 4194304
	for i = 23, 0, -1 do
		if(frac - check) > 0 then
			fraction = fraction + fp
			frac = frac - check
		end
		check = check / 2
		fp = fp / 2
	end
	return fraction * math.pow(2, exp) * sign
end

---@diagnostic disable-next-line: lowercase-global
function bitsInt(num)
	local t={}
	while num>0 do
		local rest=qmod(num, 2)
		table.insert(t,1,rest)
		num=(num-rest)/2
	end
	table.remove(t, 1)
	return t
end

---@diagnostic disable-next-line: lowercase-global
function bitsFrac(num, t)
	for i = 1, 48 do
		num = num * 2
		if(num >= 1) then
			table.insert(t, 1)
			num = num - 1
		else
			table.insert(t, 0)
		end
		if(num == 0) then
			return t
		end
	end
	return t
end

function Float2Int(fval)
	if(fval == 0) then
		return 0
	end

	local signed = false
	if(fval < 0) then
		signed = true
		fval = fval * -1
	end
	local outval = 0;
	local bits
	local exp = 0
	if fval >= 1 then
		local intPart = math.floor(fval)
		local fracPart = fval - intPart
		bits = bitsInt(intPart)
		exp = table.getn(bits)
		bitsFrac(fracPart, bits)
	else
		bits = {}
		bitsFrac(fval, bits)
		while(bits[1] == 0) do
			exp = exp - 1
			table.remove(bits, 1)
		end
		exp = exp - 1
		table.remove(bits, 1)
	end

	local bitVal = 4194304
	local start = 1

	for bpos = start, 23 do
		local bit = bits[bpos]
		if(not bit) then
			break;
		end

		if(bit == 1) then
			outval = outval + bitVal
		end
		bitVal = bitVal / 2
	end

	outval = outval + (exp+127)*8388608

	if(signed) then
		outval = outval - 2147483648
	end

	return outval;
end






------------------------------------------------Countdown Comfort------------------------------------------------------------
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



function SetMapResource(_resourceTable)
    for i = 1,table.getn(_resourceTable) do
        for eId in CppLogic.Entity.EntityIterator(CppLogic.Entity.Predicates.OfType(_resourceTable[i][1])) do
            Logic.SetResourceDoodadGoodAmount(eId, _resourceTable[i][2]);
        end
    end
end



------------------------------------------Schmelings Stuff-----------------------------------------------------------------------



--------------------------------------WoodPiles--------------------------------------------------

function CreateWoodPile( _posEntity, _resources )
    assert( type( _posEntity ) == "string" )
    assert( type( _resources ) == "number" )
    gvWoodPiles = gvWoodPiles or {
        JobID = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"ControlWoodPiles",0,nil,nil),
    }
    local pos = GetPosition( _posEntity )
    local pile_id = Logic.CreateEntity( Entities.XD_Rock3, pos.X, pos.Y, 0, 0 )

    SetEntityName( pile_id, _posEntity.."_WoodPile" )

    local newE = ReplaceEntity( _posEntity, Entities.XD_ResourceTree )
    Logic.SetModelAndAnimSet(newE, Models.XD_SignalFire1)
    Logic.SetResourceDoodadGoodAmount( GetEntityId( _posEntity ), _resources*10 )
    Logic.SetModelAndAnimSet(pile_id, Models.Effects_XF_ChopTree)
    table.insert( gvWoodPiles, { ResourceEntity = _posEntity, PileEntity = _posEntity.."_WoodPile", ResourceLimit = _resources*9 } )
end

function ControlWoodPiles()
    for i = table.getn( gvWoodPiles ),1,-1 do
        if Logic.GetResourceDoodadGoodAmount( GetEntityId( gvWoodPiles[i].ResourceEntity ) ) <= gvWoodPiles[i].ResourceLimit then
            DestroyWoodPile( gvWoodPiles[i], i )
        end
    end
end

function DestroyWoodPile( _piletable, _index )
    local pos = GetPosition( _piletable.ResourceEntity )
    DestroyEntity( _piletable.ResourceEntity )
    DestroyEntity( _piletable.PileEntity )
    Logic.CreateEffect( GGL_Effects.FXCrushBuilding, pos.X, pos.Y, 0 )
    table.remove( gvWoodPiles, _index )
end

--------------------------------------------------------------------------------------------------------------------------------------

--##################################################################--
--################ Cannon / Serf Heal by P4F #######################--
--##################################################################--

function ComfortsStartHeal()
	SerfTablePlayer1={}
	CannonTablePlayer1={}
	Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED,"","EV_ON_ENTITY_CREATED",1)
	StartSimpleJob("SJ_Refresh_Hp_Of_Serfs_And_Cannons_Player1")
	--
end

-- Player 1
function SJ_Refresh_Hp_Of_Serfs_And_Cannons_Player1()
	for i = table.getn(SerfTablePlayer1), 1, -1 do
		if IsAlive(SerfTablePlayer1[i]) then
			if GetHealth(SerfTablePlayer1[i]) < 100 then
				SetHealth(SerfTablePlayer1[i], GetHealth(SerfTablePlayer1[i]) + 1 )
			end
		else
			table.remove(SerfTablePlayer1, i)
		end
	end

	for i = table.getn(CannonTablePlayer1), 1, -1 do
		if IsAlive(CannonTablePlayer1[i]) then
			if GetHealth(CannonTablePlayer1[i]) < 100 then
				SetHealth(CannonTablePlayer1[i], GetHealth(CannonTablePlayer1[i]) + 1 )
			end
		else
			table.remove(CannonTablePlayer1, i)
		end
	end
end


function EV_ON_ENTITY_CREATED()
	local ent_ID = Event.GetEntityID()
	local ent_typ = Logic.GetEntityTypeName(Logic.GetEntityType(ent_ID))
	local ent_P = GetPlayer(ent_ID)
		
	if ent_P == 1 then
		if ent_typ == "PU_Serf" then
		table.insert(SerfTablePlayer1,ent_ID)
		elseif ent_typ == "PV_Cannon1" or ent_typ == "PV_Cannon2" or ent_typ == "PV_Cannon3" or ent_typ == "PV_Cannon4" then
		table.insert(CannonTablePlayer1,ent_ID)
		end
	end
end

--##################################################################--
--##################################################################--

function GetHealth( _entity )
    local entityID = GetEntityId( _entity )
    if not Tools.IsEntityAlive( entityID ) then
        return 0
    end
    local MaxHealth = Logic.GetEntityMaxHealth( entityID )
    local Health = Logic.GetEntityHealth( entityID )
    return ( Health / MaxHealth ) * 100
end

--##################################################################--
--##################################################################--




--Ghouls Handel-Balancer

function TransactionDetails()

    local eID = Event.GetEntityID()    
    local TSellTyp = Event.GetSellResource()     
    local TTyp = Event.GetBuyResource()     
    local PID = Logic.EntityGetPlayer(eID)    

    if Logic.GetCurrentPrice(PID,TSellTyp) > 1.3 then    
        Logic.SetCurrentPrice(PID, TSellTyp, 1.3 )        
    end
    
    if Logic.GetCurrentPrice(PID,TSellTyp) < 0.8 then    
        Logic.SetCurrentPrice(PID, TSellTyp, 0.8 )        
    end
    
    if Logic.GetCurrentPrice(PID,TTyp) > 1.3 then    
        Logic.SetCurrentPrice(PID, TTyp, 1.3 )        
    end
    
    if Logic.GetCurrentPrice(PID,TTyp) < 0.8 then    
        Logic.SetCurrentPrice(PID, TTyp, 0.8 )    
    end
    
end
