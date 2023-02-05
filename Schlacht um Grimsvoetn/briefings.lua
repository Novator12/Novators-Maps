function AnfangsBriefing()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Intro",
        text	= "@color:255,136,0 Die raue See peitsch gegen die Planken der Schiffe. Varg und seine Anhänger sind Wochen lang durch den kalten Nordatlantik gefahren und sind kurz vor dem Ende ihrer nervenzehrenden Reise.",
        position = GetPosition("intro_boat1"),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Intro",
        text	= "@color:255,136,0 Das Wetter vor der Küste Islands ist wesentlich klarer als auf der hohen See und die Männer freuen sich auf warmes Met am Lagerfeuer.",
        position = GetPosition("intro_boat2"),
        explore = 2000,
    }


    briefing.finished = function()  
        varg = Logic.CreateEntity(Entities.CU_Barbarian_Hero, GetPosition("spawn_varg").X, GetPosition("spawn_varg").Y, 0, 1)
        trupp1 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp1").X,GetPosition("spawn_trupp1").Y,0, 1)
        trupp2 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp2").X,GetPosition("spawn_trupp2").Y,0, 1)
        trupp3 = Logic.CreateEntity(Entities.CU_VeteranLieutenant, GetPosition("spawn_trupp3").X,GetPosition("spawn_trupp3").Y,0, 1)
        Logic.EntityLookAt(varg, trupp1)
        Logic.EntityLookAt(trupp1,varg)
        Logic.EntityLookAt(trupp2, varg)
        Logic.EntityLookAt(trupp3, varg)
        DestroyEntity("intro_boat1")
        DestroyEntity("intro_boat2")
        ResolveBriefing(page1);
		ResolveBriefing(page2);
        StrandBriefing()
        DefeatJob1 = StartSimpleJob("AllHerosDead") --Niederlagebedingung Helden
        Defeatjob2 = StartSimpleJob("CastleDestroyed") --Niederlagebedingung Castle
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end 

function StrandBriefing()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Arggggg. Endlich wieder Land unter den Füßen. Wieso ist der Hafen so zerstört...",
        position = GetPosition(varg),
        explore = 2000,
        action = function() 
            Logic.EntityLookAt(trupp2, varg) 
            Logic.EntityLookAt(varg, trupp2)
        end
    }
    local page2 = AP{
        title	= "@color:255,0,0 Helgar der Barbar",
        text	= "@color:255,136,0 Herr, ich sehe oben am Eingang von Reynivellir noch Licht. Wir sollten uns das schleunigst anschauen.",
        position = GetPosition(trupp1),
        action = function() 
            Logic.EntityLookAt(trupp1, varg) 
            Logic.EntityLookAt(varg, trupp1)
        end
    }
    local page3 =AP{
        title	= "@color:255,0,0 Wolfgang der Barbar",
        text	= "@color:255,136,0 Können wir nicht zuerst etwas Met trinken. Ich habe so einen Durst.",
        position = GetPosition(trupp2),
        action = function() 
            Logic.EntityLookAt(trupp2, varg) 
            Logic.EntityLookAt(varg, trupp2)
        end
    }
    local page4 =AP{
        title	= "@color:255,0,0 Rüdiger der Barbar",
        text	= "@color:255,136,0 Du Saufkopf denkst auch nur an Alkohol...Ich schließe mich Helgar an. Lasst uns nachsehen was im Dorf los ist. Varg was sagt ihr?",
        position = GetPosition(trupp3),
        action = function() 
            Logic.EntityLookAt(trupp3, varg) 
            Logic.EntityLookAt(varg, trupp3)
        end
    }
    local page5 =AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Haltet jetzt mal alle die Klappe. Ihr habt schon auf der ganzen Schiffsfahrt gesoffen. Lasst uns erstmal ins Dorf. Ich will meine Mutter erstmal wiedersehen...nach einer so langen Zeit in diesem dreckigen europäischen Gefilden.",
        position = GetPosition(varg),
        action = function() 
            Logic.EntityLookAt(trupp1, varg) 
            Logic.EntityLookAt(varg, trupp1)
            ActivateStartingFog()
        end
    }
    local page6 =AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Was ist das denn! Wo kommt der Nebel aufeinmal her. Es war doch alles ganz klar.",
        position = GetPosition(varg),
    }
    local page7 =AP{
        title	= "@color:255,0,0 Helgar der Barbar",
        text	= "@color:255,136,0 Schnell Varg. Lasst uns hoch zum Dorf laufen!",
        position = GetPosition(trupp1),
    }
    local page8 =AP{
        title	= "@color:255,0,0 Hinweis",
        text	= "Sind Varg und seine Begleiter alle @color:255,136,0 !Gleichzeitig! @color:255,255,255 tot, habt Ihr das Spiel verloren. Dies gilt für die gesamte Dauer der Karte.",
        position = GetPosition(trupp1),
    }


    briefing.finished = function() 
        ResolveBriefing(page1);
        ResolveBriefing(page2);
        ResolveBriefing(page3);
        ResolveBriefing(page4);
        ResolveBriefing(page5);
        ResolveBriefing(page6);
        ResolveBriefing(page7);
        ModeSelection()
        Logic.SuspendEntity(varg)
        Logic.SuspendEntity(trupp1)
        Logic.SuspendEntity(trupp2)
        Logic.SuspendEntity(trupp3)
        Logic.SetPlayerRawName(6, "Nebelkrieger")
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
end 

