-- Hier kommen meine Funktionen rein, die nach den Regeleinstellungen ausgeführt
-- werden sollen. Sind Regeln fest, dann wird es sofort ausgeführt.
function OnGameStart()
    AnfangsBriefing()
    StartFarming(51877.4,35506.6,8)
    CreateCaravan()
    StartSimpleJob("DefeatBedingung")
    StartSimpleJob("Sieg")
    TickPeace = StartSimpleJob("TickPeacetime")
    CreateWoodPile( "woodpile1", 1000000 )
    CreateWoodPile( "woodpile2", 1000000 )
    Logic.AddQuest(1, 1, MAINQUEST_OPEN, "Farben des Glaubens", "Willkommen in diesem wunderschönen Fleckchen Land. @cr @cr Tipp: @cr Im Tributmenue gibt es so einiges zu entdecken. @cr @cr Viel Spaß beim Spielen wuenscht Novator12.", 1)
    Logic.AddQuest(2, 1, MAINQUEST_OPEN, "Farben des Glaubens", "Willkommen in diesem wunderschönen Fleckchen Land. @cr @cr Tipp: @cr Im Tributmenue gibt es so einiges zu entdecken. @cr @cr Viel Spaß beim Spielen wuenscht Novator12.", 1)
    SetupDiplomacy()
    Tribut1()
    Tribut2()
    Tribut3()
    StartSimpleJob("IsModeSelected")
    StartSimpleJob("CheckForBossTower")
    StopPayday = StartSimpleJob("ResetGoldTillStart")
end

-- Hier kommen die Funktionen rein, die nach Ende der Friedenszeit ausgeführt
-- werden sollen. Gibt es keine Friedenszeit wird es sofort ausgeführt, sobald
-- die Regeln eingestellt wurden.
function OnPeacetimeOver()
    LocalMusic.UseSet = EVELANCEMUSIC;
    LocalMusic.SetLength = 0;
    ReplaceEntity("bridge1", Entities.PB_DrawBridgeClosed1);
    ReplaceEntity("bridge2", Entities.PB_DrawBridgeClosed1);
    ReplaceEntity("bridge3", Entities.PB_DrawBridgeClosed1);
    DestroyBarriers()


-------------------------------------------------CommandsForArmys--------------------------------------------------------------------------
    for i = 1,4,1 do
        _G["Bandit"..i]: AddCommandMove(GetPosition("attack"..i.."_id3"), true);
        _G["Bandit"..i]:AddCommandWaitForIdle(true);
        end
        
        Bandit5: AddCommandMove(GetPosition("attack5_id3"), true);
        Bandit5: AddCommandWaitForIdle(true);
              
        Bandit6: AddCommandMove(GetPosition("attack6_id3"), true);
        Bandit6: AddCommandWaitForIdle(true);
        
        Bandit7: AddCommandMove(GetPosition("attack7_id3"), true);
        Bandit7: AddCommandWaitForIdle(true);
        
        for i = 1,5,1 do
        _G["NVArmy"..i]: AddCommandMove(GetPosition("attack"..i.."_id5"), true);
        _G["NVArmy"..i]: AddCommandWaitForIdle(true);
        end
        
        NVArmy6: AddCommandMove(GetPosition("attack6_id5"), true);
        NVArmy6: AddCommandWaitForIdle(true);
        
        for i = 1,2,1 do
        _G["Citytower"..i]: AddCommandMove(GetPosition("attack_tower"..i.."_id5"), true);
        _G["Citytower"..i]:AddCommandWaitForIdle(true);
        end
        
        for i =1,2,1 do
        _G["CityBarracks"..i]: AddCommandMove(GetPosition("attack_barracks"..i.."_id5"), true);
        _G["CityBarracks"..i]:AddCommandWaitForIdle(true); 
        end
        
        for i = 1,2,1 do
        _G["CityArchery"..i]: AddCommandMove(GetPosition("attack_archery"..i.."_id5"), true);
        _G["CityArchery"..i]:AddCommandWaitForIdle(true); 
        end
        
        for i=1,2,1 do
        _G["CityStable"..i]: AddCommandMove(GetPosition("attack_stable"..i.."_id5"), true);
        _G["CityStable"..i]:AddCommandWaitForIdle(true);
        end
        
        for i=1,2,1 do
        _G["CityFoundry"..i]: AddCommandMove(GetPosition("attack_foundry"..i.."_id5"), true);
        _G["CityFoundry"..i]:AddCommandWaitForIdle(true);
        end
        
        CityCastle: AddCommandMove(GetPosition("attack_castle_id5"), true);
        CityCastle: AddCommandWaitForIdle(true);

-------------------------------------------------------------------------------------------------
    
