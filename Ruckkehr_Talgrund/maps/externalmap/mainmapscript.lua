-- ########################################################################## --
-- #  Internal main mapscript                                               # --
-- #  --------------------------------------------------------------------  # --
-- #    Author:   totalwarANGEL                                             # --
-- ########################################################################## --

gvWeatherGenerator = {
    ["SetupNormalWeatherGfxSet"]    = {RainProp = 55, SnowProp = 60},
    ["SetupHighlandWeatherGfxSet"]  = {RainProp = 70, SnowProp = 70},
    ["SetupMediteranWeatherGfxSet"] = {RainProp = 30, SnowProp = 10},
    ["SetupEvelanceWeatherGfxSet"]  = {RainProp = 30, SnowProp = 10},
    ["SetupSteppeWeatherGfxSet"]    = {RainProp = 15, SnowProp = 0},
    ["SetupMoorWeatherGfxSet"]      = {RainProp = 85, SnowProp = 0},

    MaxDuration  = 180,
    MinDuration  = 60,
    StatesAmount = 30,
    LastState    = 1;
};

gvPlayerColorMapping = {
    ["DEFAULT_COLOR"] = -1,
    ["PLAYER_COLOR"] = 1,
    ["NEPHILIM_COLOR"] = 2,
    ["FRIENDLY_COLOR1"] = 3,
    ["FRIENDLY_COLOR2"] = 4,
    ["ENEMY_COLOR2"] = 5,
    ["MERCENARY_COLOR"] = 6,
    ["ENEMY_COLOR3"] = 7,
    ["FARMER_COLOR"] = 8,
    ["EVIL_GOVERNOR_COLOR"] = 9,
    ["TRADER_COLOR"] = 10,
    ["NPC_COLOR"] = 11,
    ["KERBEROS_COLOR"] = 12,
    ["ENEMY_COLOR1"] = 13,
    ["ROBBERS_COLOR"] = 14,
    ["SAINT_COLOR"] = 15,
    ["FRIENDLY_COLOR3"] = 16,
};