function GuardBriefing()
     local callback = function()
            local briefing = {};
            local AP = function(_page) table.insert(briefing, _page); return _page; end;
            local page1 = AP{
                                title = "@color:255,0,0 Reynivellir Wache",
                                text = "@color:255,136,0 Na das war mal ein Kampf. Har Har Har. Wo kommt ihr denn her. Nach eurer Kleidung zu urteilen, müssen wir über irgendwelche Wege verwandt sein.",
                                npc = { id = GetEntityId("guard"),
                                        isObserved = true },
                                dialogCamera = true,
                                action = function() 
                                    Logic.EntityLookAt(GetID("guard"), varg) 
                                    Logic.EntityLookAt(varg, GetID("guard")) 
                                
                                end
                            };
            local page2 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Ich bin Varg. Sohn von Jarg und Marie. Was ist hier passiert? Wieso liegt alles in Schutt und Asche.",
                npc = { id = GetEntityId(varg),
                        isObserved = true },
                dialogCamera = true
            };
            local page3 = AP{
                title = "@color:255,0,0 Reynivellir Wache",
                text = "@color:255,136,0 Ahhh Varg, Sohn von Jarg, es tut gut euch nach so einer langen Zeit zu sehen. Erinnert ihr euch noch an mich? Meine Name ist Mijörn. Ich war der Berater eures Vaters. Jedoch hab ich schlechte Nachrichten für euch.",
                npc = { id = GetEntityId("guard"),
                        isObserved = true },
                dialogCamera = true
            };
            local page4 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Eure Mutter starb im letzten Winter als diese Höhlenmenschen in Grimsvötn einfielen. Euer Vater war so Wut entbrannt und zog mit unseren besten Kriegern aus, um das Lager dieser Kreaturen zu finden.",
                position = GetPosition("marie_grave"),
                explore = 2000
            };
            local page5 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Nein...neiiin (Varg atmet schwer). Mutter...Ich konnte mich nicht von ihr verabschieden. Wisst ihr wo mein Vater und seine Truppen hin sind?",
                npc = { id = GetEntityId(varg),
                        isObserved = true },
                dialogCamera = true
            };
            local page6 = AP{
                title	= "@color:255,0,0Mijörn",
                text	= "@color:255,136,0 Ja, sie sind in die südlichen Gebiete gezogen. Ich makiere es euch auf eurer Karte.",
                position = GetPosition("guard"),
                explore = 2000,
                action = function()
                    GUI.CreateMinimapPulse(GetPosition("marker_pos").X, GetPosition("marker_pos").Y, 3)
                    --GUI.DestroyMinimapPulse(_x, _y)
                end
            };
            local page7 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Außerdem habe ich die Zugbrücke hochgezogen, nachdem die ersten Nebelkrieger in den Innenhof der Burg vorgedrungen sind.",
                npc = { id = GetEntityId("guard"),
                        isObserved = true },
                dialogCamera = true
                
            };
            local page8 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Danke Mijörn. Wir müssen unbedingt herausfinden, ob mein Vater noch lebt.",
                npc = { id = GetEntityId(varg),
                        isObserved = true },
                dialogCamera = true
                
            };
            local page9 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Ach Varg, bevor ich es vergesse. Hier sind die Schlüssel zur Burg eures Vaters. Sie ist zwar ziemlich ramponiert, aber ihren Zweck sollte Sie erfüllen.",
                position = GetPosition("barb_castle"),
                explore = 2000,
                action = function() 
                  barb_castle = Logic.ChangeEntityPlayerID(GetID("barb_castle"), 1)
                end
                
            };
            local page10 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Ich lasse euch nun die Brücke erstmal herunter. Passt jedoch auf. Banditen haben sich in dieser Region angesiedelt seitdem euer Vater verschwunden ist.",
                position = GetPosition("dw1"),
                explore = 2000,
            };

            briefing.finished = function() 
                ResolveBriefing(page1); 
                ResolveBriefing(page2); 
                ResolveBriefing(page3); 
                ResolveBriefing(page4); 
                ResolveBriefing(page5); 
                ResolveBriefing(page6);
                ResolveBriefing(page7);
                ResolveBriefing(page8);
                ResolveBriefing(page9);
                ResolveBriefing(page10);
                Move(GetID("guard"), GetPosition("bridge_pos"))
                StartSimpleJob("BridgeCastle")
                Logic.SetPlayerRawName(8, "Verbliebene Reynivellianer")
                Logic.SetDiplomacyState(8, 1, 1)
                Logic.SetDiplomacyState(7, 1, 3)

            end
            NormalSpeedInBriefing()
            StartBriefing(briefing)
        end;
    local npc = {
                    name = "guard",
                    callback = callback,
                    heroName = varg,
                    wrongHeroMessage = "Wer bist du? Verschwinde!"
                };
    CreateNPC(npc);
end

function BridgeCastle()
    if Logic.CheckEntitiesDistance(GetID("guard"),GetID("bridge_pos"),200) == 1 then
        ReplaceEntity("dw1", Entities.PB_DrawBridgeClosed1)
        DW1Completed()
        return true;
    end
end


function DW1Completed()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    local page1 = AP{
        title	= "@color:255,0,0 Mijörn",
        text	= "@color:255,136,0 So, jetzt ist die Brücke wieder unten.",
        position = GetPosition("guard"),
        explore = 2000
    }
    local page2 = AP{
        title	= "@color:255,0,0 Mijörn",
        text	= "@color:255,136,0 Wenn es euch nichts ausmacht, schließe ich mich gerne euren Kriegern an.",
        position = GetPosition("bridge_pos"),
        explore = 2000,
        action = function() 
            guard = Logic.ChangeEntityPlayerID(GetID("guard"), 1)
            CppLogic.Entity.SetDisplayName(guard, "Mijörn")
            
        end
    }
    local page3 = AP{
        title	= "@color:255,0,0 Varg",
        text	= "@color:255,136,0 Sehr gerne, Mijörn. Du bist herzlichst willkommen.",
        position = GetPosition(varg),
        explore = 2000
    }


    briefing.finished = function()  
        ResolveBriefing(page1);
		ResolveBriefing(page2);
        ResolveBriefing(page3);
        SetEntityOverheadWidget(guard,1)
        HermitBriefing()
        Logic.AddQuest(1, 2, MAINQUEST_OPEN, "@color:255,0,0 Suche nach Jarg", "@cr Wie Mijörn es euch berichtet hat, ist Vargs Vater Jarg verschwunden. Eure Aufgabe ist es eine Siedlung zu errichten und dem Verschwinden des ehemaligen Königs der Barbaren nachzugehen. Findet eine Möglichkeit ein Dorfzentrum zu erwerben und besiegt die Eindringlinge in Reynivellir. Vielleicht findet ihr noch einige der reynivellianischen Siedler, die euch helfen wollen.", 1)
    end;
    NormalSpeedInBriefing()
    StartBriefing(briefing)
    
end 




