
-- #############################################################################
-- #                                                                           #
-- #                                                                           #
-- #     Mapname:  Hier könnte ihre Werbung stehen                             #
-- #                                                                           #
-- #     Author:   Novator12                                                   #
-- #                                                                           #
-- #     Script:   Enhanced Multiplayer Script by myself                       #
-- #                                                                           #
-- #                                                                           #
-- #############################################################################



gvBasePath = "maps\\user\\"..Framework.GetCurrentMapName().."\\";
CMod.DetourFile("maps\\user\\EMS\\ems.xml", gvBasePath.."ErbeGUI.xml");


-- ************************************************************************************************
-- *                                                                                              *
-- *                                                                                              *
-- *                                              EMS                                             *
-- *                                         CONFIGURATION                                        *
-- *                                                                                              *
-- *                                                                                              *
-- ************************************************************************************************


Erbe = {}
Erbe.Trigger = {}
Erbe.Tables = {}
Erbe.Tables.Serfs = {}
Erbe.Tables.PlayerInfos = {}
Erbe.Tables.PlayerInfos.Colors = {}
Erbe.Tables.PlayerInfos.Names = {}

EMS_CustomMapConfig =
{
	-- ********************************************************************************************
	-- * Configuration File Version
	-- * A version check will make sure every player has the same version of the configuration file
	-- ********************************************************************************************
	Version = 1.3,
 
	-- ********************************************************************************************
	-- * Debug Mode
	-- * Activates the ems debug mode if set to true.
	-- * This will enable key bindings to achieve some common debug tasks.
	-- * Ingame a button with the text "Debug" will be shown to give further information.
	-- * (Default: false)
	-- ********************************************************************************************
	ActivateDebug = false,
 
	-- ********************************************************************************************
	-- * Custom debug functions
	-- * If ActivateDebug is set to true, these two debug methods can be called by pressing N or M
	-- * _fromPlayer - the id of the player that pressed the key
	-- * _targetPlayerId1 - a player id between 1-8 (or 16 on cnetwork), that the caller wants to target
	-- * _targetPlayerId2 - a second player id
	-- * _x, _y - the position of the callers mouse at the time of pressing the key
	-- * Example content:
	-- * SetFriendly(_targetPlayerId1, _targetPlayerId2); -- make friends between p1 and p2
	-- * Logic.CreateEntity(Entities.PU_Serf, _x, _y, 0, _fromPlayer); -- create Serf for caller
	-- ********************************************************************************************
	CustomDebugFunc1 = function(_fromPlayer, _targetPlayerId1, _targetPlayerId2, _x, _y)
		Logic.CreateEntity(Entities.PU_LeaderSword1, _x, _y, 0, _fromPlayer);
		Logic.CreateEntity(Entities.PU_LeaderSword1, _x, _y, 0, _fromPlayer+1);
	end,
	CustomDebugFunc2 = function(_fromPlayer, _target1, _target2, _x, _y)
		ResearchTechnology(Technologies.T_SuperTechnology,1)
		ResearchTechnology(Technologies.T_SuperTechnology,2)
	end,
 
	-- ********************************************************************************************
	-- * Callback_OnMapStart
	-- * Called directly after the loading screen vanishes and works as your entry point.
	-- * Similar use to FirstMapAction/GameCallback_OnGameSart
	-- ********************************************************************************************
	Callback_OnMapStart = function()
		-- Der Pfad für die fertige Version
		--gvBasePath = "maps\\externalmap\\"; für s5x
		gvBasePath = "maps\\user\\"..Framework.GetCurrentMapName().."\\";
		Script.Load(gvBasePath.. "\\cerberus\\loader.lua");
		Script.Load(gvBasePath.. "ghoulsai.lua");
		Script.Load(gvBasePath.. "AIArmys.lua");
		Script.Load(gvBasePath.. "kimichurasdefarmy.lua");
		Script.Load(gvBasePath.. "spawnarmy.lua");
		Script.Load(gvBasePath.. "filter.lua");
		Script.Load(gvBasePath.. "army_id8_banditen.lua");
		Script.Load(gvBasePath.. "army_id5_irondef.lua");
		Script.Load(gvBasePath.. "army_id5_Norfolk.lua");
		Script.Load(gvBasePath.. "army_id3_Barmecia.lua");
		Script.Load(gvBasePath.. "army_BanditDarioFight.lua");
		Script.Load(gvBasePath.. "army_BarbarenFolklungFight.lua");
		Script.Load(gvBasePath.. "army_VargBarmecia.lua");
		Script.Load(gvBasePath.. "army_finalBarmecia.lua");
		Script.Load(gvBasePath.. "army_finalDario.lua");
		Script.Load(gvBasePath.. "army_finalFolklung.lua");
		Script.Load(gvBasePath.. "army_finalSecret.lua");
		Script.Load(gvBasePath.. "army_nv.lua");
		Script.Load(gvBasePath.. "daily_cycle.lua");
		Script.Load(gvBasePath.. "daily_cycle_rain.lua");
		Script.Load(gvBasePath.. "daily_cycle_snow.lua");
		Script.Load(gvBasePath.. "MainMapScript.lua");
		Script.Load(gvBasePath.. "ErbeTrigger.lua");
		Script.Load(gvBasePath.. "briefings.lua");
		Script.Load(gvBasePath.. "Debug.lua");
		Script.Load(gvBasePath.. "questline.lua");
		Script.Load(gvBasePath.. "Lighthouse.lua");
		Script.Load(gvBasePath.. "Merchant.lua");

		
		assert(Lib ~= nil);
		Lib.Require("module/cinematic/BriefingSystem");
		Lib.Require("module/entity/SVLib");
		Lib.Require("module/io/NonPlayerCharacter");
		Lib.Require("module/io/NonPlayerMerchant");
		Lib.Require("module/mp/Syncer");
		Lib.Require("module/entity/Treasure");

		SetupHighlandWeatherGfxSet();


		
		for i=1,11 do
			XGUIEng.ShowWidget("EMSPUGFrame"..i,0)
		end
		XGUIEng.ShowWidget("EMSPUMisc",0)
		XGUIEng.ShowWidget("EMSPUAll",0)
		XGUIEng.ShowWidget("EMSPHChoice",0)
		XGUIEng.ShowWidget("EMSPUHeroes",0)
		XGUIEng.ShowWidget("EMSPURandomizeRules",0)
		--Sommertage

		for i=1,3,1 do
		AddPeriodicSummer(4*60);
		AddPeriodicTransitionSunrise(60);
		AddPeriodicSunrise(60)
		AddPeriodicNight(4*60);
		AddPeriodicSunrise(60)
		AddPeriodicTransitionSunrise(60);
		end

		--Wintertage

		-- for i=1,2,1 do
		-- AddPeriodicWinter(4*60);
		-- AddPeriodicTransitionSunriseSnow(60);
		-- AddPeriodicSunriseSnow(60)
		-- AddPeriodicNightSnow(4*60);
		-- AddPeriodicSunriseSnow(60)
		-- AddPeriodicTransitionSunriseSnow(60);
		-- end

		--Regentage
		AddPeriodicRain(4*60);
		AddPeriodicTransitionSunriseRain(60);
		AddPeriodicSunriseRain(60)
		AddPeriodicNightRain(4*60);
		AddPeriodicSunriseRain(60)
		AddPeriodicTransitionSunriseRain(60);

		LocalMusic.UseSet = HIGHLANDMUSIC;


		
		Score.Player[0] = {buildings=0, all=0}
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

		Logic.SetPlayerRawName(16, "???")
		Logic.SetPlayerRawName(3, "Barmecia")
		Logic.SetPlayerRawName(4, "Folklung")
		Logic.SetPlayerRawName(5, "Varg")
		Logic.SetPlayerRawName(6, "Landvolk")
		Logic.SetPlayerRawName(7, "Old Kings Castle")
		Logic.SetPlayerRawName(8, "Räuber")

		Logic.SetPlayerName(16, "???")
		Logic.SetPlayerName(3, "Barmecia")
		Logic.SetPlayerName(4, "Folklung")
		Logic.SetPlayerName(5, "Varg")
		Logic.SetPlayerName(6, "Landvolk")
		Logic.SetPlayerName(7, "Old Kings Castle")
		Logic.SetPlayerName(8, "Räuber")

--------- Kimichuras Farben-KI-Verwalter--------------------------------
		local colors = {2,9,14,4,5,6,7,8,1,10,11,12,13,3,15,16}
		local players = GetActivePlayers();
		for i = 1,table.getn(players) do
		---@diagnostic disable-next-line: redundant-parameter
			local col = XNetwork.GameInformation_GetLogicPlayerColor(players[i]);
			for j = table.getn(colors), 1, -1 do
				if colors[j] == col then
					table.remove(colors, j);
				end;
			end;
		end;
		
		if table.getn(players) == 1 then
			Display.SetPlayerColorMapping(2, colors[1])
		end

		--Barmecia
		Display.SetPlayerColorMapping(3, colors[14])
		Display.SetPlayerColorMapping(9, colors[14])
		--Folklung
		Display.SetPlayerColorMapping(4, colors[2])
		Display.SetPlayerColorMapping(10, colors[2])
		Display.SetPlayerColorMapping(14, colors[2])
		--Varg
		Display.SetPlayerColorMapping(5, colors[11])
		Display.SetPlayerColorMapping(11, colors[11])
		Display.SetPlayerColorMapping(15, colors[11])
		--NPC
		Display.SetPlayerColorMapping(6, colors[5])

		--Dario
		Display.SetPlayerColorMapping(7, colors[9])
		Display.SetPlayerColorMapping(12, colors[9])
		--Banditen
		Display.SetPlayerColorMapping(8, colors[3])
		Display.SetPlayerColorMapping(13, colors[3])
		--Kala
		Display.SetPlayerColorMapping(16, 2)

		--Alle ID Namen und Farben:
		for i = 1,8,1 do
			local PlayerColor = "@color:"..table.concat({GUI.GetPlayerColor(i)}, ",");
			table.insert(Erbe.Tables.PlayerInfos.Colors,PlayerColor)
		end

		Erbe.Tables.PlayerInfos.Names = {
			[3] = "Barmecia",
			[4] = "Folklung",
			[5] = "Varg",
			[6] = "Landvolk",
			[7] = "Old Kings Castle",
			[8] = "Räuber",
			[16] = "Kala",
		   }
	   
	   for j = 1,2,1 do
		   local PlayerName = UserTool_GetPlayerName(j);
		   table.insert(Erbe.Tables.PlayerInfos.Names,j,PlayerName)
	   end
------------------------------------------------------------------


	
		local resourceTable = {
			{Entities.XD_StonePit1, 100000},
			{Entities.XD_IronPit1, 100000},
			{Entities.XD_ClayPit1, 100000},
			{Entities.XD_SulfurPit1, 100000},
			{Entities.XD_Stone1, 1500},
			{Entities.XD_Iron1, 1500},
			{Entities.XD_Clay1, 1500},
			{Entities.XD_Sulfur1, 1500}
		}
		MapTools.SetMapResource(resourceTable);
		


		---@diagnostic disable-next-line: duplicate-set-field
		function LocalMusic.CallbackSettlerKilled(_HurterPlayerID, _HurtPlayerID)

			local PlayerID = GUI.GetPlayerID()

			if _HurterPlayerID ~= _HurtPlayerID
				and PlayerID == _HurtPlayerID then
				if LocalMusic.LastBattleMusicStarted < Logic.GetTime() then
					if Logic.IsEntityInCategory(_HurterPlayerID, EntityCategories.EvilLeader) == 1 then
						LocalMusic.BattlesOnTheMap = 2
					else
						LocalMusic.BattlesOnTheMap = 1
					end
					LocalMusic.LastBattleMusicStarted = Logic.GetTime() + 127
					LocalMusic.SongLength = 0
				end
			end
		end





	end,
 
 
	-- ********************************************************************************************
	-- * Callback_OnGameStart
	-- * Called at the end of the 10 seconds delay, after the host chose the rules and started
	-- ********************************************************************************************
	Callback_OnGameStart = function()
        OnGameStart()
	end,
 
	-- ********************************************************************************************
	-- * Callback_OnPeacetimeEnded
	-- * Called when the peacetime counter reaches zero
	-- ********************************************************************************************
	Callback_OnPeacetimeEnded = function()
		OnPeacetimeOver()
	end,
 
 
	-- ********************************************************************************************
	-- * Peacetime
	-- * Number of minutes the players will be unable to attack each other
	-- ********************************************************************************************
	Peacetime = nil,
 
	-- ********************************************************************************************
	-- * GameMode
	-- * GameMode is a concept of a switchable option, that the scripter can freely use
	-- *
	-- * GameModes is a table that contains the available options for the players, for example:
	-- * GameModes = {"3vs3", "2vs2", "1vs1"},
	-- *
	-- * GameMode contains the index of selected mode by default - ranging from 1 to X
	-- *
	-- * Callback_GameModeSelected
	-- * Lets the scripter make changes, according to the selected game mode.
	-- * You could give different ressources or change the map environment accordingly
	-- * _gamemode contains the index of the selected option according to the GameModes table
	-- ********************************************************************************************
	GameMode = 2,
	GameModes = {"Leicht","Mittel","Schwer"},
	Callback_GameModeSelected = function(_gamemode)	

	end,
 
	-- ********************************************************************************************
	-- * Resource Level
	-- * Determines how much ressources the players start with
	-- * 1 = Normal
	-- * 2 = FastGame
	-- * 3 = SpeedGame
	-- * See the ressources table below for configuration
	-- ********************************************************************************************
	ResourceLevel = 1,
 
	-- ********************************************************************************************
	-- * Resources
	-- * Order:
	-- * Gold, Clay, Wood, Stone, Iron, Sulfur
	-- * Rules:
	-- * 1. If no player is defined, default values are used
	-- * 2. If player 1 is defined, these ressources will be used for all other players too
	-- * 3. Use the players index to give ressources explicitly
	-- ********************************************************************************************
	Ressources =
	{
		-- * Normal default: 1k, 1.8k, 1.5k, 0.8k, 50, 50
		Normal = {
			[1] = {
				0,
				0,
				0,
				0,
				0,
				0,
			},
		},
		-- * FastGame default: 2 x Normal Ressources
		FastGame = {},
 
		-- * SpeedGame default: 20k, 12k, 14k, 10k, 7.5k, 7.5k
		SpeedGame = {},
	},
 
	-- ********************************************************************************************
	-- * Callback_OnFastGame
	-- * Called together with Callback_OnGameStart if the player selected ResourceLevel 2 or 3
	-- * (FastGame or SpeedGame)
	-- ********************************************************************************************
	Callback_OnFastGame = function()
	end,
 
	-- ********************************************************************************************
	-- * AI Players
	-- * Player Entities that belong to an ID that is also present in the AIPlayers table won't be
	-- * removed
	-- ********************************************************************************************
	AIPlayers = {3,4,5,7,8},
 
	-- ********************************************************************************************
	-- * DisableInitCameraOnHeadquarter
	-- * Set to true if you don't want the camera to be set to the headquarter automatically
	-- * (default: false)
	-- ********************************************************************************************
	DisableInitCameraOnHeadquarter = false,
 
	-- ********************************************************************************************
	-- * DisableSetZoomFactor
	-- * If set to false, ZoomFactor will be set to 2 automatically
	-- * Set to true if nothing should be done
	-- * (default: false)
	-- ********************************************************************************************
	DisableSetZoomFactor = false,
 
	-- ********************************************************************************************
	-- * DisableStandardVictoryCondition
	-- * Set to true if you want to implement your own victory condition
	-- * Otherwise the player will lose upon losing his headquarter
	-- * (default: false)
	-- ********************************************************************************************
	DisableStandardVictoryCondition = true,
 
	-- ********************************************************************************************
	-- * Units
	-- * Various units can be allowed or forbidden
	-- * A 0 means the unit is forbidden - a higher number represents the maximum allowed level
	-- * Example: 
	-- * Sword = 0, equals Swords are forbidden
	-- * Sword = 2, equals the maximum level for swords is 2 = Upgrading once
	-- ********************************************************************************************
	Sword   = 4,
	Bow     = 4,
	PoleArm = 4,
	HeavyCavalry = 2,
	LightCavalry = 2,
	Rifle = 2,
	Thief = 0,
	Scout = 1,
	Cannon1 = 1,
	Cannon2 = 1,
	Cannon3 = 1,
	Cannon4 = 1,
 
	-- * Buildings
	Bridge = 0,
 
	-- * Markets
	-- * -1 = Building markets is forbidden
	-- * 0 = Building markets is allowed
	-- * >0 = Markets are allowed and limited to the number given
	Markets = -1,
 
	-- * Trade Limit
	-- * 0 = no trade limit
	-- * greater zero = maximum amount that you can buy in one single trade 
	TradeLimit = 0,
 
	-- * TowerLevel
	-- * 0 = Towers forbidden
	-- * 1 = Watchtowers
	-- * 2 = Balistatowers
	-- * 3 = Cannontowers
	TowerLevel = 2, -- 0-3
 
	-- * TowerLimit
	-- * 0  = no tower limit
	-- * >0 = towers are limited to the number given
	TowerLimit = 8,
 
	-- * WeatherChangeLockTimer
	-- * Minutes for how long the weather can't be changed directly again after a weatherchange happened
	WeatherChangeLockTimer =  3,
 
	-- * Enables chaning to a specific weather with the weather tower
	MakeSummer = 1,
	MakeRain   = 1,
	MakeSnow   = 1,
 
	-- * Fixes the DestrBuild bug
	AntiBug    = 1,
 
	-- * HQRush
	-- * If set to 1, Headquarters are invulernerable as long the player still has village centers
	AntiHQRush = 0,
 
	-- * If set to 1, Players can't abuse blessing and overtime in combination for unlimited work
	BlessLimit = 1,
 
	-- * if set to true, Players are not able to lose their Headquarter.
	InvulnerableHQs = false,
 
	-- * Heroes
	-- * NumberOfHeroesForAll sets the number of heroes every player can pick
	-- * 1 behind each hero defines if the hero is allowed; 0 for forbidden
	NumberOfHeroesForAll = 0,
	Dario    = 0,
	Pilgrim  = 0,
	Ari      = 0,
	Erec     = 0,
	Salim    = 0,
	Helias   = 0,
	Drake    = 0,
	Yuki     = 0,
	Kerberos = 0,
	Varg     = 0,
	Mary_de_Mortfichet = 0,
	Kala     = 0,
};



