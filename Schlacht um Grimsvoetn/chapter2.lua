function Start_Chapter2()
    chapterID = 2
    chapterText = "Wiederaufbau von Reynivellir @cr Varg muss das Dorf wieder aufbauen und das Leuchtfeuer entzünden."
    DestroyEntity(GetID("block1"))
    DestroyEntity(GetID("block2"))
    for i=1,4,1 do
        DestroyEntity("dt"..i)
    end
    for i =1,9,1 do
        DestroyEntity("be"..i)
    end
    ResetQuestBook(1)
    varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("varg_chapter2").X, GetPosition("varg_chapter2").Y, 0, 1)
    trupp1 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("helgar_chapter2").X,GetPosition("helgar_chapter2").Y,0, 1)
    trupp2 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("wolfgang_chapter2").X,GetPosition("wolfgang_chapter2").Y,0, 1)
    trupp3 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("ruediger_chapter2").X,GetPosition("ruediger_chapter2").Y,0, 1)
    guard = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("mijoern_chapter2").X,GetPosition("mijoern_chapter2").Y,0, 1)
    DefeatJob1 = StartSimpleJob("AllHerosDead")
    RefreshDisplayNames()
    StartBriefingChapter2()
     -- Start der Base Angriffe
    StartCountdown(60*5,StartBaseAttacks,false)
    --Barriere zum Lavabereich zerstören
    DestroyEntity("barrier_lava")
    for i=1,4,1 do
        DestroyEntity("ae"..i)
    end
    EnableLavaDamage = true; --Schaden in Lava nehmen = EIN
    CreatePolygon()
end


function StartBaseAttacks()
    ReplaceEntity("boat2",Entities.XD_Wreckage)
    SVLib.SetEntitySize(GetID("boat2"),1.15)
    Logic.RotateEntity(GetID("boat2"),275)
    WreckageBoat1 = ReplaceEntity("boat1",Entities.XD_Wreckage)
    Logic.RotateEntity(WreckageBoat1,317)
    NvAttackState = true
    ActivateNvAttackBase()
end

-------------------------------------------------------------------------NV-Attack-Handler--------------------------------------------------------------------------------

NvAttackState = false

function ActivateNvAttackBase()
    if NvAttackState then
        Message("Achtung, Nebel am Anlegesteg zieht auf!")
        ChangeDynamicFog("Nebel", 3, 5 );

        Nvboat1 = Logic.CreateEntity(Entities.CB_EvilBoat,GetPosition("nv_boat1").X,GetPosition("nv_boat1").Y,0,6)
        SVLib.SetEntitySize(Nvboat1,1.5)
        Nvboat2 = Logic.CreateEntity(Entities.CB_EvilBoat,GetPosition("nv_boat2").X,GetPosition("nv_boat2").Y,0,6)
        SVLib.SetEntitySize(Nvboat2,1.5)

        for n=1,2,1 do
            _G["NVAttackArmy"..n] = UnlimitedArmy:New({					
                -- benötigt
                Player = 6,
                Area = 4000,
                -- optional
                AutoDestroyIfEmpty = true,
                TransitAttackMove = true,
                Formation = UnlimitedArmy.Formations.Chaotic,
                --PrepDefense,
                DestroyBridges = false,
                --LeaderFormation,
                AIActive = false,
                --DefendDoNotHelpHeroes,
                AutoRotateRange = 100000,
                IgnoreFleeing = true,
                --DoNotNormalizeSpeed,
                --IgnoreFleeing,
                --HiResJob,
            })
            _G["nvAttackCounter"..n] = 0
            for i = 1, mode, 1 do
                if _G["nvAttackCounter"..n] == 0 or _G["nvAttackCounter"..n] == 2 then
                    _G["nvAttackType"..n] = Entities.CU_Evil_LeaderBearman1
                else
                    _G["nvAttackType"..n] = Entities.CU_Evil_LeaderSkirmisher1
                end
                _G["NVAttackArmy"..n]:CreateLeaderForArmy(_G["nvAttackType"..n], 16, GetPosition("nv_attack"..n.."_"..i), 0)
                _G["nvAttackCounter"..n] = _G["nvAttackCounter"..n]+1
            end
            _G["NVAttackArmy"..n]:AddCommandMove(GetPosition("barb_castle"), true)
            _G["NVAttackArmy"..n]:AddCommandWaitForIdle(true)
        end

        NvBaseAttackJob1 = StartSimpleJob("CheckNvBaseAttack1")
    end
end


function CheckNvBaseAttack1()
    if NVAttackArmy1:IsDead() == -1 and NVAttackArmy2:IsDead() then
        if mode == 1 and NvAttackState then
            local time = 60*7
            EndJob(NvBaseAttackJob1)
            CountNvBase = StartCountdown(time,ActivateNvAttackBase,false)
        elseif mode == 2 and NvAttackState then
            local time = 60*5
            EndJob(NvBaseAttackJob1)
            CountNvBase = StartCountdown(time,ActivateNvAttackBase,false)
        elseif mode == 3 and NvAttackState then
            local time = 60*3
            EndJob(NvBaseAttackJob1)
            CountNvBase = StartCountdown(time,ActivateNvAttackBase,false)
        end 

        if IsExisting(Nvboat1) then
            DestroyEntity(Nvboat1)
        end
        if IsExisting(Nvboat2) then
            DestroyEntity(Nvboat2)
        end

        if not NvAttackState then
            if NvBaseAttackJob1 then
                EndJob(NvBaseAttackJob1)
            end
        end


        StartSimpleJob("CountFogNvBase")
    end
end

countFog1 = 0

function CountFogNvBase()
    if countFog1 > 5 then
        ChangeDynamicFog("Nebel", 0, 5 );
        Message("Der Nebel am Anlegesteg verblasst...")
        return true
    else
        countFog1 = countFog1 +1
    end