function HermitBriefing()
     local callback = function()
            local briefing = {};
            local AP = function(_page) table.insert(briefing, _page); return _page; end;
            local page1 = AP{
                                title = "@color:255,0,0 Einsiedler",
                                text = "@color:255,136,0 *Röchel* *Hust* Mijörn...Wer ist dieser Mann der euch da begleitet?",
                                npc = { id = GetEntityId("guard"),
                                        isObserved = true },
                                dialogCamera = true,
                                action = function() 
                                    Logic.EntityLookAt(GetID("hermit"), GetID("guard")) 
                                    Logic.EntityLookAt(GetID("guard"), GetID("hermit")) 
                                    Move(varg,GetPosition("pos_hermit"))
                                
                                end
                            };
            local page2 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Heimdall, mein alter Freund, wie hast du es geschafft zu überleben?",
                position = GetPosition("hermit"),
                explore = 2000,    
            };
            local page3 = AP{
                title = "@color:255,0,0 Heimdall",
                text = "@color:255,136,0 Ich bin Heimdall, Wächter der Götter. Es war ein leichtes diese Höhlenmenschen zu überlisten und mich vor Ihnen zu verbergen. ",
                position = GetPosition("hermit"),
                
            };
            local page4 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Das ist auch wieder war. Erinnerst du dich noch an Varg, Sohn des Jarg. Er kam heute mit seinen Gefolgsleuten an und half mir die Burg von den Höhlenmenschen zu säubern. Wir machen uns nun auf die Suche nach seinem Vater und wollen Ihn befreien.",
                position = GetPosition("hermit"),
                
            };
            local page5 = AP{
                title = "@color:255,0,0 Heimdall",
                text = "@color:255,136,0 Wahrlich eine tapfere Herausforderung, jedoch werdet Ihr nicht weit kommen, denn der Weg zu den Höhlenmenschen wurde durch das raue Klima verschüttet.",
                position = GetPosition("stein1"),
                explore = 500,
            };
            local page6 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Argggg...Die Götter sind nicht mit uns. Was sollen wir jetzt nur tun. Ich kenne keinen Sprengmeister, außer diesen Saufkopf Pilgrim, welcher mit Dario höher in den Norden gefahren ist um Kerberos zu verfolgen.",
                position = GetPosition("pos_hermit"),
                explore = 2000,
                action = function() 
                    Logic.EntityLookAt(GetID("hermit"), varg) 
                    Logic.EntityLookAt(varg, GetID("hermit")) 
                    Logic.EntityLookAt(GetID("guard"), varg) 
                end
            };
            local page7 = AP{
                title = "@color:255,0,0 Heimdall",
                text = "@color:255,136,0 Gebt so schnell nicht auf. Ich habe gehört, dass die Banditen, welche sich hier breit gemacht haben, einen Mann der Wissenschaft gefangen genommen haben. Er wurde in eines Ihrer Lager verschleppt zusammen mit ein paar Arbeitern, welche Ihr sicherlich auch gut gebrauchen könnt.",
                position = GetPosition("hermit"),
                  
                  
            };
            local page8 = AP{
                title = "@color:255,0,0 Heimdall",
                text = "@color:255,136,0 Ich markiere euch die Lager auf eurer Karte. Das erste befindet sich hier.",
                position = GetPosition("camp1"),
                explore = 750,  
                action = function() 
                    GUI.CreateMinimapMarker(GetPosition("camp1").X, GetPosition("camp1").Y, 3)
                end  
            };
            local page9 = AP{
                title = "@color:255,0,0 Heimdall",
                text = "@color:255,136,0 Das zweite Lager befindet sich hier.",
                position = GetPosition("camp2"),
                explore = 750,    
                action = function() 
                    GUI.CreateMinimapMarker(GetPosition("camp2").X, GetPosition("camp2").Y, 3)
                end
            };
            local page10 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Vielen Dank Heimdall. Kommt Mijörn. Lasst uns diesen Banditen eine Lektion erteilen.",
                position = GetPosition("pos_hermit"),
                   
            };
            local page11 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Auf in die Schlacht.",
                position = GetPosition("guard"),  
                action = function() 
                    Sound.Play2DSound(1146,0,150) 
                end  
            };
            local page12 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Wartet...Hört ihr das?",
                position = GetPosition("pos_hermit"),
                  
            };
            local page13 = AP{
                title = "@color:255,0,0 Mijörn",
                text = "@color:255,136,0 Ich höre nichts...",
                position = GetPosition("guard"),
                  
            };
            local page14 = AP{
                title = "",
                text = "",
                position = GetPosition("pos_hermit"), 
                action = function() 
                    Sound.Play2DSound(1147,0,180) 
                end  
            };
            local page15 = AP{
                title = "Mentor",
                text = "Seht Herr, Verstärkung ist eingetroffen.",
                position = GetPosition("spawn_trupp1"), 
                action = function()
                    if mode == 1 then 
                        CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"help1")
                        CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"help2")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"help3")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"help4")
                    elseif mode == 2 then
                        CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"help1")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp2"),"help2")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"help3")
                    elseif mode == 3 then
                        CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"help1")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp2"),"help2")
                        CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"help3")
                    end
                end  
            };


            briefing.finished = function() 
                ResolveBriefing(page1); 
                ResolveBriefing(page2); 
                ResolveBriefing(page3); 
                ResolveBriefing(page4); 
                -- ResolveBriefing(page5); 
                ResolveBriefing(page6);
                ResolveBriefing(page7);
                -- ResolveBriefing(page8);
                -- ResolveBriefing(page9);
                ResolveBriefing(page10);
                ResolveBriefing(page11);
                ResolveBriefing(page12);
                ResolveBriefing(page13);
                ResolveBriefing(page14);
                ResolveBriefing(page15);
                Logic.AddQuest(1, 3, MAINQUEST_OPEN, "@color:255,0,0 Befreiung", "@cr Befreit den Wissenschaftler und die Arbeiter aus den Lagern der Banditen", 1)
                DestroyEntity("b1")
                DestroyEntity("b2")
                ActivateBandits()
                

            end
            NormalSpeedInBriefing()
            StartBriefing(briefing)
        end;
    local npc = {
                    name = "hermit",
                    callback = callback,
                    heroName = "guard",
                    wrongHeroMessage = "Wer seid ihr? Ich rede nur mit Mijörn"
                };
    CreateNPC(npc);
end



------------------------------------------------Banditen-Briefings---------------------------------------------------------------------------------------------