end

----------------------Game Funcs--------------------------------------------------------------------------
function ResetGoldTillStart()
    if CheckMode == 0 then
        gold1 = Logic.GetPlayersGlobalResource(1, ResourceType.GoldRaw)
        gold2 = Logic.GetPlayersGlobalResource(2, ResourceType.GoldRaw)
        Logic.SubFromPlayersGlobalResource(1, ResourceType.Gold, gold1)
        Logic.SubFromPlayersGlobalResource(2, ResourceType.Gold, gold2)
    end
end




function IsModeSelected()
    if CheckMode > 0 then
        Tribut4()
        Tribut5()
        Tribut6()
        Tribut7()
        Tribut8()
        Tribut9()
        return true
    end
end

------------------------Setup Mode-----------------------------------------------------------------------

function TickPeacetime()
    EMS.T.StopCountdown(Peacetime)
end

CheckMode = 0

Btab1 = {3,40}
Btab2 = {4,30}
Btab3 = {6,20}
Ntab1 = {2,30}
Ntab2 = {3,20}
Ntab3 = {5,10}
Ctab1 = {4,40}
Ctab2 = {6,30}
Ctab3 = {8,20}


---Easy
function Tribut1()
    local TrMod1 =  {}
    TrMod1.pId = 1
    TrMod1.text = "Spielmodus @color:57,245,26 <<Kooperation/Leicht>>! "
    TrMod1.cost = { Gold = 0 }
    TrMod1.Callback = Mode1
    TMod1 = AddTribute(TrMod1)
end

function Mode1()
    EndJob(StopPayday)
    CheckMode = 1
    Message("Schwierigkeit: @color:57,245,26 LEICHT @color:255,255,255 wurde gewaehlt!")
    ActivateBandits(Btab1)
    ActivateFogWarriors(Ntab1)
    ActivateCity(Ctab1)
    Logic.RemoveTribute(1,TMod1)
    Logic.RemoveTribute(1,TMod2)
    Logic.RemoveTribute(1,TMod3)
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)

    	-- Initial Resources
	local InitGoldRaw 		= 2000
	local InitClayRaw 		= 2500
	local InitWoodRaw 		= 2500
	local InitStoneRaw 		= 2000
	local InitIronRaw 		= 750
	local InitSulfurRaw		= 750

	
	--Add Players Resources
	for i = 1,2 do
		Tools.GiveResouces(i, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
	end
   EndJob(TickPeace)
   EMS.T.SetPeacetime(40*60 )
end

---Normal
function Tribut2()
    local TrMod2 =  {}
    TrMod2.pId = 1
    TrMod2.text = "Spielmodus @color:57,245,26 <<Kooperation/Normal>>! "
    TrMod2.cost = { Gold = 0 }
    TrMod2.Callback = Mode2
    TMod2 = AddTribute(TrMod2)
end

function Mode2()
    EndJob(StopPayday)
    CheckMode = 2
    Message("Schwierigkeit: @color:57,245,26 NORMAL @color:255,255,255 wurde gewaehlt!")
    ActivateBandits(Btab2)
    ActivateFogWarriors(Ntab2)
    ActivateCity(Ctab2)
    Logic.RemoveTribute(1,TMod1)
    Logic.RemoveTribute(1,TMod2)
    Logic.RemoveTribute(1,TMod3)
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)

    	-- Initial Resources
	local InitGoldRaw 		= 1500
	local InitClayRaw 		= 1400
	local InitWoodRaw 		= 1400
	local InitStoneRaw 		= 1000
	local InitIronRaw 		= 300
	local InitSulfurRaw		= 300

	
	--Add Players Resources
	for i = 1,2 do
		Tools.GiveResouces(i, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
	
   end
   EndJob(TickPeace)
   EMS.T.SetPeacetime(40*60 )
end

---Hard
function Tribut3()
    local TrMod3 =  {}
    TrMod3.pId = 1
    TrMod3.text = "Spielmodus @color:57,245,26 <<Kooperation/Schwer>>! "
    TrMod3.cost = { Gold = 0 }
    TrMod3.Callback = Mode3
    TMod3 = AddTribute(TrMod3)
end

function Mode3()
    EndJob(StopPayday)
    CheckMode = 3
    Message("Schwierigkeit: @color:57,245,26 SCHWER @color:255,255,255 wurde gewaehlt!")
    ActivateBandits(Btab3)
    ActivateFogWarriors(Ntab3)
    ActivateCity(Ctab3)
    Logic.RemoveTribute(1,TMod1)
    Logic.RemoveTribute(1,TMod2)
    Logic.RemoveTribute(1,TMod3)
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)

    	-- Initial Resources
	local InitGoldRaw 		= 1000
	local InitClayRaw 		= 1000
	local InitWoodRaw 		= 1000
	local InitStoneRaw 		= 800
	local InitIronRaw 		= 100
	local InitSulfurRaw		= 50

	
	--Add Players Resources
	for i = 1,2 do
		Tools.GiveResouces(i, InitGoldRaw , InitClayRaw,InitWoodRaw, InitStoneRaw,InitIronRaw,InitSulfurRaw)
	
   end
   EndJob(TickPeace)
   EMS.T.SetPeacetime(30*60 )