end

function ActivateNvAttackSignalFire()
    if NvAttackState then
        Message("Achtung, Nebel am Signalfeuer zieht auf!")
        ChangeDynamicFog("seafog", 2, 5 );

        Nvboat3 = Logic.CreateEntity(Entities.CB_EvilBoat,GetPosition("nv_boat3").X,GetPosition("nv_boat3").Y,270,6)
        SVLib.SetEntitySize(Nvboat3,1.5)
        Nvboat4 = Logic.CreateEntity(Entities.CB_EvilBoat,GetPosition("nv_boat4").X,GetPosition("nv_boat4").Y,0,6)
        SVLib.SetEntitySize(Nvboat4,1.5)


        for n=3,4,1 do
            _G["NVAttackArmy"..n] = UnlimitedArmy:New({					
                -- benötigt
                Player = 6,
                Area = 5000,
                -- optional
                AutoDestroyIfEmpty = true,
                TransitAttackMove = true,
                Formation = UnlimitedArmy.Formations.Chaotic,
                --PrepDefense,
                DestroyBridges = false,
                --LeaderFormation,
                AIActive = false,
                --DefendDoNotHelpHeroes,
                AutoRotateRange = 100000,
                IgnoreFleeing = true,
                --DoNotNormalizeSpeed,
                --IgnoreFleeing,
                --HiResJob,
            })
            _G["nvAttackCounter"..n] = 0
            for i = 1, mode, 1 do
                if _G["nvAttackCounter"..n] == 0 or _G["nvAttackCounter"..n] == 2 then
                    _G["nvAttackType"..n] = Entities.CU_Evil_LeaderBearman1
                else
                    _G["nvAttackType"..n] = Entities.CU_Evil_LeaderSkirmisher1
                end
                _G["NVAttackArmy"..n]:CreateLeaderForArmy(_G["nvAttackType"..n], 16, GetPosition("nv_attack"..n.."_"..i), 0)
                _G["nvAttackCounter"..n] = _G["nvAttackCounter"..n]+1
            end
            _G["NVAttackArmy"..n]:AddCommandMove(GetPosition("signalfire"), true)
            _G["NVAttackArmy"..n]:AddCommandWaitForIdle(true)
        end
        NvBaseAttackJob2 = StartSimpleJob("CheckNvBaseAttack2")
    end
end


function CheckNvBaseAttack2()
    if NVAttackArmy3:IsDead() == -1 and NVAttackArmy4:IsDead() then
        if mode == 1 and NvAttackState then
            local time = 60*7
            EndJob(NvBaseAttackJob2)
            CountNvSignal = StartCountdown(time,ActivateNvAttackSignalFire,false)
        elseif mode == 2 and NvAttackState then
            local time = 60*5
            EndJob(NvBaseAttackJob2)
            CountNvSignal = StartCountdown(time,ActivateNvAttackSignalFire,false)
        elseif mode == 3 and NvAttackState then
            local time = 60*3
            EndJob(NvBaseAttackJob2)
            CountNvSignal = StartCountdown(time,ActivateNvAttackSignalFire,false)
        end 

        if IsExisting(Nvboat3) then
            DestroyEntity(Nvboat3)
        end
        if IsExisting(Nvboat4) then
            DestroyEntity(Nvboat4)
        end

        if not NvAttackState then
            if NvBaseAttackJob2 then
                EndJob(NvBaseAttackJob2)
            end
        end
        
        StartSimpleJob("CountFogNvSea")
    end
end

countFog2 = 0

function CountFogNvSea()
    if countFog2 > 5 then
        ChangeDynamicFog("seafog", 0, 5 );
        Message("Der Nebel am Signalfeuer verblasst...")
        return true
    else
        countFog2 = countFog2 +1
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------Quest1-----------------------------------------------------------------------------------
chapter2_questcounter = 0

function StartHelgarQuest()
    scientist = Logic.CreateEntity(Entities.CU_AssistentLeoIdle, GetPosition("scientist_pos1").X, GetPosition("scientist_pos1").Y,0,3)
    jobPatrolScientist = StartSimpleJob("PatrolScientist")
    CreateScientistBriefing()
end

function PatrolScientist()
    if GetDistance(GetPosition(scientist),GetPosition(GetID("scientist_pos1"))) <= 200 then
        Move(scientist,GetID("scientist_pos2"),100)
    elseif GetDistance(GetPosition(scientist),GetPosition(GetID("scientist_pos2"))) <= 200 then
        Move(scientist,GetID("scientist_pos1"),100)
    end
end

