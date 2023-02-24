-----------------------------------------------Intro--------------------------------------------------------

function BeginBriefing(_playerID,_Name)

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
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq1").X,GetPosition("hq1").Y,0) Tools.ExploreArea(GetPosition("hq1").X,GetPosition("hq1").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Die Burg von "..Erbe.Tables.PlayerInfos.Colors[2].." "..Erbe.Tables.PlayerInfos.Names[2].." @color:255,255,255 befindet sich hier.",
        Target   = "hq2",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq2").X,GetPosition("hq2").Y,0) Tools.ExploreArea(GetPosition("hq2").X,GetPosition("hq2").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Im Westen befindet sich "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 . Sie werden zur Zeit stark von Varg angegriffen. Ihr solltet Ihnen so bald es geht helfen.",
        Target   = "BarmCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("BarmCastle").X,GetPosition("BarmCastle").Y,2) Tools.ExploreArea(GetPosition("BarmCastle").X,GetPosition("BarmCastle").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Und wo wir direkt bei "..Erbe.Tables.PlayerInfos.Colors[5].." "..Erbe.Tables.PlayerInfos.Names[5].." @color:255,255,255 sind: Er hat Norfolk eingenommen und hält die Stadt als Außenposten für seine Angriffe auf "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." .",
        Target   = "hq5",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq5").X,GetPosition("hq5").Y,2) Tools.ExploreArea(GetPosition("hq5").X,GetPosition("hq5").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ebenso greift er von seinem Hauptlager im Nordwesten "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,255,255 und "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 an.",
        Target   = "VargCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("VargCastle").X,GetPosition("VargCastle").Y,2) Tools.ExploreArea(GetPosition("VargCastle").X,GetPosition("VargCastle").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Hoch im Norden haben sich Salim und Pilgrim niedergelassen und regieren mit eiserner Faust über "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." .",
        Target   = "FolklungCastle",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("FolklungCastle").X,GetPosition("FolklungCastle").Y,2) Tools.ExploreArea(GetPosition("FolklungCastle").X,GetPosition("FolklungCastle").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Ebenfalls haben die beiden Darios alte Siedlung in "..Erbe.Tables.PlayerInfos.Colors[4].." "..Erbe.Tables.PlayerInfos.Names[4].." @color:255,255,255 übernommen und sie in einen Vorposten verwandelt.",
        Target   = "outpost_id4",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("outpost_id4").X,GetPosition("outpost_id4").Y,2) Tools.ExploreArea(GetPosition("outpost_id4").X,GetPosition("outpost_id4").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Nach dem Tod von Dario hat sich Ari mit Drake vermählt. Sie führen nun "..Erbe.Tables.PlayerInfos.Colors[7].." "..Erbe.Tables.PlayerInfos.Names[7].." @color:255,255,255 .",
        Target   = "OKC",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("OKC").X,GetPosition("OKC").Y,2) Tools.ExploreArea(GetPosition("OKC").X,GetPosition("OKC").Y,10) end
	}
	AP{
		Title    = "@color:255,255,0 @center Mentor",
        Text     = "@color:255,255,255 Zu guter Letzt sind da noch die "..Erbe.Tables.PlayerInfos.Colors[8].." "..Erbe.Tables.PlayerInfos.Names[8].." @color:255,255,255 ,welche Ihr Lager im Osten aufgeschlagen haben. Sie haben Darios ehemalige Burg in den Nebelberen eingenommen und kontrollieren nun den Pass.",
        Target   = "hq8",
        MiniMap = true,
		Action = function() GUI.CreateMinimapMarker(GetPosition("hq8").X,GetPosition("hq8").Y,2) Tools.ExploreArea(GetPosition("hq8").X,GetPosition("hq8").Y,10) end
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
		FadeOut = 4
	}

	
	briefing.Starting = function() end
	briefing.Finished = function() end
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
        Text     = "@color:255,0,0 Guten Tag {n:"..gvLastInteractionHeroName.."}, ich habe lange nichts mehr von euch gehört. Wir brauchen dringend eure Hilfe!",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Hallo Bürgermeister, wie können wir "..Erbe.Tables.PlayerInfos.Colors[3].." "..Erbe.Tables.PlayerInfos.Names[3].." @color:255,0,0 helfen.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Bürgermeister von Barmecia",
        Text     = "@color:255,0,0 Unser Dom wurde durch die vielen Angriffe von Vargs Schergen wieder zerstört. Wir konnten die Baustelle absichern, jedoch fehlen uns die Ressourcen um den Bau zu vollenden.",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Was braucht Ihr denn für den Bau?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Bürgermeister von Barmecia",
        Text     = "@color:255,0,0 Wir benötigen 10.000 @color:139,140,122 Steine @color:255,255,255 und 5.000 @color:139,90,43 Holz. @color:255,255,255 Beachtet jedoch, wenn Ihr den Dom errichtet, dass die anderen Regenten euch den Krieg erklären.",
        Target   = "BarmeciaMayor",
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountBarmeciaMayor = BriefCountBarmeciaMayor + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobBarmeciaMayor()
	if BriefCountBarmeciaMayor == 2 then
		TributBarmecia()
		BarmeciaFlag = false
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
        Text     = "@color:255,0,0 Ich grüße dich {n:"..gvLastInteractionHeroName.."}, wir stehen kurz vor der Auslöschung. Könnt Ihr uns helfen die Blockade der Barbaren zu durchbrechen?",
        Target   = "salim",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Hallo Salim, Hallo Pilgrim, was bietet Ihr uns denn, wenn wir euch helfen?",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Pilgrim",
        Text     = "@color:255,0,0 Auch ich grüße euch, wenn Ihr uns helft, unterstützen wir euch im Kampf um die Krone. Jedoch werden die anderen Anwärter das nicht für Gut heißen.",
        Target   = "pilgrim",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Verstanden, wir werden es uns überlegen. Unsere Entscheidung schicken wir euch bald zu. !(Schaut ins Tributmenü)!",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountFolklung = BriefCountFolklung + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobFolklung()
	if BriefCountFolklung == 2 then
		TributFolklung()
		FolklungFlag = false
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
        Text     = "@color:255,0,0 {n:"..gvLastInteractionHeroName.."}, schön, dass Ihr nach so langer Zeit vorbei schaut. Wir befinden uns gerade in einer brenzlichen Lage!",
        Target   = "ari",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Hallo Ari, Servus Drake, wir haben schon bemerkt, dass euch die Banditen gut zusetzen.",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center Drake",
        Text     = "@color:255,0,0 Genau! Wenn Ihr uns finanzielle Unterstützunh bietet, werden wir euch bei der Besteigung des Trons helfen. Das wird jedoch den anderen Anwärtern nicht gefallen.",
        Target   = "drake",
        MiniMap = false,
        
	}
	AP{
		Title    = "@color:255,255,0 @center {n:"..gvLastInteractionHeroName.."}",
        Text     = "@color:255,0,0 Verstanden, wir werden es uns überlegen. Unsere Entscheidung schicken wir euch bald zu. !(Schaut ins Tributmenü)!",
        Target   = gvLastInteractionHeroName,
        MiniMap = false,
        
	}
	
	briefing.Starting = function() end
	briefing.Finished = function()
		BriefCountDario = BriefCountDario + 1
	end
	return BriefingSystem.Start(_playerID, _Name, briefing)

end


function CounterJobDario()
	if BriefCountDario == 2 then
		TributDario()
		DarioFlag = false
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