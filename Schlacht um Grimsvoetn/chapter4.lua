function Start_Chapter4()
    chapterID = 4
    chapterText = "Schlacht um Grimsvötn @cr Der Anführer der Schattenkrieger ist geflohen. Findet einen Weg die Schattenfeste zu zerstören."
    ResetQuestBook(1)
    EndJob("DefeatJob1")
    DestroyEntity(varg)
    DestroyEntity(guard)
    DestroyEntity(trupp3)
    DestroyEntity(trupp1)
    DestroyEntity(trupp2)
    Logic.AddQuest(1, 1, MAINQUEST_OPEN, "@color:255,0,0 Die Feste im Schatten", "@cr Der Anführer der Schattenkrieger ist geflohen. Sucht einen Weg zur Schattenfeste!", 1)  
    varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("varg_chap4").X, GetPosition("varg_chap4").Y, 0, 1)
    trupp1 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("trupp1_chap4").X,GetPosition("trupp1_chap4").Y,0, 1)
    trupp2 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("trupp2_chap4").X,GetPosition("trupp2_chap4").Y,0, 1)
    trupp3 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("trupp3_chap4").X,GetPosition("trupp3_chap4").Y,0, 1)
    guard = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("guard_chap4").X,GetPosition("guard_chap4").Y,0, 1)
    theodor = Logic.CreateEntity(Entities.PU_Thief,GetPosition("theodor_spawn").X,GetPosition("theodor_spawn").Y,0,2)
    DefeatJob1 = StartSimpleJob("AllHerosDead")
    RefreshDisplayNames()
    MakeDefInvulnerable()
    SetHostile(1,4)
    Logic.SetPlayerRawName(4, "Schattenfeste")
    AI.Player_EnableAi(4)
    AI.Village_EnableConstructing(4, 1)
    AI.Village_EnableRepairing(4, 1)
    AI.Village_EnableExtracting(4,1)
    StartBriefingChapter4()
end


function MakeDefInvulnerable()
    for i = 1,4,1 do
        Logic.SetEntityInvulnerabilityFlag(GetID("inv_tower"..i),1)
    end
end



function StartBriefingChapter4()
    Move(theodor,varg,200)
    StartSimpleJob("TheodorNearVarg")
    Logic.EntityLookAt(trupp1,varg)
    Logic.EntityLookAt(trupp2,varg)
    Logic.EntityLookAt(trupp3,varg)
    Logic.EntityLookAt(guard,varg)
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page2
    local page1 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 ...also, Ihr wisst was zu tun ist. Gebt die Befehle an die Hauptmänner weiter. Wir müssen einen Weg über die Zugbrücken finden.",
        position = GetPosition(varg),
        explore = 2000,
        action = function()
            page2.npc = { id = GetEntityId(theodor),isObserved = true }
        end
    }
    page2 = AP{
        title	= "Mentor",
        text	= "Seht Herr, ein fremder betritt den Burghof. Was er wohl will?",
        npc = { id = GetEntityId(theodor),
            isObserved = true },
    }
    local page3 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Guten Tag, eure Lordschaft. Darf ich mich vorstellen. Meine Name ist Theodor Eisenklaue.",
        position = GetPosition(varg)
    }
    local page4 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Ahhh... einer von den Eisenklauen. Alles Diebe, Vergewaltiger und Mörder. Verschwindet sofort aus meiner Burg.",
        position = GetPosition(varg)
    }
    local page5 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 So wartet doch. Ich kann euch helfen. Ich habe mich lange Zeit in der Schattenfeste eingeschleust und kenne einen Weg hinein. Wäre das nicht lukrativ für euch?",
        position = GetPosition(varg)
    }
    local page6 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Hmm..sprecht weiter!",
        position = GetPosition(varg)
    }
    local page7 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Ich konnte verschiedene Schwachstellen in den Anlagen Ihrer Verteidigung ausmachen und könnte euch behilflich sein, diese auszuschalten.",
        position = GetPosition(varg)
    }
    local page8 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Es gibt hier eine Dampfmaschine, welche das süd-östliche Tor und dessen Verteidigungstürme unbesiegbar macht,...",
        position = GetPosition("gate_protector"),
        explore = 300,
        action = function() GUI.CreateMinimapMarker(GetPosition("gate_protector").X,GetPosition("gate_protector").Y,3) end
    }
    local page9 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 ...hier gibt es ein Wärterhäuschen, mit dem die Brücke für die nördliche Passage abgesenkt werden kann...",
        position = GetPosition("bridge_north"),
        explore = 300,
        action = function() GUI.CreateMinimapMarker(GetPosition("bridge_north").X,GetPosition("bridge_north").Y,3) end
    }
    local page10 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 ...und zu guter letzt das Haupthäuschen, welches die Brücken über die Lavaflüsse steuert.",
        position = GetPosition("bridge_lava"),
        explore = 300,
        action = function() GUI.CreateMinimapMarker(GetPosition("bridge_lava").X,GetPosition("bridge_lava").Y,3) end
    }
    local page11 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Danke für diese Informationen, nur wie soll uns das weiterhelfen, wenn wir nicht in Ihre Feste gelangen?",
        position = GetPosition(varg)
    }
    local page12 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Da komme ich ins Spiel. Diese Mistkerle habe meine Frau hingerichtet und ich will mich rächen. Ich kann euch, solange ich es überlebe, Ihre Verteidigungsmechaniken deaktivieren.",
        position = GetPosition(varg)
    }
    local page13 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 BAHMMMMM...Sagte jemand Explosionen?",
        position = GetPosition(varg),
        action = function()
            if IsExisting(leonardo) then
                DestroyEntity(leonardo)
            end
            leonardo = Logic.CreateEntity(Entities.CU_Leonardo,GetPosition("leonardo_chap4").X,GetPosition("leonardo_chap4").Y,0,3 )
            Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("leonardo_chap4").X, GetPosition("leonardo_chap4").Y, 1)
            Sound.Play2DSound(1071,0,150)
            Logic.EntityLookAt(leonardo,theodor)
            Logic.EntityLookAt(theodor,leonardo)
            Logic.EntityLookAt(varg,leonardo)
            Logic.EntityLookAt(trupp1,leonardo)
            Logic.EntityLookAt(trupp2,leonardo)
            Logic.EntityLookAt(trupp3,leonardo)
            Logic.EntityLookAt(guard,leonardo)
        end
    }
    local page14 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Ähmm..nein..wir sprachen über Sabotage.",
        position = GetPosition(varg)
    }
    local page15 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Auch gut! Ich habe ein Mittel entwickelt, um eine Dampfmaschine zu zerstören. Ihr braucht dafür jedoch ein paar Materialien, welche Ihr nur in der Feste der Schattenkrieger auftreiben könnt.",
        position = GetPosition(varg)
    }
    local page16 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Und was wäre das für komisches Zeug?",
        position = GetPosition(varg)
    }
    local page17 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Ganz einfach: Vulkanwasser aus einem Brunnen, Glut aus einem Geysir, die Haare eines Schafes und ein paar Schrottteile. Mixt dies alles zusammen und kippt es auf die Dampfmaschine.",
        position = GetPosition(varg)
    }
    local page18 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Na super...Dann mache ich mich wohl besser auf den Weg.",
        position = GetPosition(varg)
    }
    local page19 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Viel Erfolg Theodor Eisenklaue!",
        position = GetPosition(varg)
    }
    local page20 = AP{
        title	= "Mentor",
        text	= "Eisenklaue berichtete mir, dass er sich zum Geheimgang hierhin begeben wird.",
        position = GetPosition("thief_pos1"),
        explore = 300,
        action = function()
            GUI.CreateMinimapMarker(GetPosition("thief_pos1").X,GetPosition("thief_pos1").Y,0)
        end
    }
    briefing.finished = function()  
        ThiefQuest = true
        ResolveBriefing(page1);
        ResolveBriefing(page2);
        Logic.SetOnScreenInformation(theodor,0)
        DestroyEntity("barrier_lava2")
        for i = 1,15,1 do
            DestroyEntity("ev"..i)
        end
        ActivateThiefQuest()
        StartSimpleJob("TheodorNearSecretEntrance")
        Logic.AddQuest(2, 1, MAINQUEST_OPEN, "@color:255,0,0 Die Intrige", "Eisenklaue soll die Verteidigungsanlagen der Schattenfeste schwächen. Diese Mission unterteilt sich in zwei Bereiche: @cr @cr 1) Die Kontrolle über die Zugbrückenmechanismen @cr @cr 2) Die Sabotage der Dampfmaschine der süd-östlichen Verteidigungsanlage", 1) 
        Logic.AddQuest(2, 2, SUBQUEST_OPEN, "@color:255,0,0 Zugbrücken", "Findet in der Feste die Zugbrückenkurbeln und bringt Sie in die dafür vorgesehnen Kontrollhäuschen.", 1) 
        Logic.AddQuest(2, 3, SUBQUEST_OPEN, "@color:255,0,0 Dampfmaschine", "Sammelt folgende Materialien: @cr @cr 1) Vulkanwasser aus einem Brunnen @cr 2) Glut aus einem Geysir @cr 3) Haare von einem Schaf @cr 4) Schrottteile @cr @cr Habt Ihr alles gesammelt geht zur Dampfmaschine.", 1) 
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
    
