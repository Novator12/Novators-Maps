-----------------------------------------------Intro--------------------------------------------------------

function BeginBriefing(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)
	
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Meine Herren, Willkommen in diesem euch doch so vertrauten Gefilde.",
        Target   = "hq1",
        FadeIn     = 4,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Euer Weg war lang und schwer und dennoch habt Ihr es nach Darios Tod ins Herzen des Reiches geschafft.",
        Target   = "hq1",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ich kläre euch nun über die aktuelle militärische Lage auf:",
        Target   = "hq1",
        MiniMap = false,
	}

	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Auf eurem Weg liegen mehrere Lager der "..Erbe.Tables.PlayerInfos.Colors[8].." "..Erbe.Tables.PlayerInfos.Names[8].." @color:255,255,255 . Ihr müsst Sie auf dem Weg zu eurer Burg unschädlich machen.",
        Target   = "sp1_bandit1_tower2",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Die Burg von "..Erbe.Tables.PlayerInfos.Colors[1].." "..Erbe.Tables.PlayerInfos.Names[1].." @color:255,255,255 befindet sich hier.",
        Target   = "hq1",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq1").X,GetPosition("hq1").Y,0) Tools.ExploreArea(GetPosition("hq1").X,GetPosition("hq1").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Die Burg von "..Erbe.Tables.PlayerInfos.Colors[2].." "..Erbe.Tables.PlayerInfos.Names[2].." @color:255,255,255 befindet sich hier.",
        Target   = "hq2",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq2").X,GetPosition("hq2").Y,0) Tools.ExploreArea(GetPosition("hq2").X,GetPosition("hq2").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Im Westen befindet sich "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 . Sie werden zur Zeit stark von Varg angegriffen. Ihr solltet Ihnen so bald es geht helfen.",
        Target   = "BarmCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("BarmCastle").X,GetPosition("BarmCastle").Y,2) Tools.ExploreArea(GetPosition("BarmCastle").X,GetPosition("BarmCastle").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Und wo wir direkt bei "..Erbe.Tables.PlayerInfos.Colors[5].." "..Erbe.Tables.PlayerInfos.Names[5].." @color:255,255,255 sind: Er hat Norfolk eingenommen und hält die Stadt als Außenposten für seine Angriffe auf "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." .",
        Target   = "hq5",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq5").X,GetPosition("hq5").Y,2) Tools.ExploreArea(GetPosition("hq5").X,GetPosition("hq5").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ebenso greift er von seinem Hauptlager im Nordwesten "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 und "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 an.",
        Target   = "VargCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("VargCastle").X,GetPosition("VargCastle").Y,2) Tools.ExploreArea(GetPosition("VargCastle").X,GetPosition("VargCastle").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Hoch im Norden haben sich Salim und Pilgrim niedergelassen und regieren mit eiserner Faust über "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." .",
        Target   = "FolklungCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("FolklungCastle").X,GetPosition("FolklungCastle").Y,2) Tools.ExploreArea(GetPosition("FolklungCastle").X,GetPosition("FolklungCastle").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ebenfalls haben die beiden Darios alte Siedlung in "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 übernommen und sie in einen Vorposten verwandelt.",
        Target   = "outpost_id4",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("outpost_id4").X,GetPosition("outpost_id4").Y,2) Tools.ExploreArea(GetPosition("outpost_id4").X,GetPosition("outpost_id4").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Nach dem Tod von Dario hat sich Ari mit Drake vermählt. Sie führen nun "..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 .",
        Target   = "OKC",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("OKC").X,GetPosition("OKC").Y,2) Tools.ExploreArea(GetPosition("OKC").X,GetPosition("OKC").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Zu guter Letzt sind da noch die "..Erbe.Tables.PlayerInfos.Colors[8].." "..Erbe.Tables.PlayerInfos.Names[8].." @color:255,255,255 ,welche Ihr Lager im Osten aufgeschlagen haben. Sie haben Darios ehemalige Burg in den Nebelberen eingenommen und kontrollieren nun den Pass.",
        Target   = "hq8",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq8").X,GetPosition("hq8").Y,2) Tools.ExploreArea(GetPosition("hq8").X,GetPosition("hq8").Y,20) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ich werde nun verschwinden. Achtet auf das freundliche "..Erbe.Tables.PlayerInfos.Colors[6].." "..Erbe.Tables.PlayerInfos.Names[6].." @color:255,255,255 .Vielleicht findet Ihr ja Hilfe bei der Eroberung der Krone.",
        Target   = "helias",
        MiniMap = false,
	}
	AP{
		Title    = "@color:0,255,0 @center Info",
        Text     = "@color:255,255,255 Ziel: Vernichtet eure Gegner und bestreitet den Weg zum absoluten Herrscher über das Königreich. @color:255,0,0 Achtung: @color:255,255,255  Eure taten haben Einfluss auf die Beziehungen zu den einzelnen Kronenanwärtern.",
        Target   = "kerb_spot",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,0,0 @center Warnung",
        Text     = "@color:255,255,255 In dieser Region gilt ein @color:0,255,0 Boten-Abkommen, @color:255,255,255 was bedeutet, dass nur Helden in die Königreiche von neutralen Regenten eintreten dürfen. @color:255,0,0 Andernfalls wird sofort Krieg erklärt!",
        Target   = "kerb_spot",
        MiniMap = false,
		FadeOut = 4
	}

	
	briefing.Starting = function() end
	briefing.Finished = function()
		if GUI.GetPlayerID() == 1 or GUI.GetPlayerID() == 2 then
			Camera.ScrollSetLookAt(GetPosition(gvLastInteractionHeroName).X,GetPosition(gvLastInteractionHeroName).Y)
		end
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)
end