function CreateScientistBriefing()
    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Na schau mal einer an. Wen haben wir denn da...Ihr seid nicht Varg, das ist ganz klar.",
                            npc = { id = GetEntityId(scientist),
                                    isObserved = true }, 
                            action = function() 
                                Logic.EntityLookAt(GetID(scientist), GetID(trupp1)) 
                                Logic.EntityLookAt(GetID(trupp1), GetID(scientist)) 
                            end
                        };
                    local page2 = AP{
                        title = "@color:255,0,0 Helgar",
                        text = "@color:255,136,0 Das habt Ihr gut erkannt. Ich bin Helgar, Sohn von Tamrin. Ich wurde von unserem Oberhaupt Varg beauftragt die Minen frei zu legen. Könnt Ihr mir dabei behilflich sein?",
                        position = GetPosition(trupp1),
                        explore = 2000    
                        }; 
                    local page3 = AP{
                        title = "@color:255,0,0 Wissenschaftler",
                        text = "@color:255,136,0 Hilfe..mhmm..jaaa...Ich helfe euch wenn Ihr mir helft!",
                        position = GetPosition(scientist),
                        action = function() 
                            if mode == 1 then
                                wolftable = {}
                                for i=1,5,1 do
                                    _G["wolf"..i] = Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    table.insert(wolftable,_G["wolf"..i])
                                end
                                Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, nil, "WolfsDead",1,nil,nil)
                            elseif mode ==2 then
                                wolftable = {}
                                for i=1,5,1 do
                                    _G["wolf1_"..i] = Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    _G["wolf2_"..i] = Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    table.insert(wolftable,_G["wolf1_"..i])
                                    table.insert(wolftable,_G["wolf2_"..i])
                                end
                                Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, nil, "WolfsDead",1,nil,nil)
                            elseif mode == 3 then
                                wolftable = {}
                                for i=1,5,1 do
                                    _G["wolf1_"..i] = Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    _G["wolf2_"..i] =  Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    _G["wolf3_"..i] = Logic.CreateEntity(Entities.CU_AggressiveWolf, GetPosition("wolf"..i).X, GetPosition("wolf"..i).Y,0,7)
                                    table.insert(wolftable,_G["wolf1_"..i])
                                    table.insert(wolftable,_G["wolf2_"..i])
                                    table.insert(wolftable,_G["wolf3_"..i])
                                end
                                Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, nil, "WolfsDead",1,nil,nil)
                            end
                        end  
                        }; 
                    local page4 = AP{
                        title = "@color:255,0,0 Wissenschaflter",
                        text = "@color:255,136,0 Da oben im Wald haben sich ein paar Wölfe eingenistet. Die stören mich bei meinen Arbeiten. Erledigt Sie für mich.",
                        position = GetPosition("wolf3"),
                          
                        }; 
                    local page5 = AP{
                        title = "@color:255,0,0 Helgar",
                        text = "@color:255,136,0 Es ist mir ein Vergnügen.",
                        position = GetPosition(trupp1),  
                        }; 


    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page2);  
    end

        EndJob(jobPatrolScientist)
        NormalSpeedInBriefing()
        StartBriefing(briefing)
        
    end;
        local npc = {
                    name = scientist,
                    callback = callback,
                    heroName = trupp1,
                    wrongHeroMessage = "Mhmhmhm, jaaaaa....BRATWURST..."
                };
        CreateNPC(npc);
end

function WolfsDead()
    local id = Event.GetEntityID()
    for i = 1, table.getn(wolftable),1 do
        if wolftable[i] == id then
            table.remove(wolftable,i)
        end
    end
    if not wolftable[1] then
        if IsDead(trupp1) then
			CppLogic.Entity.Settler.HeroResurrect(GetID(trupp1))
		end
        WolfsDeadBriefing()
        return true;
    end
end


function WolfsDeadBriefing()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Wissenschaftler",
        text	= "@color:255,136,0 Vielen Dank. Jetzt bringe ich dir die Grundlagen des Sprengens von Gegenständen bei...hehehehehee.",
        position = GetPosition(scientist),
        explore = 2000,
        action = function() 
            Move(trupp1,scientist,300)
        end
    }
    local page2 = AP{
        title	= "",
        text	= "3 Stunden später...",
        position = GetPosition(""),
    }
    local page4
    local page3 = AP{
        title	= "@color:255,0,0 Wissenschaftler",
        text	= "@color:255,136,0 So...jetzt kannst du alles was du willst in die Luft sprengen. Viel Spaß. Ich verzieh mich aus dieser tristen Gegend.",
        position = GetPosition(scientist),
        action = function() 
            MoveAndVanish(GetID(scientist), GetID("leoas_vanish")) 
            page4.position = GetPosition(trupp1)
        end
    }
    local page5
    page4 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Har Har, ich bin unbesiegbar! Habt Dank werter Herr.",
        position = GetPosition(trupp1),
        explore = 2000,
        action = function() 
            if mode == 1 or mode ==2 then
                serf_iron = Logic.CreateEntity(Entities.PU_Thief,GetPosition("serf_nviron").X,GetPosition("serf_nviron").Y,0,3)
                ResearchTechnology(Technologies.T_ThiefSabotage,1)
            elseif mode ==3 then
                serf_iron = Logic.CreateEntity(Entities.PU_Serf,GetPosition("serf_nviron").X,GetPosition("serf_nviron").Y,0,3)
            end
            page5.npc = { id = GetEntityId(serf_iron),isObserved = true }
        end
    }
    page5 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Zu Hilfe...Rettet mich...AHHHHHHHHH. Sie sind hinter mir her...",
        npc = { id = GetEntityId(serf_iron),
                isObserved = true },
        action = function() 
            Move(serf_iron,trupp1,200)
            StartSimpleJob("SerfNearHelgar")
            Display.SetRenderFogOfWar(0)
        end
    }
    local page7
    local page6 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Was ist denn los? Hinter euch ist niemand!",
        position = GetPosition(trupp1),
        action = function() 
            page7.position = GetPosition(serf_iron)
            Display.SetRenderFogOfWar(1)
        end
    }
    page7 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Was? Echt? Oh Stimmt ihr habt recht. Ich bin vor diesen abscheulichen Höhlenmenschen geflohen.",
        position = GetPosition(serf_iron),
    }
    local page8 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Welche Höhlenmenschen? Wir haben vor ein paar Tagen ihr letztes Lager vernichtet!",
        position = GetPosition(trupp1),
    }
    local page9 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Da müsst Ihr euch irren. Sie haben oben auf dem Berg bei der verschütteten Eisenmine ein kleines Lager.",
        position = GetPosition("nv_spawn_iron"),
        explore = 1000
    }
    local page10 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Das gibt es doch nicht. Diese Dinger sind schlimmer als Zecken. Nun dann müssen wir uns wohl oder übel um dieses Pack kümmern.",
        position = GetPosition(trupp1),
    }
    local page11 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Seid dabei auf der Hut. Sie haben Kontrolle über das Tor. Es öffnet sich nur, wenn einer Ihrer Soldaten in der Nähe des Tores ist. Dann ist euer Zeitfenster gekommen, Truppen in das Lager einzuschleusen.",
        position = GetPosition("iron_gate"),
        explore = 1000
    }
    local page12 = AP{
        title	= "@color:255,0,0 Fremder",
        text	= "@color:255,136,0 Lasst mich euch wenigstens behilflich sein. Ein Helfer mehr sollte euch ja nicht schaden.",
        position = GetPosition(trupp1),
    }
    briefing.finished = function()  
        ResolveBriefing(page1);
        ResolveBriefing(page4);
        ResolveBriefing(page5);
        ResolveBriefing(page9);
        ResolveBriefing(page11);
        HelgarBombSelection()--Hier Bombenfähigkeit Widget einschalten.
        Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED,nil,"PitQuest",1,nil,nil)
        Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED,nil,"SetPitAmount",1,nil,nil)
        CreateNVIronPit()
        serf_iron = ChangePlayer(serf_iron,1)
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end 