end




function TheodorNearVarg()
    if IsNear(theodor,varg,300) then
        Logic.EntityLookAt(theodor,varg)
        Logic.EntityLookAt(varg,theodor)
        Logic.EntityLookAt(trupp1,theodor)
        Logic.EntityLookAt(trupp2,theodor)
        Logic.EntityLookAt(trupp3,theodor)
        Logic.EntityLookAt(guard,theodor)
        return true
    end
end


function ActivateThiefQuest() --Wechselt zu Spieler 2
    GUI.SetControlledPlayer(2)
    SetHostile(2,4)
    SetFriendly(1,2)
    SetNeutral(1,4)
    Logic.ActivateUpdateOfExplorationForAllPlayers()
    CppLogic.Logic.PlayerSetTaxLevel(1, 2) --Steuern auf normal gesetzt
    StartPatrolKI4()
    ThiefPointer1 = Logic.CreateEffect(GGL_Effects.FXTerrainPointer,GetPosition("thief_pos1").X,GetPosition("thief_pos1").Y,1)
    ThiefDeadJob = StartSimpleJob("ThiefIsDead")
    StartSimpleJob("EasterEggSheepChecker")
end

function EasterEggSheepChecker()
    if IsNear(theodor,"ee2",300) then
        EasterEggSheep()
        return true
    elseif IsDead(theodor) then
        return true
    end
end

function EasterEggSheep()
    Logic.EntityLookAt(theodor,GetID("ee_sheep"))
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP {
        title = "@color:255,0,0 Eisenklaue",
        text = "@color:255,136,0 Hmmmm...das könnte das Schaf sein, was dieser Wissenschaftler erwähnt hatte. Ich muss nur ein Haar von ihm zupfen.",
        position = GetPosition(theodor),
        explore = 2000
    }
    local page2 = AP {
        title = "@color:255,0,0 Eisenklaue",
        text = "@color:255,136,0 Erstmal reiße ich diesen Zaun ein...",
        position = GetPosition(theodor),
        action = function() 
            Sound.Play2DSound(1060,0,150) 
            for i = 1,5,1 do
                DestroyEntity("ee"..i)
            end
        end
    }
    local page3 = AP {
        title = "@color:255,0,0 Das schwarze Schaf",
        text = "@color:255,136,0 MÄÄÄHHHHH...Lass bloß deine Griffel von mir...MÄÄÄÄHHHHHH.",
        position = GetPosition("ee_sheep"),
        explore = 2000,
        action = function() 
            Sound.Play2DSound(1155,0,150)
        end
    }
    local page4 = AP {
        title = "@color:255,0,0 Eisenklaue",
        text = "@color:255,136,0 Huch, du kannst ja reden. Das ist aber ungewöhnlich für ein Schaf.",
        position = GetPosition(theodor),
    }
    local page5 = AP {
        title = "@color:255,0,0 Das schwarze Schaf",
        text = "@color:255,136,0 MÄÄHHH...Ich zeig dir gleich mal was ungewöhnlich ist!",
        position = GetPosition("ee_sheep"),
        action = function() 
            Sound.Play2DSound(1155,0,150)
            Move("ee_sheep",theodor,10)
        end
    }


    briefing.finished = function()
        ResolveBriefing(page1);
        ResolveBriefing(page3);
        GUI.ExpelSettler(theodor)
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)

end




function StartPatrolKI4()


    if mode == 1 then
        KI4_Def = {
            [1] = 1, --Größe der Armee/ Leaderanzahl
            [2] = 160 --Respawnzeit
        }
    elseif mode == 2 then
        KI4_Def = {
            [1] = 2, --Größe der Armee/ Leaderanzahl
            [2] = 140 --Respawnzeit
        }
    elseif mode == 3 then
        KI4_Def = {
            [1] = 3, --Größe der Armee/ Leaderanzahl
            [2] = 120 --Respawnzeit
        }
    end



    function SoeldnerMove(self)
        if not self:IsIdle() then
            return false
        end
        local numbertable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 }
        table.remove(numbertable, self.LastPoint)
        for k, v in pairs(numbertable) do
            if v == self.CurrentPoint then
                self.LastPoint = table.remove(numbertable, k)
                break;
            end
        end
        self.CurrentPoint = numbertable[math.random(1, 11)]
        return false, UnlimitedArmy.CreateCommandMove(self.Points[self.CurrentPoint], false)
    end

    KI4ArmyTable = {}

    for i = 1, 8, 1 do
        KI4ArmyTable[i] = {}
        KI4ArmyTable[i][1] = LazyUnlimitedArmy:New({
            -- benötigt
            Player = 4,
            Area = 4000,
            -- optional
            AutoDestroyIfEmpty = true,
            TransitAttackMove = true,
            Formation = UnlimitedArmy.Formations.Chaotic,
            LeaderFormation = 4,
            AIActive = true,
            AutoRotateRange = 100000,
            HiResJob = true
        }, 11 + i, NumberUA)

        --ArmyParolPoints
        KI4ArmyTable[i][1].Points = {
            GetPosition("id4_patrol1"),
            GetPosition("id4_patrol2"),
            GetPosition("id4_patrol3"),
            GetPosition("id4_patrol4"),
            GetPosition("id4_patrol5"),
            GetPosition("id4_patrol6"),
            GetPosition("id4_patrol7"),
            GetPosition("id4_patrol8"),
            GetPosition("id4_patrol9"),
            GetPosition("id4_patrol10"),
            GetPosition("id4_patrol11"),
            GetPosition("id4_patrol12"),
            GetPosition("id4_patrol13")
        }
        KI4ArmyTable[i][1].LastPoint = nil
        KI4ArmyTable[i][1].CurrentPoint = math.random(1, 13)


        KI4SpawnerTable = {
            [1] = { "barracks_id4", "spawn_barracks_id4", Entities.PU_LeaderSword4, 8 },
            [2] = { "archery_id4", "spawn_archery_id4", Entities.PU_LeaderBow4, 8 },
            [3] = { "foundry_id4", "spawn_foundry_id4", Entities.PV_Cannon3, 0 },
            [4] = { "stables_id4", "spawn_stables_id4", Entities.PU_LeaderCavalry2, 6 },
            [5] = { "tower1_id4", "spawn_tower1_id4", Entities.CU_BanditLeaderSword2, 8 },
            [6] = { "tower2_id4", "spawn_tower2_id4", Entities.CU_BanditLeaderBow2, 8 },
            [7] = { "hq_id4", "spawn_hq_id4", Entities.CU_VeteranMajor, 4 },
            [8] = { "inv_tower2", "spawn_inv_tower2", Entities.PU_LeaderCavalry2, 6 },
        }

        KI4ArmyTable[i][2] = UnlimitedArmySpawnGenerator:New(KI4ArmyTable[i][1], {
            -- benötigt:
            Position = GetPosition(KI4SpawnerTable[i][2]), --position
            ArmySize = KI4_Def[1], --armysize
            SpawnCounter = KI4_Def[2], --spawncounter
            SpawnLeaders = KI4_Def[1], --spawnleaders
            LeaderDesc = {
                { LeaderType = KI4SpawnerTable[i][3], SoldierNum = KI4SpawnerTable[i][4], SpawnNum = 1, Looped = true,
                    Experience = 3 },
            },
            -- optional:
            Generator = KI4SpawnerTable[i][1], --generator
        })

        KI4ArmyTable[i][1]:AddCommandMove(GetPosition("id4_patrol" .. KI4ArmyTable[i][1].CurrentPoint), false)
        KI4ArmyTable[i][1]:AddCommandWaitForIdle(false)
        local numbertable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 }
        KI4ArmyTable[i][1].LastPoint = table.remove(numbertable, KI4ArmyTable[i][1].CurrentPoint)
        local nextpoint = numbertable[math.random(1, 12)]
        KI4ArmyTable[i][1]:AddCommandMove(GetPosition("id4_patrol" .. nextpoint), false)
        KI4ArmyTable[i][1].CurrentPoint = nextpoint
        KI4ArmyTable[i][1]:AddCommandLuaFunc(SoeldnerMove, true)
    end

end



SteamMachineDestroyed = false
AllBridgesActivated = false

