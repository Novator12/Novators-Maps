function DebugTestKI4()
    DebugOpen()
    Debug1()
    SetHostile(1,4)
    Logic.SetPlayerRawName(4, "Schattenfeste")
    ActivateTributesChapter4()
    StartPatrolKI4()
    AddTribute(Tribut_DrawBridgeNorth)
    AddTribute(Tribut_DrawBridgeLava)
    AddTribute(Tribut_BackdoorGate)

end

function DebugTestKI42()
    BuffKI4()
    UpgradeKI4()
    ResCheatKI4()
    ActivateKI4Attacks()
    KI4RecruitSerfs()

end


function DebugDestroyKI5()
    DestroyEntity("barracks_id5")
    DestroyEntity("foundry_id5")
    DestroyEntity("archery_id5")
    DestroyEntity("village_id5")
    DestroyEntity("hq_id5")
    DestroyEntity("spawner_bandit1_id5")
    DestroyEntity("spawner_bandit2_id5")
end



--Erstellt euch Verstärkungstruppen

function DebugTroups()
    CreateMilitaryGroup(1,Entities.PU_LeaderBow4,8,GetPosition("debug_help1"),"hilfe1")
    CreateMilitaryGroup(1,Entities.PU_LeaderBow4,8,GetPosition("debug_help1"),"hilfe2")
    CreateMilitaryGroup(1,Entities.PU_LeaderBow4,8,GetPosition("debug_help1"),"hilfe3")
    CreateMilitaryGroup(1,Entities.PU_LeaderBow4,8,GetPosition("debug_help1"),"hilfe4")

    CreateMilitaryGroup(1,Entities.PU_LeaderSword4,8,GetPosition("debug_help2"),"hilfe5")
    CreateMilitaryGroup(1,Entities.PU_LeaderSword4,8,GetPosition("debug_help2"),"hilfe6")
    CreateMilitaryGroup(1,Entities.PU_LeaderSword4,8,GetPosition("debug_help2"),"hilfe7")
    CreateMilitaryGroup(1,Entities.PU_LeaderSword4,8,GetPosition("debug_help2"),"hilfe8")

end

function DebugTroups2()
    CreateMilitaryGroup(1,Entities.PU_LeaderCavalry1,3,GetPosition("debug_help1"),"hilfe1")
    CreateMilitaryGroup(1,Entities.PU_LeaderCavalry2,6,GetPosition("debug_help1"),"hilfe2")
    CreateMilitaryGroup(1,Entities.PU_LeaderHeavyCavalry1,3,GetPosition("debug_help1"),"hilfe3")
    CreateMilitaryGroup(1,Entities.PU_LeaderHeavyCavalry2,3,GetPosition("debug_help1"),"hilfe4")
end

function DebugTroups3()
    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("debug_help1"),"hilfe1")
    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow2,8,GetPosition("debug_help1"),"hilfe2")
    CreateMilitaryGroup(1,Entities.CU_BanditLeaderSword1,8,GetPosition("debug_help1"),"hilfe3")
    CreateMilitaryGroup(1,Entities.CU_BanditLeaderSword2,8,GetPosition("debug_help1"),"hilfe4")
end


--Öffnet alle Wege
function DebugOpen()
    ReplaceEntity("dw1", Entities.PB_DrawBridgeClosed1)
    DestroyEntity("b1")
    DestroyEntity("b2")
    for i=1,4,1 do
        DestroyEntity("r"..i)
    end
    DestroyEntity("stein1")
    DestroyEntity("barrier_lava")
    for i = 1,4,1 do
        ReplaceEntity(GetID("gate"..i.."_id5"), Entities.XD_DarkWallStraightGate)
    end
    DestroyEntity(GetID("block1"))
    DestroyEntity(GetID("block2"))
    DestroyEntity("useless_tree")
    DestroyEntity("shortcut1")
    DestroyEntity("shortcut2")
    DestroyEntity("barrier_lava2")
    for i = 1,15,1 do
        DestroyEntity("ev"..i)
    end
    for i=1,4,1 do
        DestroyEntity("dt"..i)
    end
    for i =1,9,1 do
        DestroyEntity("be"..i)
    end
    for i=1,4,1 do
        DestroyEntity("ae"..i)
    end