function SerfBriefingFalse()
    serfcallbackFalse = function()
           local briefing = {};
           local AP = function(_page) table.insert(briefing, _page); return _page; end;
           local page1 = AP{
                               title = "@color:255,0,0 Leibeigener",
                               text = "@color:255,136,0 Vielen Dank, dass Ihr uns befreit habt. Habt ihr schon den Wissenschaftler gerettet?",
                               npc = { id = GetEntityId("serf2"),
                                       isObserved = true },
                               dialogCamera = true,
                               action = function() 
                                   Logic.EntityLookAt(GetID("serf2"), GetID(varg)) 
                                   Logic.EntityLookAt(GetID(varg), GetID("serf2")) 
                               end
                           };
           local page2 = AP{
               title = "@color:255,0,0 Varg",
               text = "@color:255,136,0 Nein noch nicht. Wollt Ihr uns schonmal helfen das Dorf wieder aufzubauen?",
               position = GetPosition(varg),
               explore = 2000,    
           };
           local page3 = AP{
            title = "@color:255,0,0 Leibeigener",
            text = "@color:255,136,0 Wir helfen euch erst, wenn Ihr den Wissenschaftler befreit habt! Kommt dann zu uns.",
            position = GetPosition("serf2"),    
        };



    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page2); 
        ResolveBriefing(page3); 
        SerfBriefingFalse()
        SerfBriefingTrue()
    end

    NormalSpeedInBriefing()
    StartBriefing(briefing)

    end;
    npcserfFalse = {
            name = "serf2",
            callback = serfcallbackFalse,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
    
    if leocamp == 0 then
        CreateNPC(npcserfFalse);
    end
end


function SerfBriefingTrue()
    serfcallbackTrue = function()
           local briefing = {};
           local AP = function(_page) table.insert(briefing, _page); return _page; end;
           local page1 = AP{
                               title = "@color:255,0,0 Leibeigener",
                               text = "@color:255,136,0 Ahhh, Danke das Ihr uns und den Wissenschaftler befreit habt. Wir stehen zu euren Diensten!",
                               npc = { id = GetEntityId("serf2"),
                                       isObserved = true },
                               dialogCamera = true,
                               action = function() 
                                   Logic.EntityLookAt(GetID("serf2"), GetID(varg)) 
                                   Logic.EntityLookAt(GetID(varg), GetID("serf2")) 
                               end
                           };
    briefing.finished = function() 
        ResolveBriefing(page1); 
        for i=1,4,1 do
            ChangePlayer("serf"..i,1)
        end
    end

    NormalSpeedInBriefing()
    StartBriefing(briefing)

    end;
    npcserfTrue = {
            name = "serf2",
            callback = serfcallbackTrue,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
    
    if leocamp == 1 then
        npcleoasFalse = {
            name = "leoas",
            callback = leoascallbackFalse,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
        local npcId = GetEntityId(npcleoasFalse.name)
        if NPC[npcId] then
            LeoAsBriefingTrue()
            DestroyNPC(npcleoasFalse);
            npcleoasTrue = {
                name = "leoas",
                callback = leoascallbackTrue,
                heroName = varg,
                wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
            };
            CreateNPC(npcleoasTrue);
        end
        CreateNPC(npcserfTrue);
    end
end


function LeoAsBriefingFalse()
    leoascallbackFalse = function()
           local briefing = {};
           local AP = function(_page) table.insert(briefing, _page); return _page; end;
           local page1 = AP{
                               title = "@color:255,0,0 Wissenschaftler",
                               text = "@color:255,136,0 Ahhh...gut...Ihr habt mich befreit! Habt Ihr schon meinen treuen Arbeitern geholfen, weil ohne Sie helfe ich euch nicht weiter!",
                               npc = { id = GetEntityId("leoas"),
                                       isObserved = true },
                               dialogCamera = true,
                               action = function() 
                                   Logic.EntityLookAt(GetID("leoas"), GetID(varg)) 
                                   Logic.EntityLookAt(GetID(varg), GetID("leoas")) 
                               end
                           };
           local page2 = AP{
               title = "@color:255,0,0 Varg",
               text = "@color:255,136,0 Nein, haben wir noch nicht. Wir kümmern uns sofort drum...",
               position = GetPosition(varg),
               explore = 2000,    
           };
           local page3 = AP{
            title = "@color:255,0,0 Wissenschaftler",
            text = "@color:255,136,0 Hopp, hopp!",
            position = GetPosition("leoas"),    
        };



    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page2); 
        ResolveBriefing(page3); 
        LeoAsBriefingFalse()
        LeoAsBriefingTrue()
    end

    NormalSpeedInBriefing()
    StartBriefing(briefing)
        
    end;
    npcleoasFalse = {
            name = "leoas",
            callback = leoascallbackFalse,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
    
    if serfcamp == 0 then
        CreateNPC(npcleoasFalse);
    end
end


function LeoAsBriefingTrue()
    leoascallbackTrue = function()
           local briefing = {};
           local AP = function(_page) table.insert(briefing, _page); return _page; end;
           local page1 = AP{
                               title = "@color:255,0,0 Wissenschaftler",
                               text = "@color:255,136,0 Guuut....Jaaaa... Ihr habt es geschaft mich und meine treuen Arbeiter zu befreien. Es erwartet uns viel Arbeit!",
                               npc = { id = GetEntityId("leoas"),
                                       isObserved = true },
                               dialogCamera = true,
                               action = function() 
                                   Logic.EntityLookAt(GetID("leoas"), GetID(varg)) 
                                   Logic.EntityLookAt(GetID(varg), GetID("leoas")) 
                               end
                           };
            local page2 = AP{
            title = "@color:255,0,0 Varg",
            text = "@color:255,136,0 Das ist richtig, jedoch müssen wir zuerst den Steinschlag, der den Weg zum Lager der Nebelkrieger versperrt, beseitigen, damit wir meinen Vater Jarg befreien können.",
            position = GetPosition("stein1"),    
            };
            local page3 = AP{
                title = "@color:255,0,0 Wissenschaftler",
                text = "@color:255,136,0 Mhmmmm...nun gut. Das hat natürlich die oberste Priorität. Jarg war ein wahrlich guter Anführer. Ich mache mich auf den Weg zum Steinschlag. Kommt zu mir, wenn Ihr bereit seid euch diesen Wilden zu stellen.",
                position = GetPosition("leoas"),  
            };
            local page4 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Was ist mit euren Arbeitern? Sollen diese nicht schonmal das Dorf wieder aufbauen?",
                position = GetPosition(varg),  
                explore = 2000,
            };
            local page5 = AP{
                title = "@color:255,0,0 Wissenschaftler",
                text = "@color:255,136,0 Ein guter Einwand, jedoch gingen bei dem Angriff der Nebelkrieger die Baupläne für das Barbarenlager verloren. Ich vermute Sie haben die Baupläne in Ihrem Lager versteckt.",
                position = GetPosition("leoas"),  
            };
            local page6 = AP{
                title = "@color:255,0,0 Varg",
                text = "@color:255,136,0 Noch ein Grund mehr diese Wilden anzugreifen. Die Arbeiter können in dieser Zeit schonmal Rohstoffe sammeln gehen.",
                position = GetPosition(varg),  
            };
            local page7 = AP{
                title = "@color:255,0,0 Wissenschaftler",
                text = "@color:255,136,0 So soll es sein. Wir sehen uns beim Steinrutsch!",
                position = GetPosition("leoas"),  
            };
    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page4);
        Move("leoas","stein_leoas")
        StartSimpleJob("LeoasNearStone")
    end

    NormalSpeedInBriefing()
    StartBriefing(briefing)

    end;
         npcleoasTrue = {
            name = "leoas",
            callback = leoascallbackTrue,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
    
    if serfcamp == 1 then
        npcserfFalse = {
            name = "serf2",
            callback = serfcallbackFalse,
            heroName = varg,
            wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
        };
        local npcId = GetEntityId(npcserfFalse.name)
        if NPC[npcId] then
            SerfBriefingTrue()
            DestroyNPC(npcserfFalse);
            npcserfTrue = {
                name = "serf2",
                callback = serfcallbackTrue,
                heroName = varg,
                wrongHeroMessage = "Ich möchte gerne mit eurem Anführer sprechen!"
            };
            CreateNPC(npcserfTrue);
        end
        CreateNPC(npcleoasTrue);
    end
end

function LeoasNearStone()
        if GetDistance("leoas", "stein_leoas") <= 200 then
            LeoasStoneBriefing()
            return true;
        end
    return false;
end

function LeoasStoneBriefing()

    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Da seid Ihr ja endlich. Wir haben ein Problem.",
                            npc = { id = GetEntityId("leoas"),
                                    isObserved = true },
                            dialogCamera = true,
                            action = function() 
                                Logic.EntityLookAt(GetID("leoas"), GetID(varg)) 
                                Logic.EntityLookAt(GetID(varg), GetID("leoas")) 
                            end
                        };
                        local page2 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Bei Odin, was müssen wir denn noch alles tun um meinen Vater zu befreien!",
                            position = GetPosition(varg),    
                            };
                        local page3 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Beruhigt euch Varg, wir müssen noch den Sprengsatz beschaffen um die Felsen aus dem Weg zu räumen. Leider habe ich vergessen, wo ich diesen Sprengsatz versteckt habe...",
                            position = GetPosition("leoas"),    
                            };
                        local page4 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Das kann doch nicht wahr sein! An irgendwas müsst Ihr euch doch erinnern können...",
                            position = GetPosition(varg),    
                            };
                        local page5 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Hmm...(grübel,ratter,klopf)...Ja ich weiß noch eine Sache. Ich habe meine Arbeiter damit beauftragt, die Schatztruhe in der Nähe des verschütteten Schwefelschachtes zu verstecken. Mit Ihrer Hilfe solltet Ihr den Sprengsatz finden können.",
                            position = GetPosition("leoas"),    
                            };
                        local page6 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Na dann lasst uns mal anfangen zu suchen...",
                            position = GetPosition(varg),    
                            };


        briefing.finished = function() 
            ResolveBriefing(page1); 
            Logic.AddQuest(1, 4, MAINQUEST_OPEN, "@color:255,0,0 Der Sprengsatz", "@cr Der Wissenschaftler hat irgendwo seinen Sprengsatz versteckt. Das einzige was Ihm dazu einfiel war, dass seine Arbeiter Ihn in der Nähe der verschütteten Schwefelmine deponiert haben.", 1)
            ChestBomb = CreateEntity(0,Entities.XD_ChestClose,GetPosition("chest_leoas"),"id_chest_bomb")
            StartSimpleJob("chestCallbackBombeLeoas")
        end
    
        
        NormalSpeedInBriefing()
        StartBriefing(briefing)
    
    end;
        local npc = {
                    name = "leoas",
                    callback = callback,
                    heroName = varg,
                    wrongHeroMessage = "Schickt Varg zu mir."
                };
        CreateNPC(npc);