function TheodorNearSecretEntrance()
    if IsNear(theodor,"thief_pos1",300) then
        EndJob(ThiefDeadJob)
        GUI.DestroyMinimapPulse(GetPosition("thief_pos1").X,GetPosition("thief_pos1").Y)
        Logic.DestroyEffect(ThiefPointer1)
        DestroyEntity(theodor)
        theodor = Logic.CreateEntity(Entities.PU_Thief,GetPosition("thief_pos2").X,GetPosition("thief_pos2").Y,0,2)
        Message("Tada...Da bin ich!")
        Camera.ScrollSetLookAt(GetPosition("thief_pos2").X,GetPosition("thief_pos2").Y)
        ThiefDeadJob = StartSimpleJob("ThiefIsDead")
        ThiefCollectable1Job = StartSimpleJob("ThiefCollectable1")
        ThiefCollectable2Job = StartSimpleJob("ThiefCollectable2")
        ThiefCollectable3Job = StartSimpleJob("ThiefCollectable3")
        ThiefCollectable4Job = StartSimpleJob("ThiefCollectable4")
        ThiefAllCollectedJob = StartSimpleJob("AllCollected")
        ThiefKurbelMainBridgeJob = StartSimpleJob("ThiefKurbelMainBridge")
        ThiefKurbelSideBridgeJob = StartSimpleJob("ThiefKurbelSideBridge")
        ThiefNearMainBridgeJob = StartSimpleJob("ThiefNearMainBridge")
        ThiefNearSideBridgeJob = StartSimpleJob("ThiefNearSideBridge")
        ThiefAllBridgesCompletedJob = StartSimpleJob("ThiefAllBridgesCompleted")
        ThiefQuestCompletedJob = StartSimpleJob("ThiefQuestCompleted")
        XGUIEng.ShowWidget("ThiefCollectables", 1)
        return true
    end
end


BridgesActive = 0
Kurbeln = 0

function ThiefKurbelMainBridge()
    if IsNear(theodor,"Kurbel1_1",200) then
        for i=1,4,1 do
            DestroyEntity("Kurbel1_"..i)
        end
        XGUIEng.ShowWidget("KurbelADone",1)
        Message("Ah...eine der beiden Zugbrückenkurbeln.")
        Kurbeln = Kurbeln +1
        return true
    end
end

function ThiefNearMainBridge()
    if IsNear(theodor,"keeper_spot1",200) and Kurbeln > 0 then
        Message("(Klack)...(Knack)...So die Kurbel ist dran!")
        GUI.DestroyMinimapPulse(GetPosition("bridge_lava").X,GetPosition("bridge_lava").Y)
        Kurbeln = Kurbeln -1
        BridgesActive = BridgesActive +1
        return true
    elseif IsNear(theodor,"keeper_spot1",200) and Kurbeln == 0 then
        Message("Ich muss zuerst eine Kurbel finden!")
    end
end


function ThiefKurbelSideBridge()
    if IsNear(theodor,"Kurbel2_1",200) then
        for i=1,4,1 do
            DestroyEntity("Kurbel2_"..i)
        end
        XGUIEng.ShowWidget("KurbelBDone",1)
        Message("Ah...eine der beiden Zugbrückenkurbeln.")
        Kurbeln = Kurbeln +1
        return true
    end
end

function ThiefNearSideBridge()
    if IsNear(theodor,"keeper_spot2",200) and Kurbeln > 0 then
        Message("(Klack)...(Knack)...So die Kurbel ist dran!")
        GUI.DestroyMinimapPulse(GetPosition("bridge_north").X,GetPosition("bridge_north").Y)
        Kurbeln = Kurbeln -1
        BridgesActive = BridgesActive +1
        return true
    elseif IsNear(theodor,"keeper_spot2",200) and Kurbeln == 0 then
        Message("Ich muss zuerst eine Kurbel finden!")
    end
end

function ThiefAllBridgesCompleted()
    if BridgesActive == 2 then
        StartBriefingAllBridgesDone()
        return true
    end
end

function StartBriefingAllBridgesDone()
        local briefing = {}
        local AP = function(_page) table.insert(briefing, _page) return _page end
        local page1 = AP{
            title	= "@color:255,0,0 Eisenklaue",
            text	= "@color:255,136,0 Jetzt sind beide Brücken wieder in Betrieb.",
            position = GetPosition(theodor),
            explore = 2000,
        }
            briefing.finished = function() 
                ResolveBriefing(page1) 
                AllBridgesActivated = true
                Logic.AddQuest(2, 2, SUBQUEST_CLOSED, "@color:255,0,0 Zugbrücken", "Findet in der Feste die Zugbrückenkurbeln und bringt Sie in die dafür vorgesehnen Kontrollhäuschen.", 1) 
            end;
            NormalSpeedInBriefing()
            StartBriefing(briefing)
end

function ThiefIsDead()
    if IsDestroyed(theodor) == true then
        GUI.SetControlledPlayer(1)
        Logic.ActivateUpdateOfExplorationForAllPlayers()
        Defeat()
        return true
    end
end

collectedCollectables = 0

function ThiefCollectable1()
    if IsNear(theodor,"vulc_water",200) then
        DestroyEntity("vulc_water")
        XGUIEng.ShowWidget("Collectable1Done", 1)
        Message("Hmmm...das muss das Vulkanwasser sein!")
        collectedCollectables = collectedCollectables + 1
        return true
    end
end

function ThiefCollectable2()
    if IsNear(theodor,"vulc_glut",200) then
        DestroyEntity("vulc_glut")
        XGUIEng.ShowWidget("Collectable2Done", 1)
        Message("Ahhh...das scheint die Glut zu sein!")
        collectedCollectables = collectedCollectables + 1
        return true
    end
end

function ThiefCollectable3()
    if IsNear(theodor,"sheep_hair",200) then
        DestroyEntity("sheep_hair")
        XGUIEng.ShowWidget("Collectable3Done", 1)
        Sound.Play2DSound(1155,0,150) 
        Message("Tut mir leid, liebes Schafi.")
        collectedCollectables = collectedCollectables + 1
        return true
    end
end

function ThiefCollectable4()
    if IsNear(theodor,"scratch_parts",200) then
        DestroyEntity("scratch_parts")
        XGUIEng.ShowWidget("Collectable4Done", 1)
        Message("So viel Müll. Igitt!")
        collectedCollectables = collectedCollectables + 1
        return true
    end
end

function AllCollected()
    if collectedCollectables == 4 then
        Message("Jagen wir diese Dampfmaschine in die Luft!")
        StartSimpleJob("ThiefNearSteam")
        return true
    end
end

function ThiefNearSteam()
    if IsNear(theodor,"gate_protector",300) then
        GUI.DestroyMinimapPulse(GetPosition("gate_protector").X,GetPosition("gate_protector").Y)
        StartBriefingSteamMachine()
        return true
    end
end


function StartBriefingSteamMachine()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 So, jetzt mischen wir das alles zusammen...",
        position = GetPosition(theodor),
        explore = 2000,
    }
    local page2 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 ...und kippen es hier drauf.",
        position = GetPosition(theodor),
        action = function()
            Logic.CreateEffect(GGL_Effects.FXKalaPoison, GetPosition("gate_protector").X, GetPosition("gate_protector").Y, 1)
        end
    }
    local page3 = AP{
        title	= "",
        text	= "Die Maschine ächzte und explodiert.",
        position = GetPosition(theodor),
        action = function()
            Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("gate_protector").X, GetPosition("gate_protector").Y, 1)
            Sound.Play2DSound(1071,0,150)
            DestroyEntity("gate_protector")
        end
    }
        briefing.finished = function()  
            ResolveBriefing(page1) 
            SteamMachineDestroyed = true
            Logic.AddQuest(2, 3, SUBQUEST_CLOSED, "@color:255,0,0 Dampfmaschine", "Sammelt folgende Materialien: @cr @cr 1) Vulkanwasser aus einem Brunnen @cr 2) Glut aus einem Geysir @cr 3) Haare von einem Schaf @cr 4) Schrottteile @cr @cr Habt Ihr alles gesammelt geht zur Dampfmaschine.", 1) 
            for i = 1,4,1 do
                Logic.SetEntityInvulnerabilityFlag(GetID("inv_tower"..i),0)
            end
            Logic.SetEntityInvulnerabilityFlag(GetID("inv_tower2"),1)
        end;
        NormalSpeedInBriefing()
        StartBriefing(briefing)
end


function ThiefQuestCompleted()
    if SteamMachineDestroyed == true and AllBridgesActivated == true then
        Logic.AddQuest(2, 1, MAINQUEST_CLOSED, "@color:255,0,0 Die Intrige", "Eisenklaue soll die Verteidigungsanlagen der Schattenfeste schwächen. Diese Mission unterteilt sich in zwei Bereiche: @cr @cr 1) Die Kontrolle über die Zugbrückenmechanismen @cr @cr 2) Die Sabotage der Dampfmaschine der süd-östlichen Verteidigungsanlage", 1) 
        StartBriefingThiefEscape()
        return true
    end
end