end




---------------------------------------------------------------------------------------------------------
function CheckForBossTower()
    if IsDead("burg_id3") then
        ActivateBossTower()
        Bandit8: AddCommandMove(GetPosition("attack_tower1_id5"), true);
        Bandit8: AddCommandWaitForIdle(true);
        return true;
    end
end

------------------------Setup KI 8 Support---------------------------------------------------------------

--------------------------------------------ID1---------------------------------------------------------
function Tribut4()
    local TrMod4 =  {}
    TrMod4.pId = 1
    TrMod4.text = "Kauft fuer 5000 Taler und 5000 Eisen @color:57,245,26 Reiter @color:255,255,255 zur Unterstuetzung! "
    TrMod4.cost = { Gold = 5000, Iron = 5000 }
    TrMod4.Callback = Help1
    TMod4 = AddTribute(TrMod4)
end

function Tribut5()
    local TrMod5 =  {}
    TrMod5.pId = 1
    TrMod5.text = "Kauft fuer 5000 Taler und 5000 Holz @color:57,245,26 Schuetzen @color:255,255,255 zur Unterstuetzung! "
    TrMod5.cost = { Gold = 5000, Wood = 5000 }
    TrMod5.Callback = Help2
    TMod5 = AddTribute(TrMod5)
end

function Tribut6()
    local TrMod6 =  {}
    TrMod6.pId = 1
    TrMod6.text = "Kauft fuer 5000 Taler, 2500 Holz und 2500 Eisen @cr @color:57,245,26 Nahkaempfer @color:255,255,255 zur Unterstuetzung! "
    TrMod6.cost = { Gold = 5000, Wood = 2500, Iron = 2500 }
    TrMod6.Callback = Help3
    TMod6 = AddTribute(TrMod6)
end



Stab1 = {6,10}
Stab2 = {5,20}
Stab3 = {4,30}


function Help1()
    supp_church1 = ReplaceEntity("r1_3", Entities.CB_Abbey01)
    supp_church2 = ChangePlayer(supp_church1,8) 
    DestroyEntity("r1_1")
    DestroyEntity("r1_2")
    if CheckMode == 1 then
        ActivateSupp1(Stab1)
    elseif CheckMode == 2 then
        ActivateSupp1(Stab2)    
    elseif CheckMode == 3 then
        ActivateSupp1(Stab3)
    end
    Logic.RemoveTribute(1,TMod4)
    Logic.RemoveTribute(2,TMod7)
end

function Help2()
    supp_tower1 = ReplaceEntity("r2_1", Entities.CB_Bastille1)
    supp_tower2 = ChangePlayer(supp_tower1,8) 
    DestroyEntity("r2_2")
    if CheckMode == 1 then
        ActivateSupp2(Stab1)
    elseif CheckMode == 2 then
        ActivateSupp2(Stab2)    
    elseif CheckMode == 3 then
        ActivateSupp2(Stab3)
    end
    Logic.RemoveTribute(1,TMod5)
    Logic.RemoveTribute(2,TMod8)

end

function Help3()
    supp_shot1 = ReplaceEntity("r3_1", Entities.PB_Tower3)
    supp_shot2 = ChangePlayer(supp_shot1,8) 
    DestroyEntity("r3_2")
    DestroyEntity("r3_3")
    DestroyEntity("r3_4")
    DestroyEntity("r3_5")
    DestroyEntity("r3_6")
    if CheckMode == 1 then
        ActivateSupp3(Stab1)
    elseif CheckMode == 2 then
        ActivateSupp3(Stab2)    
    elseif CheckMode == 3 then
        ActivateSupp3(Stab3)
    end
    Logic.RemoveTribute(1,TMod6)
    Logic.RemoveTribute(2,TMod9)
end


---------------------------------------ID2------------------------------------------------------------------------
function Tribut7()
    local TrMod7 =  {}
    TrMod7.pId = 2
    TrMod7.text = "Kauft fuer 5000 Taler und 5000 Eisen @color:57,245,26 Reiter @color:255,255,255 zur Unterstuetzung! "
    TrMod7.cost = { Gold = 5000, Iron = 5000 }
    TrMod7.Callback = Help1
    TMod7 = AddTribute(TrMod7)