end

function chestCallbackBombeLeoas()
	if IsNear(varg,"chest_leoas",200) then
		ReplaceEntity(ChestBomb,Entities.XD_ChestOpen)
		Sound.PlayGUISound(Sounds.fanfare, 0) 
		Sound.PlayGUISound(Sounds.VoicesMentor_CHEST_FoundTreasureChest_rnd_02, 0) 
		Message("In der Truhe befand sich eine Bombe. Bringt Sie zum Wissenschaftler.")
        LeoasBombBriefing()
		return true
	end
end


function LeoasBombBriefing()
    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Wunderbar! Ihr habt meine Bombe gefunden.",
                            npc = { id = GetEntityId("leoas"),
                                    isObserved = true }, 
                            action = function() 
                                Logic.EntityLookAt(GetID("leoas"), GetID(varg)) 
                                Logic.EntityLookAt(GetID(varg), GetID("leoas")) 
                            end
                        };
                        local page2 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Gebt nächstes mal bitte besser acht auf eure Sachen. Diese Truhe war ja besser versteckt als das Spielzeug meiner Wölfe.",
                            position = GetPosition(varg),    
                            };   
                        local page3 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Mhmja..ich versuchs mir zu merken. Nun gut, ran an den Speck.",
                            position = GetPosition("leoas"),    
                            };  
                        local page4 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Tretet ein Stück zurück!",
                            npc = { id = GetEntityId(varg),
                                    isObserved = true }, 
                            action = function() 
                                Move(varg,"bomb_varg",100)
                                StartSimpleJob("VargNearBombPos")
                            end     
                            };  
                        local page5 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 So, ich steh gut. Ihr könnt loslegen.",
                            position = GetPosition("bomb_varg"),    
                            explore = 1000,
                            }; 
                        local page6 = AP{
                            title = "@color:255,0,0 Wissenschaflter",
                            text = "@color:255,136,0 Na dann lassen wir es krachen...(Kram, Wühl, Rumpel)...und schnell weg!",
                            position = GetPosition("stein1"),    
                            action = function() 
                                Logic.CreateEntity(Entities.XD_Bomb1, GetPosition("stein_leoas").X, GetPosition("stein_leoas").Y, 0, 1)
                                Move("leoas","bomb_leoas",100)
                                StartSimpleJob("LeoasNearBombPos")
                                StartSimpleJob("BombExplosion")
                            end  
                            }; 
                        local page7 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Na das war mal ein Wumms! HarHarHar.",
                            position = GetPosition("bomb_varg"),    
                            action = function() 
                                Logic.EntityLookAt(GetID("leoas"), GetID(varg)) 
                                Logic.EntityLookAt(GetID(varg), GetID("leoas"))  
                            end  
                            }; 
                        local page8 = AP{
                            title = "@color:255,0,0 Wissenschaftler",
                            text = "@color:255,136,0 Hehehehe, ich liebe meinen Sprengstoff. Und jetzt hau ich ab, denn die Nebelkrieger haben das bestimmt gehört!",
                            position = GetPosition("bomb_leoas"),    
                            }; 
                        local page9 = AP{
                            title = "",
                            text = "",
                            position = GetPosition("bomb_leoas"), 
                            action = function() 
                                MoveAndVanish(GetID("leoas"), GetID("leoas_vanish")) 
                            end    
                            }; 
                        local page10 = AP{
                            title = "@color:255,0,0 Varg",
                            text = "@color:255,136,0 Und wir befreien jetzt endlich meinen Vater. Attacke Männer!",
                            position = GetPosition("bomb_varg"),    
                            action = function() 
                                Sound.Play2DSound(1146,0,150)  
                            end  
                            }; 
                        local page11 = AP{
                            title = "Mentor",
                            text = "Seht Herr, unsere Hauptstreitkraft ist rechtzeitig eingetroffen. Sie werden eine große Hilfe beim Kampf gegen die Nebelkrieger sein.",
                            position = GetPosition("spawn_trupp1"), 
                            action = function()
                                Sound.Play2DSound(1147,0,180) 
                                if mode == 1 then 
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"haupt_help1")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"haupt_help2")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"haupt_help3")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"haupt_help4")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"haupt_help5")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"haupt_help6")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"haupt_help7")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"haupt_help8")
                                elseif mode == 2 then
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"haupt_help1")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"haupt_help2")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"haupt_help3")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"haupt_help4")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"haupt_help5")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"haupt_help6")
                                elseif mode == 3 then
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp1"),"haupt_help1")
                                    CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,GetPosition("spawn_trupp2"),"haupt_help2")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_trupp3"),"haupt_help3")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"haupt_help4")
                                    CreateMilitaryGroup(1,Entities.CU_BanditLeaderBow1,8,GetPosition("spawn_varg"),"haupt_help5")
                                end
                            end  
                        };
                        

    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page5); 
        DisableNpcMarker(varg);
        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, "@color:255,0,0 Der Sprengsatz", "@cr Der Wissenschaftler hat irgendwo seinen Sprengsatz versteckt. Das einzige was Ihm dazu einfiel war, dass seine Arbeiter Ihn in der Nähe der verschütteten Schwefelmine deponiert haben.", 1)
        ActivateNVCamp()
    end

    
    NormalSpeedInBriefing()
    StartBriefing(briefing)
    
