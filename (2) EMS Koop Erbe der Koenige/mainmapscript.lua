-- Hier kommen meine Funktionen rein, die nach den Regeleinstellungen ausgeführt
-- werden sollen. Sind Regeln fest, dann wird es sofort ausgeführt.



function OnGameStart()

    --DebugFuncs
    --Tools.ExploreArea(1,1,100000)
    --CLogic.SetAttractionLimitOffset(1,1000)
    --BeginBriefing(1,"IntroID1")
    Syncer.Install()
    CreateSyncEvents()

    --Fix Escape during Cutscenes
    FixEscapeCutscene()

   --  Start IntroBrief
    if table.getn(GetActivePlayers()) > 1 then
        StartIntroErbe()
    end


    --Placeholders
    Placeholder.DefineNamePlaceholder("helias", "Helias")
    Placeholder.DefineNamePlaceholder("kerberos", "Kerberos")

    StartSimpleJob("DefeatBedingung")
    StartSimpleJob("Sieg")
    HQSelection()
    CreateWoodPile( "woodpile1", 1000000 )
    CreateWoodPile( "woodpile2", 1000000 )
    Logic.AddQuest(1, 1, MAINQUEST_OPEN, "@color:0,127,255 Erbe der Könige", "@color:255,255,255 Ein dunkler Schatten ragt über das Königreich von Dario. Nach seinem Tod ist der Tron unbesetzt und seine Gefährten gespalten. Es liegt an euch, die Krone für euch zu Gewinnen. @cr @cr Viel Erfolg wünscht Novator12", 1)
    Logic.AddQuest(2, 1, MAINQUEST_OPEN, "@color:0,127,255 Erbe der Könige", "@color:255,255,255 Ein dunkler Schatten ragt über das Königreich von Dario. Nach seinem Tod ist der Tron unbesetzt und seine Gefährten gespalten. Es liegt an euch, die Krone für euch zu Gewinnen. @cr @cr Viel Erfolg wünscht Novator12", 1)
    Logic.AddQuest(1, 2, MAINQUEST_OPEN, "@color:255,255,0 Auftrag", "@color:255,255,255 Kerberos ist mit seinem Vater Helias in Darios Reich angekommen. Eure Aufgabe ist es einen geeigneten Siedlungsbereich zu finden. @cr @cr @color:255,255,0 Hinweis: @color:255,255,255 Besigt hierzu alle Feinde im jeweiligen Territorium und bringt den Helden zu eurer Burg um diese einzunehmen. @cr @cr @color:255,0,0 Achtung: @color:255,255,255 Sputet euch. Ihr bleibt nicht auf ewig unentdeckt im alten Königreich!", 1)
    Logic.AddQuest(2, 2, MAINQUEST_OPEN, "@color:255,255,0 Auftrag", "@color:255,255,255 Kerberos ist mit seinem Vater Helias in Darios Reich angekommen. Eure Aufgabe ist es einen geeigneten Siedlungsbereich zu finden. @cr @cr @color:255,255,0 Hinweis: @color:255,255,255 Besigt hierzu alle Feinde im jeweiligen Territorium und bringt den Helden zu eurer Burg um diese einzunehmen. @cr @cr @color:255,0,0 Achtung: @color:255,255,255 Sputet euch. Ihr bleibt nicht auf ewig unentdeckt im alten Königreich!", 1)
    Erbe.SetupDiplomacy()
    StartSimpleJob("WaypointsFunc")
    PlaceVillageCenters()
    --Init Fixes
    ComfortsStart()
    FixStadtwache()
    CalvaryFormationSelection()


    --Init Triggers
    ActivateTriggers()

    --Truhen
    Treasure.RandomChest("chest1_1", 200, 800)
    Treasure.RandomChest("chest1_2", 200, 800)
    Treasure.RandomChest("chest2_1", 200, 800)
    Treasure.RandomChest("chest2_2", 200, 800)


    --AI Setup
    --Barmecia:
		AI.Player_EnableAi(3)
		AI.Village_SetSerfLimit(3,6)
		AI.Village_EnableConstructing(3,1)
		AI.Village_EnableRepairing(3, 1)
		AI.Village_EnableExtracting(3,1)
		AI.Player_SetResources(3, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(9)
		AI.Village_SetSerfLimit(9,6)
		AI.Village_EnableConstructing(9,1)
		AI.Village_EnableRepairing(9, 1)
		AI.Village_EnableExtracting(9,0)
		AI.Player_SetResources(9, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

		--Folklung:
		AI.Player_EnableAi(4)
		AI.Village_SetSerfLimit(4,6)
		AI.Village_EnableConstructing(4,1)
		AI.Village_EnableExtracting(4,1)
		AI.Player_SetResources(4, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(10)
		AI.Village_SetSerfLimit(10,6)
		AI.Village_EnableConstructing(10,1)
		AI.Village_EnableExtracting(10,0)
		AI.Player_SetResources(10, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(14)
		AI.Village_SetSerfLimit(14,6)
		AI.Village_EnableConstructing(14,1)
		AI.Village_EnableExtracting(14,0)
		AI.Player_SetResources(14, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

		--Varg:
		AI.Player_EnableAi(5)
		AI.Village_SetSerfLimit(5,6)
		AI.Village_EnableConstructing(5,1)
		AI.Village_EnableRepairing(5, 1)
		AI.Village_EnableExtracting(5,1)
		AI.Player_SetResources(5, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(11)
		AI.Village_SetSerfLimit(11,6)
		AI.Village_EnableConstructing(11,1)
		AI.Village_EnableRepairing(11, 1)
		AI.Village_EnableExtracting(11,0)
		AI.Player_SetResources(11, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(15)
		AI.Village_SetSerfLimit(15,6)
		AI.Village_EnableConstructing(15,1)
		AI.Village_EnableRepairing(15, 1)
		AI.Village_EnableExtracting(15,0)
		AI.Player_SetResources(15, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

		-- NPCS:
		-- AI.Player_EnableAi(6)
		-- AI.Village_SetSerfLimit(6,6)
		-- AI.Village_EnableConstructing(6,1)
		-- AI.Village_EnableRepairing(6, 1)
		-- AI.Village_EnableExtracting(6,1)
		-- AI.Player_SetResources(6, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

		--Dario:
		AI.Player_EnableAi(7)
		AI.Village_SetSerfLimit(7,6)
		AI.Village_EnableConstructing(7,1)
		AI.Village_EnableRepairing(7, 1)
		AI.Village_EnableExtracting(7,1)
		AI.Player_SetResources(7, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(12)
		AI.Village_SetSerfLimit(12,6)
		AI.Village_EnableConstructing(12,1)
		AI.Village_EnableRepairing(12, 1)
		AI.Village_EnableExtracting(12,0)
		AI.Player_SetResources(12, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

		--Räuber:
		AI.Player_EnableAi(8)
		AI.Village_SetSerfLimit(8,6)
		AI.Village_EnableConstructing(8,1)
		AI.Village_EnableRepairing(8, 1)
		AI.Village_EnableExtracting(8,1)
		AI.Player_SetResources(8, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        AI.Player_EnableAi(13)
		AI.Village_SetSerfLimit(13,6)
		AI.Village_EnableConstructing(13,1)
		AI.Village_EnableRepairing(13, 1)
		AI.Village_EnableExtracting(13,0)
		AI.Player_SetResources(13, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000)

        --Tech für KI

        for i=3,8,1 do
            Logic.SetTechnologyState(i, Technologies.T_LeatherMailArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_ChainMailArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_PlateMailArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_SoftArcherArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_PaddedArcherArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_LeatherArcherArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_MasterOfSmithery, 3)
            Logic.SetTechnologyState(i, Technologies.T_IronCasting, 3)
            Logic.SetTechnologyState(i, Technologies.T_Fletching, 3)
            Logic.SetTechnologyState(i, Technologies.T_BodkinArrow, 3)
            Logic.SetTechnologyState(i, Technologies.T_WoodAging, 3)
            Logic.SetTechnologyState(i, Technologies.T_Turnery, 3)
            Logic.SetTechnologyState(i, Technologies.T_EnhancedGunPowder, 3)
            Logic.SetTechnologyState(i, Technologies.T_BlisteringCannonballs, 3)
            Logic.SetTechnologyState(i, Technologies.T_BetterTrainingBarracks, 3)
            Logic.SetTechnologyState(i, Technologies.T_BetterTrainingArchery, 3)
            Logic.SetTechnologyState(i, Technologies.T_BetterChassis, 3)
            Logic.SetTechnologyState(i, Technologies.T_Masonry, 3)
            Logic.SetTechnologyState(i, Technologies.T_Shoeing, 3)
            Logic.SetTechnologyState(i, Technologies.T_Masonry, 3)
            Logic.SetTechnologyState(i, Technologies.T_FleeceArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_FleeceLinedLeatherArmor, 3)
            Logic.SetTechnologyState(i, Technologies.T_LeadShot, 3)
            Logic.SetTechnologyState(i, Technologies.T_Sights, 3)
        end

        --PlayerStartCalls
        StopPayday1 = StartSimpleJob("ResetGoldTillStart1")
        StopPayday2 = StartSimpleJob("ResetGoldTillStart2")

        ResourcesCompleted1 = StartSimpleJob("ResourcesPlayer1")
        ResourcesCompleted2 = StartSimpleJob("ResourcesPlayer2")

        Logic.SetPlayerPaysLeaderFlag(1, 0)
        Logic.SetPlayerPaysLeaderFlag(2, 0)

        SerfsDeadJob = StartSimpleJob("SerfsDead")
        VillageCJob = StartSimpleJob("VillageCentersBuild")

        HeliasChecker = StartSimpleJob("HeliasClaimCastle")
        KerberosChecker = StartSimpleJob("KerberosClaimCastle")

        HeliasCastleClaimed = false
        KerberosCastleClaimed = false

        for i=1,2,1 do
            Logic.SetTechnologyState(i,Technologies.B_Residence,0)
            Logic.SetTechnologyState(i,Technologies.B_Farm,0)
            Logic.SetTechnologyState(i,Technologies.B_University,0)
            Logic.SetTechnologyState(i,Technologies.B_Claymine,0)
            Logic.SetTechnologyState(i,Technologies.B_Village,0)
        end

        

        --FolklungBarbFight Inv Gebäude
        for i =1,4,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tower"..i.."_inv"),1)
        end
        for i =1,2,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tent"..i.."_inv"),1)
        end
        Logic.SetEntityInvulnerabilityFlag(GetID("id4_claymine_inv"),1)
        Logic.SetEntityInvulnerabilityFlag(GetID("FolklungCastle"),1)
end



function StartIntroErbe()
    -- StartOwnBinkVideo("OldKingsCastle",1)  --nur wenn Bik Video nicht skippable ist
    -- StartOwnBinkVideo("OldKingsCastle",2)  --nur wenn Bik Video nicht skippable ist
    Syncer.InvokeEvent(SyncEventActivateArmys)
    StartIntroBriefing()
end

-- function StartOwnBinkVideo(_name,_PlayerID)
-- 	Mouse.CursorHide()
-- 	Sound.PauseAll(true)
--     local orig = InputCallback_KeyDown;
--     InputCallback_KeyDown = function() return true; end;
--     Framework.PlayVideo( "Videos\\".._name..".bik" )
--     InputCallback_KeyDown = orig;

--     --cutscene hier starten

-- 	Sound.PauseAll(false)
-- 	Mouse.CursorShow()
-- end


function ActivateSyncArmys()
    if not ArmiesActivated then
        ArmiesActivated = true
        --StartArmeen
        ActivateNorfolkAttackers()
        ActivateBarmeciaAttackers()
        ActivateID8FightID7() 
        ActivateBarbarenAttackers()
        ActivateFolklungAttackers()
        ActivateVargFlankeAttackers()
        --Händler kommt das erste mal nach 20 min
        StartCountdown(60*20,InitTrader,false)
        --Upgrade AI Init
        StartCountdown(60*40,UpgradeAI,false)
    end
end

-- Hier kommen die Funktionen rein, die nach Ende der Friedenszeit ausgeführt
-- werden sollen. Gibt es keine Friedenszeit wird es sofort ausgeführt, sobald
-- die Regeln eingestellt wurden.
function OnPeacetimeOver()
    ActivateBanditIron()
    ActivateBanditAttackers()
    ReplaceEntity("sp1_gate",Entities.XD_PalisadeGate2)

    --ActivateAttackers
    StartSimpleJob("NorfolkAttack1")
	StartSimpleJob("NorfolkAttack2")
	if table.getn(GetActivePlayers())>1 then
		DelayStrongerNorfolk1()
		DelayStrongerNorfolk2()
        DelayStrongerBarmeica1()
		DelayStrongerBarmeica2()
        Logic.AddQuest(1, 3, MAINQUEST_CLOSED, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
        Logic.AddQuest(2, 3, MAINQUEST_CLOSED, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
        Logic.AddQuest(1, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(1, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
	else
		DelayStrongerNorfolk1()
		DelayStrongerNorfolk2()
        DelayStrongerBarmeica1()
		DelayStrongerBarmeica2()
        Logic.AddQuest(1, 3, MAINQUEST_CLOSED, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
	end


end

----------------------Game Funcs--------------------------------------------------------------------------
function StartIntroBriefing()
    if table.getn(GetActivePlayers())>1 then
        BeginBriefing(1,"IntroID1")
        BeginBriefing(2,"IntroID1")
    else
		BeginBriefing(1,"IntroID1")
	end
end 


function VillageCentersBuild()
    if table.getn(GetActivePlayers()) > 1 then
        if VillageCenterBuild1 == true and VillageCenterBuild2 == true then
            EndJob(SerfsDeadJob)
            Logic.AddQuest(1, 3, MAINQUEST_OPEN, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
            Logic.AddQuest(2, 3, MAINQUEST_OPEN, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
            return true
        end
    else
        if VillageCenterBuild1 == true then
            EndJob(SerfsDeadJob)
            Logic.AddQuest(1, 3, MAINQUEST_OPEN, "@color:255,255,0 Siedlungsbau", "@color:255,255,255 Errichtet euch eine gerüstete Siedlung. @cr @cr Eure Gegner werden euch zum Ablauf des Waffenstillstands entdeckt haben.", 1)
            return true
        end
    end
end

function HeliasClaimCastle()
    if IsDestroyed("sp1_bandit1_tent1") and
    IsDestroyed("sp1_bandit1_tent2") and
    IsDestroyed("sp1_bandit1_tower1") and
    IsDestroyed("sp1_bandit1_tower2") and
    IsDestroyed("sp1_bandit1_tower3") and
    IsDestroyed("sp1_bandit1_tower4") and
    IsNear("helias","hq1",1300) then
        Logic.SetTechnologyState(1,Technologies.B_Residence,3)
        Logic.SetTechnologyState(1,Technologies.B_Farm,3)
        Logic.SetTechnologyState(1,Technologies.B_University,3)
        Logic.SetTechnologyState(1,Technologies.B_Claymine,3)
        Logic.SetTechnologyState(1,Technologies.B_Village,3)
        ChangePlayer("hq1",1)
        GUI.DestroyMinimapPulse(GetPosition("hq1").X,GetPosition("hq1").Y)
        Logic.AddQuest(1, 2, MAINQUEST_CLOSED, "@color:255,255,0 Auftrag", "@color:255,255,255 Kerberos ist mit seinem Vater Helias in Darios Reich angekommen. Eure Aufgabe ist es einen geeigneten Siedlungsbereich zu finden. @cr @cr @color:255,255,0 Hinweis: @color:255,255,255 Besigt hierzu alle Feinde im jeweiligen Territorium und bringt den Helden zu eurer Burg um diese einzunehmen. @cr @cr @color:255,0,0 Achtung: @color:255,255,255 Sputet euch. Ihr bleibt nicht auf ewig unentdeckt im alten Königreich!", 1)
        local PlayerName = UserTool_GetPlayerName(1);
        local PlayerColor = "@color:"..table.concat({GUI.GetPlayerColor(1)}, ",");
        Message("@color:127,255,0 Mentor: @color:255,255,255 "..PlayerColor.." "..PlayerName.." @color:255,255,255 hat seine Burg eingenommen!")
        HeliasCastleClaimed = true
        return true
    end
end

function KerberosClaimCastle()
    if IsDestroyed("sp2_bandit1_tent1") and 
    IsDestroyed("sp2_bandit1_tent2") and 
    IsDestroyed("sp2_bandit1_tower1") and 
    IsDestroyed("sp2_bandit1_tent3") and
    IsNear("kerberos","hq2",1300) then
        Logic.SetTechnologyState(2,Technologies.B_Residence,3)
        Logic.SetTechnologyState(2,Technologies.B_Farm,3)
        Logic.SetTechnologyState(2,Technologies.B_University,3)
        Logic.SetTechnologyState(2,Technologies.B_Claymine,3)
        Logic.SetTechnologyState(2,Technologies.B_Village,3)
        ChangePlayer("hq2",2)
        Logic.AddQuest(2, 2, MAINQUEST_CLOSED, "@color:255,255,0 Auftrag", "@color:255,255,255 Kerberos ist mit seinem Vater Helias in Darios Reich angekommen. Eure Aufgabe ist es einen geeigneten Siedlungsbereich zu finden. @cr @cr @color:255,255,0 Hinweis: @color:255,255,255 Besigt hierzu alle Feinde im jeweiligen Territorium und bringt den Helden zu eurer Burg um diese einzunehmen. @cr @cr @color:255,0,0 Achtung: @color:255,255,255 Sputet euch. Ihr bleibt nicht auf ewig unentdeckt im alten Königreich!", 1)
        GUI.DestroyMinimapPulse(GetPosition("hq2").X,GetPosition("hq2").Y)
        local PlayerName = UserTool_GetPlayerName(2);
        local PlayerColor = "@color:"..table.concat({GUI.GetPlayerColor(2)}, ",");
        Message("@color:127,255,0 Mentor: @color:255,255,255 "..PlayerColor.." "..PlayerName.." @color:255,255,255 hat seine Burg eingenommen!")
        KerberosCastleClaimed = true
        return true
    end
end

PlayerLostFlag = false

function SerfsDead()
    if table.getn(GetActivePlayers()) > 1 then
        if IsDead("sp1_serf1") and IsDead("sp1_serf2") and VillageCenterBuild1 == false then
            PlayerLostFlag = true
            return true;
        elseif IsDead("sp2_serf1") and IsDead("sp2_serf2") and VillageCenterBuild2 == false then
            PlayerLostFlag = true
            return true;
        end
    else
        if IsDead("sp1_serf1") and IsDead("sp1_serf2") and VillageCenterBuild1 == false then
            PlayerLostFlag = true
            return true;
        end
    end
end


VillageCenterBuild1 = false
VillageCenterBuild2 = false


 GameCallback_OnBuildingConstructionCompleteOld=GameCallback_OnBuildingConstructionComplete
 function GameCallback_OnBuildingConstructionComplete(_BuildingID2,_PlayerID2)
 GameCallback_OnBuildingConstructionCompleteOld(_BuildingID2,_PlayerID2)
    local pos = GetPosition(_BuildingID2)
    local _,ent = Logic.GetEntitiesInArea(Entities.PB_VillageCenter1,pos.X,pos.Y,1000,1)
    if Logic.GetPlayerEntities(1, Entities.PB_VillageCenter1, 1) == 1 and VillageCenterBuild1 == false and Logic.IsConstructionComplete(ent) == 1 then
        Logic.SetPlayerPaysLeaderFlag(1, 1)
        EndJob(StopPayday1)
        VillageCenterBuild1 = true
        local PlayerName = UserTool_GetPlayerName(1);
        local PlayerColor = "@color:"..table.concat({GUI.GetPlayerColor(1)}, ",");
    Message("@color:127,255,0 Mentor: @color:255,255,255 "..PlayerColor.." "..PlayerName.." @color:255,255,255 kann nun Leibeigene ausbilden!")
        
    end
    if Logic.GetPlayerEntities(2, Entities.PB_VillageCenter1, 1) == 1 and VillageCenterBuild2 == false and Logic.IsConstructionComplete(ent) == 1 then
        Logic.SetPlayerPaysLeaderFlag(2, 1)
        EndJob(StopPayday2)
        VillageCenterBuild2 = true
        local PlayerName = UserTool_GetPlayerName(2);
        local PlayerColor = "@color:"..table.concat({GUI.GetPlayerColor(2)}, ",");
    Message("@color:127,255,0 Mentor: @color:255,255,255 "..PlayerColor.." "..PlayerName.." @color:255,255,255 kann nun Leibeigene ausbilden!")
    end
    if LighthouseTable[_PlayerID2] and _BuildingID2 == LighthouseTable[_PlayerID2].LighthouseID then
    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN,nil,"SetLighthouse",1,nil,{_PlayerID2})
    end
     
 end

--PlayerStartSetup


function ResourcesPlayer1()
    if CheckMode == 1 and HeliasCastleClaimed == true then
        -- Initial Resources
        local InitGoldRaw 		= 1800
        local InitClayRaw 		= 2500
        local InitWoodRaw 		= 2500
        local InitStoneRaw 		= 2000
        local InitIronRaw 		= 450
        local InitSulfurRaw		= 250

        
        --Add Players Resources
        Tools.GiveResouces(1, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
        EndJob(ResourcesCompleted1)
    elseif CheckMode == 2 and HeliasCastleClaimed == true then
         -- Initial Resources
         local InitGoldRaw 		= 1200
         local InitClayRaw 		= 1500
         local InitWoodRaw 		= 1500
         local InitStoneRaw 	= 1000
         local InitIronRaw 		= 150
         local InitSulfurRaw	= 50
 
         
         --Add Players Resources

        Tools.GiveResouces(1, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
        EndJob(ResourcesCompleted1)
    elseif CheckMode == 3 and HeliasCastleClaimed == true then
         -- Initial Resources
         local InitGoldRaw 		= 900
         local InitClayRaw 		= 800
         local InitWoodRaw 		= 800
         local InitStoneRaw 	= 800
         local InitIronRaw 		= 0
         local InitSulfurRaw	= 0
 
         
         --Add Players Resources

         Tools.GiveResouces(1, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
         EndJob(ResourcesCompleted1)

    end

 end

 function ResourcesPlayer2()
    if CheckMode == 1 and KerberosCastleClaimed == true then
        -- Initial Resources
        local InitGoldRaw 		= 1800
        local InitClayRaw 		= 2500
        local InitWoodRaw 		= 2500
        local InitStoneRaw 		= 2000
        local InitIronRaw 		= 450
        local InitSulfurRaw		= 250

        
        --Add Players Resources
        Tools.GiveResouces(2, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
        EndJob(ResourcesCompleted2)
    elseif CheckMode == 2 and KerberosCastleClaimed == true then
         -- Initial Resources
         local InitGoldRaw 		= 1200
         local InitClayRaw 		= 1500
         local InitWoodRaw 		= 1500
         local InitStoneRaw 	= 1000
         local InitIronRaw 		= 150
         local InitSulfurRaw	= 50
 
         
         --Add Players Resources

        Tools.GiveResouces(2, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
        EndJob(ResourcesCompleted2)
    elseif CheckMode == 3 and KerberosCastleClaimed == true then
         -- Initial Resources
         local InitGoldRaw 		= 900
         local InitClayRaw 		= 800
         local InitWoodRaw 		= 800
         local InitStoneRaw 	= 800
         local InitIronRaw 		= 0
         local InitSulfurRaw	= 0
 
         
         --Add Players Resources

         Tools.GiveResouces(2, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
         EndJob(ResourcesCompleted2)
    end

 end


 function ResetGoldTillStart1()
    if CheckMode == 0 then
        gold1 = Logic.GetPlayersGlobalResource(1, ResourceType.GoldRaw)
        Logic.SubFromPlayersGlobalResource(1, ResourceType.Gold, gold1)
    end
end

function ResetGoldTillStart2()
    if CheckMode == 0 then
        gold2 = Logic.GetPlayersGlobalResource(2, ResourceType.GoldRaw)
        Logic.SubFromPlayersGlobalResource(2, ResourceType.Gold, gold2)
    end
end



------------------------Setup Mode-----------------------------------------------------------------------

CheckMode = 0



--Easy

function Erbe.Mode1()
    CheckMode = 1

    --StartTruppen
    for i = 1, 2, 1 do
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp1")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp2")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp3")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp4")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp5")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp6")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp7")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp8")
        CreateMilitaryGroup(i, Entities.PV_Cannon4, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp9")
        CreateMilitaryGroup(i, Entities.PV_Cannon4, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp10")
    end


    Message("Schwierigkeit: @color:57,245,26 LEICHT @color:255,255,255 wurde gewaehlt!")
    Syncer.InvokeEvent(SyncEventActivateModeSelectionArmys)
    Erbe.SetupAI()
end

---Normal

function Erbe.Mode2()
    CheckMode = 2

    --StartTruppen
    for i = 1, 2, 1 do
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp1")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp2")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp3")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp4")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp5")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp6")
        CreateMilitaryGroup(i, Entities.PV_Cannon2, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp7")
        CreateMilitaryGroup(i, Entities.PV_Cannon2, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp8")
    end


    Message("Schwierigkeit: @color:255,150,0 NORMAL @color:255,255,255 wurde gewaehlt!")
    Syncer.InvokeEvent(SyncEventActivateModeSelectionArmys)
    Erbe.SetupAI()
end

---Hard

function Erbe.Mode3()
    CheckMode = 3

    --StartTruppen
    for i = 1, 2, 1 do
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp1")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help1"), "sp" .. i .. "_trupp2")
        CreateMilitaryGroup(i, Entities.PU_LeaderSword3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp3")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help2"), "sp" .. i .. "_trupp4")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp5")
        CreateMilitaryGroup(i, Entities.PU_LeaderBow3, 8, GetPosition("sp" .. i .. "_help3"), "sp" .. i .. "_trupp6")
        CreateMilitaryGroup(i, Entities.PV_Cannon2, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp7")
        CreateMilitaryGroup(i, Entities.PV_Cannon2, 0, GetPosition("sp" .. i .. "_help4"), "sp" .. i .. "_trupp8")
    end


    Message("Schwierigkeit: @color:255,0,0 SCHWER @color:255,255,255 wurde gewaehlt!")
    Syncer.InvokeEvent(SyncEventActivateModeSelectionArmys)
    Erbe.SetupAI()
end


function ActivateSyncModeArmys()
    if not ModeSelectionArmiesActivated then
        ModeSelectionArmiesActivated = true
        ActivateBandits()
        ActivateIronDef()
    end
end

------------------------------------------------------------------------------------------------------------------


------------------------General Setup--------------------------------------------------------------------




--NovatorDiplomacy Func für mehere AI ID´s 
--  
-- Wenn eine AI mehrere ID´s hat werden die Gesinnungen für alle zugehörigen ID´s gegenüber einer anderen AI/Spieler gesetzt.  
--
-- _diploState == 1 => Friendly 
--
-- _diploState == 2 => Neutral
--
-- _diploState == 3 => Hostile


function SetTableDiplomacyState(_diploState, _AITableID1, _AITableID2)
    assert(type(_diploState) == "number", "_diplostate must be a number value.")
    assert(type(_AITableID1) == "table", "_AITable must be a table.")
    assert(type(_AITableID2) == "table", "_AITable must be a table.")
    if _diploState == 1 then
        for i = 1, table.getn(_AITableID1) do
            for j = 1, table.getn(_AITableID2) do
                SetFriendly(_AITableID1[i], _AITableID2[j])
            end
        end
    elseif _diploState == 2 then
        for i = 1, table.getn(_AITableID1) do
            for j = 1, table.getn(_AITableID2) do
                SetNeutral(_AITableID1[i], _AITableID2[j])
            end
        end
    elseif _diploState == 3 then
        for i = 1, table.getn(_AITableID1) do
            for j = 1, table.getn(_AITableID2) do
                SetHostile(_AITableID1[i], _AITableID2[j])
            end
        end
    end
end

--Diplomacy

function Erbe.SetupDiplomacy()
   Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)

    Player1State = {1}
    Player2State = {2}
    BarmeciaState = {3,9}
    FolklungState = {4,10,14}
    VargState = {5,11,15}
    NPCState = {6}
    DarioState = {7,12}
    RobberState = {8,13}
    
    SetTableDiplomacyState(1, Player1State, Player2State)

    SetTableDiplomacyState(1, Player1State, NPCState)
    SetTableDiplomacyState(1, Player2State, NPCState)

    SetTableDiplomacyState(2, Player1State, BarmeciaState)
    SetTableDiplomacyState(2, Player2State, BarmeciaState)

    SetTableDiplomacyState(2, Player1State, FolklungState)
    SetTableDiplomacyState(2, Player2State, FolklungState)

    SetTableDiplomacyState(3, Player1State, VargState)
    SetTableDiplomacyState(3, Player2State, VargState)

    SetTableDiplomacyState(2, Player1State, DarioState)
    SetTableDiplomacyState(2, Player2State, DarioState)

    SetTableDiplomacyState(3, Player1State, RobberState)
    SetTableDiplomacyState(3, Player2State, RobberState)


    SetTableDiplomacyState(1, BarmeciaState, FolklungState)
    SetTableDiplomacyState(3, BarmeciaState, VargState)
    SetTableDiplomacyState(2, BarmeciaState, NPCState)
    SetTableDiplomacyState(1, BarmeciaState, DarioState)
    SetTableDiplomacyState(3, BarmeciaState, RobberState)
    
    SetTableDiplomacyState(3, FolklungState, VargState)
    SetTableDiplomacyState(1, FolklungState, DarioState)
    SetTableDiplomacyState(3, FolklungState, RobberState)
    SetTableDiplomacyState(2, FolklungState, NPCState)

    SetTableDiplomacyState(2, VargState, NPCState)
    SetTableDiplomacyState(3, VargState, DarioState)
    SetTableDiplomacyState(1, VargState, RobberState)

    SetTableDiplomacyState(2, NPCState, DarioState)
    SetTableDiplomacyState(2, NPCState, RobberState)

    SetTableDiplomacyState(3, DarioState, RobberState)


end
---------------------------------------------------------------------------------------------------------


------------------------Defeat---------------------------------------------------------------------------
function DefeatBedingung()
    if table.getn(GetActivePlayers()) >1 then
        if not IsExisting("hq1") or not IsExisting("hq2") or PlayerLostFlag == true then
           Logic.PlayerSetGameStateToLost(1);
           Logic.PlayerSetGameStateToLost(2);
           return true;
        end
    else
        if not IsExisting("hq1") or PlayerLostFlag == true then
            Logic.PlayerSetGameStateToLost(1);
            return true;
        end
    end
end

---------------------------------------------------------------------------------------------------------

function Sieg()
    if IsDead("hq7") and ("hq4") then
        if table.getn(GetActivePlayers())==2 then
            Logic.PlayerSetGameStateToWon(1)
            Logic.PlayerSetGameStateToWon(2)
            return true;
        elseif table.getn(GetActivePlayers())==1 then
            Logic.PlayerSetGameStateToWon(1)
            return true;
        end
    end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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

---------------------------------------------------------------------------------------------------------------------------------------
--Fixes

--CalvarySelection Fix

function CalvaryFormationSelection()
    GameCallback_GUI_SelectionChangedCalvary = GameCallback_GUI_SelectionChanged
    function GameCallback_GUI_SelectionChanged()
        GameCallback_GUI_SelectionChangedCalvary()
        local EntityId = GUI.GetSelectedEntity()
        if Logic.GetEntityTypeName(Logic.GetEntityType(EntityId)) == "PU_LeaderCavalry1" or
            Logic.GetEntityTypeName(Logic.GetEntityType(EntityId)) == "PU_LeaderCavalry2" or
            Logic.GetEntityTypeName(Logic.GetEntityType(EntityId)) == "PU_LeaderHeavyCavalry1" or
            Logic.GetEntityTypeName(Logic.GetEntityType(EntityId)) == "PU_LeaderHeavyCavalry2" then
            XGUIEng.ShowWidget(gvGUI_WidgetID.SelectionLeader, 1)
        end
        if Logic.GetEntityTypeName(Logic.GetEntityType(EntityId)) == "PU_BattleSerf" then
            XGUIEng.ShowWidget("Commands_Leader",1) -- battleserf formation fix
        end
    end
end

--Serf ausbilden
function HQSelection()
    GameCallback_GUI_SelectionChangedHQ = GameCallback_GUI_SelectionChanged
    function GameCallback_GUI_SelectionChanged()
        GameCallback_GUI_SelectionChangedHQ()
        local player = GUI.GetPlayerID()
        local sel = GUI.GetSelectedEntity()
        local ty = Logic.GetEntityType(sel)
        if (ty == Entities.PB_Headquarters1 or ty == Entities.PB_Headquarters2 or ty == Entities.PB_Headquarters3) and player == 1 and VillageCenterBuild1 == false then
            XGUIEng.ShowWidget("Buy_Serf", 0)
        elseif (ty == Entities.PB_Headquarters1 or ty == Entities.PB_Headquarters2 or ty == Entities.PB_Headquarters3) and player == 2 and VillageCenterBuild2 == false then
            XGUIEng.ShowWidget("Buy_Serf", 0)
        else
            XGUIEng.ShowWidget("Buy_Serf", 1)
        end
    end
end

--Stadtwachenfix
function FixStadtwache()
   GameCallback_OnTechnologyResearchedOriginal = GameCallback_OnTechnologyResearched
   function GameCallback_OnTechnologyResearched( _PlayerID, _TechnologyType )
       GameCallback_OnTechnologyResearchedOriginal( _PlayerID,_TechnologyType)
       if _TechnologyType == Technologies.T_TownGuard then
       Logic.SetTechnologyState(_PlayerID,Technologies.T_CityGuard, 3)
       end
   end
end
   --


--##################################################################--
--################ Cannon / Serf Heal by P4F #######################--
--##################################################################--

function ComfortsStart()
   SerfTablePlayer1={}
   CannonTablePlayer1={}
   Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED,"","EV_ON_ENTITY_CREATED",1)
   StartSimpleJob("SJ_Refresh_Hp_Of_Serfs_And_Cannons_Player1")
   --
   if XNetwork.GameInformation_IsHumanPlayerAttachedToPlayerID(2) == 1 then
   SerfTablePlayer2={}
   CannonTablePlayer2={}
   StartSimpleJob("SJ_Refresh_Hp_Of_Serfs_And_Cannons_Player2")
   end
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
-- Player 2
function SJ_Refresh_Hp_Of_Serfs_And_Cannons_Player2()
   for i = table.getn(SerfTablePlayer2), 1, -1 do
       if IsAlive(SerfTablePlayer2[i]) then
           if GetHealth(SerfTablePlayer2[i]) < 100 then
               SetHealth(SerfTablePlayer2[i], GetHealth(SerfTablePlayer2[i]) + 1 )
           end
       else
           table.remove(SerfTablePlayer2, i)
       end
   end

   for i = table.getn(CannonTablePlayer2), 1, -1 do
       if IsAlive(CannonTablePlayer2[i]) then
           if GetHealth(CannonTablePlayer2[i]) < 100 then
               SetHealth(CannonTablePlayer2[i], GetHealth(CannonTablePlayer2[i]) + 1 )
           end
       else
           table.remove(CannonTablePlayer2, i)
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

   if XNetwork.GameInformation_IsHumanPlayerAttachedToPlayerID(2) == 1 then
       if ent_P == 2 then
           if ent_typ == "PU_Serf" then
           table.insert(SerfTablePlayer2,ent_ID)
           elseif ent_typ == "PV_Cannon1" or ent_typ == "PV_Cannon2" or ent_typ == "PV_Cannon3" or ent_typ == "PV_Cannon4" then
           table.insert(CannonTablePlayer2,ent_ID)
           end
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
-- schmelings stuff

function SetInvisibility(id, flag)
	if HistoryFlag == nil then
		if XNetwork.Manager_IsNATReady then
			HistoryFlag = 1
		else
			HistoryFlag = 0
		end
	end

	local idtemp
	if type(id) == "number" then
		idtemp = id
	end
	if type(id) == "string" then
		idtemp = Logic.GetEntityIDByName(id)
	end

	if flag then
		if HistoryFlag == 1 then
			Logic.SetEntityScriptingValue(idtemp, -26, 513)
		elseif HistoryFlag == 0 then
			Logic.SetEntityScriptingValue(idtemp, -30, 513)
		end
	else
		if HistoryFlag == 1 then
			Logic.SetEntityScriptingValue(idtemp, -26, 65793)
		elseif HistoryFlag == 0 then
			Logic.SetEntityScriptingValue(idtemp, -30, 65793)
		end
	end
end



---------------------------------------Cutscene Fix----------------------------------------------------------

function FixEscapeCutscene()

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

    function GameCallback_Escape()
        if IsBriefingActive == nil or not IsBriefingActive() then
            gvInterfaceCinematicSelectedEntites = {0}
            Camera.FollowEntity(0)
            -- Cutscene.Cancel()        
            
        elseif IsBriefingActive ~= nil then
            NextBriefingPage()
        end
        
    end

    function SetInternalClippingLimitMax(_val)

        assert(type(_val) == "number", "Clipping Limit needs to be a number")
        CUtilMemory.GetMemory(tonumber("0x77A7E8", 16))[0]:SetFloat(_val)
        
    end
    function GetInternalClippingLimitMax()
  
  
        return CUtilMemory.GetMemory(tonumber("0x77A7E8", 16))[0]:GetFloat()
        
    end
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



function PlaceVillageCenters()
    --VillageCenter ID5
    local pos1 = GetPosition("vc_id5")
    VC_ID5 = Logic.CreateEntity(Entities.PB_VillageCenter2,pos1.X,pos1.Y,270,6)
    --VillageCenter ID4_1
    local pos2 = GetPosition("vc_id4_1")
    VC_ID4_1 = Logic.CreateEntity(Entities.PB_VillageCenter3,pos2.X,pos2.Y,0,6)
    --VillageCenter ID4_2
    local pos3 = GetPosition("vc_id4_2")
    VC_ID4_2 = Logic.CreateEntity(Entities.PB_VillageCenter1,pos3.X,pos3.Y,0,6)
    --VillageCenter ID4_3
    local pos4 = GetPosition("vc_id4_3")
    VC_ID4_3 = Logic.CreateEntity(Entities.PB_VillageCenter2,pos4.X,pos4.Y,0,6)
    --VillageCenter ID4_4
    local pos8 = GetPosition("vc_id4_4")
    VC_ID4_4 = Logic.CreateEntity(Entities.PB_VillageCenter3,pos8.X,pos8.Y,0,6)
    --VillageCenter ID7_1
    local pos5 = GetPosition("vc_id7_1")
    VC_ID7_1 = Logic.CreateEntity(Entities.PB_VillageCenter1,pos5.X,pos5.Y,180,6)
    --VillageCenter ID7_2
    local pos6 = GetPosition("vc_id7_2")
    VC_ID7_2 = Logic.CreateEntity(Entities.PB_VillageCenter3,pos6.X,pos6.Y,180,6)
    --VillageCenter ID8
    local pos7 = GetPosition("vc_id8")
    VC_ID8 = Logic.CreateEntity(Entities.PB_VillageCenter1,pos7.X,pos7.Y,270,6)
end

function ChangeKIBuildings()
    --Change VC
    ChangePlayer(VC_ID5,5)
    ChangePlayer(VC_ID4_1,4)
    ChangePlayer(VC_ID4_2,4)
    ChangePlayer(VC_ID4_3,4)
    ChangePlayer(VC_ID4_4,4)
    ChangePlayer(VC_ID7_1,7)
    ChangePlayer(VC_ID7_2,7)
    ChangePlayer(VC_ID8,8)

    --Change HQ´s
    ChangePlayer("hq4",4)
    ChangePlayer("outpost_id4",4)
    ChangePlayer("hq7",7)
    ChangePlayer("hq8",8)
end




function CreateSyncEvent()
    if CNetwork then
        CNetwork.SetNetworkHandler("SyncCallback_StartOutpostUpgrade",
            function(name, _PlayerID, _ScriptName, _Type, _Time)
                if CNetwork.IsAllowedToManipulatePlayer(name, _PlayerID) then
                    SyncCallback_StartOutpostUpgrade(_PlayerID, _ScriptName, _Type, _Time);
                end;
            end
        );
    end;
end


function CreateSyncEvents()
    SyncEventID1 = Syncer.CreateEvent(DelayStrongerBarbarians1);
    SyncEventID2 = Syncer.CreateEvent(DelayStrongerBarbarians2);

    SyncEventID3 = Syncer.CreateEvent(DelayStrongerFolklungJob1);
    SyncEventID4 = Syncer.CreateEvent(DelayStrongerFolklungJob2);

    SyncEventID5 = Syncer.CreateEvent(DelayStrongerBandits1);
    SyncEventID6 = Syncer.CreateEvent(DelayStrongerBandits2);

    SyncEventID7 = Syncer.CreateEvent(DelayStrongerVargBar1);
    SyncEventID8 = Syncer.CreateEvent(DelayStrongerVargBar2);

    SyncEventID9 = Syncer.CreateEvent(SyncLeoBrief);
    SyncEventID10 = Syncer.CreateEvent(SyncGuardBrief);

    SyncEventActivateArmys = Syncer.CreateEvent(ActivateSyncArmys);
    SyncEventActivateModeSelectionArmys = Syncer.CreateEvent(ActivateSyncModeArmys);
end