function SerfNearHelgar()
    if IsNear(serf_iron,trupp1,300) then
        Logic.EntityLookAt(serf_iron,trupp1)
        Logic.EntityLookAt(trupp1,serf_iron)
        return true;
    end
end


---------NV bei der Eisenmine

function CreateNVIronPit()

    if mode == 1 then
        nvIron_table = {
            [1] = 1, --Größe der Armee/ Leaderanzahl
            [2] = 60 --Respawnzeit
        }
        SetHealth("nv_spawner_iron", 40)
    elseif mode == 2 then
        nvIron_table = {
            [1] = 2, --Größe der Armee/ Leaderanzahl
            [2] = 30 --Respawnzeit
        }
    elseif mode == 3 then
        nvIron_table = {
            [1] = 4, --Größe der Armee/ Leaderanzahl
            [2] = 10 --Respawnzeit
        }
    end
    
    
        NVIronArmy = LazyUnlimitedArmy:New({					
            -- benötigt
            Player = 6,
            Area = 1500,
            -- optional
            AutoDestroyIfEmpty = true,
            TransitAttackMove = true,
            Formation = UnlimitedArmy.Formations.Chaotic,
            AIActive = true,
            AutoRotateRange = 100000,
            HiResJob = true,
			IgnoreFleeing = true,
        }, 7,NumberUA)
    

        SpawnerNVIronArmy = UnlimitedArmySpawnGenerator:New(NVIronArmy, {
            -- benötigt:
            Position = GetPosition("nv_spawn_iron"), --position
            ArmySize = nvIron_table[1], --armysize
            SpawnCounter = nvIron_table[2],  --spawncounter
            SpawnLeaders = nvIron_table[1],   --spawnleaders
            LeaderDesc = {
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
            },
            -- optional:
            Generator = "nv_spawner_iron",  --generator
        })
    

    ---Move-Befehle
    
    NVIronArmy: AddCommandMove(GetPosition("patrol_iron1"), true);
    NVIronArmy: AddCommandWaitForIdle(true);
    NVIronArmy: AddCommandMove(GetPosition("patrol_iron2"), true);
    NVIronArmy: AddCommandWaitForIdle(true);
    NVIronArmy: AddCommandMove(GetPosition("nv_spawn_iron"), true);
    NVIronArmy: AddCommandWaitForIdle(true);


    AddChangeGate("patrol_iron2",1000,Entities.CU_Evil_LeaderBearman1,Entities.CU_Evil_LeaderSkirmisher1, "Tor1")
    Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, nil, "NVIronSpawnerDead",1,nil,nil)

end

function NVIronSpawnerDead()
    if NVIronArmy:IsDead() == -1 and IsDestroyed("nv_spawner_iron") then
        RemoveChangeGate("Tor1")
        local _,gateClosedID = Logic.GetEntitiesInArea(Entities.XD_DarkWallStraightGate_Closed,GetPosition("patrol_iron2").X,GetPosition("patrol_iron2").Y,500,1)
        if Logic.GetEntityTypeName(Logic.GetEntityType(gateClosedID)) == "XD_DarkWallStraightGate_Closed" then
            ReplaceEntityOnNextTick(gateClosedID,Entities.XD_DarkWallStraightGate, nil)  --Tor zur Eisenmine
        end
        return true;
    end
end




pitCounter1 = 0

function PitQuest()
    local pitID = Event.GetEntityID()
    if Logic.GetEntityTypeName(Logic.GetEntityType(pitID)) == "XD_ClosedIronPit1" then
        pitCounter1 = pitCounter1 + 1
    elseif Logic.GetEntityTypeName(Logic.GetEntityType(pitID)) == "XD_ClosedSulfurPit1" then
        pitCounter1 = pitCounter1 + 1
    elseif Logic.GetEntityTypeName(Logic.GetEntityType(pitID)) == "XD_ClosedStonePit1" then
        pitCounter1 = pitCounter1 + 1
    elseif Logic.GetEntityTypeName(Logic.GetEntityType(pitID)) == "XD_ClosedClayPit1" then
        pitCounter1 = pitCounter1 + 1
    end

    if pitCounter1 >= 4 then
        Logic.AddQuest(1, 2, SUBQUEST_CLOSED, "@color:255,0,0 Minen", "@cr Helgar wurde damit beauftrag die Minen wieder freizulegen. Der Wissenschaflter könnte Ihm hierbei behilflich sein.", 1)
        chapter2_questcounter = chapter2_questcounter +1;
        Chapter2AllQuestCompleted()
        return true;
    end

end

pitCounter2 = 0