end;
    local npc = {
                name = "leoas",
                callback = callback,
                heroName = varg,
                wrongHeroMessage = "Schickt Varg zu mir."
            };
    CreateNPC(npc);
end

function VargNearBombPos()
    if IsNear(varg,"bomb_varg",150) then
        Logic.EntityLookAt(GetID(varg), GetID("stein_leoas")) 
        return true;
    end
end

function LeoasNearBombPos()
    if IsNear("leoas","bomb_varg",150) then
        Logic.EntityLookAt(GetID("leoas"), GetID("stein_leoas")) 
        return true;
    end
end

function BombExplosion()
    if IsDead("stein1") then
            for i=1,4,1 do
                DestroyEntity("r"..i)
            end
            Sound.Play2DSound(1072,0,200)
            Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("explosion1").X, GetPosition("explosion1").Y, 1)
            Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("explosion2").X, GetPosition("explosion2").Y, 1)
        return true;
    end
end


function ActivateDeadJargBrief()
    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP{
                            title = "@color:255,0,0 Mijörn",
                            text = "@color:255,136,0 Oh Varg, es tut mir so leid. Ich erkenne das Schwert eures Vaters bei dieser Leiche. Jarg ist tot!",
                            npc = { id = GetEntityId(guard),
                                    isObserved = true }, 
                            action = function() 
                                Logic.EntityLookAt(GetID(guard), GetID(varg)) 
                                Logic.EntityLookAt(GetID(varg), GetID("bone_jarg")) 
                                GUI.DestroyMinimapPulse(GetPosition("marker_pos").X,GetPosition("marker_pos").Y)
                                Move("hermit","signalfire") 
                                StartSimpleJob("HeimdallNearSignal")
                            end
                        };
                    local page2 = AP{
                        title = "@color:255,0,0 Varg",
                        text = "@color:255,136,0 Vater...Nein...Wir sind zu spät.",
                        position = GetPosition(varg),
                        explore = 2000    
                        }; 
                    local page3 = AP{
                        title = "@color:255,0,0 Varg",
                        text = "@color:255,136,0 (Wutentbrannter Schrei)",
                        position = GetPosition(varg), 
                        action = function() 
                            TriggerFixCppLogicExtension.AddMapArchiveToLoadOrder()
                            Sound.Play2DSound(Sounds.girlscream,0,240) 
                        end   
                        }; 
                    local page4 = AP{
                        title = "@color:255,0,0 Mijörn",
                        text = "@color:255,136,0 Geht es euch gut? Herr, ich weiß euer Schmerz ist groß, jedoch seid Ihr nun unser Anführer und Ihr müsst unser Dorf wieder aufbauen.",
                        position = GetPosition(guard),   
                        }; 
                    local page5 = AP{
                        title = "@color:255,0,0 Varg",
                        text = "@color:255,136,0 Nein mir geht es nicht gut!!! Aber Ihr habt recht. Nur erstmal müssen wir die Baupläne für das Barbarenlager finden. Ohne sie werden wir nicht weit kommen.",
                        position = GetPosition(varg),   
                        };
                    local page6 = AP{
                        title = "@color:255,0,0 Mijörn",
                        text = "@color:255,136,0 Da kann ich vielleicht behilflich sein. Ich habe bei Angriff auf das Lager eine Truhe hinter der Kirchenruine gesehen.",
                        position = GetPosition(guard),   
                        }; 
                    local page7 = AP{
                        title = "@color:255,0,0 Varg",
                        text = "@color:255,136,0 Dann sollten wir uns das mal etwas genauer anschauen.",
                        npc = { id = GetEntityId(varg),
                                    isObserved = true },
                        action = function() 
                            Move(varg,"chest_nv") 
                            StartSimpleJob("VargNearNvChest")
                        end     
                        };
                    local page8 = AP{
                        title = "@color:255,0,0 Varg",
                        text = "@color:255,136,0 Heureka. Hier ist alles drin was wir brauchen!",
                        position = GetPosition("chest_nv"),
                        };

    briefing.finished = function() 
        ResolveBriefing(page1); 
        ResolveBriefing(page2); 
        ResolveBriefing(page7);
        Logic.AddQuest(1, 2, MAINQUEST_CLOSED, "@color:255,0,0 Suche nach Jarg", "@cr Wie Mijörn es euch berichtet hat, ist Vargs Vater Jarg verschwunden. Eure Aufgabe ist es eine Siedlung zu errichten und dem Verschwinden des ehemaligen Königs der Barbaren nachzugehen. Findet eine Möglichkeit ein Dorfzentrum zu erwerben und besiegt die Eindringlinge in Reynivellir. Vielleicht findet ihr noch einige der reynivellianischen Siedler, die euch helfen wollen.", 1)
        guard = Logic.ChangeEntityPlayerID(GetID(guard), 1)
        CppLogic.Entity.SetDisplayName(guard, "Mijörn")
        SetEntityOverheadWidget(guard,1)
    end

    
    NormalSpeedInBriefing()
    StartBriefing(briefing)
    
end;
    local npc = {
                name = guard,
                callback = callback,
                heroName = varg,
                wrongHeroMessage = "Schickt Varg zu mir."
            };
    CreateNPC(npc);
end