end 

--Gibt dem Spieler massiv viele Ressourcen
function DebugRes()
    Logic.AddToPlayersGlobalResource(1,ResourceType.ClayRaw,1000000)
    Logic.AddToPlayersGlobalResource(1,ResourceType.StoneRaw,1000000)
    Logic.AddToPlayersGlobalResource(1,ResourceType.GoldRaw,1000000)
    Logic.AddToPlayersGlobalResource(1,ResourceType.IronRaw,1000000)
    Logic.AddToPlayersGlobalResource(1,ResourceType.WoodRaw,1000000)
    Logic.AddToPlayersGlobalResource(1,ResourceType.SulfurRaw,1000000)
end
--Debug Test für zu bauende Sachen

function DebugBuild()
    Debug1()
    DebugOpen()
    DebugSerf()
    DebugSerf()
    DebugSerf()
    DebugSerf()
    DebugRes()
    DebugTech()
end

--Debug Alle Techs freischalten
function DebugTech()
    Logic.SetTechnologyState(1,Technologies.GT_Alchemy,3)
    Logic.SetTechnologyState(1,Technologies.GT_Alloying,3)
    Logic.SetTechnologyState(1,Technologies.GT_Architecture,3)
    Logic.SetTechnologyState(1,Technologies.GT_Banking,3)
    Logic.SetTechnologyState(1,Technologies.GT_Binocular,3)
    Logic.SetTechnologyState(1,Technologies.GT_ChainBlock,3)
    Logic.SetTechnologyState(1,Technologies.GT_Chemistry,3)
    Logic.SetTechnologyState(1,Technologies.GT_Construction,3)
    Logic.SetTechnologyState(1,Technologies.GT_GearWheel,3)
    Logic.SetTechnologyState(1,Technologies.GT_Gilds,3)
    Logic.SetTechnologyState(1,Technologies.GT_Laws,3)
    Logic.SetTechnologyState(1,Technologies.GT_Library,3)
    Logic.SetTechnologyState(1,Technologies.GT_Matchlock,3)
    Logic.SetTechnologyState(1,Technologies.GT_Mathematics,3)
    Logic.SetTechnologyState(1,Technologies.GT_Mercenaries,3)
    Logic.SetTechnologyState(1,Technologies.GT_Metallurgy,3)
    Logic.SetTechnologyState(1,Technologies.GT_Printing,3)
    Logic.SetTechnologyState(1,Technologies.GT_PulledBarrel,3)
    Logic.SetTechnologyState(1,Technologies.GT_StandingArmy,3)
    Logic.SetTechnologyState(1,Technologies.GT_Strategies,3)
    Logic.SetTechnologyState(1,Technologies.GT_Tactics,3)
    Logic.SetTechnologyState(1,Technologies.GT_Taxation,3)
    Logic.SetTechnologyState(1,Technologies.GT_Trading,3)
    Logic.SetTechnologyState(1,Technologies.GT_Literacy,3)
    Logic.SetTechnologyState(1,Technologies.B_BarbVillage,2)
    Logic.SetTechnologyState(1,Technologies.B_BarbTower,2)
    Logic.SetTechnologyState(1,Technologies.B_BarbArena,2)
    Logic.SetTechnologyState(1,Technologies.B_Residence,2)
    Logic.SetTechnologyState(1,Technologies.B_Farm,2)
    Logic.SetTechnologyState(1,Technologies.B_University,2)
    Logic.SetTechnologyState(1,Technologies.B_Claymine,2)
    Logic.SetTechnologyState(1,Technologies.B_Woodmine,2)
    Logic.SetTechnologyState(1,Technologies.B_Village,2)