-----------------------------------------------IngenieurBrief--------------------------------------------------------


BriefCountIng = 0

function IngenieurBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("ingenieur",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Mann",
        Text     = "@color:255,255,255 Verschwindet von hier. Nicht das Ihr dieses Banditenpack zu mir lockt.",
        Target   = "ingenieur",
        FadeIn     = 4,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Keine Angst, um die haben wir uns bereits gekümmert.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Mann",
        Text     = "@color:255,255,255 Na das ist ja mal wahrlich eine schöne Neuigkeit.",
        Target   = "ingenieur",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Wer bist du überhaupt? Du hast dich hier im Dickicht ja gut versteckt.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Hermit der Ingenieur",
        Text     = "@color:255,255,255 Ich bin Hermit der Ingenieur, Meister im Dorfzentrumsbau, Gelehrter der Universität von Folklung, Schüler des Salims, Erfinder des ...",
        Target   = "ingenieur",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Du brauchst mir nicht deine ganze Lebensgeschichte erzählen. Aber Meister des Dorfzentrumbaus hört sich interessant an. Kannst du uns helfen, unseren Platz zu vergrößern?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Hermit der Ingenieur",
        Text     = "@color:255,255,255 Frechheit...es wären noch an die hundert weitere Titel gefolgt! Aber ja ich kann euch den Bauplan für einen Leuchttrum geben, welcher mehr Siedler in eure Stadt lockt. Die Kosten dafür sende ich an eure @color:127,255,0 Tributmenüs.",
        Target   = "ingenieur",
        MiniMap = false,
		FadeOut = 4
	}

	briefing.Starting = function() end
	briefing.Finished = function() 
		BriefCountIng = BriefCountIng + 1
	end
    return BriefingSystem.Start(_playerID, _Name, briefing)

end

function CounterJobIng()
	if BriefCountIng == 2 then
		LighthouseTribut(1)
		LighthouseTribut(2) 
		return true
	end
end
StartSimpleJob("CounterJobIng")

function HeroNearIng()
	if IsNear("helias","ingenieur",1000) or IsNear("kerberos","ingenieur",1000) then
		NonPlayerCharacter.Create(
			{ScriptName = "ingenieur",     
			Callback = ActivateIngBrief })
			StartSimpleJob("IngSameSector")
		return true
	end
end

StartSimpleJob("HeroNearIng")

function IngSameSector()
	if Logic.GetSector(GetID("ingenieur")) == Logic.GetSector(GetID("ing_pos")) then
		Move("ingenieur","ing_pos")
		StartSimpleJob("IngNearHouse")
		return true
	end
end

function IngNearHouse()
	if IsNear("ingenieur","ing_pos",500) then
		NonPlayerCharacter.Activate("ingenieur")
		return true
	end