function VargNearNvChest()
    if IsNear(varg,"chest_nv",300) then
        ReplaceEntity(chestNV,Entities.XD_ChestOpen)
		Sound.PlayGUISound(Sounds.fanfare, 0)
        Logic.SetTechnologyState(1,Technologies.B_BarbVillage,2)
        Logic.SetTechnologyState(1,Technologies.B_BarbTower,2)
        Logic.SetTechnologyState(1,Technologies.B_BarbArena,2)
        Logic.SetTechnologyState(1,Technologies.B_Residence,2)
        Logic.SetTechnologyState(1,Technologies.B_Farm,2)
        Logic.SetTechnologyState(1,Technologies.B_University,2)
        Logic.SetTechnologyState(1,Technologies.B_Claymine,2)
        Logic.SetTechnologyState(1,Technologies.B_Woodmine,2)
        Logic.SetTechnologyState(1,Technologies.B_Village,2)

        if mode == 1 then
            Logic.AddToPlayersGlobalResource(1,ResourceType.ClayRaw,1500)
            Logic.AddToPlayersGlobalResource(1,ResourceType.StoneRaw,1200)
            Logic.AddToPlayersGlobalResource(1,ResourceType.GoldRaw,1200)
            Logic.AddToPlayersGlobalResource(1,ResourceType.IronRaw,800)
            Logic.AddToPlayersGlobalResource(1,ResourceType.WoodRaw,1500)
            Logic.AddToPlayersGlobalResource(1,ResourceType.SulfurRaw,800)
        elseif mode == 2 then
            Logic.AddToPlayersGlobalResource(1,ResourceType.ClayRaw,1000)
            Logic.AddToPlayersGlobalResource(1,ResourceType.StoneRaw,800)
            Logic.AddToPlayersGlobalResource(1,ResourceType.GoldRaw,800)
            Logic.AddToPlayersGlobalResource(1,ResourceType.IronRaw,300)
            Logic.AddToPlayersGlobalResource(1,ResourceType.WoodRaw,1000)
            Logic.AddToPlayersGlobalResource(1,ResourceType.SulfurRaw,300)
        elseif mode == 3 then
            Logic.AddToPlayersGlobalResource(1,ResourceType.ClayRaw,800)
            Logic.AddToPlayersGlobalResource(1,ResourceType.StoneRaw,600)
            Logic.AddToPlayersGlobalResource(1,ResourceType.GoldRaw,600)
            Logic.AddToPlayersGlobalResource(1,ResourceType.IronRaw,100)
            Logic.AddToPlayersGlobalResource(1,ResourceType.WoodRaw,600)
            Logic.AddToPlayersGlobalResource(1,ResourceType.SulfurRaw,0)
        end
        return true;
    end
    return false;
end

function HeimdallNearSignal()
    if IsNear("hermit","signalfire",700) then
        BriefingHeimdallSignal()
        if mode ==1 then
            HermitTimer = 15
        elseif mode ==2 then
            HermitTimer = 10
        elseif mode == 3 then
            HermitTimer = 7
        end
        HeimdallCount1 = StartCountdown(HermitTimer*60,TalkToHeimdallWarning1,false)
        return true;
    end
end


function TalkToHeimdallWarning1()
    Message("Ihr solltet mit Heimdall beim Signalfeuer sprechen.")
    HeimdallCount2 = StartCountdown(HermitTimer*60,TalkToHeimdallWarning2,false)
end

function TalkToHeimdallWarning2()
    Message("Sprecht mit Heimdall bevor er an Altersschwäche stirbt.")
    HeimdallCount3 = StartCountdown(HermitTimer*60,TalkToHeimdallWarning3,true)
end

function TalkToHeimdallWarning3()
    Message("Ein Blitz hat Heimdall erschlagen. Was ein Pech!")
    Logic.CreateEffect(GGL_Effects.FXLightning, GetPosition("hermit").X, GetPosition("hermit").Y, 1)
    DestroyEntity("hermit")
    StartCountdown(5,DefeatHeimdall,false)
end

function DefeatHeimdall()
    Defeat()
end

function BriefingHeimdallSignal()
    local callback = function()
        local briefing = {};
        local AP = function(_page) table.insert(briefing, _page); return _page; end;
        local page1 = AP {
            title = "@color:255,0,0 Heimdall",
            text = "@color:255,136,0 Schaut an, schaut an. Das Leuchtfeuer von Grimsvötn.",
            npc = { id = GetEntityId("hermit"),
                isObserved = true },
            action = function()
                Logic.EntityLookAt(GetID("hermit"), GetID(varg))
                Logic.EntityLookAt(GetID(varg), GetID("hermit"))
            end
        };
        local page2 = AP {
            title = "@color:255,0,0 Heimdall",
            text = "@color:255,136,0 Viele Schiffe sind an diesen Felsen zerberstet und haben Schiffbruch erlitten.",
            position = GetPosition("wreck2"),
            explore = 2000
        };
        local page3 = AP {
            title = "@color:255,0,0 Heimdall",
            text = "@color:255,136,0 Ich glaube kaum, dass dies einer überlebt hat.",
            position = GetPosition("wreck1"),
            explore = 2000
        };
        local page4 = AP {
            title = "@color:255,0,0 Varg",
            text = "@color:255,136,0 Dann sollten wir das Leuchtfeuer schleunigst wieder entzünden. Ich hoffe diese Wilden sind nun ein für alle mal ausgerottet und zerstören es nicht wieder erneut.",
            position = GetPosition(varg),
            explore = 2000
        };
        local page5 = AP {
            title = "@color:255,0,0 Heimdall",
            text = "@color:255,136,0 Da gebe ich dir Recht, jedoch werden wir viel Holz benötigen, um das Feuer wieder aufgebaut zu bekommen und dafür benötigen wir zuerst ein ansehnliches Dorf.",
            position = GetPosition("hermit"),
        };
        local page6 = AP {
            title = "@color:255,0,0 Varg",
            text = "@color:255,136,0 Lass das Dorf mal meine Sorge sein und jetzt kommt, es gibt viel zu tun...",
            position = GetPosition(varg),
        };


        briefing.finished = function()
            ResolveBriefing(page1);
            ResolveBriefing(page2);
            ResolveBriefing(page3);
            ResolveBriefing(page4);
            EndJob(DefeatJob1)
            DestroyEntity(varg)
            DestroyEntity(guard)
            DestroyEntity(trupp3)
            DestroyEntity(trupp1)
            DestroyEntity(trupp2)
            StartBlende(
                "@center @color:255,0,0 Aufbau von Reynivellir",
                "@center @color:255,255,255 @cr @cr Seid Vargs Ankunft in Reynivellir ist viel geschehen. Er hat erfahren, dass seine Mutter und sein Vater tot sind und er nun Oberhaupt seines Stammes und Heimatvolkes ist. Vor Varg liegt ein langer Weg, bis er seinem Vater ebenbürtig werden kann. Alleine ist er jedoch nicht, da seine engsten Freunde, seien es alte oder neu dazugewonnenen, an seiner Seite stehen. Varg muss zunächst das Dorf wieder aufbauen und das Signalfeuer neu entzüden, um weitere Schiffsunglücke zu verhindern. Wird Ihm dies gelingen? Man weiß es nicht..."
                ,
                function() Start_Chapter2() end,

                20) --muss später höher
        end
        if HeimdallCount1 then
            StopCountdown(HeimdallCount1)
        end
        if HeimdallCount2 then
            StopCountdown(HeimdallCount2)
        end
        if HeimdallCount3 then
            StopCountdown(HeimdallCount3)
        end
        NormalSpeedInBriefing()
        StartBriefing(briefing)

    end;
    local npc = {
        name = "hermit",
        callback = callback,
        heroName = varg,
        wrongHeroMessage = "Schickt Varg zu mir."
    };
    CreateNPC(npc);