function SetPitAmount()
    local pitId = Event.GetEntityID()
    local pitName = Logic.GetEntityTypeName(Logic.GetEntityType(pitId))
    if string.find(pitName,"Pit1") then
        pitCounter2 = pitCounter2 + 1
        if mode == 1 then
         pitAmount = 45000
        elseif mode == 2 then
            pitAmount = 30000
        elseif mode == 3 then
            pitAmount = 15000
        end
        Logic.SetResourceDoodadGoodAmount(pitId,pitAmount)
    end

    if pitCounter2 >= 4 then
        return true;
    end
end


--------------------------------------------------------------------------------Quest2----------------------------------------------------------------------------------------------------------------------




rebuild_costtable = {}
build_costtable = {}

function ActivateTributWolfgang()
    if mode == 1 then
        rebuild_costtable = {
            Gold = 0,
            Clay = 2000,
            Wood = 4000,
            Stone = 2000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
        build_costtable  = {
            Gold = 3000,
            Clay = 1000,
            Wood = 5000,
            Stone = 3000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
    elseif mode == 2 then
        rebuild_costtable = {
            Gold = 0,
            Clay = 4000,
            Wood = 7000,
            Stone = 4000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
        build_costtable  = {
            Gold = 6000,
            Clay = 4000,
            Wood = 6000,
            Stone = 5000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
    elseif mode == 3 then
        rebuild_costtable = {
            Gold = 0,
            Clay = 6000,
            Wood = 8000,
            Stone = 6000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
        build_costtable  = {
            Gold = 9000,
            Clay = 6000,
            Wood = 6000,
            Stone = 6000,
            Iron = 0,
            Sulfur = 0,
            Silver = 0
        }
    end

    Tribut_RebuildVillage = CreateATribute(1
    ,"@color:255,0,0 Vorbereitung der Palisaden @cr @color:255,255,255 Zahlt @color:91,58,41 "..rebuild_costtable.Wood.." Holz @color:255,255,255 , @color:213,78,33 "..rebuild_costtable.Clay.." Lehm @color:255,255,255 und @color:124,128,120 "..rebuild_costtable.Stone.." Stein @color:255,255,255 für den Abriss der Ruinen und die Vorbereitung zum Palisadenbau.",
    rebuild_costtable, 
    function() 
        DeleteOldVillage() 
        AddTribute(Tribut_CreateBuildingSitesVillage)
    end)

    AddTribute(Tribut_RebuildVillage)

    Tribut_CreateBuildingSitesVillage = CreateATribute(1
    ,"@color:255,0,0 Ausbau zur Palisadenverteidigung @cr @color:255,255,255 Zahlt @color:212,175,55 "..build_costtable.Gold.." Gold  @color:255,255,255 , @color:91,58,41 "..build_costtable.Wood.." Holz @color:255,255,255 , @color:213,78,33 "..build_costtable.Clay.." Lehm @color:255,255,255 und @color:124,128,120 "..build_costtable.Stone.." Stein @color:255,255,255 für den Ausbau der Gerüste.",
    build_costtable, 
    function() 
        RebuildVillage()
        StartCutscene("villageflight", VillageCutsceneBrief)
    end)

    
end

function VillageCutsceneBrief()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "Mentor",
        text	= "Was ein prachtvolles Dorf, Herr. Das hat Wolfgang wahrlich gut gemacht.",
        position = GetPosition("barb_castle"),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Wolfgang",
        text	= "@color:255,136,0 Vielen Dank.",
        position = GetPosition(trupp2),
        explore = 2000,
    }


    briefing.finished = function()  
        ResolveBriefing(page1);
		ResolveBriefing(page2);
        Logic.AddQuest(1, 3, SUBQUEST_CLOSED, "@color:255,0,0 Dorfpalisaden", "@cr Wolfgang soll die Verteidigung des Dorfes wieder in Stand setzen. Mijörn hat ihm dafür eine Liste der Kosten zukommen lassen.", 1)
        chapter2_questcounter = chapter2_questcounter +1;
        Chapter2AllQuestCompleted()
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end

   

-------------------------------------------------------------------------------------------------------------Quest3---------------------------------------------------------------------------------------------------
function StartRuedigerQuest()
    StartSimpleJob("RuedigerNearLeoStone")
end

function RuedigerNearLeoStone()
    if IsNear(trupp3, GetID("rock_leo"),500) then
        MoveRockBrief()
        return true;
    end
end


function MoveRockBrief()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Na was ist das denn...Wer steckt hier einfach Hölzer in den Boden.",
        position = GetPosition(trupp3),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ich zieh die Dinger lieber mal raus...",
        position = GetPosition(trupp3),
    }
    local page3 = AP{
        title	= "",
        text	= "(knack...rumpel)",
        position = GetPosition("stick2"),  
        action = function() 
            Sound.Play2DSound(1060,0,150) 
            DestroyEntity(GetID("stick1"))
            DestroyEntity(GetID("stick2"))
            DestroyEntity(GetID("stick3"))
            MoveStaticEntity("rock_leo",GetPosition("stone_target").X,GetPosition("stone_target").Y,true,false)
            Counter.SetLimit("DelaySmoke1",1)
            Counter.SetLimit("DelaySmoke2",2)
            Counter.SetLimit("DelaySmoke3",3)
            StartSimpleJob("StoneInMovement")
        end  
    }
    local page4 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ups...naja..zumindest ist der Weg frei.",
        position = GetPosition(trupp3),
    }
    briefing.finished = function()  
        CreateLeonardoBriefing()
        ResolveBriefing(page1);

    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end


function StoneInMovement()
    local spot1 = GetID("smoke1")
    local spot2 = GetID("smoke2")
    local spot3 = GetID("stone_target")
    if Counter.Tick2("DelaySmoke1",1) then
        Logic.CreateEffect(GGL_Effects.FXBuildingSmokeLarge, GetPosition(spot1).X, GetPosition(spot1).Y, 1)
    end
    if Counter.Tick2("DelaySmoke2",2) then
        Logic.CreateEffect(GGL_Effects.FXBuildingSmokeLarge, GetPosition(spot2).X, GetPosition(spot2).Y, 1)
    end
    if Counter.Tick2("DelaySmoke3",3) then
        Sound.Play2DSound(1069,0,150)
        Logic.CreateEffect(GGL_Effects.FXBuildingSmokeLarge, GetPosition(spot3).X, GetPosition(spot3).Y, 1) 
        return true;
    end
 end



function CreateLeonardoBriefing()

    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP{
                            title = "@color:255,0,0 Rüdiger",
                            text = "@color:255,136,0 Hallo? Wer bist du denn und was machst du hier soweit oben auf dem Berg?",
                            position = GetPosition(trupp3),
                            explore = 2000, 
                            action = function() 
                                Logic.EntityLookAt(GetID("leonardo"), GetID(trupp3)) 
                                Logic.EntityLookAt(GetID(trupp3), GetID("leonardo")) 
                            end
                        };
                    local page2 = AP{
                        title = "@color:255,0,0 Komischer Kautz",
                        text = "@color:255,136,0 Ich bin der einzig wahre Leonardo, Berater des Königs Dario und kompetenter Erfinder.",
                        position = GetPosition("leonardo"),
                        explore = 2000    
                        }; 
                    local page3 = AP{
                        title = "@color:255,0,0 Rüdiger",
                        text = "@color:255,136,0 Ah ja, Varg hatte dich mal erwähnt. Erzähl mir, was machst du in dieser Gegend.",
                        position = GetPosition(trupp3),
                        }; 
                    local page4 = AP{
                        title = "@color:255,0,0 Leonardo",
                        text = "@color:255,136,0 Falls es euch nicht aufgefallen ist befinden wir uns fast an der Spitze eines Vulkans, welcher vor einiger Zeit ausgebrochen ist und ich bin hier um die seismischen Aktivitäten zu studieren und etwas Schwefel zu sammeln....mhm...jaaa.... Schwefel....hehehehe.",
                        position = GetPosition("leonardo"),
                          
                        }; 


    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page2);  
        StartCutscene("vulkan", VulkanCutsceneBrief)
    end
    NormalSpeedInBriefing()
    StartBriefing(briefing)
        
    end;

        local npc = {
                    name = "leonardo",
                    callback = callback,
                    heroName = trupp3,
                    wrongHeroMessage = "Schwefel...MEHR SCHWEFEL...!"
                };
        CreateNPC(npc);
end


function VulkanCutsceneBrief()

local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Ich arbeite momentan an etwas, was uns ermöglicht in der heißen Lava Gebäude zu errichten. Eine Art Schutzbeschichtung für Gegenstände.",
        position = GetPosition("leonardo"),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Das wird Varg freuen zu hören, so können wir weiter die Gegend auskundschaften und nach dem Rechten in Grimsvötn schauen. Könnt Ihr mir diese Sache schon geben?",
        position = GetPosition(trupp3),
        explore = 2000,
    }
    local page3 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Immer ruhig mein Jungsprund. Ich brauche dafür ein paar Sachen. Und vorallem Schweeeeeeefel. Vieeeeeel Schweeeefel...mhmm...jaaaa.",
        position = GetPosition("leonardo"),  
    }
    local page4 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ich werde mich darum kümmern. Gebt mir einfach eine Liste mit den Materialien, die Ihr benötigt.",
        position = GetPosition(trupp3),
    }
    briefing.finished = function()  
        ResolveBriefing(page1);
		ResolveBriefing(page2);

        if mode == 1 then
            leo_restable = {
                Gold = 1000,
                Clay = 0,
                Wood = 0,
                Stone = 0,
                Iron = 1000,
                Sulfur = 2000,
                Silver = 0
            }
        elseif mode == 2 then
            leo_restable = {
                Gold = 3000,
                Clay = 0,
                Wood = 0,
                Stone = 0,
                Iron = 3000,
                Sulfur = 5000,
                Silver = 0
            }
        elseif mode == 3 then 
            leo_restable = {
                Gold = 5000,
                Clay = 0,
                Wood = 0,
                Stone = 0,
                Iron = 4000,
                Sulfur = 6500,
                Silver = 0
            }
        end

        Tribut_Leonardo = CreateATribute(1
            ,"@color:255,0,0 Leonardos Ressourcenlieferung @cr @color:255,255,255 Sendet @color:212,175,55 "..leo_restable.Gold.." Gold  @color:255,255,255 , @color:67,75,77 "..leo_restable.Iron.." Eisen @color:255,255,255 und @color:234,240,68 "..leo_restable.Sulfur.." Schwefel @color:255,255,255 an Leonardo, um seine Forschung zu unterstützen.",
            leo_restable, 
            function() 
                chapter2_questcounter = chapter2_questcounter +1;
                Chapter2AllQuestCompleted()
                Logic.AddQuest(1, 4, SUBQUEST_CLOSED, "@color:255,0,0 Alter Kautz", "@cr Rüdiger soll einen alten Kautz finden. Wo er sich aufhält weiß niemand. Da hilft wohl nur suchen.", 1)
            end)
        AddTribute(Tribut_Leonardo)

    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end