end

function ActivateIngBrief()
	if table.getn(GetActivePlayers())>1 then
		IngenieurBrief(1,"IngBrief")
		IngenieurBrief(2,"IngBrief")
	else
		IngenieurBrief(1,"IngBrief")
	end
end


-----------------------------------------------LeonardoBriefing--------------------------------------------------------


BriefCountLeo = 0

function LeonardoBriefing(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("leo",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Leonardo",
        Text     = "@color:255,255,255 Guten Tag, {n:"..gvLastInteractionHeroName.."}",
        Target   = "leo",
        FadeIn     = 4,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Wieso war das wieder klar Leonardo...(seufz)",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Leonardo",
        Text     = "@color:255,255,255 Ich weiß garnicht, worauf Ihr hinaus wollt. Mehehehe...",
        Target   = "leo",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Bla bla bla... kannst du uns behilflich sein? Ach warte, lass mich raten! Du brauchst @color:234,240,68 Schwefel @color:255,255,255 ?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Leonardo",
        Text     = "@color:255,255,255 Genau! Woher wisst Ihr das nur? Naja. Bei mir könnt Ihr für etwas Schwefel und einen kleinen Obulus ein paar limitierte Kanonen kaufen.",
        Target   = "leo",
        MiniMap = false,
		FadeOut = 4
	}
	

	briefing.Starting = function() end
	briefing.Finished = function() 
		BriefCountLeo = BriefCountLeo + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobLeo()
	if BriefCountLeo == 2 then
		ActivateLeoTrader() --Leo muss Ansprechbarer NPC sein
		return true
	end
end
StartSimpleJob("CounterJobLeo")


function ActivateLeoBriefing()
	if IsDestroyed("biron_tower1") and IsDestroyed("biron_tower2") and IsDestroyed("B_Attack1") and IsDestroyed("B_Attack2") and IsDestroyed("B_Attack3") then
		DestroyEntity("fence_leo")
		ReplaceEntity("gate_biron",Entities.XD_PalisadeGate2)
		ReplaceEntity("outpost_gate1",Entities.XD_WallStraightGate)
		ReplaceEntity("outpost_gate2",Entities.XD_WallStraightGate)
		CreateLeoBrief()
		return true
	end
end

StartSimpleJob("ActivateLeoBriefing")

function CreateLeoBrief()
	NonPlayerCharacter.Create(
			{ScriptName = "leo",     
			Callback = StartLeoBrief })
	NonPlayerCharacter.Activate("leo")
end

function StartLeoBrief()
	LeonardoBriefing(1,"LeoBrief")
	LeonardoBriefing(2,"LeoBrief")
end

-----------------------------------------------Guard_ID7_Briefing--------------------------------------------------------

BriefCountGuardID7 = 0
Gate_ID7_State = false

function Guard_ID7_Briefing(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("guard_id7",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Wache",
        Text     = "@color:255,0,0 !!! HALT !!! @color:255,255,255 Die Straße ist zur Zeit wegen Banditenüberfallen auf "..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 gesperrt.",
        Target   = "guard_id7",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Wache",
        Text     = "Ihr habt @color:255,0,0 30 Sekunden @color:255,255,255 um aus dem Herrschaftsgebiet von "..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 zu verschwinden, sonst erklären wir euch den Krieg.",
        Target   = "guard_id7",
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountGuardID7 = BriefCountGuardID7 + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobGuardID7()
	if BriefCountGuardID7 == 2 then
		Gate_ID7_State = true 
		CountdownHandler_GateID7()
		return true
	end
end
StartSimpleJob("CounterJobGuardID7")


function HeroNearGuard_ID7()
	if IsNear("helias","guard_id7",2000) or IsNear("kerberos","guard_id7",2000) then
		CreateGuardBrief()
		return true
	end
end

StartSimpleJob("HeroNearGuard_ID7")

function CreateGuardBrief()
	Guard_ID7_Briefing(1,"GuardBrief")
	Guard_ID7_Briefing(2,"GuardBrief")
end

function CountdownHandler_GateID7()
	EnemyCountdown_ID7 = StartCountdown(30,ID7Hostile,true)
	GateJob_ID7 = StartSimpleJob("EntitiesInHostileArea_ID7")
end

function EntitiesInHostileArea_ID7()
	local pos = GetPosition("guard_id7")
	if (Logic.GetPlayerEntitiesInArea(1,0,pos.X,pos.Y,2000,16,2) > 0 or Logic.GetPlayerEntitiesInArea(1,0,pos.X,pos.Y,2000,16,2) > 0) and Gate_ID7_State == true then
		if not EnemyCountdown_ID7 then
			EnemyCountdown_ID7 = StartCountdown(30,ID7Hostile,true)
		end
	elseif Gate_ID7_State == true then
		if EnemyCountdown_ID7 then
			StopCountdown(EnemyCountdown_ID7)
			---@diagnostic disable-next-line: assign-type-mismatch
			EnemyCountdown_ID7 = nil
		end
	end
end

HostileToID7 = false

function ID7Hostile()
	SetTableDiplomacyState(3, Player1State, DarioState)
    SetTableDiplomacyState(3, Player2State, DarioState)
	EndJob(GateJob_ID7)
	HostileToID7 = true
end




BriefCountBarmeciaMayor = 0

function StartBarmeciaMayorBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("BarmeciaMayor",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Bürgermeister von Barmecia",
        Text     = "@color:255,255,255 Guten Tag {n:"..gvLastInteractionHeroName.."}, ich habe lange nichts mehr von euch gehört. Wir brauchen dringend eure Hilfe!",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Hallo Bürgermeister, wie können wir "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 helfen.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Bürgermeister von Barmecia",
        Text     = "@color:255,255,255 Unser Dom wurde durch die vielen Angriffe von Vargs Schergen wieder zerstört. Wir konnten die Baustelle absichern, jedoch fehlen uns die Ressourcen um den Bau zu vollenden.",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Was braucht Ihr denn für den Bau?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Bürgermeister von Barmecia",
        Text     = "@color:255,255,255 Wir benötigen 10.000 @color:139,140,122 Steine @color:255,255,255 und 5.000 @color:139,90,43 Holz. @color:255,255,255 Beachtet jedoch, wenn Ihr den Dom errichtet, dass die anderen Regenten euch den Krieg erklären.",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountBarmeciaMayor = BriefCountBarmeciaMayor + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end

BarmeciaFlag = false

function CounterJobBarmeciaMayor()
	if BriefCountBarmeciaMayor == 2 then
		TributBarmecia()
		return true
	end
end
StartSimpleJob("CounterJobBarmeciaMayor")


function TributBarmecia()
    local TrBar =  {}
    TrBar.pId = 1
    TrBar.text = Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3]..": @color:255,255,255 Sendet 10.000 @color:139,140,122 Steine @color:255,255,255 und 5.000 @color:139,90,43 Holz @color:255,255,255 an Barmecia für den Dombau. (Schwer)"
    TrBar.cost = { Stone = 10000, Wood = 5000 }
    TrBar.Callback = PayedBarmecia
    TBar = AddTribute(TrBar)
end


BriefCountFolklung = 0

function StartFolklungBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("salim",gvLastInteractionHeroName)
	LookAt("pilgrim",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Salim",
        Text     = "@color:255,255,255 Ich grüße dich {n:"..gvLastInteractionHeroName.."}, wir stehen kurz vor der Auslöschung. Könnt Ihr uns helfen die Blockade der Barbaren zu durchbrechen?",
        Target   = "salim",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Hallo Salim, Hallo Pilgrim, was bietet Ihr uns denn, wenn wir euch helfen?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Pilgrim",
        Text     = "@color:255,255,255 Auch ich grüße euch, wenn Ihr uns helft, unterstützen wir euch im Kampf um die Krone. Jedoch werden die anderen Anwärter das nicht für Gut heißen.",
        Target   = "pilgrim",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Verstanden, wir werden es uns überlegen. Unsere Entscheidung schicken wir euch bald zu. !(Schaut ins Tributmenü)!",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountFolklung = BriefCountFolklung + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end

FolklungFlag = false

function CounterJobFolklung()
	if BriefCountFolklung == 2 then
		TributFolklung()
		return true
	end
end
StartSimpleJob("CounterJobFolklung")


function TributFolklung()
    local TrFolk =  {}
    TrFolk.pId = 1
    TrFolk.text = Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4]..": @color:255,255,255 Kämpft mit Folklung zusammen! (Leicht)"
    TrFolk.cost = { Gold = 0 }
    TrFolk.Callback = PayedFolklung
    TFolk = AddTribute(TrFolk)
end



BriefCountDario = 0

function StartDarioBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("ari",gvLastInteractionHeroName)
	LookAt("drake",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Ari",
        Text     = "@color:255,255,255 {n:"..gvLastInteractionHeroName.."}, schön, dass Ihr nach so langer Zeit vorbei schaut. Wir befinden uns gerade in einer brenzlichen Lage!",
        Target   = "ari",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Hallo Ari, Servus Drake, wir haben schon bemerkt, dass euch die Banditen gut zusetzen.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Drake",
        Text     = "@color:255,255,255 Genau! Wenn Ihr uns finanzielle Unterstützung bietet, werden wir euch bei der Besteigung des Trons helfen. Das wird jedoch den anderen Anwärtern nicht gefallen.",
        Target   = "drake",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Verstanden, wir werden es uns überlegen. Unsere Entscheidung schicken wir euch bald zu. !(Schaut ins Tributmenü)!",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountDario = BriefCountDario + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end

DarioFlag = false

function CounterJobDario()
	if BriefCountDario == 2 then
		TributDario()
		return true
	end
end
StartSimpleJob("CounterJobDario")


function TributDario()
    local TrDar =  {}
    TrDar.pId = 1
    TrDar.text = Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7]..": @color:255,255,255 Unterstüzt Darios Königreich mit 15.000 @color:212,175,55 Talern. @color:255,255,255 (Mittel)"
    TrDar.cost = { Gold = 15000 }
    TrDar.Callback = PayedDario
    TDar = AddTribute(TrDar)
end



function StartKalaBrief(_playerID,_Name)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Kala",
        Text     = "@color:255,0,0 Hahahaha, ich werde euch zeigen, wer der Krone würdig ist.",
        Target   = Kala,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Kala",
        Text     = "@color:255,0,0 Angriff, meine Kinder!",
        Target   = Kala,
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function() end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end



BriefCountBomb1 = 0

function StartBomb1Brief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("miner",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Guten Tag {n:"..gvLastInteractionHeroName.."}, ich kann euch anbieten für einen kleinen Obulus Minen frei zu sprengen.",
        Target   = "miner",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Das hört sich gut an. Welche Mine willst du uns denn frei sprengen?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Ich sprenge euch diese Mine als erstes frei. Schaut in euer @color:127,255,0 Tributmenü.",
        Target   = "bomb1",
        MiniMap = true,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountBomb1 = BriefCountBomb1 + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobBomb1()
	if BriefCountBomb1 == 2 then
		TributBomb1()
		MinerState = 0
		return true
	end
end
StartSimpleJob("CounterJobBomb1")

function TributBomb1()
    local TrB1 =  {}
    TrB1.pId = 1
    TrB1.text = "Sprengt für 500 Taler und 500 Schwefel die Mine frei!"
    TrB1.cost = { Gold = 500, Sulfur = 500 }
    TrB1.Callback = PayedMiner1
    TB1 = AddTribute(TrB1)
end

function PayedMiner1()
	StartSimpleJob("DetonateMine1")
	Move("miner",GetPosition("bomb1"),50)
end


function DetonateMine1()
	if IsNear("miner","bomb1",150) then
		CreateEntity(0,Entities.XD_Bomb1,GetPosition("bomb1"))
		Move("miner",GetPosition("miner_spot"),50)
		MinerState = 1
		return true
	end
end

BriefCountBomb2 = 0

function StartBomb2Brief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("miner",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Hallo {n:"..gvLastInteractionHeroName.."}, soll ich euch eine weitere Mine frei sprengen?",
        Target   = "miner",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Kommt ganz auf dein Angebot an. Welche wäre denn die nächste Mine?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Das wäre diese hier. Schaut in euer @color:127,255,0 Tributmenü.",
        Target   = "bomb2",
        MiniMap = true,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountBomb2 = BriefCountBomb2 + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobBomb2()
	if BriefCountBomb2 == 2 then
		TributBomb2()
		return true
	end
end
StartSimpleJob("CounterJobBomb2")

function TributBomb2()
    local TrB2 =  {}
    TrB2.pId = 1
    TrB2.text = "Sprengt für 500 Taler und 500 Schwefel die Mine frei!"
    TrB2.cost = { Gold = 500, Sulfur = 500 }
    TrB2.Callback = PayedMiner1
    TB2 = AddTribute(TrB2)
end

function PayedMiner2()
	StartSimpleJob("DetonateMine2")
	Move("miner",GetPosition("bomb2"),50)
end


function DetonateMine2()
	if IsNear("miner","bomb2",150) then
		CreateEntity(0,Entities.XD_Bomb1,GetPosition("bomb2"))
		Move("miner",GetPosition("miner_spot"),50)
		MinerState = 2
		return true
	end
end


BriefCountBomb3 = 0

function StartBomb3Brief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("miner",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Und nochmals Hallo lieber {n:"..gvLastInteractionHeroName.."}, wenn Ihr möchtet sprenge ich euch die letzte Mine frei.",
        Target   = "miner",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Hmmm, das muss ich mir überlegen. Wo befindet sie sich denn?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Miner",
        Text     = "@color:255,255,255 Genau hier. Schaut in euer @color:127,255,0 Tributmenü.",
        Target   = "bomb3",
        MiniMap = true,
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountBomb3 = BriefCountBomb3 + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobBomb3()
	if BriefCountBomb3 == 2 then
		TributBomb3()
		return true
	end
end
StartSimpleJob("CounterJobBomb3")


function TributBomb3()
    local TrB3 =  {}
    TrB3.pId = 1
    TrB3.text = "Sprengt für 500 Taler und 500 Schwefel die Mine frei!"
    TrB3.cost = { Gold = 500, Sulfur = 500 }
    TrB3.Callback = PayedMiner1
    TB3 = AddTribute(TrB3)
end

function PayedMiner3()
	StartSimpleJob("DetonateMine3")
	Move("miner",GetPosition("bomb3"),50)
end


function DetonateMine3()
	if IsNear("miner","bomb3",150) then
		CreateEntity(0,Entities.XD_Bomb1,GetPosition("bomb3"))
		Move("miner",GetPosition("miner_spot"),50)
		MinerState = 3
		return true
	end
end




BriefCountLegend = 0

function StartLegendBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("legend",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Grüzi {n:"..gvLastInteractionHeroName.."}, hat der Herr einen moment Zeit für einen armen Händler?",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Hmmm, na gut, was gibt es denn?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Diese Schergen von Banditen haben meine Missi entführt. Wenn Ihr Sie mir zurück bringt werde ich euch entlohnen. Bitte Ihr müsst mir helfen.",
        Target   = "legend",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Ich kann euch nichts versprechen, aber wir werden Ausschau nach Missi halten. Hat deine Missi irgendwelche besonderen Merkmale.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Vielen Dank. Ja, sie kann manchmal etwas bockig sein und ist oft schwarz gekleidet.",
        Target   = "legend",
        MiniMap = false,
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountLegend = BriefCountLegend + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobLegend()
	if BriefCountLegend == 2 then
		Logic.AddQuest(1, 9, MAINQUEST_OPEN, "@color:155,155,0 Missi", "Findet Missi und bringt Sie zurück zum Händler!", 1)
		Logic.AddQuest(2, 9, MAINQUEST_OPEN, "@color:155,155,0 Missi", "Findet Missi und bringt Sie zurück zum Händler!", 1)
		Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"MissiHandler",1)
		return true
	end
end
StartSimpleJob("CounterJobLegend")


function MissiHandler()
	if IsNear("legend_sheep","legend",300) and DarioFlag == false and BarmeciaFlag == false and FolklungFlag ==  false then
		NonPlayerCharacter.Create(
			{ScriptName = "legend",     
			Callback = ActivateLegendFinishBrief()  })
		NonPlayerCharacter.Activate("legend")
		return true
	end
	if IsNear("legend_sheep","legend",300) and (DarioFlag == true or BarmeciaFlag == true or FolklungFlag ==  true) then
		NonPlayerCharacter.Create(
			{ScriptName = "legend",     
			Callback = ActivateLegendFailedBrief()  })
		NonPlayerCharacter.Activate("legend")
		return true
	end
	if IsNear("helias","legend_sheep",1000) then
		local pos = GetPosition("helias") 
		Move("legend_sheep",pos)
	end
	if IsNear("kerberos","legend_sheep",1000) then
		local pos = GetPosition("kerberos") 
		Move("legend_sheep",pos)
	end
end


function ActivateLegendFinishBrief()
	StartLegendFinishBrief(1,"LegFinBrief")
	StartLegendFinishBrief(2,"LegFinBrief")
end

function ActivateLegendFailedBrief()
	StartLegendFailedBrief(1,"LegFinBrief")
	StartLegendFailedBrief(2,"LegFinBrief")
end



BriefCountLegendFinish = 0

function StartLegendFinishBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("legend",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Ihr habt meine Missi gefunden! DANKE!!!",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Du hättest uns mal direkt sagen können, dass Missi ein Schaf ist...",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Missi",
        Text     = "@color:255,255,255 Määäääh",
        Target   = "legend_sheep",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Ja, da magst du Recht haben. Aber nun zu eurer Belohnung. Ich kann euch die Krone von Dario besorgen. Ich bin eigentlich ein Undercover-Schmuggler.",
        Target   = "legend",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Und das sollen wir glauben?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Na klar. Also wenn Ihr schnell Könige werden wollt, dann bestätigt mir den Auftrag in eurem Tributmenü und ich mache mich auf den Weg!",
        Target   = "legend",
        MiniMap = false,
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountLegendFinish = BriefCountLegendFinish + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobLegendFinish()
	if BriefCountLegendFinish == 2 then
		TributLegend()
		return true
	end
end
StartSimpleJob("CounterJobLegendFinish")


function TributLegend()
    local TrLeg =  {}
    TrLeg.pId = 1
    TrLeg.text = "Lasst euch vom Händler die Krone beschaffen. (Legendär)"
    TrLeg.cost = { Gold = 0 }
    TrLeg.Callback = PayedLegend
    TLeg = AddTribute(TrLeg)
end






function StartLegendFailedBrief(_playerID,_Name)

	local gvLastInteractionHeroName = Interaction.Hero(_playerID)
	LookAt("legend",gvLastInteractionHeroName)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Ihr habt meine Missi gefunden! DANKE!!!",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Du hättest uns mal direkt sagen können, dass Missi ein Schaf ist...",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Missi",
        Text     = "@color:255,255,255 Määäääh",
        Target   = "legend_sheep",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Leider kann ich euch nicht belohnen, da durch die politische Lage, alle meine Waren konfisziert wurden.",
        Target   = "legend",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,255,255 Na toll, danke für garnichts!",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	
	
	briefing.Starting = function() end
	briefing.Finished = function() end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end

SecretQuestCount = 0

function StartSecretQuestBrief(_playerID,_Name)

	Move("legend","legend_pos",50)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Ich mach mich nun auf den Weg, um die Krone zu besorgen. Barmecia hat Sie in der Schatzkammer gebunkert. Durch meine Connections sollte es mir aber ein leichtes sein dort rein zu kommen.",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 So gleich hier hinten ist der Eingang in die Bank, dort sollte ich wohl fündig werden.",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Wache",
        Text     = "@color:255,255,255 Halt du Dieb!!! Sofort stehen bleiben!",
        Target   = "guard1",
        MiniMap = false,
		Action = function() Move("guard1","legend",100) Move("guard2","legend",100) end,
	}
	AP{
		Title    = "@color:255,255,0 @center Wache",
        Text     = "@color:255,255,255 Du wirst lange hinter Gittern sitzen!",
        Target   = "guard2",
        MiniMap = false,
	}
	AP{
		Title    = "@color:255,255,0 @center Mysteriöser Händler",
        Text     = "@color:255,255,255 Hilfe, Missi!! Ich habe doch garnichts gemacht. Das waren dieser Helias und Kerberos...Die haben mich beauftragt die Krone zu stehlen.",
        Target   = "legend",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Info",
        Text     = "@color:255,255,255 Durch den Versuch die Krone auf nicht legitime Weise zu bekommen, erklären euch alle Kronenanwärter den Krieg. Viel Glück!",
        Target   = "legend",
        MiniMap = false,
        
	}
	
	
	briefing.Starting = function() end
	briefing.Finished = function() 
		SecretQuestCount = SecretQuestCount + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobSecretQuest()
	if SecretQuestCount == 2 then
		DestroyEntity("legend")
		DestroyEntity("guard1")
		DestroyEntity("guard2")
		SecretFlag = true
		Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VictoryHandler",1)
		return true
	end
end
StartSimpleJob("CounterJobSecretQuest")






function StartMapChangesBrief(_playerID,_Name)

	local briefing = {
		DisableSkipping = true,
		RestoreCamera = true,
		RenderFoW = false,
		RenderSky = true,
	}
	local AP,ASP,AMC = BriefingSystem.AddPages(briefing)

	AP{
		Title    = "@color:255,255,0 @center Info",
        Text     = "@color:255,255,255 Aufgrund der Änderung der politischen Lage im Königreich hat sich Folklung dazu entschlossen, versperrte Passagen freizulegen.",
        Target   = "salim",
        MiniMap = false,
		Action = function() 
			serfNPCTable = {}
			for i = 1,3,1 do
				local posi1 = GetPosition("pas"..i)
				serfNPCTable[i] = Logic.CreateEntity(Entities.PU_Serf,posi1.X,posi1.Y,235,6)
			end
			for i = 4,6,1 do
				local posi2 = GetPosition("pas"..i)
				serfNPCTable[i] = Logic.CreateEntity(Entities.PU_Serf,posi2.X,posi2.Y,275,6)
			end
			for j = table.getn(serfNPCTable),1,-1 do
				Logic.SetTaskList(serfNPCTable[j], TaskLists.TL_SERF_EXTRACT_RESOURCE);
			end
		end,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Info",
        Text     = "@color:255,255,255 Die Leibeigenen von Folklung heben die überschwämmten Wege im Moor aus.",
        Target   = "pas2",
        MiniMap = false,
		Action = function() StartSimpleJob("ReduceWaterHeight1") end,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Info",
        Text     = "@color:255,255,255 Die Leibeigenen von Folklung heben die überschwämmten Wege im Moor aus.",
        Target   = "pas5",
        MiniMap = false,
		Action = function() StartSimpleJob("ReduceWaterHeight2") end,
	}
	AP{
		Title    = "@color:255,255,0 @center Info",
        Text     = "@color:255,255,255 Ebenso hat Folklung den Bergpass bei Ihrem Außenposten gesprengt.",
        Target   = "exp3",
        MiniMap = false,
		Action = function() 
			for i=1,5,1 do  
				local pos = GetPosition("exp"..i)
				Logic.CreateEntity(Entities.XD_Bomb1,pos.X,pos.Y,0,1)
			end 
		end,
	}
	
	
	briefing.Starting = function() end
	briefing.Finished = function() 
		for n = table.getn(serfNPCTable),1,-1 do
			if IsExisting(serfNPCTable[n]) then
				DestroyEntity(serfNPCTable[n])
			end
		end
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


CountWater1 = 0
function ReduceWaterHeight1()
	if CountWater1 ~= -400 then
		CountWater1 = CountWater1 -100
		Logic.WaterSetRelativeHeight(GetPosition("water3").X/100, GetPosition("water3").Y/100,GetPosition("water4").X/100, GetPosition("water4").Y/100, CountWater1 )
	elseif CountWater1 == -400 then
		Logic.UpdateBlocking(GetPosition("water3").X/100, GetPosition("water3").Y/100,GetPosition("water4").X/100,GetPosition("water4").Y/100)
		return true
	end
end

CountWater2 = 0
function ReduceWaterHeight2()
	if CountWater2 ~= -400 then
		CountWater2 = CountWater2 -100
		Logic.WaterSetRelativeHeight(GetPosition("water1").X/100, GetPosition("water1").Y/100,GetPosition("water2").X/100, GetPosition("water2").Y/100, CountWater2 )
	elseif CountWater2 == -400 then
		Logic.UpdateBlocking(GetPosition("water1").X/100, GetPosition("water1").Y/100,GetPosition("water2").X/100,GetPosition("water2").Y/100)
		return true
	end
end