function StartBriefingThiefEscape()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Alles geschafft. Jetzt muss ich mich nurnoch hier rausschleichen.",
        position = GetPosition(theodor),
        explore = 2000,
    }
    local page2 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Auf zum Geheimgang!",
        position = GetPosition("thief_pos2"),
        explore = 2000,
        action = function()
            GUI.CreateMinimapMarker(GetPosition("thief_pos2").X,GetPosition("thief_pos2").Y,0)
        end
    }
        briefing.finished = function()
            ResolveBriefing(page1)
            ResolveBriefing(page2)
            StartSimpleJob("ThiefSecretEscape")
            ThiefPointer2 = Logic.CreateEffect(GGL_Effects.FXTerrainPointer,GetPosition("thief_pos2").X,GetPosition("thief_pos2").Y,1)
        end;
        NormalSpeedInBriefing()
        StartBriefing(briefing)
end

function ThiefSecretEscape()
    if IsNear(theodor,"thief_pos2",300) then
        Logic.DestroyEffect(ThiefPointer2)
        XGUIEng.ShowWidget("ThiefCollectables",0)
        ThiefQuest = false
        GUI.DestroyMinimapPulse(GetPosition("thief_pos2").X,GetPosition("thief_pos2").Y)
        EndJob(ThiefDeadJob)
        DestroyEntity(theodor)
        theodor = Logic.CreateEntity(Entities.PU_Thief,GetPosition("thief_pos1").X,GetPosition("thief_pos1").Y,0,2)
        ThiefDeadJob = StartSimpleJob("ThiefIsDead")
        Message("Ich sollte mich auf den Weg zu Varg machen!")
        Camera.ScrollSetLookAt(GetPosition("thief_pos1").X,GetPosition("thief_pos1").Y)
        StartSimpleJob("ThiefNearVarg")
        return true
    end
end


function ThiefNearVarg()
    if IsNear(theodor,varg,300) then
        TheodorVargBriefing2()
        Logic.EntityLookAt(theodor,varg)
        Logic.EntityLookAt(leonardo,theodor)
        Logic.EntityLookAt(trupp1,theodor)
        Logic.EntityLookAt(trupp2,theodor)
        Logic.EntityLookAt(trupp3,theodor)
        Logic.EntityLookAt(guard,theodor)
        EndJob(ThiefDeadJob)
        if XGUIEng.IsWidgetShown("ThiefCollectables") == 1 then
            XGUIEng.ShowWidget("ThiefCollectables",0)
        end
        return true
    end
end


function TheodorVargBriefing2()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Da bin ich wieder. Habt ihr mich vermisst?",
        position = GetPosition(theodor),
        explore = 2000,
    }
    local page2 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Ich glaub es nicht... du hast es tatsächlich geschafft.",
        position = GetPosition(varg),
        explore = 2000,
    }
    local page3 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Ein Klacks war es nicht, aber ja, die Verteidigungsanlagen sind sabotiert. ",
        position = GetPosition(theodor)
    }
    local page4 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Es liegt nun an euch, wie Ihr taktisch vorgehen wollt. Ihr habt die Kontrolle über die Zugänge.",
        position = GetPosition(theodor)
    }
    local page5 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Dann lasst uns in den Krieg ziehen!",
        position = GetPosition(varg)
    }
    local page6 = AP{
        title	= "@color:255,0,0 Eisenklaue",
        text	= "@color:255,136,0 Bevor ich es vergesse. Ich habe beim erkunden der Feste beobachten können, dass Ihre Militärgebäude durch Dampfmaschinen geschützt werden. Wir benötigen wohl Fernkämpfer um Ihre Rekrutierungsgebäude zerstörbar zu machen.",
        position = GetPosition(theodor)
    }
    local page7 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Gut zu wissen. Danke Eisenklaue",
        position = GetPosition(varg)
    }
        briefing.finished = function()
            ResolveBriefing(page1)
            ResolveBriefing(page2)
            ResetQuestBook(2)
            GUI.SetControlledPlayer(1)
            Logic.ActivateUpdateOfExplorationForAllPlayers()
            theodor = ChangePlayer(theodor,1)
            SetHostile(1,4)
            Tools.ExploreArea(GetPosition("dw4").X,GetPosition("dw4").Y,7)
            Tools.ExploreArea(GetPosition("dw2").X,GetPosition("dw2").Y,7)
            Tools.ExploreArea(GetPosition("dw3").X,GetPosition("dw3").Y,7)
            Tools.ExploreArea(GetPosition("backdoor_player4").X,GetPosition("backdoor_player4").Y,7)
            ActivateTributesChapter4()
            AddTribute(Tribut_DrawBridgeNorth)
            AddTribute(Tribut_DrawBridgeLava)
            AddTribute(Tribut_BackdoorGate)
            Logic.AddQuest(1, 2, MAINQUEST_OPEN, "@color:255,0,0 Finalschlacht", "@cr Ihr habt nun die volle Kontrolle über die Zuwege zur Schattenfeste. Setzt diese weise ein. Besiegt alle Militärgebäude, alle Soldaten und zerstört die Feste. @cr @cr @color:255,255,0 Wichtig: @color:255,255,255  Die Militärgebäude der Schattenfeste werden durch Dampfmaschinen geschützt. Zerstört diese zuerst, damit die Militärgebäude zerstört werden können!", 1) 
            BuffKI4()
            UpgradeKI4()
            ResCheatKI4()
            ActivateKI4Attacks()
            KI4RecruitSerfs()

            --NV Rush
            NVtime = 180
            if mode == 3 then
                NVtime = 60
            elseif mode == 2 then
                NVtime = 120
            elseif mode == 1 then
                NVtime = 180
            end
            StartCountdown(NVtime,ActivateNVRush,false)
            

            ---Def Generatoren
            Logic.SetEntityInvulnerabilityFlag(GetID("barracks_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("archery_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("stables_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("foundry_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("tower1_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("tower2_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("hq_id4"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("support_army1"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("support_army2"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("def_hq1"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("def_hq2"),1)
            Logic.SetEntityInvulnerabilityFlag(GetID("support_army2"),1)
            SteamDefTrigger = Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED,nil,"SteamDefAlive",1)
            --SupportArmy
            SupportArmyTrigger = Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED,nil,"ActivateSupportArmys",1)
            --

            InvTowerJob = StartSimpleJob("ActivateInvTower")
            VictoryJob = StartSimpleJob("KI4Defeated")
        end;
        NormalSpeedInBriefing()
        StartBriefing(briefing)
end

function ActivateInvTower()
    if IsDestroyed("def_inv_tower") then
        Logic.SetEntityInvulnerabilityFlag(GetID("inv_tower2"),0)
        return true
    end
end

function SteamDefAlive()
    if IsDestroyed("def_archery") then
        Logic.SetEntityInvulnerabilityFlag(GetID("archery_id4"),0)
    end
    if IsDestroyed("def_barracks") then
        Logic.SetEntityInvulnerabilityFlag(GetID("barracks_id4"),0)
    end
    if IsDestroyed("def_foundry") then
        Logic.SetEntityInvulnerabilityFlag(GetID("foundry_id4"),0)
    end
    if IsDestroyed("def_stables") then
        Logic.SetEntityInvulnerabilityFlag(GetID("stables_id4"),0)
    end
    if IsDestroyed("def_hq1") and IsDestroyed("def_hq2") then
        Logic.SetEntityInvulnerabilityFlag(GetID("tower1_id4"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("tower2_id4"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("hq_id4"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("support_army1"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("support_army2"),0)
    end
    if IsDestroyed("def_archery") and IsDestroyed("def_barracks") and IsDestroyed("def_foundry") and IsDestroyed("def_stables") and IsDestroyed("def_hq1") and IsDestroyed("def_hq2") then
        Trigger.UnrequestTrigger(SteamDefTrigger)
    end
end


BridgesTable = {
    Gold = 0,
    Clay = 0,
    Wood = 0,
    Stone = 0,
    Iron = 0,
    Sulfur = 0,
    Silver = 0
}

function KI4RecruitSerfs()
    if IsExisting("hq_id4") then
        for i=1,8,1 do
            CppLogic.Entity.Building.HQBuySerf("hq_id4")
        end
        StartSimpleJob("KI4SerfChecker")
    end
end

function KI4SerfChecker()
    if Logic.GetPlayerEntities(4,Entities.PU_Serf,8) == 0 and IsExisting("hq_id4") then
        KI4RecruitSerfs()
        return true
    elseif IsDead("hq_id4") then
        return true
    end
end


function ResCheatKI4()
    Logic.AddToPlayersGlobalResource(4,ResourceType.ClayRaw,1000000)
    Logic.AddToPlayersGlobalResource(4,ResourceType.StoneRaw,1000000)
    Logic.AddToPlayersGlobalResource(4,ResourceType.GoldRaw,1000000)
    Logic.AddToPlayersGlobalResource(4,ResourceType.IronRaw,1000000)
    Logic.AddToPlayersGlobalResource(4,ResourceType.WoodRaw,1000000)
    Logic.AddToPlayersGlobalResource(4,ResourceType.SulfurRaw,1000000)
end

function UpgradeKI4()
    if mode == 3 then
    for i=1,3,1 do --Schwert auf T4 upgraden
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
    end

    for i=1,3,1 do --Bogen auf T4 upgraden
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
    end

    for i=1,3,1 do --Speerträger auf T4 upgraden
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
    end

    --Scharfschützen auf T2 upgraden
    GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 4)  
    GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 4)

    --Reiter auf T2 upgraden
    GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 4)  
    GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 4)
    GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)  
    GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 4)

    elseif mode<3 then
        for i=1,2,1 do --Schwert auf T3 upgraden
            GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)  
            GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
        end
    
        for i=1,2,1 do --Bogen auf T3 upgraden
            GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)  
            GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
        end
    
        for i=1,2,1 do --Speerträger auf T3 upgraden
            GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)  
            GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
        end
    
        --Scharfschützen auf T2 upgraden
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 4)

        --Reiter auf T2 upgraden
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 4)
        GUI.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)  
        GUI.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 4)
    end

    