end


--Debug SpawnSerf
function DebugSerf()
    CreateEntity(1,Entities.PU_Serf,GetPosition("spawn_trupp1"),"debug_serf")
end

--Debug StartNV
function Debug1()
    nvStartArmy:KillAllLeaders()
    nvStartArmy:Destroy()
end

--Debug Banditcamp1
function Debug2()
    for i=1,2,1 do
        DestroyEntity("bandit"..i)  
    end
    for i=1,2,1 do
        _G["BanditArmy"..i]:KillAllLeaders()
        _G["BanditArmy"..i]:Destroy()
    end
end


--Debug Banditcamp2
function Debug3()
    for i=3,4,1 do
        DestroyEntity("bandit"..i)  
    end
    for i=3,4,1 do
        _G["BanditArmy"..i]:KillAllLeaders()
        _G["BanditArmy"..i]:Destroy()
    end
end

--Debug NVCamp

function Debug4()
   DestroyEntity("nv_spawner1") 
   DestroyEntity("nv_spawner2") 
   DestroyEntity("evil_tower1")
   DestroyEntity("evil_tower2")
   DestroyEntity("evil_tower3")
   DestroyEntity("evil_tower4")
   DestroyEntity("evil_tower5")
   DestroyEntity("evil_tower6")
   for i=1,2,1 do
    _G["NvCampArmy"..i]:KillAllLeaders()
    _G["NvCampArmy"..i]:Destroy()
end
end


function DebugIron()
    DestroyEntity("nv_spawner_iron")
    NVIronArmy:KillAllLeaders()
    NVIronArmy:Destroy()
end

function DebugKI5Def()
    KI5SpawnerBanditArmy1:ClearCommandQueue()
    KI5SpawnerBanditArmy2:ClearCommandQueue()
    KI5SpawnerBanditArmy1: AddCommandMove(GetPosition("spawner_bandit1_id5"), true);
    KI5SpawnerBanditArmy1:AddCommandWaitForIdle(true);
    KI5SpawnerBanditArmy2: AddCommandMove(GetPosition("spawner_bandit1_id5"), true);
    KI5SpawnerBanditArmy2:AddCommandWaitForIdle(true);
    KI5SpawnerArmy:ClearCommandQueue()
    KI5Army:ClearCommandQueue()
    KI5SpawnerArmy: AddCommandMove(GetPosition("hq_id5"), true);
    KI5SpawnerArmy: AddCommandWaitForIdle(true);
    KI5Army: AddCommandMove(GetPosition("hq_id5"), true);
    KI5Army: AddCommandWaitForIdle(true);
end


function DebugKI5Attack()
    KI5SpawnerBanditArmy1:ClearCommandQueue()
    KI5SpawnerBanditArmy2:ClearCommandQueue()
    KI5SpawnerBanditArmy1: AddCommandMove(GetPosition("barb_castle"), true);
    KI5SpawnerBanditArmy1:AddCommandWaitForIdle(true);
    KI5SpawnerBanditArmy2: AddCommandMove(GetPosition("barb_castle"), true);
    KI5SpawnerBanditArmy2:AddCommandWaitForIdle(true);
    KI5SpawnerArmy:ClearCommandQueue()
    KI5Army:ClearCommandQueue()
    KI5SpawnerArmy: AddCommandMove(GetPosition("barb_castle"), true);
    KI5SpawnerArmy: AddCommandWaitForIdle(true);
    KI5Army: AddCommandMove(GetPosition("barb_castle"), true);
    KI5Army: AddCommandWaitForIdle(true);
end


function DebugDeactivateThiefAttack()
    EnableThiefAttack = false
    for i = table.getn(ThiefTable),1,-1 do
        if IsExisting(ThiefTable[i]) then
            DestroyEntity(ThiefTable[i])
        end
    end
    ThiefTable = nil
end

