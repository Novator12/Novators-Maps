function StartQuestline()

    --1. Quest 
        Logic.AddQuest(1, 10, MAINQUEST_OPEN, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)
        Logic.AddQuest(2, 10, MAINQUEST_OPEN, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)

        Logic.AddQuest(1, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_OPEN, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

    if FailedBarm == false then
    NonPlayerCharacter.Create(
			{ScriptName = "BarmeciaMayor",     
			Callback = ActivateBarmeciaBrief })
	NonPlayerCharacter.Activate("BarmeciaMayor")
    BarmQuestActive = true
    end

    if FailedFolk == false then
    NonPlayerCharacter.Create(
			{ScriptName = "salim",   
			Callback = ActivateFolklungBrief })
	NonPlayerCharacter.Activate("salim")
    FolkQuestActive = true
    end

    if FailedOKC == false then
    NonPlayerCharacter.Create(
			{ScriptName = "ari",     
			Callback = ActivateDarioBrief })
	NonPlayerCharacter.Activate("ari")
    OKCQuestActive = true
    end

   
    NonPlayerCharacter.Create(
			{ScriptName = "miner",     
			Callback = ActivateBomb1Brief  })
	NonPlayerCharacter.Activate("miner")

    NonPlayerCharacter.Create(
			{ScriptName = "legend",     
			Callback = ActivateLegendBrief  })
	NonPlayerCharacter.Activate("legend")


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

function ActivateBomb1Brief()
    StartBomb1Brief(1,"Bomb1Brief")
    StartBomb1Brief(2,"Bomb1Brief")
end

function ActivateBomb2Brief()
    StartBomb2Brief(1,"Bomb2Brief")
    StartBomb2Brief(2,"Bomb2Brief")
end

function ActivateBomb3Brief()
    StartBomb3Brief(1,"Bomb3Brief")
    StartBomb3Brief(2,"Bomb3Brief")
end

function ActivateLegendBrief()
    StartLegendBrief(1,"LegendBrief")
    StartLegendBrief(2,"LegendBrief")
end


function QuestlineHandler()
    if BarmeciaFlag == true then
        if FailedBarm == false then
            Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
        end
        if FailedFolk == false then
            Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
        end
        if FailedOKC == false then
            Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
        end
        Erbe.UpgradeVargOutpostAggressivness()
        Erbe.UpgradeVargMainAggressivness()
        Erbe.UpgradeBanditenAggressivness()

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)
        Logic.AddQuest(2, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 3, 1)
        Logic.SetShareExplorationWithPlayerFlag(1, 9, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 9, 1)
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
        SetTableDiplomacyState(1, DarioState, RobberState)
        SetTableDiplomacyState(1, FolklungState, RobberState)
        SetTableDiplomacyState(1, FolklungState, VargState)
        SetTableDiplomacyState(1, DarioState, VargState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        for j=1,18,1 do
            if IsExisting("ev"..j) then
                DestroyEntity("ev"..j)
            end
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
        SetupFinalFight1() 
        CreateFinalFight1()
        StartSimpleJob("MinerCheck1")
        StartSimpleJob("MinerCheck2")
        StartMapChangesBrief(1,"MapChangesBrief")
        return true
    elseif FolklungFlag == true then

        if FailedBarm == false then
            Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
        end
        if FailedFolk == false then
            Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
        end
        if FailedOKC == false then
            Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
        end
        Erbe.UpgradeVargOutpostAggressivness()
        Erbe.UpgradeVargMainAggressivness()
        Erbe.UpgradeBanditenAggressivness()

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)
        Logic.AddQuest(2, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 4, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 4, 1)
        Logic.SetShareExplorationWithPlayerFlag(1, 10, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 10, 1)
        Logic.SetShareExplorationWithPlayerFlag(1, 14, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 14, 1)
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
        SetTableDiplomacyState(1, DarioState, RobberState)
        SetTableDiplomacyState(1, BarmeciaState, RobberState)
        SetTableDiplomacyState(1, BarmeciaState, VargState)
        SetTableDiplomacyState(1, DarioState, VargState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        for j=1,18,1 do
            if IsExisting("ev"..j) then
                DestroyEntity("ev"..j)
            end
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
        SetupFinalFight2() 
        CreateFinalFight2()
        StartSimpleJob("MinerCheck1")
        StartSimpleJob("MinerCheck2")
        StartMapChangesBrief(1,"MapChangesBrief")
        return true
    elseif DarioFlag == true then

        if FailedBarm == false then
            Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
        end
        if FailedFolk == false then
            Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
        end
        if FailedOKC == false then
            Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
        end
        Erbe.UpgradeVargOutpostAggressivness()
        Erbe.UpgradeVargMainAggressivness()
        Erbe.UpgradeBanditenAggressivness()

        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)
        Logic.AddQuest(2, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        Logic.SetShareExplorationWithPlayerFlag(1, 7, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 7, 1)
        Logic.SetShareExplorationWithPlayerFlag(1, 12, 1)
        Logic.SetShareExplorationWithPlayerFlag(2, 12, 1)
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
        SetTableDiplomacyState(1, FolklungState, RobberState)
        SetTableDiplomacyState(1, BarmeciaState, RobberState)
        SetTableDiplomacyState(1, BarmeciaState, VargState)
        SetTableDiplomacyState(1, FolklungState, VargState)
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        for j=1,18,1 do
            if IsExisting("ev"..j) then
                DestroyEntity("ev"..j)
            end
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
        SetupFinalFight3() 
        CreateFinalFight3()
        StartSimpleJob("MinerCheck1")
        StartSimpleJob("MinerCheck2")
        StartMapChangesBrief(1,"MapChangesBrief")
        return true
    elseif SecretFlag == true then

        if FailedBarm == false then
            Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
        end
        if FailedFolk == false then
            Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
        end
        if FailedOKC == false then
            Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
        end

        Erbe.UpgradeVargOutpostAggressivness()
        Erbe.UpgradeVargMainAggressivness()
        Erbe.UpgradeBanditenAggressivness()
        
        Logic.AddQuest(1, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)
        Logic.AddQuest(2, 4, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].."", ""..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 steht unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zum Bürgermeister um mit ihm zu sprechen,", 1)

        Logic.AddQuest(1, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)
        Logic.AddQuest(2, 5, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].."", ""..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 steht ebenfalls unter Belagerung von Varg. Durchbrecht die Belagerung und eilt zu Salim und Pilgrim um mit Ihnen zu sprechen,", 1)

        Logic.AddQuest(1, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)
        Logic.AddQuest(2, 6, MAINQUEST_CLOSED, ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].."", ""..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 wird von Banditen Angegriffen, sprecht mit Ari und Drake. Findet hierfür einen Weg, die Straßensperre zu umgehen.,", 1)

        Logic.AddQuest(1, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)
        Logic.AddQuest(2, 10, MAINQUEST_CLOSED, "Info", "Es wird empfohlen, erst mit allen Kronenanwärtern zu sprechen, dies ist jedoch keine Pflicht. Vielleicht gibt es noch weitere Möglichkeiten. Denkt an das Landvolk!", 1)

        Logic.AddQuest(1, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)
        Logic.AddQuest(2, 7, MAINQUEST_OPEN, "@color:65,105,225 Königsrennen", "Das Rennen um die Krone hat begonnen! Besiegt alle euch feindlich gesinnten Gegner und besteigt den Thron.", 1)

        
        SetTableDiplomacyState(3, Player1State, BarmeciaState)
        SetTableDiplomacyState(3, Player2State, BarmeciaState)
        SetTableDiplomacyState(3, Player1State, FolklungState)
        SetTableDiplomacyState(3, Player2State, FolklungState)
        SetTableDiplomacyState(3, Player1State, DarioState)
        SetTableDiplomacyState(3, Player2State, DarioState)
        SetTableDiplomacyState(1, BarmeciaState, DarioState)
        SetTableDiplomacyState(1, BarmeciaState, FolklungState)
        SetTableDiplomacyState(1, DarioState, FolklungState)
        SetTableDiplomacyState(1, DarioState, RobberState)
        SetTableDiplomacyState(1, BarmeciaState, RobberState)
        SetTableDiplomacyState(1, FolklungState, RobberState)
        SetTableDiplomacyState(1, FolklungState, VargState)
        SetTableDiplomacyState(1, DarioState, VargState)
        SetTableDiplomacyState(1, BarmeciaState, VargState)
        
        Gate_ID7_State = false
        for i=1,9,1 do
            DestroyEntity("block"..i)
        end
        for j=1,18,1 do
            if IsExisting("ev"..j) then
                DestroyEntity("ev"..j)
            end
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
        SetupFinalFight4() 
        CreateFinalFight4()
        StartSimpleJob("MinerCheck1")
        StartSimpleJob("MinerCheck2")
        StartMapChangesBrief(1,"MapChangesBrief")
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
    if TLeg then
        Logic.RemoveTribute(1,TLeg)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")
    ReplaceEntity("Cathedral",Entities.PB_Monastery3)
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
    if TLeg then
        Logic.RemoveTribute(1,TLeg)
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
    if TLeg then
        Logic.RemoveTribute(1,TLeg)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")

    Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VictoryHandler",1)

end


function PayedLegend()
    if TBar then
        Logic.RemoveTribute(1,TBar)
    end
    if TFolk then
    Logic.RemoveTribute(1,TFolk)
    end
    if TDar then
    Logic.RemoveTribute(1,TDar)
    end
    if TLeg then
        Logic.RemoveTribute(1,TLeg)
    end
    GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
    NonPlayerCharacter.Deactivate("BarmeciaMayor")
    NonPlayerCharacter.Deactivate("salim")
    NonPlayerCharacter.Deactivate("ari")

    StartSecretQuestBrief(1,"SecQuestBrief")
    StartSecretQuestBrief(2,"SecQuestBrief")

end

function MinerCheck1()
    if MinerState == 1 and IsNear("miner","miner_spot",300) then
        NonPlayerCharacter.Create(
			{ScriptName = "miner",     
			Callback = ActivateBomb2Brief()  })
	    NonPlayerCharacter.Activate("miner")
        return true
    end
end

function MinerCheck2()
    if MinerState == 2 and IsNear("miner","miner_spot",300) then
        NonPlayerCharacter.Create(
			{ScriptName = "miner",     
			Callback = ActivateBomb3Brief()  })
	    NonPlayerCharacter.Activate("miner")
        return true
    end
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
            Kala = Logic.CreateEntity(Entities.CU_Evil_Queen,GetPosition("secret_attack8").X,GetPosition("secret_attack8").Y,0,16)
            StartKalaBrief(1,"KalaBrief")
            StartKalaBrief(2,"KalaBrief")
            CreateKalaAttack()
            return true
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
            Kala = Logic.CreateEntity(Entities.CU_Evil_Queen,GetPosition("secret_attack8").X,GetPosition("secret_attack8").Y,0,16)
            StartKalaBrief(1,"KalaBrief")
            StartKalaBrief(2,"KalaBrief")
            CreateKalaAttack()
            return true
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
            Kala = Logic.CreateEntity(Entities.CU_Evil_Queen,GetPosition("secret_attack8").X,GetPosition("secret_attack8").Y,0,16)
            StartKalaBrief(1,"KalaBrief")
            StartKalaBrief(2,"KalaBrief")
            CreateKalaAttack()
            return true
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
            CheckMode = 4;
            Kala = Logic.CreateEntity(Entities.CU_Evil_Queen,GetPosition("secret_attack8").X,GetPosition("secret_attack8").Y,0,16)
            StartKalaBrief(1,"KalaBrief")
            StartKalaBrief(2,"KalaBrief")
            CreateKalaAttack()
            return true
        end
    end

end

function CreateKalaAttack()
    Logic.SetPlayerRawName(16, "Kala")
	Logic.SetPlayerName(16, "Kala")
    Display.SetPlayerColorMapping(16, 2)
    Logic.GroupAttackMove(Kala,GetPosition("hq2").X,GetPosition("hq2").Y,nil)
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