-- ###################################################################################################
-- #                                                                                                 #
-- #                                                                                                 #
-- #     Script:   Enhanced Multiplayer Script by MadShadow                                          #
-- #                                                                                                 #
-- #                                                                                                 #
-- ###################################################################################################


initEMS = function()return false end;
Script.Load("maps\\user\\EMS\\load.lua");

if not initEMS() then
		local errMsgs = 
		{
			["de"] = "Achtung: Enhanced Multiplayer Script wurde nicht gefunden! @cr \195\156berpr\195\188fe ob alle Dateien am richtigen Ort sind!",
			["eng"] = "Attention: Enhanced Multiplayer Script could not be found! @cr Make sure you placed all the files in correct place!",
		}
		local lang = "de";
		if XNetworkUbiCom then
			---@diagnostic disable-next-line: cast-local-type
			lang = XNetworkUbiCom.Tool_GetCurrentLanguageShortName();
			if lang ~= "eng" and lang ~= "de" then
				lang = "eng";
			end
		end
		GUI.AddStaticNote("@color:255,0,0 ------------------------------------------------------------------------------------------------------------");
		GUI.AddStaticNote("@color:255,0,0 " .. errMsgs[lang]);
		GUI.AddStaticNote("@color:255,0,0 ------------------------------------------------------------------------------------------------------------");
		return;
end 


