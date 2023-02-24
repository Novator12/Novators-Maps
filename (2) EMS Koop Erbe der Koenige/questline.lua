function StartQuestline()

    --1. Quest 
        Logic.AddQuest(1, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)


    NonPlayerCharacter.Create(
			{ScriptName = "BarmeciaMayor",     
			Callback = ActivateBarmeciaBrief })
	NonPlayerCharacter.Activate("BarmeciaMayor")


    NonPlayerCharacter.Create(
			{ScriptName = "salim",   
			Callback = ActivateFolklungBrief })
	NonPlayerCharacter.Activate("salim")


    NonPlayerCharacter.Create(
			{ScriptName = "ari",     
			Callback = ActivateDarioBrief })
	NonPlayerCharacter.Activate("ari")


    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"QuestlineHandler",1)
end

function ActivateBarmeciaBrief()
    StartBarmeciaMayorBrief(1,"BarmBrief")
    StartBarmeciaMayorBrief(2,"BarmBrief")
end

function ActivateFolklungBrief()
    StartFolklungBrief(1,"FolkBrief")
    StartFolklungBrief(2,"FolkBrief")
end

function ActivateDarioBrief()
    StartDarioBrief(1,"DarioBrief")
    StartDarioBrief(2,"DarioBrief")
end


function QuestlineHandler()
    if BarmeciaFlag == true then

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 3, 1)
        Logic.ForceFullExplorationUpdate()
        SetTableDiplomacyState(1, Player1State, BarmeciaState)
        SetTableDiplomacyState(1, Player2State, BarmeciaState)
        SetTableDiplomacyState(3, Player1State, FolklungState)
        SetTableDiplomacyState(3, Player2State, FolklungState)
        SetTableDiplomacyState(3, Player1State, DarioState)
        SetTableDiplomacyState(3, Player2State, DarioState)
        SetTableDiplomacyState(3, BarmeciaState, DarioState)
        SetTableDiplomacyState(3, BarmeciaState, FolklungState)
        SetTableDiplomacyState(1, DarioState, FolklungState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        ChangeKIBuildings()

        for i =1,4,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tower"..i.."_inv"),0)
        end
        for i =1,2,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tent"..i.."_inv"),0)
        end
        Logic.SetEntityInvulnerabilityFlag(GetID("id4_claymine_inv"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("FolklungCastle"),0)
        VargGateFlag = true
        UpgradeArmyAggressivness()
        SetupFinalFight1() 
        CreateFinalFight1()
        return true
    elseif FolklungFlag == true then

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 4, 1)
        Logic.ForceFullExplorationUpdate()
        SetTableDiplomacyState(3, Player1State, BarmeciaState)
        SetTableDiplomacyState(3, Player2State, BarmeciaState)
        SetTableDiplomacyState(1, Player1State, FolklungState)
        SetTableDiplomacyState(1, Player2State, FolklungState)
        SetTableDiplomacyState(3, Player1State, DarioState)
        SetTableDiplomacyState(3, Player2State, DarioState)
        SetTableDiplomacyState(1, BarmeciaState, DarioState)
        SetTableDiplomacyState(3, BarmeciaState, FolklungState)
        SetTableDiplomacyState(3, DarioState, FolklungState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        ChangeKIBuildings()

        for i =1,4,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tower"..i.."_inv"),0)
        end
        for i =1,2,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tent"..i.."_inv"),0)
        end
        Logic.SetEntityInvulnerabilityFlag(GetID("id4_claymine_inv"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("FolklungCastle"),0)
        VargGateFlag = true
        UpgradeArmyAggressivness()
        SetupFinalFight2() 
        CreateFinalFight2()
        return true
    elseif DarioFlag == true then

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 7, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 7, 1)
        Logic.ForceFullExplorationUpdate()
        SetTableDiplomacyState(3, Player1State, BarmeciaState)
        SetTableDiplomacyState(3, Player2State, BarmeciaState)
        SetTableDiplomacyState(3, Player1State, FolklungState)
        SetTableDiplomacyState(3, Player2State, FolklungState)
        SetTableDiplomacyState(1, Player1State, DarioState)
        SetTableDiplomacyState(1, Player2State, DarioState)
        SetTableDiplomacyState(3, BarmeciaState, DarioState)
        SetTableDiplomacyState(1, BarmeciaState, FolklungState)
        SetTableDiplomacyState(3, DarioState, FolklungState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        ChangeKIBuildings()

        for i =1,4,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tower"..i.."_inv"),0)
        end
        for i =1,2,1 do
            Logic.SetEntityInvulnerabilityFlag(GetID("id5_tent"..i.."_inv"),0)
        end
        Logic.SetEntityInvulnerabilityFlag(GetID("id4_claymine_inv"),0)
        Logic.SetEntityInvulnerabilityFlag(GetID("FolklungCastle"),0)
        VargGateFlag = true
        UpgradeArmyAggressivness()
        SetupFinalFight3() 
        CreateFinalFight3()
        return true
    end
end


function PayedBarmecia()
    BarmeciaFlag = true
    if TBar then
        Logic.RemoveTribute(1,TBar)
    end
    if TFolk then
    Logic.RemoveTribute(1,TFolk)
    end
    if TDar then
    Logic.RemoveTribute(1,TDar)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")

    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VictoryHandler",1)

end

function PayedFolklung()
    FolklungFlag = true
    if TBar then
        Logic.RemoveTribute(1,TBar)
    end
    if TFolk then
    Logic.RemoveTribute(1,TFolk)
    end
    if TDar then
    Logic.RemoveTribute(1,TDar)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")

    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VictoryHandler",1)

end

function PayedDario()
    DarioFlag = true
    if TBar then
        Logic.RemoveTribute(1,TBar)
    end
    if TFolk then
    Logic.RemoveTribute(1,TFolk)
    end
    if TDar then
    Logic.RemoveTribute(1,TDar)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")

    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VictoryHandler",1)

end

SecretFlag = false

function VictoryHandler()
    if BarmeciaFlag == true then
        if IsDestroyed("VargCastle") 
        and IsDestroyed("id5_kanonen") 
        and IsDestroyed("id5_maint3") 
        and IsDestroyed("hq5") 
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("outpost_id4") 
        and IsDestroyed("out_kaserne") 
        and IsDestroyed("out_archery") 
        and IsDestroyed("out_stable") 
        and IsDestroyed("FolklungCastle") 
        and IsDestroyed("hq4") 
        and IsDestroyed("id4_kaserne1") 
        and IsDestroyed("id4_kaserne2") 
        and IsDestroyed("id4_kaserne3") 
        and IsDestroyed("id4_archery")
        and IsDestroyed("id4_reiter")
        and IsDestroyed("id8_turm")
        and IsDestroyed("id8_kanonen")
        and IsDestroyed("id8_kaserne")
        and IsDestroyed("id8_archery")
        and IsDestroyed("hq8")
        and IsDestroyed("hq7")
        and IsDestroyed("id7_kaserne1")
        and IsDestroyed("id7_kaserne2")
        and IsDestroyed("id7_reiter")
        and IsDestroyed("id7_archery1")
        and IsDestroyed("id7_archery2")
        and IsDestroyed("id7_kanonen")
        and IsDestroyed("OKC") then
             CreateKalaAttack()
        end
    elseif FolklungFlag == true then
        if IsDestroyed("VargCastle") 
        and IsDestroyed("id5_kanonen") 
        and IsDestroyed("id5_maint3") 
        and IsDestroyed("hq5") 
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("id8_turm")
        and IsDestroyed("id8_kanonen")
        and IsDestroyed("id8_kaserne")
        and IsDestroyed("id8_archery")
        and IsDestroyed("hq8")
        and IsDestroyed("hq7")
        and IsDestroyed("id7_kaserne1")
        and IsDestroyed("id7_kaserne2")
        and IsDestroyed("id7_reiter")
        and IsDestroyed("id7_archery1")
        and IsDestroyed("id7_archery2")
        and IsDestroyed("id7_kanonen")
        and IsDestroyed("OKC") 
        and IsDestroyed("hq3")
        and IsDestroyed("BarKanonen")
        and IsDestroyed("BarArchery")
        and IsDestroyed("BarKaserne")
        and IsDestroyed("BarReiter") then
            CreateKalaAttack()
        end
    elseif DarioFlag == true then
        if IsDestroyed("VargCastle") 
        and IsDestroyed("id5_kanonen") 
        and IsDestroyed("id5_maint3") 
        and IsDestroyed("hq5") 
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("id8_turm")
        and IsDestroyed("id8_kanonen")
        and IsDestroyed("id8_kaserne")
        and IsDestroyed("id8_archery")
        and IsDestroyed("hq8") 
        and IsDestroyed("hq3")
        and IsDestroyed("BarKanonen")
        and IsDestroyed("BarArchery")
        and IsDestroyed("BarKaserne")
        and IsDestroyed("BarReiter")
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("outpost_id4") 
        and IsDestroyed("out_kaserne") 
        and IsDestroyed("out_archery") 
        and IsDestroyed("out_stable") 
        and IsDestroyed("FolklungCastle") 
        and IsDestroyed("hq4") 
        and IsDestroyed("id4_kaserne1") 
        and IsDestroyed("id4_kaserne2") 
        and IsDestroyed("id4_kaserne3") 
        and IsDestroyed("id4_archery")
        and IsDestroyed("id4_reiter") then
            CreateKalaAttack()
        end
    elseif SecretFlag == true then
        if IsDestroyed("VargCastle") 
        and IsDestroyed("id5_kanonen") 
        and IsDestroyed("id5_maint3") 
        and IsDestroyed("hq5") 
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("id8_turm")
        and IsDestroyed("id8_kanonen")
        and IsDestroyed("id8_kaserne")
        and IsDestroyed("id8_archery")
        and IsDestroyed("hq8") 
        and IsDestroyed("hq3")
        and IsDestroyed("BarKanonen")
        and IsDestroyed("BarArchery")
        and IsDestroyed("BarKaserne")
        and IsDestroyed("BarReiter")
        and IsDestroyed("outpost_id5") 
        and IsDestroyed("outpost_id4") 
        and IsDestroyed("out_kaserne") 
        and IsDestroyed("out_archery") 
        and IsDestroyed("out_stable") 
        and IsDestroyed("FolklungCastle") 
        and IsDestroyed("hq4") 
        and IsDestroyed("id4_kaserne1") 
        and IsDestroyed("id4_kaserne2") 
        and IsDestroyed("id4_kaserne3") 
        and IsDestroyed("id4_archery")
        and IsDestroyed("id4_reiter") 
        and IsDestroyed("hq7")
        and IsDestroyed("id7_kaserne1")
        and IsDestroyed("id7_kaserne2")
        and IsDestroyed("id7_reiter")
        and IsDestroyed("id7_archery1")
        and IsDestroyed("id7_archery2")
        and IsDestroyed("id7_kanonen")
        and IsDestroyed("OKC") then
            CreateKalaAttack()
        end
    end

end

function CreateKalaAttack()
    Logic.SetPlayerRawName(16, "Kala")
	Logic.SetPlayerName(16, "Kala")
    Display.SetPlayerColorMapping(16, 2)
	for i=1,8,1 do
		for j=1,2,1 do 
			local pos = GetPosition("secretdef"..i.."_"..j)
			local name = Logic.CreateEntity(Entities.CB_Evil_Tower1,pos.X,pos.Y,0,16)
			DestroyEntity("secretdef"..i.."_"..j)
			SetEntityName(name,"secretdef"..i.."_"..j)
		end
	end
    Logic.AddQuest(1, 7, MAINQUEST_CLOSED, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
    Logic.AddQuest(2, 7, MAINQUEST_CLOSED, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
    Logic.AddQuest(1, 8, MAINQUEST_OPEN, "@color:255,0,0 Kala", "Was ist das denn! Kala mischt sich nun auch in den Kampf um die Krone ein. Drängt Sie zurück und zerstört Ihre Stellungen.", 1)
    Logic.AddQuest(1, 8, MAINQUEST_OPEN, "@color:255,0,0 Kala", "Was ist das denn! Kala mischt sich nun auch in den Kampf um die Krone ein. Drängt Sie zurück und zerstört Ihre Stellungen.", 1)
    StartNVRush()
    --Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"WinHandler",1) ?
end

function WinHandler()

end