function Chapter2AllQuestCompleted()
    if chapter2_questcounter == 3 then
        EndJob(DefeatJob1)
        DestroyEntity(varg)
        DestroyEntity(guard)
        DestroyEntity(trupp3)
        DestroyEntity(trupp1)
        DestroyEntity(trupp2)
        varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("varg_chapter2").X, GetPosition("varg_chapter2").Y, 0, 1)
        trupp1 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("helgar_chapter2").X,GetPosition("helgar_chapter2").Y,0, 1)
        trupp2 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("wolfgang_chapter2").X,GetPosition("wolfgang_chapter2").Y,0, 1)
        trupp3 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("ruediger_chapter2").X,GetPosition("ruediger_chapter2").Y,0, 1)
        guard = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("mijoern_chapter2").X,GetPosition("mijoern_chapter2").Y,0, 1)
        Logic.EntityLookAt(varg,trupp3)
        Logic.EntityLookAt(guard,varg)
        Logic.EntityLookAt(trupp1,varg)
        Logic.EntityLookAt(trupp2,varg)
        Logic.EntityLookAt(trupp3,varg)
        DefeatJob1 = StartSimpleJob("AllHerosDead")
        RefreshDisplayNames()
        Chapter2AllQuestsDoneBrief()
        Logic.AddQuest(1, 1, MAINQUEST_CLOSED, "@color:255,0,0 Wideraufbau von Reynivellir", "@cr Varg hat seine Mitstreiter mit verschiedenen Aufgaben beauftragt. Erledigt Sie alle um fortzufahren.", 1)
    end