end

function Tribut8()
    local TrMod8 =  {}
    TrMod8.pId = 2
    TrMod8.text = "Kauft fuer 5000 Taler und 5000 Holz @color:57,245,26 Schuetzen @color:255,255,255 zur Unterstuetzung! "
    TrMod8.cost = { Gold = 5000, Wood = 5000 }
    TrMod8.Callback = Help2
    TMod8 = AddTribute(TrMod8)
end

function Tribut9()
    local TrMod9 =  {}
    TrMod9.pId = 2
    TrMod9.text = "Kauft fuer 5000 Taler, 2500 Holz und 2500 Eisen @cr @color:57,245,26 Nahkaempfer @color:255,255,255 zur Unterstuetzung! "
    TrMod9.cost = { Gold = 5000, Wood = 2500, Iron = 2500 }
    TrMod9.Callback = Help3
    TMod9 = AddTribute(TrMod9)
end
------------------------------------------------------------------------------------------------------------------



------------------------General Setup--------------------------------------------------------------------
function SetupDiplomacy()
    SetHostile( 8, 3 )
    SetHostile( 1, 6 )
    SetHostile( 2, 6 )
    SetHostile( 8, 4 )
    SetHostile( 8, 5 )
    SetHostile( 1, 3 )
    SetHostile( 1, 4 )
    SetHostile( 1, 5 )
    SetHostile( 2, 3 )
    SetHostile( 2, 4 )
    SetHostile( 2, 5 )
    SetFriendly( 1, 2 )
    SetFriendly( 1, 8 )
    SetFriendly( 8, 2 )
    SetNeutral( 1, 7 )
    SetNeutral( 2, 7 )
    SetNeutral( 3, 7 )
    SetNeutral( 4, 7 )
    SetNeutral( 5, 7 )
    SetNeutral( 8, 7 )
    Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)
    Logic.SetShareExplorationWithPlayerFlag(2, 8, 1)
    Logic.SetShareExplorationWithPlayerFlag(1, 8, 1)
  
end
---------------------------------------------------------------------------------------------------------

------------------------DestroyBarriers------------------------------------------------------------------
function DestroyBarriers()
    for i = 1,10,1 do
        DestroyEntity("b"..i)
    end
end

---------------------------------------------------------------------------------------------------------


------------------------Defeat---------------------------------------------------------------------------
function DefeatBedingung()
        if not IsExisting("burg_id1") or not IsExisting("burg_id2") then
           Logic.PlayerSetGameStateToLost(1);
           Logic.PlayerSetGameStateToLost(2);
           return true;
        end
end

---------------------------------------------------------------------------------------------------------








function Sieg()
    if IsDead("burg_id3")
    and IsDead("burg_id4")
    and IsDead("burg_id5")
    and IsDead("nv1")
    and IsDead("nv2") 
    and IsDead("nv3")
    and IsDead("nv4")
    and IsDead("nv5") 
    and IsDead("stable1_id5")
    and IsDead("stable2_id5")
    and IsDead("tower1_id5")
    and IsDead("tower2_id5")
    and IsDead("barracks1_id5")
    and IsDead("barracks2_id5")
    and IsDead("archery1_id5")
    and IsDead("archery2_id5")
    and IsDead("foundry1_id5")
    and IsDead("foundry2_id5")
    and IsDead("tower1_id3")
    and IsDead("tower2_id3")
    and IsDead("tower3_id3")
    and IsDead("tower4_id3")
    and IsDead("outpost_id3")
    and IsDead("tent1_id3")
    then
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













function GetActivePlayers()
    local Players = {};
    if XNetwork.Manager_DoesExist() == 1 then
        -- TODO: Does that fix everything for Community Server?
        for i= 1, table.getn(Score.Player), 1 do
            if Logic.PlayerGetGameState(i) == 1 then
                table.insert(Players, i);
            end
        end
    else
        table.insert(Players, GUI.GetPlayerID());
    end
    return Players;
end





FormationFunktion = function(self, truppid)
    if Logic.IsEntityInCategory(truppid, EntityCategories.Cannon)==1 then
        return 1
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.Hero)==1 then
        return 1
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.CavalryHeavy)==1 then
        return 7
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.CavalryLight)==1 then
        return 2
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.Bow)==1 or Logic.IsEntityInCategory(truppid, EntityCategories.Rifle)==1 then
        return 2
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.Spear)==1 then
        return 6
    end
    if Logic.IsEntityInCategory(truppid, EntityCategories.Sword)==1 then
        return 4
    end
    return 1
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

---------------------------------------------------------------------------------------------------------------------------------------