end

function BuffKI4()
    Logic.SetTechnologyState(4, Technologies.T_LeatherMailArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_ChainMailArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_PlateMailArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_SoftArcherArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_PaddedArcherArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_LeatherArcherArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_MasterOfSmithery, 3)
    Logic.SetTechnologyState(4, Technologies.T_IronCasting, 3)
    Logic.SetTechnologyState(4, Technologies.T_Fletching, 3)
    Logic.SetTechnologyState(4, Technologies.T_BodkinArrow, 3)
    Logic.SetTechnologyState(4, Technologies.T_WoodAging, 3)
    Logic.SetTechnologyState(4, Technologies.T_Turnery, 3)
    Logic.SetTechnologyState(4, Technologies.T_EnhancedGunPowder, 3)
    Logic.SetTechnologyState(4, Technologies.T_BlisteringCannonballs, 3)
    Logic.SetTechnologyState(4, Technologies.T_BetterTrainingBarracks, 3)
    Logic.SetTechnologyState(4, Technologies.T_BetterTrainingArchery, 3)
    Logic.SetTechnologyState(4, Technologies.T_Shoeing, 3)
    Logic.SetTechnologyState(4, Technologies.T_Masonry, 3)
    if mode == 3 then
        Logic.SetTechnologyState(4, Technologies.T_SuperTechnology, 3)
    end
    
    Logic.SetTechnologyState(4, Technologies.T_FleeceArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_FleeceLinedLeatherArmor, 3)
    Logic.SetTechnologyState(4, Technologies.T_LeadShot, 3)
    Logic.SetTechnologyState(4, Technologies.T_Sights, 3)
end



function ActivateTributesChapter4()
    BridgeSystemActive = true
    CounterBridgeLava = 0
    CounterBridgeNorth = 0
    CounterGateSouth = 0

    CountBridgesTable = {}
    if mode == 1 then
        CountBridgesTable = {
            [1] = 120
        }
    elseif mode == 2 then
        CountBridgesTable = {
            [1] = 210
        }
    elseif mode == 3 then
        CountBridgesTable = {
            [1] = 300
        }
    end

    XGUIEng.SetText("CountdownBridgeNorth", "@center @color:124,252,0 Fertig!", 1)
    XGUIEng.SetText("CountdownBridgeLava", "@center @color:124,252,0 Fertig!", 1)
    XGUIEng.SetText("CountdownGateSouth", "@center @color:124,252,0 Fertig!", 1)

    XGUIEng.ShowWidget("BridgeCooldown", 1)

    Tribut_DrawBridgeNorth = CreateATribute(1
    ,"@color:255,0,0 Zugbrücke: Norden @cr @color:255,255,255 Öffnet/ Schließt die Zugbrücke im Norden!",
    BridgesTable, 
    function() 
        ChangeBridgeNorth() 
        CounterBridgeNorth =  CountBridgesTable[1]
        StartSimpleJob("ActivateCountdownNorth")
        Tribut_DrawBridgeNorth.Tribute = nil
    end)

    Tribut_DrawBridgeLava = CreateATribute(1
    ,"@color:255,0,0 Zugbrücke: Lavagebiet @cr @color:255,255,255 Öffnet/ Schließt die Zugbrücke im Lavagebiet!",
    BridgesTable, 
    function() 
        ChangeBridgeLava() 
        CounterBridgeLava = CountBridgesTable[1]
        StartSimpleJob("ActivateCountdownLava")
        Tribut_DrawBridgeLava.Tribute = nil
    end)

    Tribut_BackdoorGate = CreateATribute(1
    ,"@color:255,0,0 Tor: Süd-Osten @cr @color:255,255,255 Öffnet/ Schließt das Tor im Süd-Osten!",
    BridgesTable, 
    function() 
        ChangeBackdoorGate() 
        CounterGateSouth = CountBridgesTable[1]
        StartSimpleJob("ActivateCountdownSouth")
        Tribut_BackdoorGate.Tribute = nil
    end)

end


function ActivateCountdownNorth()
    if CounterBridgeNorth == 0 then
        AddTribute(Tribut_DrawBridgeNorth)
        XGUIEng.SetText("CountdownBridgeNorth", "@center @color:124,252,0 Fertig!", 1)
        return true
    else
        CounterBridgeNorth = CounterBridgeNorth -1
        local TotalMin = math.floor( CounterBridgeNorth / 60 )
        local Minutes = math.mod( TotalMin, 60 )
        local TotalSeconds = math.mod( math.floor(CounterBridgeNorth), 60 )
        local String = " "


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
        CountBridgeNorth = String
        XGUIEng.SetText("CountdownBridgeNorth", "@center @color:255,0,0  "..CountBridgeNorth, 1)
        return false
    end
end

function ActivateCountdownLava()
    if CounterBridgeLava == 0 then
        AddTribute(Tribut_DrawBridgeLava)
        XGUIEng.SetText("CountdownBridgeLava", "@center @color:124,252,0 Fertig!", 1)
        return true
    else
        CounterBridgeLava = CounterBridgeLava -1
        local TotalMin = math.floor( CounterBridgeLava / 60 )
        local Minutes = math.mod( TotalMin, 60 )
        local TotalSeconds = math.mod( math.floor(CounterBridgeLava), 60 )
        local String = " "


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
        CountBridgeLava = String
        XGUIEng.SetText("CountdownBridgeLava", "@center @color:255,0,0  "..CountBridgeLava, 1)
        return false
    end
end


function ActivateCountdownSouth()
    if CounterGateSouth == 0 then
        AddTribute(Tribut_BackdoorGate)
        XGUIEng.SetText("CountdownGateSouth", "@center @color:124,252,0 Fertig!", 1)
        return true
    else
        CounterGateSouth = CounterGateSouth -1
        local TotalMin = math.floor( CounterGateSouth / 60 )
        local Minutes = math.mod( TotalMin, 60 )
        local TotalSeconds = math.mod( math.floor(CounterGateSouth), 60 )
        local String = " "


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
        CountGateSouth = String
        XGUIEng.SetText("CountdownGateSouth",  "@center @color:255,0,0  "..CountGateSouth, 1)
        return false
    end
end


StatusBridgeNorth = 0

function ChangeBridgeNorth()
    local bID = GetID("dw4")
    local type = Logic.GetEntityTypeName(Logic.GetEntityType(bID))
    if type == "PB_DrawBridgeClosed2" then
        ReplaceEntity(bID,Entities.XD_DrawBridgeOpen2)
        StatusBridgeNorth = 1
    else
        ReplaceEntity(bID,Entities.PB_DrawBridgeClosed2)
        StatusBridgeNorth = 0
    end
end

StatusBridgeLava = 0

function ChangeBridgeLava()
    local bID1 = GetID("dw2")
    local bID2 = GetID("dw3")
    local type1 = Logic.GetEntityTypeName(Logic.GetEntityType(bID1))
    local type2 = Logic.GetEntityTypeName(Logic.GetEntityType(bID2))
    if type1 == "PB_DrawBridgeClosed2" and type2 == "PB_DrawBridgeClosed2" then
        ReplaceEntity(bID1,Entities.XD_DrawBridgeOpen2)
        ReplaceEntity(bID2,Entities.XD_DrawBridgeOpen2)
        StatusBridgeLava = 1
    else
        ReplaceEntity(bID1,Entities.PB_DrawBridgeClosed2)
        ReplaceEntity(bID2,Entities.PB_DrawBridgeClosed2)
        StatusBridgeLava = 0
    end
end

StatusBackdoorGate = 0