end


function Chapter2AllQuestsDoneBrief()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Hervorragend meine Mitstreiter. Ich bin sehr zufrieden mit euch.",
        position = GetPosition(varg),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Helgar",
        text	= "@color:255,136,0 Erfreut uns zu hören, Herr.",
        position = GetPosition(trupp1),
        explore = 2000,
    }
    local page3 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Unsere Basis ist verstärkt, die Ressourcenversorung ist wiederhergestellt. Rüdiger, hast du den komischen Kautz finden können?",
        position = GetPosition(varg),
    }
    local page4 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ja, es handelt sich um den Wissenschaftler Leonardo. Er arbeitet gerade an einem Material mit dem es möglich ist, dass unsere Gebäude die Hitze des Vulkans aushalten.",
        position = GetPosition(trupp3),
    }
    local page5 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Ein Vulkan!? ",
        position = GetPosition(varg),
    }
    local page6 = AP{
        title	= "@color:255,0,0 Rüdiger",
        text	= "@color:255,136,0 Ja Herr. Er ist vor einigen Tagen ausgebrochen, bevor wir mit unseren Schiffen am Ufer gelandet sind. Deshalb sollten wir vorsicht walten lassen den Süden und Osten weiter zu erkunden.",
        position = GetPosition(trupp3),
    }
    local page7 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Alles klar. Wir setzen unseren Fokus nun erstmal auf das Signalfeuer. Wir müssen die Schiffsfahrt wieder sicher machen und solange uns die Nebelkrieger weiter über das Ufer angreifen. Stellt es eine Gefahr da, sie nicht rechtzeitig zu sichten und Ihre Schiffe im Meer zu versenken.",
        position = GetPosition("signalfire"),
    }


    briefing.finished = function()  
        ResolveBriefing(page1);
		ResolveBriefing(page2);
        Logic.AddQuest(1, 5, MAINQUEST_OPEN, "@color:255,0,0 Das Signalfeuer", "@cr Entfacht wieder das Signalfeuer. Passt auf das es nicht gänzlich zerstört wird, da es keine Baupläne für ein neues gibt.", 1)
        ActivateSignalfireQuest()
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end


function ActivateSignalfireQuest()
    Signalfire = ChangePlayer("signalfire",1)

    if mode == 1 then
        SignalFireCosts = {
            [ResourceType.Gold] = 0,
            [ResourceType.Wood] = 10000,
            [ResourceType.Clay] = 0,
            [ResourceType.Stone] = 0,
            [ResourceType.Iron] = 0,
            [ResourceType.Sulfur] = 0,
            [ResourceType.Silver] = 0,
        }
    elseif mode == 2 then
        SignalFireCosts = {
            [ResourceType.Gold] = 0,
            [ResourceType.Wood] = 30000,
            [ResourceType.Clay] = 0,
            [ResourceType.Stone] = 0,
            [ResourceType.Iron] = 0,
            [ResourceType.Sulfur] = 0,
            [ResourceType.Silver] = 0,
        }
    elseif mode == 3 then
        SignalFireCosts = {
            [ResourceType.Gold] = 0,
            [ResourceType.Wood] = 50000,
            [ResourceType.Clay] = 0,
            [ResourceType.Stone] = 0,
            [ResourceType.Iron] = 0,
            [ResourceType.Sulfur] = 0,
            [ResourceType.Silver] = 0,
        }
    end

    function GUITooltip_IgniteFire()
        XGUIEng.SetText("TooltipBottomText", "@color:255,165,0 Signalfeuer @color:255,255,255 @cr Entzündet für @color:91,58,41 " ..SignalFireCosts[ResourceType.Wood].. " Holz @color:255,255,255 das Leuchtfeuer. Wird es zerstört, habt Ihr verloren, da es keine Baupläne für den Wiederaufau gibt.")
        XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(SignalFireCosts))
    end
    GUITooltip_IgniteFire()
    SignalfireJob = StartSimpleJob("SignalfireHandler")

    -- Start des Signalfeuerangriffs
    if mode == 1 then
        StartCountdown(5*60,ActivateNvAttackSignalFire,false)
    elseif mode == 2 then
        StartCountdown(2*60,ActivateNvAttackSignalFire,false)
    elseif mode == 3 then
        ActivateNvAttackSignalFire()
    end
end