Global_MapConfigurationData = {
    MapName = "Rückkehr nach Talgrund",
    MapDescription = "Nach einer langen Reise durch das Reich des alten Kerons und vielen Strapazen die unsere Helden erleiden mussten, kehren Dario und Ari zurück nach Thalgrund. Doch was sie dort erwartet ist nichts Gutes....",
    WeatherSet = "SetupMediterraneanWeatherGfxSet",
    RandomizeWeather = false,
    Resources = {500,750,750,500,250,250,},
    Debug = {true,false,false,false,},
    Players = {
        {Name = "Dario", Color = "EVIL_GOVERNOR_COLOR", Diplomacy = {{1, 1},{2, 3},{3, 1},{4, 1},{5, 2},{6, 1},{7, 1},{8, 1},}},
        {Name = "Räuber", Color = "NEPHILIM_COLOR", Diplomacy = {{1, 3},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "", Color = "DEFAULT_COLOR", Diplomacy = {{1, 1},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "", Color = "DEFAULT_COLOR", Diplomacy = {{1, 1},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "Darios Anhänger", Color = "FARMER_COLOR", Diplomacy = {{1, 2},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "", Color = "DEFAULT_COLOR", Diplomacy = {{1, 1},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "", Color = "DEFAULT_COLOR", Diplomacy = {{1, 1},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
        {Name = "", Color = "DEFAULT_COLOR", Diplomacy = {{1, 1},{2, 1},{3, 1},{4, 1},{5, 1},{6, 1},{7, 1},{8, 1},}},
    },
};

--
-- Sets names and diplomatic relations of the players.
--
function InitDiplomacy()
    for k, v in pairs(Global_MapConfigurationData.Players) do
        for i= 1, table.getn(v.Diplomacy), 1 do
            if v.Diplomacy[i][1] ~= k then
                local DiplomacyStateName = "Neutral";
                if (v.Diplomacy[i][2] == 2) then
                    DiplomacyStateName = "Friendly";
                elseif (v.Diplomacy[i][2] == 3) then
                    DiplomacyStateName = "Hostile";
                end
                _G["Set" ..DiplomacyStateName](k, v.Diplomacy[i][1]);
            end
        end
        if v.Name ~= "" then
            SetPlayerName(k, v.Name);
        end
    end
end

--
-- Adds the starting resources to the human player.
--
function InitResources()
    Tools.GiveResouces(gvMission.PlayerID, unpack(Global_MapConfigurationData.Resources));
end

--
-- Sets technology states. Currently unused.
--
function InitTechnologies()
end

--
-- Starts the weather set.
--
function InitWeatherGfxSets()
	_G[Global_MapConfigurationData.WeatherSet]();
end

--
-- Sets the player colors.
--
function InitPlayerColorMapping()
    for k, v in pairs(Global_MapConfigurationData.Players) do
        if gvPlayerColorMapping[v.Color] and gvPlayerColorMapping[v.Color] ~= -1 then
            Display.SetPlayerColorMapping(k, gvPlayerColorMapping[v.Color]);
        end
    end
end

--
-- Creates random weather for the selected weather set. Do not expect much!
-- This is a very basic randomizer.
--
function GenerateWeather()
    if Global_MapConfigurationData.RandomizeWeather then
        local WeatherData = gvWeatherGenerator[Global_MapConfigurationData.WeatherSet];
        for i= 1, gvWeatherGenerator.StatesAmount, 1 do
            local Length = math.random(gvWeatherGenerator.MinDuration, gvWeatherGenerator.MaxDuration);
            if i == 1 then
                gvWeatherGenerator.LastState = 1;
                AddPeriodicSummer(Length);
            else
                if WeatherData.RainProp > 0 and math.random(1, 100) <= WeatherData.RainProp then
                    if WeatherData.SnowProp > 0 and gvWeatherGenerator.LastState > 1 and math.random(1, 100) <= WeatherData.SnowProp then
                        gvWeatherGenerator.LastState = 3;
                        AddPeriodicWinter(Length);
                    else
                        gvWeatherGenerator.LastState = 2;
                        AddPeriodicRain(Length);
                    end
                else
                    gvWeatherGenerator.LastState = 1;
                    AddPeriodicSummer(Length);
                end
            end
        end
    end
end

--
-- Activates all processes that must be startet when the game is starting.
--
function FirstMapAction()
    Score.Player[0] = {};
	Score.Player[0]["buildings"] = 0;
    Score.Player[0]["all"] = 0;

    math.randomseed(XGUIEng.GetSystemTime());
    GenerateWeather();

    QuestSystemBehavior:PrepareQuestSystem();
    if Global_MapConfigurationData.Debug[1] or Global_MapConfigurationData.Debug[2] or Global_MapConfigurationData.Debug[3] or Global_MapConfigurationData.Debug[4] then
        QuestDebug:Activate(unpack(Global_MapConfigurationData.Debug));
    end
    CreateQuests();
    PreperationDone();
end

Global_QuestsToGenerate = {
    {Name = "000_Schwierigkeit", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Briefing","Schwierigkeitsauswahl",}, {"Trigger_Time",0,}, },
    {Name = "000a_LeichtSetup", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","Schwierigkeitsauswahl_CP_4",1,}, {"Reward_CustomVariable","difficulty","=",1,}, {"Reward_MapScriptFunction","VerbietenLeicht",}, {"Reward_Resource","Gold",7000,}, {"Reward_Resource","Clay",5000,}, {"Reward_Resource","Wood",5000,}, {"Reward_Resource","Stone",5000,}, {"Reward_Resource","Iron",7000,}, {"Reward_Resource","Sulfur",1000,}, {"Trigger_Briefing","000_Schwierigkeit","Any",}, },
    {Name = "000b_SchwerSetup", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","Schwierigkeitsauswahl_CP_4",2,}, {"Reward_CustomVariable","difficulty","=",0,}, {"Reward_MapScriptFunction","VerbietenSchwer",}, {"Trigger_Briefing","000_Schwierigkeit","Any",}, },
    {Name = "00_Defeat", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Destroy","burg",}, {"Reward_Defeat",}, {"Trigger_Time",0,}, },
    {Name = "01_Start-Setup", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Briefing","Prolog",}, {"Reward_MapScriptFunction","HQ_Life",}, {"Reward_SetPlayerColor",7,"PLAYER_COLOR",}, {"Trigger_Briefing","000_Schwierigkeit","Any",}, },
    {Name = "02_HeiratJa", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","Prolog_CP_6",1,}, {"Reward_AI_CreateAIPlayer",2,4,0,false,false,}, {"Reward_CreateGroup","Trupp3","PU_LeaderBow3",8,}, {"Reward_CreateGroup","Trupp4","PU_LeaderBow3",8,}, {"Reward_CreateGroup","Trupp1","PU_LeaderSword3",8,}, {"Reward_CreateGroup","Trupp2","PU_LeaderSword3",8,}, {"Reward_DestroyEntity","ari2",}, {"Reward_DestroyEntity","dario2",}, {"Reward_DestroyEntity","kirche2",}, {"Reward_DestroyEntity","a1",}, {"Reward_DestroyEntity","kirche",}, {"Trigger_BriefingSuccess","01_Start-Setup",}, },
    {Name = "03_HeiratNein", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","Prolog_CP_6",2,}, {"Reward_Defeat",}, {"Trigger_BriefingSuccess","01_Start-Setup",}, },
    {Name = "04_WacheSkelet", Time = 0, Receiver = 1, Title = "Eine wunderliches Sekelet", Text = "Herr, dort vorne liegt ein Skelet. Wir sollten es uns genauer ansehen.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_EntityDistance","dario","wache",200,"<",}, {"Reward_AI_CreateSpawnArmy","BanditCampArmy2",2,"t3",1,"bandit_spawn",4000,25,"CU_BanditLeaderSword1","CU_BanditLeaderBow1","CU_BanditLeaderBow1","CU_BanditLeaderBow1","PV_Cannon1","-",}, {"Reward_AI_CreateSpawnArmy","BanditCampArmy3",2,"t3",1,"bandit_spawn",4000,25,"CU_BanditLeaderSword1","CU_BanditLeaderBow1","PV_Cannon1","CU_BanditLeaderBow1","CU_BanditLeaderSword1","-",}, {"Reward_AI_CreateSpawnArmy","BanditCampArmy1",2,"kaserne",1,"bandit_spawnk2",4000,25,"CU_BanditLeaderSword1","CU_BanditLeaderBow1","CU_BanditLeaderBow1","CU_BanditLeaderBow1","PV_Cannon1","-",}, {"Reward_Briefing","Skelet",}, {"Reward_MapScriptFunction","ControleArmyBandit",}, {"Trigger_QuestSuccess","02_HeiratJa",0,}, },
    {Name = "05_HilfeLeonardo", Time = 0, Receiver = 1, Title = "Leonardos Lager", Text = "Im Osten von uns liegt Leonardos Lager. Wir sollten ihn besuchen und fragen, was es mit der brennenden Siedlung auf sich hat.{cr}{cr}Passt auf eure Truppen und Helden auf. Wenn sie sterben verliert ihr...{cr}{cr}{cr}Tipp: Der Banditenturm liefert Nachschub an Soldaten", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_MapScriptFunction","Goal_IsBanditCampDefeated",}, {"Reprisal_Defeat",}, {"Reward_DestroyEntity","gitterleo",}, {"Reward_MapScriptFunction","DestroyControleArmyBandit",}, {"Trigger_QuestSuccess","04_WacheSkelet",0,}, },
    {Name = "06_Leonardo", Time = 0, Receiver = 1, Title = "Leonardo", Text = "Sprecht mit Leonardo", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","leo","dario","Ich spreche nur mit Dario.",}, {"Reward_Briefing","Leonardo",}, {"Reward_CreateMarker","PulseNeutral","burg",}, {"Trigger_QuestSuccess","05_HilfeLeonardo",0,}, },
    {Name = "07_BrennendeBurg", Time = 0, Receiver = 1, Title = "Die brennende Burg", Text = "Ihr solltet rasch die brennende Burg aufsuchen...", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_EntityDistance","dario","burg",2000,"<",}, {"Reward_Briefing","garek",}, {"Reward_ChangePlayer","burg",1,}, {"Reward_ChangePlayer","sp1",1,}, {"Reward_ChangePlayer","sp2",1,}, {"Reward_ChangePlayer","sp3",1,}, {"Reward_ChangePlayer","sp4",1,}, {"Reward_CreateMarker","StaticFriendly","bau_lehm",}, {"Reward_CreateMarker","StaticFriendly","bau_stein",}, {"Reward_CreateMarker","StaticFriendly","bau_dz",}, {"Reward_CreateMarker","StaticFriendly","bau_dz2",}, {"Reward_CreateMarker","StaticFriendly","bau_hs",}, {"Reward_CreateMarker","StaticFriendly","bau_haus",}, {"Reward_CreateMarker","StaticFriendly","bau_bauernhof",}, {"Reward_CreateMarker","StaticFriendly","bau_sm",}, {"Reward_DestroyMarker","burg",}, {"Trigger_QuestSuccess","06_Leonardo",0,}, },
    {Name = "08_Wiederaufbau", Time = 0, Receiver = 1, Title = "Der Wiederaufbau", Text = "Garek hat uns eine Aufgabe gegeben die alte Siedlung wieder aufzubauen. Dafür muss folgendes an den richtigen Stellen gebaut werden:", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_WinQuest","09_DZ1 bauen",}, {"Goal_WinQuest","12_DZ2 bauen",}, {"Goal_WinQuest","13_Hochschule bauen",}, {"Goal_WinQuest","14_Haus bauen",}, {"Goal_WinQuest","15_Bauernhof bauen",}, {"Goal_WinQuest","16_Muehle bauen",}, {"Goal_WinQuest","11_Lehmmine bauen",}, {"Goal_WinQuest","10_Steinmine bauen",}, {"Reward_Briefing","bau_fertig",}, {"Trigger_QuestSuccess","07_BrennendeBurg",0,}, },
    {Name = "09_DZ1 bauen", Time = 0, Receiver = 1, Title = "Baue das erste Dorfzentrum", Text = "Das erste Dorfzentrum befindet sich vor deiner Burg.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_VillageCenter1","bau_dz",1000,1,true,1,}, {"Reward_DestroyMarker","bau_dz",}, {"Reward_Message","Das erste Dorfzentrum wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "10_Steinmine bauen", Time = 0, Receiver = 1, Title = "Baue eine Steinmine", Text = "Der Platz für die Steinmine ist hoffentlich selbsterklärend.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_StoneMine1","bau_stein",1000,1,true,1,}, {"Reward_DestroyMarker","bau_stein",}, {"Reward_Message","Die Steinmine wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "11_Lehmmine bauen", Time = 0, Receiver = 1, Title = "Baue eine Lehmmine", Text = "Der Platz für die Lehmmine ist hoffentlich selbsterklärend.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_ClayMine1","bau_lehm",1000,1,true,1,}, {"Reward_DestroyMarker","bau_lehm",}, {"Reward_Message","Die Lehmmine wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "12_DZ2 bauen", Time = 0, Receiver = 1, Title = "Baue das zweite Dorfzentrum", Text = "Das zweite Dorfzentrum befindet sich im Süd Westen des Waldes.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_VillageCenter1","bau_dz2",1000,1,true,1,}, {"Reward_DestroyMarker","bau_dz2",}, {"Reward_Message","Das zweite Dorfzentrum wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "13_Hochschule bauen", Time = 0, Receiver = 1, Title = "Baue eine Hochschule", Text = "Baue die Hochschule innerhalb der Umzäunung westlich deines Dorfes. Zerstört hierfür die Ruinen.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_University1","bau_hs",1500,1,true,1,}, {"Reward_DestroyMarker","bau_hs",}, {"Reward_Message","Die Hochschule wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "14_Haus bauen", Time = 0, Receiver = 1, Title = "Baue ein Haus", Text = "Baue ein Haus unterhalb der Hochschule auf der linken Makierung.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_Residence1","bau_haus",1000,1,true,1,}, {"Reward_DestroyMarker","bau_haus",}, {"Reward_Message","Das Haus wurde erfolgreich gebaut",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "15_Bauernhof bauen", Time = 0, Receiver = 1, Title = "Baue einen Bauernhof", Text = "Baue einen Bauernhof unterhalb der Hochschule auf der rechten Makierung.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_Farm1","bau_bauernhof",1000,1,true,1,}, {"Reward_DestroyMarker","bau_bauernhof",}, {"Reward_Message","Der Bauernhof wurde erfolgreich gebaut",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "16_Muehle bauen", Time = 0, Receiver = 1, Title = "Baue eine Sägemühle", Text = "Baue unterhalb der Burg im Wald eine Sägemühle.", Type = "FRAGMENTQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Create","PB_Sawmill1","bau_sm",2000,1,true,1,}, {"Reward_DestroyMarker","bau_sm",}, {"Reward_Message","Die Sägemühle wurde erfolgreich gebaut.",}, {"Trigger_QuestActive","08_Wiederaufbau",0,}, },
    {Name = "17_Aktivierung Banditen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_AI_CreateAIPlayer",8,2,0,false,false,}, {"Reward_AI_CreateAIPlayer",3,2,0,false,false,}, {"Reward_CreateEntity","bergpass","CB_Camp18",}, {"Reward_CreateMarker","StaticFriendly","marker_barmecia",}, {"Reward_Diplomacy",1,8,"Friendly",}, {"Reward_Diplomacy",1,3,"Hostile",}, {"Reward_Diplomacy",8,3,"Hostile",}, {"Reward_MapScriptFunction","CreateAiNameBanditBarmecia",}, {"Reward_SetPlayerColor",3,"ENEMY_COLOR3",}, {"Reward_SetPlayerColor",8,"FRIENDLY_COLOR1",}, {"Trigger_QuestSuccess","08_Wiederaufbau",0,}, },
    {Name = "18_VorbereitungKI3", Time = 480, Receiver = 1, Title = "Vorbereitung auf den Angriff", Text = "Bereite dich auf den Angriff der Banditen vor. Nach 8 Minuten wirst du angegriffen.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Protect","burg",}, {"Reward_AI_CreateSpawnArmy","barmecia",8,"bergpass",4,"bergpass_army",25000,20,"PU_LeaderCavalry1","PU_LeaderCavalry1","PU_LeaderPoleArm2","PU_LeaderRifle1","PU_LeaderSword2","CU_BanditLeaderBow1",}, {"Reward_AI_CreateSpawnArmy","outpost_attack2",3,"def1",2,"bandit_army2",30000,20,"CU_BanditLeaderSword1","CU_BanditLeaderSword1","-","-","-","-",}, {"Reward_AI_CreateSpawnArmy","outpost_attack1",3,"def2",2,"bandit_army1",30000,20,"CU_BanditLeaderBow1","CU_BanditLeaderBow1","-","-","-","-",}, {"Reward_AI_CreateSpawnArmy","outpost_attack3",3,"def5",4,"bandit_army3",30000,30,"CU_BanditLeaderSword1","CU_BanditLeaderBow1","PV_Cannon2","PV_Cannon2","-","-",}, {"Reward_DestroyEntity","barriere1",}, {"Reward_MapScriptFunction","CreateBarmeciaAttack",}, {"Reward_MapScriptFunction","CreateBanditAttack",}, {"Reward_Message","Der Weg zu den Banditen ist frei. Angriff!",}, {"Trigger_QuestSuccess","17_Aktivierung Banditen",0,}, },
    {Name = "19_BanditenAusssenposten", Time = 0, Receiver = 1, Title = "Banditen Außenposten", Text = "Nachdem der Weg zu den Banditen frei ist solltet ihr bei eurem Angriff alle Hauptgebäude zerstören. Das sind:{cr}- Kaserne{cr}-Schießplatz{cr}-Alle Türme (nicht Ballistentürme und Kanonentürme)", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","def1",}, {"Goal_Destroy","def2",}, {"Goal_Destroy","def3",}, {"Goal_Destroy","def4",}, {"Goal_Destroy","def5",}, {"Reward_Briefing","outpost_win",}, {"Reward_DestroyEntity","gitter_banditen",}, {"Reward_DestroyMarker","marker_barmecia",}, {"Reward_MapScriptFunction","DestroyBarmeciaAttack",}, {"Reward_MapScriptFunction","DestroyBanditAttack",}, {"Trigger_QuestSuccess","18_VorbereitungKI3",0,}, },
    {Name = "20_BefreiungGefangeneBanditen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","gefangener1","dario","Ich spreche nur mit Dario.",}, {"Reward_AI_CreateAIPlayer",4,3,4,false,false,}, {"Reward_Briefing","Brueckenbau",}, {"Reward_Diplomacy",7,4,"Neutral",}, {"Reward_MapScriptFunction","TechnologienFreischaltung",}, {"Reward_MapScriptFunction","BanditenOsten",}, {"Reward_SetPlayerColor",4,"SAINT_COLOR",}, {"Trigger_QuestSuccess","19_BanditenAusssenposten",0,}, },
    {Name = "21_Haendler", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","diel","","",}, {"Reward_Briefing","Schwefelmine",}, {"Reward_MapScriptFunction","Tribute1",}, {"Reward_MapScriptFunction","Tribute2",}, {"Trigger_QuestSuccess","20_BefreiungGefangeneBanditen",0,}, },
    {Name = "22a_BrueckeOeffnen", Time = 0, Receiver = 1, Title = "Die Brücke", Text = "Suche im Süd-Osten nach weiteren Infos zur Brückenblockade.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","brueckeoffnen","dario","Ich will mit Dario sprechen.",}, {"Reward_Briefing","BrueckeFertig",}, {"Trigger_QuestSuccess","20_BefreiungGefangeneBanditen",0,}, },
    {Name = "22b_BrueckeEntscheidung", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","BrueckeFertig_CP_7",1,}, {"Reward_AI_CreateSpawnArmy","SideBanditArmy1",4,"de3",5,"spawnde3",4500,20,"PU_LeaderPoleArm3","PU_LeaderSword3","PU_LeaderCavalry1","PU_LeaderHeavyCavalry1","PU_LeaderSword4","-",}, {"Reward_AI_CreateSpawnArmy","SideBanditArmy2",4,"de4",3,"spawnde4",4500,20,"PU_LeaderBow3","PU_LeaderRifle2","PU_LeaderRifle2","-","-","-",}, {"Reward_AI_CreateSpawnArmy","SideBanditArmy3",4,"de5",4,"spawnde5",4500,20,"CU_BanditLeaderSword2","CU_BanditLeaderBow1","CU_BanditLeaderSword1","CU_BanditLeaderBow1","-","-",}, {"Reward_AI_CreateSpawnArmy","SideBanditArmy4",4,"de2",3,"spawnde2",4500,40,"PV_Cannon3","PV_Cannon3","PV_Cannon4","-","-","-",}, {"Reward_Diplomacy",1,4,"Hostile",}, {"Reward_MapScriptFunction","CreateSideBanditAttack1",}, {"Reward_MapScriptFunction","CreateSideBanditAttack2",}, {"Reward_MapScriptFunction","CreateSideBanditAttack3",}, {"Reward_MapScriptFunction","CreateSideBanditAttack4",}, {"Reward_OpenGate","bruecketor2",}, {"Reward_OpenGate","bruecketor1",}, {"Trigger_Briefing","22a_BrueckeOeffnen","Any",}, },
    {Name = "23_SideBanditenHolztor", Time = 0, Receiver = 1, Title = "Die Banditen", Text = "Um zur Burg der Banditen vorzurücken müssen alle Türme und Militärgebäude vernichtet sein.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","de2",}, {"Goal_Destroy","de3",}, {"Goal_Destroy","de4",}, {"Goal_Destroy","de5",}, {"Reward_MapScriptFunction","DoorBanditen",}, {"Reward_OpenGate","door",}, {"Trigger_Briefing","22a_BrueckeOeffnen","Any",}, },
    {Name = "24_HqBanditen", Time = 0, Receiver = 1, Title = "Burg der Banditen", Text = "Zerstöre das Hauptquatier der Banditen.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","de1",}, {"Reward_Briefing","Banditen4Hq",}, {"Reward_CreateEntity","","","",}, {"Reward_MapScriptFunction","DestroySideBanditAttack1",}, {"Reward_MapScriptFunction","DestroySideBanditAttack2",}, {"Reward_MapScriptFunction","DestroySideBanditAttack3",}, {"Reward_MapScriptFunction","DestroySideBanditAttack4",}, {"Trigger_QuestSuccess","23_SideBanditenHolztor",0,}, },
    {Name = "25_Hoehleneingang", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_EntityDistance","ari","entry",200,"<",}, {"Reward_DestroyEntity","entryspark",}, {"Reward_DestroyEntity","dario",}, {"Reward_DestroyEntity","ari",}, {"Trigger_QuestSuccess","24_HqBanditen",10,}, },
    {Name = "26_HoehleAnfang(Teil1)", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Diplomacy",1,2,"Hostile",}, {"Reward_MapScriptFunction","HoehleAnfangFun",}, {"Trigger_QuestSuccess","25_Hoehleneingang",2,}, },
    {Name = "26_HoehleAnfang(Teil2)", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Briefing","HoehleAnfang",}, {"Trigger_QuestSuccess","26_HoehleAnfang(Teil1)",1,}, },
    {Name = "27_HoehleTod", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Destroy","dario",}, {"Goal_Destroy","ari",}, {"Reward_Defeat",}, {"Trigger_QuestSuccess","26_HoehleAnfang(Teil2)",0,}, },
    {Name = "28_FortestzungTor", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_EntityDistance","dario","info",400,"<",}, {"Reward_Message","Hallo Reisender. Dieses Tor führt in ein anderes Reich. (Nächste Map by Novator12)",}, {"Trigger_QuestSuccess","26_HoehleAnfang(Teil2)",0,}, },
    {Name = "29_SteinschlagHoehle", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_EntityDistance","dario","stein",400,"<",}, {"Reward_Message","Dario: Misst der Weg wurde durch einen Steinschlag versperrt. Wir müssen einen neuen finden.",}, {"Trigger_QuestSuccess","26_HoehleAnfang(Teil2)",0,}, },
    {Name = "30_BriefingVarg", Time = 0, Receiver = 1, Title = "Erkundet die Höhle", Text = "Ihr solltet die Höhle erforschen, achtet jedoch darauf, dass Dario und Ari nicht sterben, sonst habt ihr verloren.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_MapScriptFunction","VargLife",}, {"Reward_Briefing","VargBriefing",}, {"Reward_ChangePlayer","varg",7,}, {"Trigger_QuestSuccess","26_HoehleAnfang(Teil2)",0,}, },
    {Name = "30_BriefingVargEntscheidung", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_MultipleChoiceSelection","VargBriefing_CP_8",1,}, {"Reprisal_CustomVariable","VargLebt","=",0,}, {"Reprisal_DestroyEntity","varg",}, {"Reward_CustomVariable","VargLebt","=",1,}, {"Trigger_Briefing","30_BriefingVarg","Any",}, },
    {Name = "31_HoehleAusgang", Time = 0, Receiver = 1, Title = "Ausgang", Text = "Findet den Ausgang der Höhle.", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_QuestInterrupt","27_HoehleTod",}, {"Reward_QuestInterrupt","29_SteinschlagHoehle",}, {"Reward_QuestInterrupt","28_FortestzungTor",}, {"Trigger_Briefing","30_BriefingVarg","Any",}, },
    {Name = "32_Pilgrim", Time = 0, Receiver = 1, Title = "Die unbekannte Insel", Text = "Ihr habt es aus der Höhle auf eine unbekannte Insel geschafft. Ihr solltet schauen ob ihr hier neue Verbündete gewinnen könnt.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","pille","","",}, {"Reward_Briefing","PilgrimInsel",}, {"Trigger_QuestSuccess","31_HoehleAusgang",0,}, },
    {Name = "33_BruderJohannes", Time = 0, Receiver = 1, Title = "Bruder Johannes", Text = "Ihr hab auf der Insel Pilgrim gefunden. Dieser riet euch mit Bruder Johannes zu sprechen. Also tut dies bitte.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","johann","","",}, {"Reward_Briefing","JohannInsel",}, {"Trigger_BriefingSuccess","32_Pilgrim",}, },
    {Name = "34_Residenzbau", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Gold",2000,"Zahle 2000 Gold für die Residenz.",}, {"Goal_Tribute","Stone",5000,"Zahle 5000 Stein für die Residenz.",}, {"Goal_Tribute","Wood",4000,"Zahle 4000 Holz für die Residenz.",}, {"Reward_CreateEffect","smoke1","wolke1","FXBuildingSmokeLarge",}, {"Reward_CreateEffect","smoke2","wolke2","FXBuildingSmokeLarge",}, {"Reward_CreateEffect","smoke3","wolke3","FXBuildingSmokeLarge",}, {"Reward_CreateEffect","smoke4","wolke4","FXBuildingSmokeLarge",}, {"Reward_CreateEntity","bau","CB_MonasteryBuildingSite1",5,}, {"Reward_CreateEntity","serf1","PU_Serf",5,}, {"Reward_CreateEntity","serf2","PU_Serf",5,}, {"Reward_CreateEntity","serf3","PU_Serf",5,}, {"Reward_CreateEntity","serf4","PU_Serf",5,}, {"Trigger_BriefingSuccess","33_BruderJohannes",}, },
    {Name = "35_ZeitResidenzBau", Time = 120, Receiver = 1, Title = "Bau der Residenz", Text = "Wartet bis die Residenz gebaut wurde.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Protect","bau",}, {"Reward_Briefing","JohannBauAbgeschlossen",}, {"Reward_CreateEntity","bau","CB_CrawfordCastle",7,}, {"Reward_DestroyEffect","smoke1",}, {"Reward_DestroyEffect","smoke2",}, {"Reward_DestroyEffect","smoke3",}, {"Reward_DestroyEffect","smoke4",}, {"Reward_DestroyEntity","serf1",}, {"Reward_DestroyEntity","serf2",}, {"Reward_DestroyEntity","serf3",}, {"Reward_DestroyEntity","serf4",}, {"Trigger_QuestSuccess","34_Residenzbau",0,}, },
    {Name = "36_Leuchtturm", Time = 0, Receiver = 1, Title = "Der Leuchtturm", Text = "Greift die Banditen beim Leuchtturm an. {cr}{cr}-Der Hautpmann muss tot sein{cr}-Dario muss nahe am Leuchtturm stehen", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","leuchtleader",}, {"Goal_EntityDistance","dario","leucht",1000,"<",}, {"Reward_Briefing","LeuchtturmAbreise",}, {"Reward_CreateEntity","leucht","CB_LighthouseActivated",7,}, {"Reward_CreateMarker","StaticFriendly","haupt",}, {"Reward_QuestInterrupt","36a_NiederlageInsel",}, {"Trigger_QuestSuccess","35_ZeitResidenzBau",0,}, },
    {Name = "36a_NiederlageInsel", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Destroy","dario",}, {"Goal_Destroy","ari",}, {"Goal_Destroy","pille",}, {"Goal_Destroy","jhelp1",}, {"Goal_Destroy","jhelp2",}, {"Reward_Defeat",}, {"Trigger_QuestSuccess","35_ZeitResidenzBau",0,}, },
    {Name = "37_KriegSetup", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_AI_CreateAIPlayer",7,3,6,true,true,}, {"Reward_DestroyEntity","b1",}, {"Reward_DestroyEntity","b2",}, {"Reward_DestroyEntity","b3",}, {"Reward_DestroyEntity","b4",}, {"Reward_DestroyEntity","b5",}, {"Reward_DestroyEntity","b6",}, {"Reward_DestroyEntity","b7",}, {"Reward_DestroyEntity","b8",}, {"Reward_DestroyEntity","b9",}, {"Reward_DestroyEntity","b10",}, {"Reward_DestroyEntity","b11",}, {"Reward_Diplomacy",1,7,"Neutral",}, {"Reward_Diplomacy",2,7,"Hostile",}, {"Reward_Diplomacy",6,7,"Hostile",}, {"Trigger_QuestSuccess","36_Leuchtturm",0,}, },
    {Name = "38_Hauptmann", Time = 0, Receiver = 1, Title = "Pilgrims Info", Text = "Sprecht mit dem Hauptmann der Hauptstadt.{cr}{cr}", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","haupt","dario","Stört jemand anders....",}, {"Reward_Briefing","Hauptmann",}, {"Reward_DestroyMarker","haupt",}, {"Reward_Diplomacy",1,7,"Friendly",}, {"Reward_MapScriptFunction","NameHauptstadt",}, {"Trigger_QuestSuccess","37_KriegSetup",2,}, },
    {Name = "39a_RohstoffeTruppen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Gold",10000,"Zahlt 10000 Gold für Bogenschützen",}, {"Reward_AI_CreateSpawnArmy","BogiSupp",7,"BogiLeben",4,"armyGun",4000,60,"PU_LeaderBow4","PU_LeaderBow4","PU_LeaderBow3","PU_LeaderBow3","-","-",}, {"Trigger_Briefing","38_Hauptmann","Success",}, },
    {Name = "39b_RohstoffeTruppen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Iron",5000,"Zahlt 5000 Eisen für Schwertkämpfer",}, {"Reward_AI_CreateSpawnArmy","SchwertSupp",7,"kaserne7",3,"armyTwo",4000,60,"PU_LeaderSword4","PU_LeaderSword4","PU_LeaderSword3","-","-","-",}, {"Trigger_Briefing","38_Hauptmann","Success",}, },
    {Name = "39c_RohstoffeTruppen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Wood",7500,"Zahlt 7500 Holz für Speerträger",}, {"Reward_AI_CreateSpawnArmy","SpeerSupp",7,"burg7",3,"armyOne",4000,60,"PU_LeaderPoleArm4","PU_LeaderPoleArm3","PU_LeaderPoleArm3","-","-","-",}, {"Trigger_Briefing","38_Hauptmann","Success",}, },
    {Name = "39d_RohstoffeTruppen", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Sulfur",5000,"Zahlt 5000 Schwefel für Kanonen",}, {"Reward_AI_CreateSpawnArmy","KanonenSupp",7,"turm7",2,"armyThree",4000,60,"PV_Cannon4","PV_Cannon3","-","-","-","-",}, {"Trigger_Briefing","38_Hauptmann","Success",}, },
    {Name = "40_NiederlageID7", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Destroy","burg7",}, {"Reward_Defeat",}, {"Trigger_QuestSuccess","38_Hauptmann",0,}, },
    {Name = "41_SetupMainBanditAngriff", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_AI_CreateSpawnArmy","BanditMainSchwert",2,"kaserne2",6,"kaserne2_spawn",4000,5,"PU_LeaderSword4","PU_LeaderSword4","PU_LeaderBow4","PU_LeaderRifle2","PV_Cannon3","PV_Cannon3",}, {"Reward_AI_CreateSpawnArmy","BanditMainBogi",2,"bogi2",6,"rot",5000,30,"PU_LeaderBow4","PU_LeaderBow4","PU_LeaderBow4","PU_LeaderBow4","PU_LeaderRifle2","PU_LeaderRifle2",}, {"Reward_AI_CreateSpawnArmy","BanditMainKanonen",2,"guntower",5,"armyGun2",5000,30,"PV_Cannon4","PV_Cannon3","PV_Cannon3","PV_Cannon3","PV_Cannon4","-",}, {"Reward_AI_CreateSpawnArmy","BanditMainSpeer",2,"spawn1",6,"armyFour",5000,30,"PU_LeaderPoleArm4","CU_BanditLeaderSword1","CU_BanditLeaderBow1","CU_BanditLeaderSword1","CU_VeteranCaptain","CU_VeteranMajor",}, {"Trigger_QuestSuccess","38_Hauptmann",0,}, },
    {Name = "42_ZeitBisKampfID7", Time = 480, Receiver = 1, Title = "Vorbereitung", Text = "Die Blockade der Hauptstadt wird nicht lange halten. Rüstet euch aus, zahlt die Tribute um die Banditen einfacher zu besiegen und baut ggf. weitere Ballistentürme zur Verteidigung. Wenn das Hauptquatier der Hauptstadt fällt verliert ihr.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Protect","burg7",}, {"Reward_DestroyEntity","ser1",}, {"Reward_DestroyEntity","ser2",}, {"Reward_DestroyEntity","ser3",}, {"Reward_DestroyEntity","ser4",}, {"Reward_DestroyEntity","ser5",}, {"Reward_DestroyEntity","ser6",}, {"Reward_DestroyEntity","ser7",}, {"Reward_DestroyEntity","ser8",}, {"Reward_MapScriptFunction","CreateMainCastleAttack1",}, {"Reward_MapScriptFunction","CreateMainCastleAttack2",}, {"Reward_MapScriptFunction","CreateMainCastleAttack3",}, {"Reward_MapScriptFunction","CreateMainCastleAttack4",}, {"Reward_MapScriptFunction","CreateHauptBanditenAttack1",}, {"Reward_MapScriptFunction","CreateHauptBanditenAttack2",}, {"Reward_MapScriptFunction","CreateHauptBanditenAttack3",}, {"Reward_MapScriptFunction","CreateHauptBanditenAttack4",}, {"Reward_Message","Die Blockade ist gefallen!!!!",}, {"Trigger_Briefing","38_Hauptmann","Success",}, },
    {Name = "43_SiegBanditen", Time = 0, Receiver = 1, Title = "Krieg", Text = "Besiegt die Banditen und zerstört die beiden Türme (nicht Balista-, Kanonentürme), die Kaserne & das Schloss um den Krieg zu gewinnen.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","spawn1",}, {"Goal_Destroy","guntower",}, {"Goal_Destroy","bogi2",}, {"Goal_Destroy","kaserne2",}, {"Reward_DestroyEntity","igrid",}, {"Reward_MapScriptFunction","DestroyMainCastleAttack1",}, {"Reward_MapScriptFunction","DestroyMainCastleAttack2",}, {"Reward_MapScriptFunction","DestroyMainCastleAttack3",}, {"Reward_MapScriptFunction","DestroyMainCastleAttack4",}, {"Reward_MapScriptFunction","DestroyHauptBanditenAttack1",}, {"Reward_MapScriptFunction","DestroyHauptBanditenAttack2",}, {"Reward_MapScriptFunction","DestroyHauptBanditenAttack3",}, {"Reward_MapScriptFunction","DestroyHauptBanditenAttack4",}, {"Trigger_QuestSuccess","42_ZeitBisKampfID7",0,}, },
    {Name = "44_Salim", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","salim","","",}, {"Reward_Briefing","SiegBanditen",}, {"Reward_CreateMarker","StaticFriendly","finale_start",}, {"Trigger_QuestSuccess","43_SiegBanditen",0,}, },
    {Name = "45_Scout", Time = 0, Receiver = 1, Title = "Der Kundschafter", Text = "Spreche mit dem Kundschafter am Waldrand. ACHTUNG: Nach dem Gespräch beginnt der Endkampf.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_NPC","finale_start","dario","Mit dir rede ich nicht!",}, {"Reward_AI_CreateAIPlayer",6,4,8,false,false,}, {"Reward_Briefing","Scout",}, {"Reward_DestroyEntity","rocka",}, {"Reward_DestroyEntity","rockb",}, {"Reward_DestroyMarker","finale_start",}, {"Reward_Diplomacy",6,7,"Hostile",}, {"Reward_Diplomacy",6,1,"Hostile",}, {"Reward_Diplomacy",5,7,"Friendly",}, {"Reward_Diplomacy",8,6,"Hostile",}, {"Reward_Diplomacy",8,7,"Friendly",}, {"Reward_Diplomacy",8,1,"Friendly",}, {"Reward_Diplomacy",2,7,"Neutral",}, {"Reward_Diplomacy",2,8,"Neutral",}, {"Reward_MapScriptFunction","NameMary",}, {"Reward_OpenGate","door_endkampf",}, {"Trigger_Briefing","44_Salim","Success",}, },
    {Name = "46_SetupMary", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_AI_CreateSpawnArmy","MarryArmee1",6,"sma1",4,"ma1",4000,10,"PU_LeaderSword4","PU_LeaderSword4","PU_LeaderSword4","PU_LeaderSword4","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee2",6,"sma2",4,"ma2",4000,10,"PU_LeaderHeavyCavalry2","PU_LeaderHeavyCavalry2","PU_LeaderCavalry2","PU_LeaderCavalry2","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee3",6,"sma3",4,"ma3",4000,10,"PU_LeaderBow4","PU_LeaderBow4","PU_LeaderBow4","PU_LeaderBow4","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee4",6,"sma4",4,"ma4",4000,10,"PU_LeaderPoleArm4","PU_LeaderPoleArm4","PU_LeaderPoleArm4","PU_LeaderPoleArm4","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee5",6,"sma5",5,"ma5",4000,20,"PV_Cannon3","PV_Cannon3","PV_Cannon4","PV_Cannon4","PV_Cannon3","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee6",6,"sma6",4,"ma6",4000,20,"PU_LeaderCavalry2","PU_LeaderCavalry2","PU_LeaderHeavyCavalry2","PU_LeaderHeavyCavalry2","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee7",6,"sma7",3,"ma7",4000,10,"PU_LeaderRifle2","PU_LeaderRifle2","PU_LeaderRifle2","-","-","-",}, {"Reward_AI_CreateSpawnArmy","MarryArmee8",6,"sma8",5,"ma8",4000,15,"PV_Cannon4","PV_Cannon4","PV_Cannon3","PV_Cannon4","PV_Cannon3","-",}, {"Reward_MapScriptFunction","CreateMaryCastleAttack1",}, {"Reward_MapScriptFunction","CreateMaryCastleAttack2",}, {"Reward_MapScriptFunction","CreateMaryCastleAttack3",}, {"Reward_MapScriptFunction","CreateMaryCastleAttack4",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack1",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack2",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack3",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack4",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack5",}, {"Reward_MapScriptFunction","CreateMaryHauptstadtAttack6",}, {"Trigger_BriefingSuccess","45_Scout",}, },
    {Name = "47_Helias", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","helias_1","dario","Ich spreche nur mit meinem Enkel.",}, {"Reward_Briefing","Helias",}, {"Reward_ChangePlayer","erec_1",1,}, {"Reward_ChangePlayer","helias_1",1,}, {"Trigger_QuestSuccess","45_Scout",0,}, },
    {Name = "48_SprengungLeo", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Sulfur",5000,"Zahle 5000 Schwefel damit Barmecia zu Hilfe kommen kann.",}, {"Reward_CreateEntity","sba","CB_Camp04",8,}, {"Reward_DestroyEntity","steinbarmecia1",}, {"Reward_DestroyEntity","steinbarmecia2",}, {"Reward_Diplomacy",6,8,"Hostile",}, {"Reward_Diplomacy",7,8,"Friendly",}, {"Reward_Diplomacy",5,8,"Friendly",}, {"Reward_Diplomacy",1,8,"Friendly",}, {"Reward_Message","Barmecia eilt euch zu Hilfe!",}, {"Trigger_BriefingSuccess","47_Helias",}, },
    {Name = "49_SetupBarmeciaEnde", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_AI_CreateSpawnArmy","BarmeciaEndTrupp",8,"sba",6,"barmeciaEnde",4000,30,"PU_LeaderBow4","PU_LeaderBow4","PU_LeaderHeavyCavalry1","PU_LeaderHeavyCavalry1","PU_LeaderSword4","PU_LeaderSword4",}, {"Reward_MapScriptFunction","CreateBarmeciaHauptstadtAttack",}, {"Trigger_QuestSuccess","48_SprengungLeo",0,}, },
    {Name = "50_Finale", Time = 0, Receiver = 1, Title = "Showdown", Text = "Vernichte alle Militärgebäude von Mary und ihre Burg.", Type = "MAINQUEST_OPEN", Visible = true, SubQuests = {}, {"Goal_Destroy","sma1",}, {"Goal_Destroy","sma2",}, {"Goal_Destroy","sma3",}, {"Goal_Destroy","sma4",}, {"Goal_Destroy","sma5",}, {"Goal_Destroy","sma6",}, {"Goal_Destroy","sma7",}, {"Goal_Destroy","sma8",}, {"Goal_Destroy","maryhq",}, {"Goal_Destroy","kerberoshq",}, {"Reward_Diplomacy",1,6,"Friendly",}, {"Reward_Diplomacy",8,6,"Friendly",}, {"Reward_Diplomacy",5,6,"Friendly",}, {"Reward_Diplomacy",7,6,"Friendly",}, {"Reward_MapScriptFunction","ClearAllHeroes",}, {"Trigger_QuestSuccess","45_Scout",0,}, },
    {Name = "51_Epiolog", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Briefing","FinaleBriefing",}, {"Trigger_QuestSuccess","50_Finale",1,}, },
    {Name = "52_Ende", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_InstantSuccess",}, {"Reward_Victory",}, {"Trigger_BriefingSuccess","51_Epiolog",}, },
    {Name = "53_Wetter", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","wettertyp","dario","Mehehehe...nicht du. Will den mit dem Amulett.",}, {"Reward_Briefing","Wettertyp",}, {"Trigger_BriefingSuccess","47_Helias",}, },
    {Name = "54_WetterChange", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Tribute","Sulfur",5000,"Zahle 5000 Schwefel an den Wettermeister.",}, {"Goal_Tribute","Iron",4000,"Zahle 4000 Eisen an den Wettermeister.",}, {"Reward_Briefing","WetterSchnee",}, {"Reward_CreateEffect","laserbeam","wetterAn","FXTemplarAltarEffect",}, {"Reward_CreateEntity","wetterAn","PB_Weathermachine_Activated",5,}, {"Reward_DestroyEntity","wettermaschine",}, {"Trigger_BriefingSuccess","53_Wetter",}, },
    {Name = "55_Smith", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_NPC","smith","","",}, {"Reward_Briefing","Schmied",}, {"Reward_CreateMarker","PulseFriendly","markerstein",}, {"Trigger_BriefingSuccess","54_WetterChange",}, },
    {Name = "56_PilgrimsStein", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_Destroy","pillestein",}, {"Reward_DestroyEffect","laserbeam",}, {"Reward_DestroyEntity","barriereMary",}, {"Reward_DestroyMarker","markerstein",}, {"Reward_MapScriptFunction","Schmelze",}, {"Trigger_QuestSuccess","54_WetterChange",0,}, },
    {Name = "57_TorZuHelias", Time = 0, Receiver = 1, Title = "", Text = "", Type = "MAINQUEST_OPEN", Visible = false, SubQuests = {}, {"Goal_EntityDistance","dario","activate_gate1",300,"<",}, {"Reward_DestroyEntity","h_tor",}, {"Reward_DestroyEntity","activate_gate1",}, {"Reward_DestroyEntity","e_tor",}, {"Trigger_BriefingSuccess","45_Scout",}, },
};


--
-- Generates the quests configured in the assistent.
--
function CreateQuests()
    for k, v in pairs(Global_QuestsToGenerate) do
        local Behaviors = {}
        for i= 1, table.getn(v), 1 do
            local CurrentBehaviorData = copy(v[i]);
            local CurrentBehaviorName = table.remove(CurrentBehaviorData, 1);
            table.insert(Behaviors, _G[CurrentBehaviorName](unpack(CurrentBehaviorData)));
        end

        local Description;
        if v.Visible then
            Description = {
                Title = v.Title,
                Text  = v.Text,
                Type  = _G[v.Type],
                Info  = 1
            }
        end

        CreateQuest {
            Name        = v.Name,
            Description = Description,
            Receiver    = v.Receiver,
            Time        = v.Time,

            unpack(Behaviors)
        };
    end
    -- Delete to unlock memory
    Global_QuestsToGenerate = nil;
end

-- -------------------------------------------------------------------------- --

function Banditen4Hq(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Endlich geschafft. Diese lausigen Banditen haben uns gut auf Trapp gehalten. Ich frage mich woher sie so gute Ausrüstung bekommen konnten.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Geliebter, ich kann es dir auch nicht sagen, aber mich wundert es genauso. Wir sollen uns mal umgucken, ob es noch einen weiteren Zugang zur Insel gibt. Irgendwie müssen die Banditen sich ja versorgt haben.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "entry",
        Title           = "Mentor",
        Text            = "Schaut Herr, ein Höhleneingang! Wo der wohl hinführen mag.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Dann sollten wir der Sache mal nachgehen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function BrueckeFertig(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "dario",
        Title           = "Dario",
        Text            = "General Doofbar. Was macht ihr denn hier?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "brueckeoffnen",
        Title           = "General Dovbar",
        Text            = "DOVBAR!!!! NICHT DOOFBAR!!! Ich bin doch nicht doof....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Sag ich doch....Doofbar...(prustet vor lachen). ",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "brueckeoffnen",
        Title           = "General Dovbar",
        Text            = "Was solls... (Was ein Kleinkind und der nennt sich König). Ich bin hier um die Brücke zu bewachen. Die Banditen haben sich in ihrer Feste verschanst und blockieren das Tunnelsystem von Talgrund.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Hm...das ist nicht gut. Aber wir haben mittlerweile eine starke Armee errichtet und wollen uns deren annehmen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "brueckeoffnen",
        Title           = "General Dovbar",
        Text            = "Wenn das so ist. Soll ich die Brücke also wirklich öffnen?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    local BrueckeFertig_CP_7 = AP{
        Name            = "BrueckeFertig_CP_7",
        Target          = "brueckenbau",
        Title           = "Die Brücke ",
        Text            = "Soll die Brücke jetzt oder erst später geöffnet werden?",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFoW       = false,
        DisableSkipping = true,
        MC              = {
            {"[Brücke öffnen]",(_G["DP_9"] and type(_G["DP_9"]) == "function" and _G["DP_9"]) or "DP_9", ID = 1},
            {"[Den Schwanz einziehen und gehen]",(_G["DP_11"] and type(_G["DP_11"]) == "function" and _G["DP_11"]) or "DP_11", ID = 2},
        },
    };
    AP();
    AP{
        Name            = "DP_9",
        Target          = "bruecketor2",
        Title           = "General Dovbar",
        Text            = "Die Brücke ist nun geöffnet.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP();
    AP{
        Name            = "DP_11",
        Target          = "brueckeoffnen",
        Title           = "General Dovbar",
        Text            = "Ihr seid ein Feigling. Ihr könnt nicht einfach abhauen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP("DP_6");

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Brueckenbau(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "gefangener1",
        Title           = "Brückenarchitekt",
        Text            = "Vielen Dank für die Rettung Dario. Dieser Ingenieur neben mir fing schon an zu stinken.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "gefangener2",
        Title           = "Ingenieur",
        Text            = "Ey, was soll das. Wenigstens hab ich nicht angefangen meine eigene... Ach das erzähl ich lieber nicht. Will eh keiner wissen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Hey, hey, hey beruhigt euch. Ihr könnt gleich eine Dusche nehmen und dort eure Diskussion fort führen. Nun aber zu wichtigeren Angelegenheiten. Konntet ihr etwas herausfinden, wo die Banditen ihr Hauptlager haben?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "brueckenbau",
        Title           = "Brückenarchitekt",
        Text            = "Ja, nachts am Feuer haben sie von einem Lager weiter im Süd-Osten geredet, wo sich angeblich ein größerer Außenposten befinden soll. Das Problem jedoch ist, dass die Brücke von den Banditen blockiert wurde und mit starken Verteidigungamaßnahmen verstärkt wurde...",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Das hört sich nicht gut an. Wir sollten uns das mal genauer angucken. Vielleicht kann uns bei der Brücke jemand weiterhelfen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "dario",
        Title           = "Mentor",
        Text            = "Herr, vielleicht können der Ingenieur und der Brückenarchitekt unsere Technologien verbessern.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "gefangener1",
        Title           = "Brückenarchitekt",
        Text            = "Da hat euer Berater recht. Wir haben das nötige Wissen um alles in die Wege zu leiten. Kleinen Moment...",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "gefangener1",
        Title           = "Lautes Poltern",
        Text            = "Mensch, wo sind sie nur....hmmmm,,,, (polter)...autsch....(krach). Ah gefunden. Hier sind alle benötigten Unterlagen. Und wenn ich nun drum bitten darf: Wir gehen jetzt duschen.",
        DialogCamera    = true,
        Action          = MovePrisoner,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function FinaleBriefing(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "rebirth",
        Title           = "Mentor",
        Text            = "Herr wir haben gesiegt. Mary jedoch ist richtung Ritualstelle gerannt mit ein paar Knochen in der Hand. Ihr sollte sie verfolgen....",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_2",
        Target          = "mary",
        Title           = "Mary",
        Text            = "Wie könnt ihr es wagen!!!! Ihr habt meine Stadt vernichtet. Und dennoch könnt ihr mich nicht stopppen. HAHAHAHA",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Mary halte ein. Dieser Irrsinn muss ein Ende haben. Du hast verloren...",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_4",
        Target          = "mary",
        Title           = "Mary",
        Text            = "Ihr könnt mich und meinen Geliebten nicht besiegen!",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_5",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Dein Geliebter ist mehrere hundert Meter in den Tod gestürzt. Was faselst du da für einen Humbuk.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_6",
        Target          = "mary",
        Title           = "Mary",
        Text            = "Das werden wir ja noch sehen: AMKAHBAR ZARAMABA KANU VARAM HUK DIA TENA VARIM",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_7",
        Target          = "mary",
        Title           = "Mary",
        Text            = "Geliebter bist du es?",
        DialogCamera    = false,
        Action          = ReviveKerberos,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_8",
        Target          = "kerberos",
        Title           = "Kerberos",
        Text            = "HAR HAR HAR, endlich..... ENDLICH bin ich wieder unter den Lebenden. Was guckst du so entgeistert Dario. Ich werde dich vernichten.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_9",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Nein....Nein....Das darf nicht sein... NEEIIIIIIIINNNNN",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_10",
        Target          = "helias_1",
        Title           = "Helias",
        Text            = "Weiche von uns Satan. Du hast hier keine Macht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_11",
        Target          = "kerberos",
        Title           = "Kerberos",
        Text            = "Ach Vater... spar dir dein dummes Gefasel. Du langweilst hier nur alle.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_12",
        Target          = "mary",
        Title           = "Mary",
        Text            = "Komm Liebster, lass uns verschwinden!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_13",
        Target          = "kerberos",
        Title           = "Kerberos",
        Text            = "Ja meine treue Frau. Wir sehen uns wieder.... HAR HAR HAR (Kerberos Stimme versickerte im Nebel)",
        DialogCamera    = true,
        Action          = Fliehen,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_14",
        Target          = "rebirth",
        Title           = "Mentor",
        Text            = "Wir haben ihn verloren...Owehh.. was sollen wir jetzt nur tun....",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_15",
        Target          = "rebirth",
        Title           = "Fortsetzung folgt....",
        Text            = "Vielen Dank für das Spielen meiner Karte. Ich hoffe ihr hattet Spaß und bis zum nächsten mal. Mit freundlichen Grüßen Novator12",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Hauptmann(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "ALLAAAARRRRMMMMMM, ALLLAAAARRRRMMMMM, Ich bin in Gefahr. Wachen helft mir.",
        DialogCamera    = false,
        Action          = WachenMovenHin,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Was fällt euch ein!!! Ich bin der König!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "HA.... dass ich nicht lache. Der König ist in den Fliterwochen und lässt uns hier im Stich. Ihr seid ein Hochstapler. Wenn ihr wirklich der König seid zeigt mir das Amulett der Macht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "(zeigt das Amulett)",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "Oh...schei.....Mein Herr....Das tut mir leid... Ich wollte euch nicht so angehen, wir sind hier jedoch so am Verzweifeln wegen den permanenten Angriffen der Banditen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "Wachen zurück auf eure Posten.",
        DialogCamera    = false,
        Action          = WachenMovenWeg,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_7",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Was ist denn los? Können wir euch helfen?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "spawn1",
        Title           = "Hauptmann",
        Text            = "Die Banditen greifen uns seit Wochen an und wir können uns bald nicht mehr verteidigen. Wir brauchen weitere Ressourcen um die Verteidigung aufrecht zu erhalten.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Das sollte kein Problem sein. Wir kümmern uns um den Nachschub.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "Gut, nur wird das ein teurer Spaß. Ich schicke euch eine Materialien Liste zu eurem Tributverwalter. (Schaut ins Tirbutmenü).",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_11",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Geliebter. Die Armen Leute....Wie konnte das nur geschehen. Ist Mary total Irre geworden?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_12",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Die alte hat doch nicht mehr alle Latten am Zaun. Wenn ich die in die Finger bekomme Ari, dann knallt es aber ordentlich.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_13",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Beruhigt euch Freunde. Kümmern wir uns zuerst um die Banditen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_14",
        Target          = "haupt",
        Title           = "Hauptmann",
        Text            = "Dario! Bevor ich es vergesse. Wir haben die Flusspassagen mit Palisaden verbarikadiert. Lange werden diese nicht mehr halten, also beeilt euch mit der Rohstoffversorgung.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Helias(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "spawn_earmy",
        Title           = "Helias",
        Text            = "Ohhh Dario. Es tut gut euch wohlauf zu sehen. So viel Schmerz. So viel Tod. Ach wehhhh. ",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Onkel. Ich habe euch vermisst. Nur wir haben keine Zeit zu quatschen. Krieg ist am toben und wir haben gehofft, etwas Hilfe vom Orden zu erhalten.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "erec_1",
        Title           = "Erec",
        Text            = "Da schalte ich mich ein. Hallo Dario, schön dich lebendig zu sehen. Ich habe schon vor einigen Tagen einen Kundschafter nach Barmecia geschickt um Verstärkung anzufordern. Dieser kam jedoch nie zurück.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Das liegt daran, dass der Weg nach Barmecia durch einen Steinschlag versperrt wurde. Und ich weiß leider immernoch nicht wie wir das beheben sollen....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "leo",
        Title           = "Leonardo",
        Text            = "Meine telepathischen Kräfte empfangen das Verlangen nach Sprengstoff. Ich sollte Dario eine Anfrage für Schwefel stellen, damit wir den Weg nach Barmecia freisprengen können. (Schau ins Tributmenü)",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ich hab das Gefühl, es wird sich bald eine Lösung aufweisen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "smith",
        Title           = "Helias",
        Text            = "Dario. Wir konnten beobachten, dass ein einsamer Mann auf der Insel auf dem See wohnt. Vielleicht kann er uns strategisch nützlich sein.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "erec_1",
        Title           = "Erec",
        Text            = "Ja Helias, nur das Problem ist, dass es nicht schneit und somit der See nicht gefriert. Und die Pläne für die Wettermaschine wurden vernichtet....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Wir sollten uns umschauen, ob wir nicht etwas oder jemanden finden, der uns weiterhelfen kann.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function HoehleAnfang(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Dario, ich wusste das hier irgendwas sein muss.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Du hast Recht Schatz. (Gedanken: Das ich sowas mal sage).",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Los, lass uns die Höhle erkunden. Ein paar der Männer begleiten uns.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function JohannBauAbgeschlossen(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "bau",
        Title           = "Bruder Johannes",
        Text            = "Ahhh Dario. Herrlich. Die Residenz ist wunderschön. Vielen Dank.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Nichts zu danken. Wir haben euch gerne geholfen. Jetzt sollten wir uns aber um die Barbaren kümmern. Dafür muss uns Pilgrim den Weg frei räumen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "johanntrupp1",
        Title           = "Bruder Johannes",
        Text            = "Dario. Bevor ich es vergesse. Nehmt diese Truppen als Unterstützung. SIe sollen euch helfen dieses Dreckspack zu erledigen.",
        DialogCamera    = true,
        Action          = HelpJohann,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "johann",
        Title           = "Bruder Johannes",
        Text            = "Euer Ziel ist es den Leuchtturm neu zu entfachen. Dafür sollt müsst ihr den bösen Hauptmann töten und euch dem Leuchtturm nähern.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Dario, warte auf mich. Ich komme ja schon.",
        DialogCamera    = true,
        Action          = ChangePille,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function JohannInsel(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "johann",
        Title           = "Bruder Johannes",
        Text            = "Ahhh Dario, schoen dich zu sehen. Du musst uns helfen!!!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "johann",
        Title           = "Bruder Johannes",
        Text            = "Wir müssen ein neues Gebäude für das Dorf bauen. Es handelt sich um eine Residenz. Stellst du uns die Ressourcen zur Verfügung.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Verstanden ich werde euch helfen, doch was hat es mit der Belagerung der Insel auf sich?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "johann",
        Title           = "Bruder Johannes",
        Text            = "Schrecklich für das Dorf...Die Höhlenbewohner haben die Insel eingenommen und den Leuchtturm besetzt. Dadurch ist der Hafen unbefahren und niemand kommt auf oder von der Insel weg. Da ihr aber die Banditen in der Höhle besiegt habt ist zumindest der Landweg wieder zugänglich.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Mentor",
        Text            = "Schaut in euer Tributmenü!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Leonardo(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "leo",
        Title           = "Leonardo",
        Text            = "Danke Dario...endlich..so lang ist es her...?.",
        DialogCamera    = true,
        Action          = BarriereBurg,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Leonardo?Warum bist du wieder gefangen?...Wieso frage ich ueberhaupt, war doch eh klar.Und wo sind die anderen?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "leo",
        Title           = "Leonardo",
        Text            = "Lange Geschichte..MJAAA...lange Geschichte. Das ist das ueberbleibsel von der dunklen Zeit..Mjaaaa",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Dunkle Zeit..Was meinst du damit???",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "leo",
        Title           = "Mentor",
        Text            = "Leonardos Blick erfuellte sich mit leere und er läuft weg... (Sucht lieber bei der Burg nach weiteren Infos)",
        DialogCamera    = true,
        Action          = MoveLeonardo,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function LeuchtturmAbreise(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Unser Job hier ist erledigt. Lasst uns nun diese Insel verlassen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Ich schließe mich euch an. Euch kann man ja nicht alleine durch die Gegend streifen lassen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Tolle Flitterwochen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "boot",
        Title           = "Auf dem Schiff",
        Text            = "(eine sanfte Briese weht)",
        DialogCamera    = false,
        Action          = TeleportSchiff,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ach, wie lange ich nicht mehr auf einem Schiff war. Oh Gott mir wird schlecht.... (würg)",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Lappen.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "anfang",
        Title           = "An Land",
        Text            = "Die Vögel zwitschern.",
        DialogCamera    = false,
        Action          = TeleportLand,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Endlich fester Boden unter den Füßen....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Du bist immernoch ein Lappen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Die Hauptstadt befindet sich im Herzen von Talgrund. Wir sollten uns auf den Weg machen und den Hauptmann aufsuchen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function PilgrimInsel(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Dario???Was machst du hier in Talgrund. Das gibt es doch nicht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "OMG Pilgrim. Ich bin froh dich zu sehen. Bist du schon wieder auf Kneipentour!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Nein, man glaubt es kaum aber ich bin hier um zu helfen, da in Talgrund Krieg ausgebrochen ist, nach unserem Sieg in Evelance.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ich bin hier wegen Aris und meinen Flitterwochen, doch da jetzt Krieg ist wollen wir auch helfen.Hast du was für uns zu tun?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "Ja wir müssen eine neue Residenz für die Kneipe bauen und den Leuchturm aus den Händen der Höhlenbewohner befreien. Sprecht am Besten mit Bruder Johannes vor der Abtei.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Prolog(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "willk",
        Title           = "Willkommen",
        Text            = "Rückkehr nach Talgrund",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = true,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "willk",
        Title           = "Vorgeschichte",
        Text            = "Einen Winter ist es nun her, dass Dario und Ari über  Kerberos und seine Schergen gesiegt haben. Es ist an der Zeit, dass sie heiraten und sich in Talgrund niederlassen.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "kirche",
        Title           = "Priester",
        Text            = " Ari,nimmst du Dario zu deinem Mann?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "ari2",
        Title           = "Ari",
        Text            = "Ja, ich will.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "kirche",
        Title           = "Priester",
        Text            = "Dario,nimmst du Ari zu deiner Frau?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    local Prolog_CP_6 = AP{
        Name            = "Prolog_CP_6",
        Target          = "dario2",
        Title           = "Willst du Ari heiraten?",
        Text            = "Wähle weise, du triffst eine Entscheidung für dein Leben:",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFoW       = false,
        DisableSkipping = true,
        MC              = {
            {"Ari heiraten",(_G["DecideToMarry"] and type(_G["DecideToMarry"]) == "function" and _G["DecideToMarry"]) or "DecideToMarry", ID = 1},
            {"Ari nicht heiraten",(_G["DecideToNotMarry"] and type(_G["DecideToNotMarry"]) == "function" and _G["DecideToNotMarry"]) or "DecideToNotMarry", ID = 2},
        },
    };
    AP();
    AP{
        Name            = "DecideToMarry",
        Target          = "dario2",
        Title           = "Dario",
        Text            = "Ja, ich will!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "kirche",
        Title           = "Priester",
        Text            = "Kraft des mir verliehenen Amtes durch Großoheim Helias erkläre ich euch zu Mann und Frau. Ihr dürft die Braut jetzt küssen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "burg",
        Title           = "Drei Monate später...",
        Text            = "Nach Darios und Aris Hochzeit beschlossen sie Darios Geburtsort aufzusuchen und sich dort niederzulassen. Sie reisten durch die großen Städte Norfolk, Barmecia und Cleycourd. An der Grenze der Provinz Talgrund stieß ihnen beißender Rauch in die Augen und Nase.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Dario, was ist nur geschehen. Lass uns eilen und den Leuten helfen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_11",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ja, die armen Menschen. Los komm...",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP();
    AP{
        Name            = "DecideToNotMarry",
        Target          = "dario2",
        Title           = "Dario",
        Text            = "Nein, ich kann das nicht!",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_13",
        Target          = "dario2",
        Title           = "Mentor",
        Text            = "Dario bereute seine Entscheidung sein Leben lang und begann Suizid.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Schmied(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "smith",
        Title           = "Schmied",
        Text            = "Endlich....Winter...Jaaaa....Danke",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "smith",
        Title           = "Schmied",
        Text            = "Also Belohnung zeige ich euch einen geheimen Weg in Marys Festung, die mich hier auf diese Insel Verband hat.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "pillestein",
        Title           = "Schmied",
        Text            = "Schaut...Mit etwas Sprengstoff kriegt ihr den ganz einfach weg.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_4",
        Target          = "smith",
        Title           = "Schmied",
        Text            = "Ich verlasse nun die nervige Insel.",
        DialogCamera    = true,
        Action          = MoveSmith,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Schwefelmine(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "diel",
        Title           = "Händler",
        Text            = "Grüüüüüzi, feine Schwefelwaren und Minen zu Spottpreisen. Kommen sie, kommen sie.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Guten Tag, ich wäre interessiert an den Schwefelmine oberhalb ihres Handelpostens.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "diel",
        Title           = "Händler",
        Text            = "Kein Problem, die kostet nur schlappe 3500 Taler und 2500 Eisen. Zusätzlich biete ich natürlich auch an Gold gegen Eisen zu tauschen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Hmm....Spottpreise, das ich nicht lache.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "diel",
        Title           = "Händler",
        Text            = "Ich schicke ihnen ein Angebot an ihren Tributverwalter (Schau in dein Tributmenü). Sie können es sich ja überlegen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Schwierigkeitsauswahl(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "kirche",
        Title           = "Novator12",
        Text            = "Willkommen zu meiner Map. Vorab schonmal Danke fürs spielen. Es gibt zwei Schwierigkeitsgrade die ich auf den nächsten Seiten erkläre:",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_2",
        Target          = "kirche",
        Title           = "Schwierigkeit: Entschärft",
        Text            = "Ihr könnt ab dem Start-Punkt Zahnräder erforschen und Balistatürme bauen (Limit sind 10 Türme). Die Gegner haben weniger Türme um sich zu verteidigen. Handel ist erlaubt und im Late-Game auch schwere Kanonen. Ihr habt wesentlich mehr Startressourcen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_3",
        Target          = "kirche",
        Title           = "Schwierigkeit: Schwer",
        Text            = "Ihr könnt das Spiel über keine Türme bauen (Aussichts-, Balista-, Kanonetürme. Die Gegner haben eine stärkere Verteidigung. Der Markt ist nicht verfügbar und man kann im Late-Game nur leichte Kanonen ausbilden. Einige Technologien werden erst später freigeschaltet als bei leicht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    local Schwierigkeitsauswahl_CP_4 = AP{
        Name            = "Schwierigkeitsauswahl_CP_4",
        Target          = "kirche",
        Title           = "Wählt eine Schwierigkeit:",
        Text            = "Jetzt ist es an der Zeit die Schwierigkeitsstufe zu wählen.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFoW       = false,
        DisableSkipping = true,
        MC              = {
            {"Entschärft",(_G["DP_6"] and type(_G["DP_6"]) == "function" and _G["DP_6"]) or "DP_6", ID = 1},
            {"Schwer",(_G["DP_8"] and type(_G["DP_8"]) == "function" and _G["DP_8"]) or "DP_8", ID = 2},
        },
    };
    AP();
    AP{
        Name            = "DP_6",
        Target          = "kirche",
        Title           = "Entschärft",
        Text            = "Ihr habt entschärft gewählt.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP();
    AP{
        Name            = "DP_8",
        Target          = "kirche",
        Title           = "Schwer",
        Text            = "Ihr habt schwer gewählt.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Scout(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "finale_start",
        Title           = "Scout",
        Text            = "Hallo Dario, ich habe mich schon gefragt wann ihr endlich kommt. Es spricht sich herum, dass ihr Talgrund am befreien seid.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Hallo. Kannst du uns weiterhelfen, was Mary am planen ist. Salim hat uns berichtet, dass etwas großes bevorsteht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "finale_start",
        Title           = "Scout",
        Text            = "Genaues weiß ich leider nicht, aber ich konnte etwas mit meinem Fernglas erspähen:{cr}Schaut selbst",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "rebirth",
        Title           = "(Fernglas)",
        Text            = "(Dario schaut durch das Fernglas und erspäht eine alte Ritualstelle)",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Was hat das zu bedeuten? Wieso zeigst du mir diese verlassene Ritualstelle?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "finale_start",
        Title           = "Scout",
        Text            = "Mary war die letzten Tage oft an dieser Stelle. Außerdem konnte ich beobachten wie sie einen Schrein für Kerberos errichtet hat und diesen täglich besucht.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Du glaubst doch nicht, dass Mary Kerberos wiederbeleben will.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "helias_1",
        Title           = "Scout",
        Text            = "Ich weiß es nicht... Ich hoffe aber mal nicht, denn sonst haben wir ein großes Problem. Ihr solltet Großoheim Helias und euren Gefährten Erec im Süd Westen aufsuchen. Sie baten mich nach euch ausschau zu halten...",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "finale_start",
        Title           = "Scout",
        Text            = "(Laute Geräusche des Krieges).    Oh nein, Marys Truppen haben uns gefunden. Kämpft oder flieht......",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "dario",
        Title           = "Endkampf",
        Text            = "Der Endkampf hat nun begonnen. Ihr könnt Mary nur mit Hilfe der Hauptstadt versuchen zu besiegen. Alternativen gibt es jedoch. Ihr müsst sie nur finden (Zwinker)",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function SiegBanditen(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "salim",
        Title           = "Salim",
        Text            = "Inshallah mein Freunde. Danke für die Rettung. Ich bin schon seit Wochen hier eingesperrt....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "pille",
        Title           = "Pilgrim",
        Text            = "So riechst du auch, HAHAHA.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Pilgrim, Ruhe jetztt! Salim kannst du uns etwas über Marys Pläne erzählen, bzw. weißt du warum sie nach Kerberos Tod uns vernichten will?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "salim",
        Title           = "Salim",
        Text            = "Leider nein. Mir ist darüber leider auch nichts bekannt. Ich konnte nur von einem Gespräch meiner Wachen entnehmen, dass Mary etwas Großes plant. Ich habe außerdem noch weitere Technologien für euch die die Banditen hier gehortet haben.",
        DialogCamera    = true,
        Action          = SalimTech,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "salim",
        Title           = "Salim",
        Text            = "Entschuldigt mich nun meine Freunde. Ich mach mich erstmal frisch und regeneriere mich. Ich stoße dann säter zu euch. Am Waldrand richtung Westen gibt es einen Fährtenleser. Vielleicht hat er was gesehen oder kann euch weiterhelfen. ",
        DialogCamera    = true,
        Action          = RegenSalim,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Skelet(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Oh nein, der arme Wächter. Was haben sie ihm nur angetan. Dario, ich hoffe Leonardo geht es gut. Er wohnt doch nun hier im Osten.",
        DialogCamera    = true,
        Action          = DestroyWache,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Keine Sorge Ari. Leonardo ist ein taffer Mann. zwar komisch, aber taff. ihm wird es schon gut gehen. Der Wächter war ein guter Freund meiner Mutter. Sie hat mich damals als kleines Kind zum Spielen bei ihm gelassen. Er versteckte seine Habseligkeiten immer hinter seiner Hütte. Lass uns dort nachschauen.",
        DialogCamera    = false,
        Action          = CreateChestSparkles,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_3",
        Target          = "dario",
        Title           = "Mentor",
        Text            = "Herr, wir sollten eilen. Ich höre komische Geräusche aus dem Osten. Es hört sich so an, als ob jemand am jammern ist.",
        DialogCamera    = false,
        Action          = MoveDarioToKiste,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Heureka, ich habe den Schlüssel für das Tor gefunden. Ich schließ es am besten sofort auf, damit wir den Geräuschen nachgehen können.",
        DialogCamera    = false,
        Action          = DestroyKiste,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = true,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "(Dario läuft zum Tor)",
        Text            = "Knack, Knirsch, Klimper, Rumpel",
        DialogCamera    = false,
        Action          = MoveDarioToGate,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = true,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function VargBriefing(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "dario",
        Title           = "Varg",
        Text            = "AHHH. Ich gebe auf. Hört auf mich anzugreifen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Gut so sei es. So dumm scheinst du ja doch nicht zu sein.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "ari",
        Title           = "Ari",
        Text            = "Das musst du gerade sagen....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Mentor",
        Text            = "HAHAHAHAHHAHAHAHA",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ruhe jetzt. Varg erzähl uns wer die Angriffe auf Talgrund zu verantworten hat oder du wirst direkt hingerichtet.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "varg",
        Title           = "Varg",
        Text            = "Ich weiß nicht wer das war. Ich hab meine Befehle von Mary bekommen. Sie hat eine große Stadt im Westen von Talgrund errichtet und belagert nun die Hauptstadt.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Nun gut. Das muss reichen. Ich lasse dir nun die Wahl. Schließe dich uns an und bereue deine Sünden oder stirb.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    local VargBriefing_CP_8 = AP{
        Name            = "VargBriefing_CP_8",
        Target          = "dario",
        Title           = "Vargs Urteil",
        Text            = "Ihr entscheidet über Vargs nächsten Schritt. Soll er euch beistehen oder sterben?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFoW       = false,
        DisableSkipping = true,
        MC              = {
            {"Varg soll sich anschließen",(_G["DP_9"] and type(_G["DP_9"]) == "function" and _G["DP_9"]) or "DP_9", ID = 1},
            {"Varg soll sterben",(_G["DP_12"] and type(_G["DP_12"]) == "function" and _G["DP_12"]) or "DP_12", ID = 2},
        },
    };
    AP();
    AP{
        Name            = "DP_9",
        Target          = "varg",
        Title           = "Varg",
        Text            = "Ich schließe mich euch an. ",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Lasst uns nun die Höhle verlassen.",
        DialogCamera    = true,
        Action          = ExitHoehle,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_11",
        Target          = "exit1",
        Title           = "Mentor",
        Text            = "Da sind nun unsere drei Helden auf einer völlig fremden Insel.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP();
    AP{
        Name            = "DP_12",
        Target          = "varg",
        Title           = "Varg",
        Text            = "Lieber sterbe ich, als unter eurem Kommando zu stehen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_13",
        Target          = "dario",
        Title           = "Dario",
        Text            = "So sei es. Stirb....",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_14",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Lass uns gehen Schatz.",
        DialogCamera    = true,
        Action          = ExitHoehle,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_15",
        Target          = "exit1",
        Title           = "Mentor",
        Text            = "Da sind nun unsere beiden Helden.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function WetterSchnee(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "wettertyp",
        Title           = "Wettermeister",
        Text            = "mehehehe...Lassen wir es schneien....mehehehe",
        DialogCamera    = true,
        Action          = Snow,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = true,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function Wettertyp(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "wettertyp",
        Title           = "Wettermeister",
        Text            = "Mehehhehe..Hallo mein Freund...meheheheh...Wie kann ich euch weiterhelfen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Kannst du es schneien lassen. Wir müssen auf den See.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "wettertyp",
        Title           = "Wettermeister",
        Text            = "Das ist kein Problem, jedoch bräuchte ich dafür die Energie aus eurem Amulett.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Na gut einverstanden. (Dario gibt das Amulett dem Wettermeister)",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "wettertyp",
        Title           = "Wettermeister",
        Text            = "Ach jaa. Einen kleinen Tribut bräuchte ich dann auch noch...MEHEHEHEHEHE",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Es war so klar...Was brauchst du denn?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "wettertyp",
        Title           = "Wettermeister",
        Text            = "5000 Schwefel und 4000 Eisen...mehehehehe",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Ich schau was sich machen lässt. Wehe du legst uns rein. Dann gibt es Ärger.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = false,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function bau_fertig(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "garek",
        Title           = "Garek",
        Text            = "Dario, du hast es gechafft. Endlich floriert die Wirtschaft wieder und die Leute kommen zurück in die Gemeinde.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Gern geschehen Garek. Doch nun erzähl. Wo halten sich die Schergen von denen du gesprochen hast auf.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "garek",
        Title           = "Garek",
        Text            = "Das kann ich dir nicht sagen. Sie sind in den Westen gezogen. Jedoch ist der Weg dorthin durch die Witterungsumstände vorerst blockiert. Jedoch haben mir meine Kundschafter von einem Banditenaußenposten im Osten unserer Gemeinde erzählt. Auf den sollten wir uns zuerst fokussieren. ",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Hmmm...vielleicht finden wir dort auch Eisen. Das brauchen wir nämlich dringend, denn die Vorräte im Süden halten nicht ewig.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "bergpass",
        Title           = "Garek",
        Text            = "Alles klar. Ich habe Barmecia kontaktiert, die uns mit Truppen unterstützen. Sie kommen über den Bergpass von dem ihr auch gekommen seid.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Das sind gute Neuigkeiten. Wir sollten uns auf den Kampf vorbereiten.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "burg",
        Title           = "Mentor",
        Text            = "Herr, baut eine Armee auf und sichert den Weg aus dem Osten lieber ab. Sobald die Zeit um ist werden die Banditen euch angreifen.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function garek(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "garek",
        Title           = "Garek",
        Text            = "OHHHHHH....(wimmer)...Dario..guck dir an was diese Scharlatane getrieben haben...",
        DialogCamera    = true,
        Action          = MoveGarek,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Garek beruhige dich. Ich bin jetzt ja hier. Was machst du in Talgrund und wieso liegt hier alles in Schutt und Asche?",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "garek",
        Title           = "Garek",
        Text            = "Oh Dario...das waren Kerberos Schergen. Nach deiner Abreise in Old Kings Castle bin ich nach Talgrund gereist und wollte mich hier niederlassen und für dich deinen Heimatort verwalten. Nach einigen Monaten jedoch vielen die dunklen Truppen des Kerberos ein und griffen meine Gemeinde an. Ich versteckte mich mit den vier Siedlern hier und überlebte....zum Glück.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Garek, mein alter Freund. Wir werden hier alles so herichten, wie es vor dem Angriff war. Du musst mir nur sagen wo was gestanden hat.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_5",
        Target          = "garek",
        Title           = "Garek",
        Text            = "Danke Dario. Auf dich kann man sich immer verlassen. Also...",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_6",
        Target          = "bau_dz",
        Title           = "Bau des Dorfzentrums",
        Text            = "Hier muss ein Dorfzentrum errichtet werden.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_7",
        Target          = "bau_stein",
        Title           = "Bau der Steinmine",
        Text            = "Oben in Leonardos altem Lager muss eine Steinmine errichtet werden.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_8",
        Target          = "bau_lehm",
        Title           = "Bau einer Lehmgrube",
        Text            = "Hier musst du eine Lehmgrube bauen.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_9",
        Target          = "bau_hs",
        Title           = "Hier musst du eine Hoschule bauen.",
        Text            = "Bevor du unsere alte Hochschule wieder aufbaust, musst du die Ruinen abreißen. Unterhalb der Hochschule stand ein Haus und ein Bauernhof.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_10",
        Target          = "bau_sm",
        Title           = "Hier muss ein Sägewerk entstehen.",
        Text            = "An dieser Stelle stand unsere prächtige Sägemühle. Um sie wieder aufbauen zu können, musst der Wald erst gerodet werden.",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_11",
        Target          = "garek",
        Title           = "Ein zweites Dorfzentrum",
        Text            = "Früher gab es im süd westen des Waldes ein Dorfzentrum. Du solltest es finden und wieder aufbauen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_12",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Uff...das ist aber viel. Egal, wir schaffen das.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end

function outpost_win(_Receiver)
    local briefing = {RestoreCamera = true};
    local AP = AddPages(briefing);

    AP{
        Name            = "DP_1",
        Target          = "dario",
        Title           = "Dario",
        Text            = "Geschafft. Wir haben den Außenposten befreit. Und zusätzlich haben wir noch einige Gefangene aus den Händen der Banditen befreien können.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_2",
        Target          = "ari",
        Title           = "Ari",
        Text            = "ja, Geliebter. Stück für Stück bringen wir wieder Ordnung nach Talgrund. Wir sollten mit den ehemaligen Gefangenen sprechen.",
        DialogCamera    = true,
        Action          = DestroyBarmeciaSupport,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_3",
        Target          = "steinschlag1",
        Title           = "(Lautes Krachen)",
        Text            = "Oh nein Herr, ein Steinschlag hat den Weg nach Talgrund versperrt und das Lager unserer Verbündeten aus Barmecia zerstört. Es können keine weiteren Truppen zur Hilfe kommen...",
        DialogCamera    = false,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };
    AP{
        Name            = "DP_4",
        Target          = "gefangener1",
        Title           = "Mentor",
        Text            = "Sprecht mit den befreiten Gefangenen.",
        DialogCamera    = true,
        Action          = nil,
        RenderSky       = false,
        RenderFow       = true,
        DisableSkipping = false,
    };

    briefing.Finished = function()
    end
    return StartBriefing(briefing, _Receiver);
end