function ChangeBackdoorGate()
    local bID = GetID("backdoor_player4")
    local type = Logic.GetEntityTypeName(Logic.GetEntityType(bID))
    if type == "XD_DarkWallStraightGate_Closed" then
        ReplaceEntity(bID,Entities.XD_DarkWallStraightGate)
        StatusBackdoorGate = 1
    else
        ReplaceEntity(bID,Entities.XD_DarkWallStraightGate_Closed)
        StatusBackdoorGate = 0
    end
end


UAControlState = {Attacking=1, Refill=2}

function ActivateKI4Attacks()

    
    if mode == 1 then
        KIRecruitTable = {
            [1] = 10 --Größe der Armee/ Leaderanzahl
        }
    elseif mode == 2 then
        KIRecruitTable = {
            [1] = 20 --Größe der Armee/ Leaderanzahl
        }
    elseif mode == 3 then
        KIRecruitTable = {
            [1] = 30 --Größe der Armee/ Leaderanzahl
        }
    end

    KI4RecruitingArmy = LazyUnlimitedArmy:New({
        -- benötigt
        Player = 4,
        Area = 11000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = 4,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true,
        IgnoreFleeing = true,
    }, 20, NumberUA)



    RecruiterKI4 = UnlimitedArmyRecruiter:New(KI4RecruitingArmy, {
        Buildings = { GetID("archery_id4"), GetID("barracks_id4"), GetID("foundry_id4"), GetID("stables_id4") }, -- mehr gebäude einfach hier rein
        ArmySize = KIRecruitTable[1],
        UCats = {
            { UCat = UpgradeCategories.Cannon4, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.LeaderSword, SpawnNum = 3, Looped = true },
            { UCat = UpgradeCategories.LeaderBow, SpawnNum = 3, Looped = true },
            { UCat = UpgradeCategories.LeaderCavalry, SpawnNum = 2, Looped = true },
            { UCat = UpgradeCategories.LeaderHeavyCavalry, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.Cannon3, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 2, Looped = true },
            { UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.LeaderRifle, SpawnNum = 2, Looped = true },
            { UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.Cannon3, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.LeaderCavalry, SpawnNum = 2, Looped = true },
            { UCat = UpgradeCategories.LeaderHeavyCavalry, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.Cannon4, SpawnNum = 1, Looped = true },
            { UCat = UpgradeCategories.LeaderSword, SpawnNum = 3, Looped = true },
            { UCat = UpgradeCategories.LeaderBow, SpawnNum = 3, Looped = true },
        },
        ResCheat = true,
        ReorderAllowed = false,
        RemoveUnavailable = true
    })

    KI4RecruitingArmy.ControlState= UAControlState.Refill
    KI4RecruitingArmy:AddCommandLuaFunc(HandleArmy,true).Def = UnlimitedArmy.CreateCommandDefend(GetPosition("def_pos_army4"), 12000)

    
end



function HandleArmy(self, cmd)
    if self.ControlState ~= UAControlState.Refill and self:IsDead() then
        self.SpawnerActive = true
        self.ControlState = UAControlState.Refill
        --Message("now refilling, cmd move home")
        return false, UnlimitedArmy.CreateCommandMove(GetPosition("def_pos_army4"))
    end
    if self.ControlState == UAControlState.Refill then
        if not self.Spawner or self:GetSize() >= self.Spawner.ArmySize then
            self.SpawnerActive = false
            self.ControlState = UAControlState.Attacking
            --Message("now attacking")
        else
            --Message("cmd def")
            return false, cmd.Def
        end
    end
    if self.ControlState == UAControlState.Attacking then
        if IsOnSide(self) then
            if self:IsIdle() then
                --Message("cmd move attack")
                return false, UnlimitedArmy.CreateCommandMove(GetPosition("barb_castle"))
            end
        else
            --Message("no way, def")
            return false, cmd.Def
        end
    end
    --Message("no cmd")
    return false
end

---@param self UnlimitedArmy
function IsOnSide(self)
    --local armyPos = self:GetPosition()
    --local sec = CppLogic.Logic.LandscapeGetSector(armyPos)
    local firstleader = self:Iterator()()
    local sec = 0
    if IsValid(firstleader) then
        sec = Logic.GetSector(firstleader)
    end
    return Logic.GetSector(GetID("barb_castle")) == sec
end


function ActivateEndboss()
    Endgegner = Logic.CreateEntity(Entities.CU_BlackKnight_LeaderMace1,GetPosition("spawn_hq_id4").X,GetPosition("spawn_hq_id4").Y,0,4)
    --Setup Endboss
    CppLogic.Entity.SetDamage(GetID(Endgegner), 30)
    CppLogic.Entity.SetArmor(GetID(Endgegner), 20)
    CppLogic.Entity.Leader.SetTroopHealth(GetID(Endgegner), 1000)
    CppLogic.Entity.PerformHeal(GetID(Endgegner), 1000, false)
    --
    if IsAlive("support_army1") then
        SupportArmy1:AddLeader(Endgegner)
    end
    StartSimpleHiResJob("EndbossSpezial")
    StartSimpleJob("EndgegnerMinen")
end

function EndbossSpezial()
    if IsAlive("hq_id4") then
        local id = GetEntityId(Endgegner)
        if Logic.IsEntityAlive(id) then
            Logic.HealEntity(id, 5)
        end
    end
    if IsDead(Endgegner) then
        StartCountdown(60 * 4, ActivateEndboss, false)
        return true
    end
end

function EndgegnerMinen()
    if IsAlive(Endgegner) then
        if Counter.Tick2("Minenplatzierung", 4) then --alle 4 Sekunden
            if IsAlive(Endgegner) then
                local pos = GetPosition(Endgegner) --Bombe
                Logic.CreateEntity(Entities.XD_Bomb1, pos.X, pos.Y, 0, 6)
                x_end, y_end = Logic.EntityGetPos(GetID(Endgegner)) --Rangeattack

                local x
                local y
                local r = 500
                for a = 0, 360, 30 do
                    x = r * math.cos(a) + x_end
                    y = r * math.sin(a) + y_end
                    CppLogic.Effect.CreateProjectile(GGL_Effects.FXKalaArrow, x_end, y_end, x, y, 0, nil, nil, nil, 4, nil, nil, nil)
                    Logic.CreateEffect(GGL_Effects.FXSalimHeal, x, y, 1)
                    CppLogic.Combat.DealAoEDamage(GetID(Endgegner), x, y, 150, 300, 4, DamageClasses.DC_Hero, true, false, true, AdvancedDealDamageSource.Script)
                end
            end
        end
    end
    if IsDead(Endgegner) then
        return true
    end
end