function SignalfireHandler()
    _,SignalLit = Logic.GetPlayerEntitiesInArea(1,Entities.CB_Signalfire_Fire,GetPosition("signalfire").X,GetPosition("signalfire").Y,400,1)
    if IsExisting(SignalLit)then
        NvAttackState = false
        if CountNvSignal then
            StopCountdown(CountNvSignal)
        end
        if CountNvBase then
            StopCountdown(CountNvBase)
        end
        BigCanonBrief()
        return true;
    elseif IsDestroyed(Signalfire) then
        Defeat()
        return true;
    end
end

function BigCanonBrief()
    --SetupBriefing-----------------------------------------------------------------------------------------------------------------
    DestroyEntity("leonardo")
    leonardo = Logic.CreateEntity(Entities.CU_Leonardo,GetPosition("leo_canon").X,GetPosition("leo_canon").Y,215,3 )
    leocanon = Logic.CreateEntity(Entities.PV_Cannon4,GetPosition("nv_canon").X,GetPosition("nv_canon").Y,135,3 )
    nv_boat = Logic.CreateEntity(Entities.CB_EvilBoat, GetPosition("evilboat_spot").X,GetPosition("evilboat_spot").Y,0,6)
    SVLib.SetEntitySize(leocanon, 1.5)
    SVLib.SetEntitySize(nv_boat, 2)
    DestroyEntity(varg)
    varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("varg_canon").X, GetPosition("varg_canon").Y, 0, 1)
    Logic.EntityLookAt(varg,leonardo)

    ---------------------------------------------------------------------------------------------------------------------------------

    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Das Leuchtfeuer ist nun wieder aktiv. Jetzt sollten keine Schiffe mehr an den Klippen zerschellen.",
        position = GetPosition(SignalLit),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Mhmm...jaaaaa...gut! Ich habe mich währenddessen um ein kleines Projekt gekümmert, wodruch wir die Nebelkrieger von unseren Ufern fernhalten können.",
        position = GetPosition(leonardo),
        explore = 2000
    }
    local page3 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Darf ich vorstellen: Der Nebelschreck. ",
        position = GetPosition(leocanon),
        explore = 2000
    }
    local page4 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Hierbei handelt es sich um ein hoch präszies Verteidigungsgerät, welches auf mehrere Kilometer genau das Ziel trifft. Leider können die Kugeln nur von einer erhöhten Position auf eine niedrigere abgeschossen werden, da sie sehr schwer sind.",
        position = GetPosition(leonardo),
    }
    local page5 = AP{
        title	= "Mentor",
        text	= "Herr, seht doch! Ein weiteres Nebelkriegerschiff nähert sich.",
        position = GetPosition(nv_boat),
        explore = 2000
    }
    local page6 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Wunderbar, ein Testobjekt. Lasst mich euch die Effektivität demonstrieren.",
        position = GetPosition(leonardo),
    }
    local page7 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Erst ladet Ihr die Kanone mit Schießpulver und einer großen Kanonenkugel...",
        position = GetPosition(leocanon),
    }
    local page8 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 ...,dann schießt Ihr auf euer Ziel...",
        position = GetPosition(leocanon),
        action = function()
            Sound.Play2DSound(1068,0,150)
            CppLogic.Entity.Settler.PlayScriptAnimation(leocanon, "PV_Cannon4_Shoot",false,1)
        end
    }
    local page9 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 ...und seht zu wie es zerstört wird.",
        position = GetPosition(nv_boat),
        action = function()
            Counter.SetLimit("DelayNvShip",2)
            StartSimpleJob("NvShipDelay")
        end,
    }
    local page10 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Ganz simpel alles.",
        position = GetPosition(leonardo),
    }
    local page11 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Gut, dann sollten wir absofort über den Seeweg sicher sein. Wie weit seid Ihr mit der Schutzbeschichtung gegen die Hitze des Vulkans.",
        position = GetPosition(varg),
    }
    local page12 = AP{
        title	= "@color:255,0,0 Leonardo",
        text	= "@color:255,136,0 Fast fertig. Gebt mir noch ein paar Tage Zeit, dann sollten meine Forschungen abgeschlossen sein.",
        position = GetPosition(leonardo),
    }
    briefing.finished = function()  
        ResolveBriefing(page1);
        ResolveBriefing(page2);
        ResolveBriefing(page3);
        ResolveBriefing(page5);
        EndJob(DefeatJob1)
        DestroyEntity(varg)
        DestroyEntity(guard)
        DestroyEntity(trupp3)
        DestroyEntity(trupp1)
        DestroyEntity(trupp2)
        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, "@color:255,0,0 Das Signalfeuer", "@cr Entfacht wieder das Signalfeuer. Passt auf das es nicht gänzlich zerstört wird, da es keine Baupläne für ein neues gibt.", 1)
        StartBlende(
            "@center @color:255,0,0 Erkundung von Grimsvötn", 
            "@center @color:255,255,255 @cr @cr Varg und seine Mitstreiter haben es seit der Zeit Ihrer Ankunft in Grimsvötn weit gebracht. Sie haben das sein Heimatdorf Reynivellir wieder aufgebaut und die Bevölkerung vor den Angriffen der Nebelkrieger beschützt. Bei der Zusammenarbeit mit dem Wissenschaftler Leonardo stellte sich heraus, dass der Vulkan in Grimsvötn aktiv geworden ist. Nun liegt es an Varg, auch das Umland und die tödlichen Lavaregionen wieder sicher zu machen... ", 
            function() Start_Chapter3() end, 
    
            20)--muss später höher
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)

end


function NvShipDelay()
   if Counter.Tick2("DelayNvShip",2) then
        Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition(nv_boat).X, GetPosition(nv_boat).Y, 1)
        Sound.Play2DSound(1071,0,150)
        nv_wreckage = ReplaceEntity(nv_boat,Entities.XD_EvilBoat_Wreckage)
        SVLib.SetEntitySize(nv_wreckage, 2)
        return true
   else
        return false
   end
end