end



function StartBriefingChapter2()
        local briefing = {}
        local AP = function(_page) table.insert(briefing, _page) return _page end
        local page1 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 So Männer. Es gibt viel zu tun. Wir müssen das gesamte Dorf wieder neu errichten, deshalb bekommt jeder von euch eine eigene Aufgabe.",
            position = GetPosition(varg),
            explore = 2000,
            action = function() 
                Logic.EntityLookAt(varg,trupp1)
                Logic.EntityLookAt(guard,varg)
                for i=1,3,1 do
                    Logic.EntityLookAt(_G["trupp"..i],varg)
                end
            end 
        }
        local page2 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Helgar, du sollst dich darum kümmern, dass die verschütteten Minen wieder in Betrieb genommen werden können. Vielleicht kann unser der Wissenschaftler dabei wieder eine Hilfe sein.",
            position = GetPosition(varg),
            action = function() 
                Logic.EntityLookAt(varg,trupp1)
                Logic.EntityLookAt(trupp1,varg)
            end 
        }
        local page3 = AP{
            title	= "@color:255,0,0 Helgar",
            text	= "@color:255,136,0 Jawohl, Herr.",
            position = GetPosition(trupp1),
            action = function() 
                Logic.EntityLookAt(varg,trupp1)
                Logic.EntityLookAt(trupp1,varg)
            end 
        }
        local page4 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Du kannst wegtreten.",
            position = GetPosition(varg),
            action = function() 
                Move(trupp1,GetID("target_helgar"))
            end 
        }
        local page5 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Wolfgang, kümmere du dich um die Instandsetzung unserer Dorfpalisaden. Diese Höhlenmenschen haben unsere gesamte Verteidigung zerstört. Vielleicht kann dir dabei Mijörn weiterhelfen.",
            position = GetPosition(varg),
            action = function() 
                Logic.EntityLookAt(varg,trupp2)
                Logic.EntityLookAt(trupp2,varg)
            end 
        }
        local page6 = AP{
            title	= "@color:255,0,0 Mijörn",
            text	= "@color:255,136,0 Ich habe noch die alten Pläne der Anlage und eine Liste der Kosten, die auf uns zukommen. Ich lasse dir alles zukommen.",
            position = GetPosition(guard),
            action = function() 
                Logic.EntityLookAt(guard,trupp2)
                Logic.EntityLookAt(trupp2,guard)
            end 
        }
        local page7 = AP{
            title	= "@color:255,0,0 Wolfgang",
            text	= "@color:255,136,0 Habt Danke. Ich werde mich umgehend darum kümmern.",
            position = GetPosition(trupp2),
        }
        local page8 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Auch du kannst wegtreten.",
            position = GetPosition(varg),
            action = function() 
                Move(trupp2,GetID("target_wolfgang"))
            end 
        }
        local page9 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Zu guter letzt Rüdiger, für dich habe ich einen besonderen Auftrag. Irgendwo hier in unserem Gebiet soll es einen alten Kautz geben, der uns mehr über die Entwicklung zur politischen Lage und Besetzung von Grimvötn erzählen kann. Finde Ihn!",
            position = GetPosition(varg),
            action = function() 
                Logic.EntityLookAt(varg,trupp3)
                Logic.EntityLookAt(trupp3,varg)
            end 
        }
        local page10 = AP{
            title	= "@color:255,0,0 Rüdiger",
            text	= "@color:255,136,0 Ja, mein Herr. Ich werde mein bestes geben.",
            position = GetPosition(trupp3),
        }
        local page11 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Dann kannst du auch wegtreten.",
            position = GetPosition(varg),
            action = function() 
                Move(trupp3,GetID("target_ruediger"))
            end 
        }
        local page12 = AP{
            title	= "@color:255,0,0 Varg",
            text	= "@color:255,136,0 Und wir beide Mijörn, wir warten ab, bis die drei Ihre Aufgaben erfüllt haben.",
            position = GetPosition(varg),
            action = function() 
                guard = Logic.ChangeEntityPlayerID(guard,3)
                varg = Logic.ChangeEntityPlayerID(varg,3)
                RefreshDisplayNames()
            end 
        }
    
        briefing.finished = function()  
           ResolveBriefing(page1)
           Logic.AddQuest(1, 1, MAINQUEST_OPEN, "@color:255,0,0 Wideraufbau von Reynivellir", "@cr Varg hat seine Mitstreiter mit verschiedenen Aufgaben beauftragt. Erledigt Sie alle um fortzufahren.", 1)
           Logic.AddQuest(1, 2, SUBQUEST_OPEN, "@color:255,0,0 Minen", "@cr Helgar wurde damit beauftrag die Minen wieder freizulegen. Der Wissenschaflter könnte Ihm hierbei behilflich sein.", 1)
           Logic.AddQuest(1, 3, SUBQUEST_OPEN, "@color:255,0,0 Dorfpalisaden", "@cr Wolfgang soll die Verteidigung des Dorfes wieder in Stand setzen. Mijörn hat ihm dafür eine Liste der Kosten zukommen lassen.", 1)
           Logic.AddQuest(1, 4, SUBQUEST_OPEN, "@color:255,0,0 Alter Kautz", "@cr Rüdiger soll einen alten Kautz finden. Wo er sich aufhält weiß niemand. Da hilft wohl nur suchen.", 1)
           StartHelgarQuest() --Start HelgarQuest
           ActivateTributWolfgang() --Start WolfgangQuest
           StartRuedigerQuest() --Start RüdigerQuest
        end;
        NormalSpeedInBriefing()
        StartBriefing(briefing)
end



function AddPages( _briefing )
    local AP = function(_page) table.insert(_briefing, _page); return _page; end
    local ASP = function(_entity, _title, _text, _dialog, _explore) return AP(CreateShortPage(_entity, _title, _text, _dialog, _explore)); end
    return AP, ASP;
end

function CreateShortPage( _entity, _title, _text, _dialog, _explore) 
    local page = {
        title = _title,
        text = _text,
        position = GetPosition(_entity),
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