function ActivateSupportArmys()
    if IsDestroyed("barracks_id4") and IsDestroyed("archery_id4") and IsDestroyed("stables_id4") and IsDestroyed("foundry_id4") then
        Message("@color:255,0,0 Achtung: @color:255,255,255 Die Schattenfeste macht einen Ausfall.")
        ActivateSupportArmy1()
        ActivateSupportArmy2()
        Logic.SetEntityInvulnerabilityFlag(GetID("def_hq1"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("def_hq2"),0)
        if mode == 3 then
            ActivateEndboss()
        end
        return true
    end
end

function ActivateSupportArmy1()

    SupportArmy1Table = {} 

    if mode == 1 then
        SupportArmy1Table = {
            [1] = 180,  --Spawnzeit
            [2] = 6,   --Armeegröße
            [3] = {Entities.PU_LeaderSword3,8,1},
            [4] = {Entities.PU_LeaderBow3,8,1},
            [5] = {Entities.PV_Cannon2,0,1},
            [6] = {Entities.PV_Cannon1,0,1},
            [7] = {Entities.PU_LeaderRifle1,4,1},
            [8] = {Entities.PU_LeaderRifle1,4,1},
        }
    elseif mode == 2 then
        SupportArmy1Table = {
            [1] = 120,  --Spawnzeit
            [2] = 10,   --Armeegröße
            [3] = {Entities.PU_LeaderSword3,8,2},
            [4] = {Entities.PU_LeaderBow3,8,2},
            [5] = {Entities.PV_Cannon2,0,2},
            [6] = {Entities.PV_Cannon3,0,2},
            [7] = {Entities.PU_LeaderRifle1,4,1},
            [8] = {Entities.PU_LeaderRifle1,4,1},
        }
    elseif mode == 3 then
        SupportArmy1Table = {
            [1] = 60,  --Spawnzeit
            [2] = 18,   --Armeegröße
            [3] = {Entities.PU_LeaderSword4,8,3},
            [4] = {Entities.PU_LeaderBow4,8,3},
            [5] = {Entities.PU_LeaderCavalry2,6,3},
            [6] = {Entities.PU_LeaderHeavyCavalry2,3,3},
            [7] = {Entities.PU_LeaderRifle1,4,3},
            [8] = {Entities.PU_LeaderRifle1,4,3},
        }
    end


    SupportArmy1 = LazyUnlimitedArmy:New({
        -- benötigt
        Player = 4,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Lines,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true,
        IgnoreFleeing = true,
    }, 22, NumberUA)

    SupportArmy1Spawner = UnlimitedArmySpawnGenerator:New(SupportArmy1, {
        -- benötigt:
        Position = GetPosition("spawn_support_army1"), --position
        ArmySize = SupportArmy1Table[2], --armysize
        SpawnCounter = SupportArmy1Table[1],  --spawncounter
        SpawnLeaders = SupportArmy1Table[2],   --spawnleaders
        LeaderDesc = {
            {LeaderType = SupportArmy1Table[3][1], SoldierNum = SupportArmy1Table[3][2] , SpawnNum = SupportArmy1Table[3][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy1Table[4][1], SoldierNum = SupportArmy1Table[4][2] , SpawnNum = SupportArmy1Table[4][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy1Table[5][1], SoldierNum = SupportArmy1Table[5][2] , SpawnNum = SupportArmy1Table[5][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy1Table[6][1], SoldierNum = SupportArmy1Table[6][2] , SpawnNum = SupportArmy1Table[6][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy1Table[7][1], SoldierNum = SupportArmy1Table[7][2] , SpawnNum = SupportArmy1Table[7][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy1Table[8][1], SoldierNum = SupportArmy1Table[8][2] , SpawnNum = SupportArmy1Table[8][3], Looped = true, Experience = 3},
        },
        -- optional:
        Generator = "support_army1",  --generator
    })


    SupportArmy1.ControlState= UAControlState.Refill
    SupportArmy1:AddCommandLuaFunc(HandleArmy,true).Def = UnlimitedArmy.CreateCommandDefend(GetPosition("def_pos_army4"), 12000)
end


function ActivateSupportArmy2()

    SupportArmy2Table = {} 

    if mode == 1 then
        SupportArmy2Table = {
            [1] = 180,  --Spawnzeit
            [2] = 6,   --Armeegröße
            [3] = {Entities.PU_LeaderSword3,8,1},
            [4] = {Entities.PU_LeaderBow3,8,1},
            [5] = {Entities.PV_Cannon2,0,1},
            [6] = {Entities.PV_Cannon1,0,1},
            [7] = {Entities.PU_LeaderRifle1,4,1},
            [8] = {Entities.PU_LeaderRifle1,4,1},
        }
    elseif mode == 2 then
        SupportArmy2Table = {
            [1] = 120,  --Spawnzeit
            [2] = 10,   --Armeegröße
            [3] = {Entities.PU_LeaderSword3,8,2},
            [4] = {Entities.PU_LeaderBow3,8,2},
            [5] = {Entities.PV_Cannon2,0,2},
            [6] = {Entities.PV_Cannon3,0,2},
            [7] = {Entities.PU_LeaderRifle1,4,1},
            [8] = {Entities.PU_LeaderRifle1,4,1},
        }
    elseif mode == 3 then
        SupportArmy2Table = {
            [1] = 60,  --Spawnzeit
            [2] = 18,   --Armeegröße
            [3] = {Entities.PU_LeaderSword4,8,3},
            [4] = {Entities.PU_LeaderBow4,8,3},
            [5] = {Entities.PV_Cannon3,0,3},
            [6] = {Entities.PV_Cannon4,0,3},
            [7] = {Entities.PU_LeaderRifle1,4,3},
            [8] = {Entities.PU_LeaderRifle1,4,3},
        }
    end


    SupportArmy2 = LazyUnlimitedArmy:New({
        -- benötigt
        Player = 4,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Lines,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true,
        IgnoreFleeing = true,
    }, 23, NumberUA)

    SupportArmy2Spawner = UnlimitedArmySpawnGenerator:New(SupportArmy2, {
        -- benötigt:
        Position = GetPosition("spawn_support_army2"), --position
        ArmySize = SupportArmy2Table[2], --armysize
        SpawnCounter = SupportArmy2Table[1],  --spawncounter
        SpawnLeaders = SupportArmy2Table[2],   --spawnleaders
        LeaderDesc = {
            {LeaderType = SupportArmy2Table[3][1], SoldierNum = SupportArmy2Table[3][2] , SpawnNum = SupportArmy2Table[3][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy2Table[4][1], SoldierNum = SupportArmy2Table[4][2] , SpawnNum = SupportArmy2Table[4][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy2Table[5][1], SoldierNum = SupportArmy2Table[5][2] , SpawnNum = SupportArmy2Table[5][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy2Table[6][1], SoldierNum = SupportArmy2Table[6][2] , SpawnNum = SupportArmy2Table[6][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy2Table[7][1], SoldierNum = SupportArmy2Table[7][2] , SpawnNum = SupportArmy2Table[7][3], Looped = true, Experience = 3},
            {LeaderType = SupportArmy2Table[8][1], SoldierNum = SupportArmy2Table[8][2] , SpawnNum = SupportArmy2Table[8][3], Looped = true, Experience = 3},
        },
        -- optional:
        Generator = "support_army2",  --generator
    })

    SupportArmy2.ControlState= UAControlState.Refill
    SupportArmy2:AddCommandLuaFunc(HandleArmy,true).Def = UnlimitedArmy.CreateCommandDefend(GetPosition("def_pos_army4"), 12000)

end



function KI4Defeated()
    if IsDestroyed("barracks_id4") and IsDestroyed("archery_id4") and IsDestroyed("stables_id4") and IsDestroyed("foundry_id4") and IsDestroyed("tower1_id4") and IsDestroyed("tower2_id4") and IsDestroyed("inv_tower2") and IsDestroyed("hq_id4") then
        if KI4RecruitingArmy:IsDead() == -1 and KI4ArmyTable[1][1]:IsDead() == -1  and KI4ArmyTable[2][1]:IsDead() == -1 and KI4ArmyTable[3][1]:IsDead() == -1 and KI4ArmyTable[4][1]:IsDead() == -1 and KI4ArmyTable[5][1]:IsDead() == -1 and KI4ArmyTable[6][1]:IsDead() == -1 and KI4ArmyTable[7][1]:IsDead() == -1 and KI4ArmyTable[8][1]:IsDead() == -1 then
            StartVictoryBriefing()
            return true
        end
    end
end


function ActivateNVRush()
    ActivateRushSpawner1()
    ActivateRushSpawner2()
    StartNVRushBrief()
end


function StartNVRushBrief()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "Mentor",
        text	= "Seht Herr, das Nebelvolk hat einen Weg durch das unterirdische Höhlensystem gefunden und greift uns wieder an!",
        position = GetPosition("nv_rush1"),
        explore = 2000,
    }
    local page2 = AP{
        title	= "Mentor",
        text	= "Sie kommen auch am Fuß des Vulkans aus den Höhlen!",
        position = GetPosition("nv_rush2"),
        explore = 2000,
    }
    briefing.finished = function()  
        ResolveBriefing(page1)
        ResolveBriefing(page2)
        for i=1,6,1 do
            DestroyEntity("pali"..i)
        end
        NVRushJob = StartSimpleJob("NVRush2Checker")
     end;
     NormalSpeedInBriefing()
     StartBriefing(briefing)

end

function NVRush2Checker()
    if IsDestroyed("block_rush2") then
        ReplaceEntity("nv_rush2",Entities.XD_RockDarkEvelance7)
        Sound.Play2DSound(1069,0,150)
        Logic.CreateEffect(GGL_Effects.FXBuildingSmokeLarge, GetPosition("nv_rush2").X, GetPosition("nv_rush2").Y, 1) 
        SpawnerNVRushArmy2:Remove()
        StartSimpleJob("StoneChecker")
        return true
    end
end

function StoneChecker()
    local enttype = { Logic.GetPlayerEntitiesInArea(1, nil, GetPosition("nv_rush2").X, GetPosition("nv_rush2").Y, 600, 1) }
    if enttype[1] > 0 then
        if Logic.IsHero(enttype[2]) == 1 then
            trupp1 = SetPosition(enttype[2], GetPosition("trupp2_chap4"))
            Logic.HurtEntity(trupp1,1000)
            Message("@color:255,136,0 Hinweis: Helgar wurde von dem Stein getötet. Schaut vor eurer Burg nach ihm.")
        else
            Logic.DestroyEntity(enttype[2])
            Message("@color:255,136,0 Hinweis: Einige Truppen sind durch den Steinschlag gestorben.")
        end
        enttype = { Logic.GetPlayerEntitiesInArea(1, nil, GetPosition("nv_rush2").X, GetPosition("nv_rush2").Y, 600, 1) }
    else
        return true
    end
end

function ActivateRushSpawner1()
   
    if mode == 1 then
        nvrush1_table = {
            [1] = 2, --Größe der Armee/ Leaderanzahl
            [2] = 180 --Respawnzeit
        }
    elseif mode == 2 then
        nvrush1_table = {
            [1] = 4, --Größe der Armee/ Leaderanzahl
            [2] = 140 --Respawnzeit
        }
    elseif mode == 3 then
        nvrush1_table = {
            [1] = 6, --Größe der Armee/ Leaderanzahl
            [2] = 120 --Respawnzeit
        }
    end
    
    
        NVRushArmy1 = LazyUnlimitedArmy:New({					
            -- benötigt
            Player = 6,
            Area = 4000,
            -- optional
            AutoDestroyIfEmpty = true,
            TransitAttackMove = true,
            Formation = UnlimitedArmy.Formations.Chaotic,
            AIActive = true,
            AutoRotateRange = 100000,
            HiResJob = true,
			IgnoreFleeing = true,
        }, 24,NumberUA)
    

        SpawnerNVRushArmy1 = UnlimitedArmySpawnGenerator:New(NVRushArmy1, {
            -- benötigt:
            Position = GetPosition("nv_rush1"), --position
            ArmySize = nvrush1_table[1], --armysize
            SpawnCounter = nvrush1_table[2],  --spawncounter
            SpawnLeaders = nvrush1_table[1],   --spawnleaders
            LeaderDesc = {
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
            },
        })

        NVRushArmy1: AddCommandMove(GetPosition("barb_castle"), true);
        NVRushArmy1: AddCommandWaitForIdle(true);

end

function ActivateRushSpawner2()
    if mode == 1 then
        nvrush2_table = {
            [1] = 2, --Größe der Armee/ Leaderanzahl
            [2] = 180 --Respawnzeit
        }
    elseif mode == 2 then
        nvrush2_table = {
            [1] = 4, --Größe der Armee/ Leaderanzahl
            [2] = 140 --Respawnzeit
        }
    elseif mode == 3 then
        nvrush2_table = {
            [1] = 6, --Größe der Armee/ Leaderanzahl
            [2] = 120 --Respawnzeit
        }
    end
    
    
        NVRushArmy2 = LazyUnlimitedArmy:New({					
            -- benötigt
            Player = 6,
            Area = 4000,
            -- optional
            AutoDestroyIfEmpty = true,
            TransitAttackMove = true,
            Formation = UnlimitedArmy.Formations.Chaotic,
            AIActive = true,
            AutoRotateRange = 100000,
            HiResJob = true,
			IgnoreFleeing = true,
        }, 25,NumberUA)
    

        SpawnerNVRushArmy2 = UnlimitedArmySpawnGenerator:New(NVRushArmy2, {
            -- benötigt:
            Position = GetPosition("nv_rush2"), --position
            ArmySize = nvrush2_table[1], --armysize
            SpawnCounter = nvrush2_table[2],  --spawncounter
            SpawnLeaders = nvrush2_table[1],   --spawnleaders
            LeaderDesc = {
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
            },
        })

        NVRushArmy2: AddCommandMove(GetPosition("barb_castle"), true);
        NVRushArmy2: AddCommandWaitForIdle(true);

end


function StartVictoryBriefing()
    EndJob(DefeatJob1)
    ReplaceEntity("boat2",Entities.XD_Dragonboat)
    Logic.RotateEntity(GetID("boat2"),85)
    DestroyEntity(varg)
    DestroyEntity(guard)
    DestroyEntity(trupp3)
    DestroyEntity(trupp1)
    DestroyEntity(trupp2)
    DestroyEntity(leonardo)
    varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("spawn_varg").X, GetPosition("spawn_varg").Y, 0, 1)
    trupp1 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp1").X,GetPosition("spawn_trupp1").Y,0, 1)
    trupp2 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp2").X,GetPosition("spawn_trupp2").Y,0, 1)
    trupp3 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp3").X,GetPosition("spawn_trupp3").Y,0, 1)
    Logic.EntityLookAt(varg, trupp1)
    Logic.EntityLookAt(trupp1,varg)
    Logic.EntityLookAt(trupp2, varg)
    Logic.EntityLookAt(trupp3, varg)
    guard = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp4").X,GetPosition("spawn_trupp4").Y,0, 1)
    Logic.EntityLookAt(guard, varg)
    leonardo = Logic.CreateEntity(Entities.CU_Leonardo,GetPosition("spawn_trupp5").X,GetPosition("spawn_trupp5").Y,0,3 )
    Logic.EntityLookAt(leonardo, varg)

    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Männer! Ich bin stolz auf euch. Wir waren siegreich.",
        position = GetPosition(varg),
        explore = 2000,
    }
    local page2 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Hurra...(jauchz)...den haben wir es ordentlich gezeigt.",
        position = GetPosition(trupp1),
        explore = 2000,
    }
    local page3 = AP{
        title	= "@color:255,0,0 Wolfgang",
        text	= "@color:255,136,0 Aber sowas von. Niemand sollte sich mit unserem neuen Anführer: VARG, Sohn des Jarg anlegen.",
        position = GetPosition(trupp2)
    }
    local page4 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Har Har, Reynivellir erstrahlt im neuen glanz und ist sicherer den je!",
        position = GetPosition(trupp3)
    }
    local page5 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Genau und das haben wir uns alles zusammen erarbeitet. Stimmts Leonardo?",
        position = GetPosition(varg)
    }
    local page6 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Aber sowasvon...Nur ich habe leider schlechte Kunde für euch...",
        position = GetPosition(leonardo)
    }
    local page7 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Was soll denn sein?",
        position = GetPosition(varg)
    }
    local page8 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Ihr erinnert euch doch noch an die Geschenisse in Thalgrund. Wo Mary de Mortfichet Kerberos von den Toten zurückgeholt hat.",
        position = GetPosition(leonardo)
    }
    local page9 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Wie könnte ich das nur vergessen. Ich war froh, all diese Menschen hinter mir zu lassen...",
        position = GetPosition(varg)
    }
    local page10 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Dario hat seinen Falken zu mir entsandt mit einer Botschaft für euch:",
        position = GetPosition(leonardo)
    }
    local page11 = AP{
        title	= "Darios Botschaft",
        text	= "Varg mein alter Freund. Wir haben Kerberos hoch in den Norden über das kalte Meer verfolgt. Noch weiter nördlich als deine Heimat Grimsvötn. Kerberos hat sich hier in den Nordlanden verkrochen und sich an deinen Vetter gewandt. Ihr müsst uns zur Hilfe kommen!",
        position = GetPosition(leonardo)
    }
    local page12 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Er bittet uns um Hilfe gegen Kerberos noch ein weiteres mal in den Krieg zu ziehen. Was haltet Ihr davon Männer?",
        position = GetPosition(leonardo)
    }
    local page13 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Wir sollten Ihnen helfen. Auch wenn ich diesen Dario nicht kenne. Jedoch steht dort auch was von eurem Vetter, also es geht um die Familie!",
        position = GetPosition(trupp1)
    }
    local page14= AP{
        title	= "@color:255,0,0 Wolfgang",
        text	= "@color:255,136,0 Da stimme ich Helgar zu. Die Familie ist alles!",
        position = GetPosition(trupp2)
    }
    local page15 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ich will doch nur etwas Met trinken....",
        position = GetPosition(trupp3)
    }
    local page16 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Dann steht es fest. Wir segeln noch höher in den Norden! Leonardo begleitest du uns?",
        position = GetPosition(varg)
    }
    local page17 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Na klar! Und Rüdiger, ich habe da eine kleine Überraschung für dich:",
        position = GetPosition(leonardo)
    }
    local page18 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 GAAAANNNNZZZ VIEL MEEEEET! ",
        position = GetPosition("met2"),
        action = function() 
            Logic.CreateEntity(Entities.XD_MiscBarrel2,GetPosition("met1").X,GetPosition("met1").Y,0,0)
            Logic.CreateEntity(Entities.XD_MiscBarrel2,GetPosition("met2").X,GetPosition("met2").Y,0,0)
            Logic.CreateEntity(Entities.XD_MiscBarrel2,GetPosition("met3").X,GetPosition("met3").Y,0,0)
        end
    }
    local page19 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 JAAAAAAA!!!!",
        position = GetPosition(trupp3),
        action = function()
            Logic.CreateEntity(Entities.XD_Dragonboat,GetPosition("end_pos").X,GetPosition("end_pos").Y,0,0)
        end
    }
    local page20 = AP{
        title	= "Mentor",
        text	= "Und so segelte die Gruppe in Richtung Norden, um Dario zur Unterstützung zu eilen.",
        position = GetPosition("end_pos"),
        explore = 2000
    }
    local page21 = AP{
        title	= "Fortsetzung folgt...",
        text	= "Vielen Dank für das Spielen meiner Karte. Ich hoffe ihr hattet Spaß. Liebe Grüße Novator12",
        position = GetPosition("end_pos")
    }
        briefing.finished = function()  
           Victory()
        end;
        NormalSpeedInBriefing()
        StartBriefing(briefing)
end
