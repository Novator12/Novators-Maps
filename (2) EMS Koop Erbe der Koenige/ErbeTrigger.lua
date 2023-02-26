

function ActivateTriggers()
	--SerfTriggers:
	for i = 9,15,1 do
		_G["SerfTrigger_ID"..i] = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"CreateSerfChecker_ID"..i,1,nil,nil)
		table.insert(Erbe.Trigger,_G["SerfTrigger_ID"..i])
		
		_G["SerfsDeadTrigger_ID"..i] = Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED,nil,"SerfsAllDead_ID"..i,1,nil,nil)
		table.insert(Erbe.Trigger,_G["SerfsDeadTrigger_ID"..i])
	end

	--SpawnerHandler
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, nil, "SpawnerHandler", 1, nil, nil)

	--HandelBalancing
	Trigger.RequestTrigger(Events.LOGIC_EVENT_GOODS_TRADED,nil,"TransactionDetails",1,nil,nil) 

	--Trigger Palisadentor Varg
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"VargGateChecker",1,nil,nil)

	--BarmeciaTrigger
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, nil, "BarmeciaHandler", 1, nil, nil)

	--FolklungTrigger
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, nil, "FolklungHandler", 1, nil, nil)

	--DarioTrigger
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, nil, "DarioHandler", 1, nil, nil)

	--All AI´s triggert
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, nil, "EnemyHandler", 1, nil, nil)

end

FlagDarBa = false
NorBarFlag = false
FlagFolkBar = false
VargFlankFlag = false

function SpawnerHandler()

	if FlagDarBa == true and NorBarFlag == true and FlagFolkBar == true and VargFlankFlag == true then
		return true
	end

	local pos1 = GetPosition("NorCheck1")
	local pos2 = GetPosition("NorCheck2")
	if 	(Logic.GetPlayerEntitiesInArea(1,0,pos1.X,pos1.Y,1000,2) > 0 or Logic.GetPlayerEntitiesInArea(2,0,pos1.X,pos1.Y,1000,2) >0 or Logic.GetPlayerEntitiesInArea(1,0,pos2.X,pos2.Y,1000,2) >0 or Logic.GetPlayerEntitiesInArea(2,0,pos2.X,pos2.Y,1000,2) >0) and NorBarFlag == false then
		ActivateBarmeciaAttackers()
		ActivateNorfolkBarmeciaAttack()
		for i=1,3 do
			ReplaceEntity("NorGate"..i,Entities.XD_WallStraightGate)
		end
		NorBarFlag = true
	end

	local pos3 = GetPosition("outpost_gate2")
	local pos4 = GetPosition("dariobandtrig")
	if 	(Logic.GetPlayerEntitiesInArea(1,0,pos3.X,pos3.Y,2000,2) > 0 or Logic.GetPlayerEntitiesInArea(2,0,pos3.X,pos3.Y,2000,2) >0 or Logic.GetPlayerEntitiesInArea(1,0,pos4.X,pos4.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(2,0,pos4.X,pos4.Y,4000,2) >0) and FlagDarBa == false then
		ActivateID8FightID7()
		FlagDarBa = true
	end

	local pos5 = GetPosition("folkTrig")
	local pos6 = GetPosition("dariobandtrig")
	if 	(Logic.GetPlayerEntitiesInArea(1,0,pos5.X,pos5.Y,12000,2) > 0 or Logic.GetPlayerEntitiesInArea(2,0,pos5.X,pos5.Y,12000,2) >0 or Logic.GetPlayerEntitiesInArea(1,0,pos6.X,pos6.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(2,0,pos6.X,pos6.Y,4000,2) >0) and FlagFolkBar == false then
		ActivateBarbarenAttackers()
		ActivateFolklungAttackers()
		FlagFolkBar = true
	end


	local pos7 = GetPosition("VargFlankTrig2")
	local pos8 = GetPosition("dariobandtrig")
	local pos9 = GetPosition("VargFlankTrig1")
	if 	(Logic.GetPlayerEntitiesInArea(1,0,pos7.X,pos7.Y,4000,2) > 0 or Logic.GetPlayerEntitiesInArea(2,0,pos7.X,pos7.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(1,0,pos8.X,pos8.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(2,0,pos8.X,pos8.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(1,0,pos9.X,pos9.Y,4000,2) >0 or Logic.GetPlayerEntitiesInArea(2,0,pos9.X,pos9.Y,4000,2) >0) and VargFlankFlag == false then
		ActivateVargFlankeAttackers()
		VargFlankFlag = true
	end

end

enemyCount = 0


function BarmeciaHandler()
	local pos1 = GetPosition("BarmCenter")
	local Ent1 = {Logic.GetPlayerEntitiesInArea(1,0,pos1.X,pos1.Y,10000,2)}
	local Ent2 = {Logic.GetPlayerEntitiesInArea(2,0,pos1.X,pos1.Y,10000,2)}
	

	for i = 2, table.getn(Ent1) do
		local type = Logic.GetEntityType(Ent1[i])
		if (Logic.IsSettler(Ent1[i]) == 1 and Logic.IsHero(Ent1[i]) == 0 ) and BarmeciaFlag == false then
			SetTableDiplomacyState(3, Player1State, BarmeciaState)
			SetTableDiplomacyState(3, Player2State, BarmeciaState)
			if BarmQuestActive == true then
				NonPlayerCharacter.Deactivate("BarmeciaMayor")
			end
			Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
			Message("@color:255,0,0 Warnung: @color:255,255,255 Barmecia hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount+1
			FailedBarm = true
			return true
		end
	end

	Ent1 = nil

	for i = 2, table.getn(Ent2) do
		local type = Logic.GetEntityType(Ent2[i])
		if (Logic.IsSettler(Ent2[i]) == 1 and Logic.IsHero(Ent2[i]) == 0 ) and BarmeciaFlag == false then
			SetTableDiplomacyState(3, Player1State, BarmeciaState)
			SetTableDiplomacyState(3, Player2State, BarmeciaState)
			if BarmQuestActive == true then
				NonPlayerCharacter.Deactivate("BarmeciaMayor")
			end
			Erbe.SetupAIBar()
			Erbe.UpgradeBarmeciaAggressivness()
			Message("@color:255,0,0 Warnung: @color:255,255,255 Barmecia hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount+1
			FailedBarm = true
			return true
		end
	end

	Ent2 = nil

	if BarmeciaFlag == true then
		return true
	end

end


function FolklungHandler()
	local pos1 = GetPosition("FolklungCenter")
	local Ent1 = { Logic.GetPlayerEntitiesInArea(1, 0, pos1.X, pos1.Y, 15000, 2) }
	local Ent2 = { Logic.GetPlayerEntitiesInArea(2, 0, pos1.X, pos1.Y, 15000, 2) }


	for i = 2, table.getn(Ent1) do
		local type = Logic.GetEntityType(Ent1[i])
		if (Logic.IsSettler(Ent1[i]) == 1 and Logic.IsHero(Ent1[i]) == 0 ) and FolklungFlag == false then
			SetTableDiplomacyState(3, Player1State, FolklungState)
			SetTableDiplomacyState(3, Player2State, FolklungState)
			if FolkQuestActive == true then
				NonPlayerCharacter.Deactivate("salim")
			end
			Message("@color:255,0,0 Warnung: @color:255,255,255 Folklung hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount + 1
			FailedFolk = true
			Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
			return true
		end
	end

	Ent1 = nil

	for i = 2, table.getn(Ent2) do
		local type = Logic.GetEntityType(Ent2[i])
		if (Logic.IsSettler(Ent2[i]) == 1 and Logic.IsHero(Ent2[i]) == 0 ) and FolklungFlag == false then
			SetTableDiplomacyState(3, Player1State, FolklungState)
			SetTableDiplomacyState(3, Player2State, FolklungState)
			if FolkQuestActive == true then
				NonPlayerCharacter.Deactivate("salim")
			end
			Message("@color:255,0,0 Warnung: @color:255,255,255 Folklung hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount + 1
			FailedFolk = true
			Erbe.SetupAIFolk()
			Erbe.UpgradeFolklungAggressivness()
			Erbe.SetupAIOutpost()
			Erbe.UpgradeOutpostAggressivness()
			return true
		end
	end

	Ent2 = nil

	if FolklungFlag == true then
		return true
	end
end
function DarioHandler()
	local pos1 = GetPosition("okcTrigger")
	local Ent1 = { Logic.GetPlayerEntitiesInArea(1, 0, pos1.X, pos1.Y, 5000, 2) }
	local Ent2 = { Logic.GetPlayerEntitiesInArea(2, 0, pos1.X, pos1.Y, 5000, 2) }


	for i = 2, table.getn(Ent1) do
		local type = Logic.GetEntityType(Ent1[i])
		if (Logic.IsSettler(Ent1[i]) == 1 and Logic.IsHero(Ent1[i]) == 0 ) and DarioFlag == false then
			SetTableDiplomacyState(3, Player1State, FolklungState)
			SetTableDiplomacyState(3, Player2State, FolklungState)
			SetTableDiplomacyState(3, Player1State, DarioState)
			SetTableDiplomacyState(3, Player2State, DarioState)
			if OKCQuestActive == true then
				NonPlayerCharacter.Deactivate("ari")
			end
			Message("@color:255,0,0 Warnung: @color:255,255,255 OldKingsCastle hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount + 1
			FailedOKC = true
			Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
			return true
		end
	end

	Ent1 = nil

	for i = 2, table.getn(Ent2) do
		local type = Logic.GetEntityType(Ent2[i])
		if (Logic.IsSettler(Ent2[i]) == 1 and Logic.IsHero(Ent2[i]) == 0 ) and DarioFlag == false then
			SetTableDiplomacyState(3, Player1State, FolklungState)
			SetTableDiplomacyState(3, Player2State, FolklungState)
			SetTableDiplomacyState(3, Player1State, DarioState)
			SetTableDiplomacyState(3, Player2State, DarioState)
			if OKCQuestActive == true then
				NonPlayerCharacter.Deactivate("ari")
			end
			Message("@color:255,0,0 Warnung: @color:255,255,255 OldKingsCastle hat euch den Krieg erklärt, da Ihr das Abkommen gebrochen habt.")
			enemyCount = enemyCount + 1
			FailedOKC = true
			Erbe.SetupAIDario()
			Erbe.UpgradeDarioAggressivness()
			return true
		end
	end

	Ent2 = nil

	if DarioFlag == true then
		return true
	end
end




function EnemyHandler()
	if enemyCount >= 3 then
		SecretFlag = true
		Message("@color:255,0,0 Warnung: @color:255,255,255 Ihr habt mit allen Parteien das Abkommen gebrochen. Sie werden nun gegen euch gemeinsam vorgehen.")
		return true
	end
end


VargGateFlag = false

function VargGateChecker()
	if Logic.GetPlayerEntitiesInArea(9,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) >0 
	or Logic.GetPlayerEntitiesInArea(1,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) >0 
	or Logic.GetPlayerEntitiesInArea(2,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) >0 then
		ReplaceEntity("BarbGate",Entities.XD_PalisadeGate1)
	elseif Logic.GetEntitiesInArea(Entities.XD_PalisadeGate1,GetPosition("gatepos").X,GetPosition("gatepos").Y,100,1) > 0 
	and (Logic.GetPlayerEntitiesInArea(9,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) <=0 
	or Logic.GetPlayerEntitiesInArea(1,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) <=0
	or Logic.GetPlayerEntitiesInArea(2,0,GetPosition("gatepos").X,GetPosition("gatepos").Y,1000,16,nil) <=0) then
		ReplaceEntity("BarbGate",Entities.XD_PalisadeGate2)
	end
	if VargGateFlag == true then
		if Logic.GetEntitiesInArea(Entities.XD_PalisadeGate1,GetPosition("gatepos").X,GetPosition("gatepos").Y,100,1) > 0 then
			ReplaceEntity("BarbGate",Entities.XD_PalisadeGate2)
			return true
		else 
			return true
		end
	end
end


Erbe.Tables.Serfs.BarmeciaSerfTable = {}
function CreateSerfChecker_ID9()
	if IsExisting("hq3") and table.getn(Erbe.Tables.Serfs.BarmeciaSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(9,Entities.PU_Serf,GetPosition("Serfs_Id9"),"Serf_"..i.."_ID9")
            table.insert(Erbe.Tables.Serfs.BarmeciaSerfTable,i,serf)
		end
	end
	if IsDestroyed("hq3") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID9)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID9)
	end
end

function SerfsAllDead_ID9()
	for i=table.getn(Erbe.Tables.Serfs.BarmeciaSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.BarmeciaSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.BarmeciaSerfTable,i)
		end
	end
end

Erbe.Tables.Serfs.FolklungMainSerfTable = {}
function CreateSerfChecker_ID10()
	if IsExisting("hq4") and table.getn(Erbe.Tables.Serfs.FolklungMainSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(10,Entities.PU_Serf,GetPosition("Serfs_Id10"),"Serf_"..i.."_ID10")
			table.insert(Erbe.Tables.Serfs.FolklungMainSerfTable,i,serf)
		end
	end
	if IsDestroyed("hq4") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID10)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID10)
	end
end

function SerfsAllDead_ID10()
	for i=table.getn(Erbe.Tables.Serfs.FolklungMainSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.FolklungMainSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.FolklungMainSerfTable,i)
		end
	end
end



Erbe.Tables.Serfs.VargMainSerfTable = {}
function CreateSerfChecker_ID11()
	if IsExisting("VargCastle") and table.getn(Erbe.Tables.Serfs.VargMainSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(11,Entities.PU_Serf,GetPosition("Serfs_Id11"),"Serf_"..i.."_ID11")
			table.insert(Erbe.Tables.Serfs.VargMainSerfTable,i,serf)
		end
	end
	if IsDestroyed("VargCastle") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID11)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID11)
	end
end

function SerfsAllDead_ID11()
	for i=table.getn(Erbe.Tables.Serfs.VargMainSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.VargMainSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.VargMainSerfTable,i)
		end
	end
end



Erbe.Tables.Serfs.DarioSerfTable = {}
function CreateSerfChecker_ID12()
	if IsExisting("OKC") and table.getn(Erbe.Tables.Serfs.DarioSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(12,Entities.PU_Serf,GetPosition("Serfs_Id12"),"Serf_"..i.."_ID12")
			table.insert(Erbe.Tables.Serfs.DarioSerfTable,i,serf)
		end
	end
	if IsDestroyed("OKC") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID12)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID12)
	end
end

function SerfsAllDead_ID12()
	for i=table.getn(Erbe.Tables.Serfs.DarioSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.DarioSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.DarioSerfTable,i)
		end
	end
end



Erbe.Tables.Serfs.BanditsSerfTable = {}
function CreateSerfChecker_ID13()
	if IsExisting("hq8") and table.getn(Erbe.Tables.Serfs.BanditsSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(13,Entities.PU_Serf,GetPosition("Serfs_Id13"),"Serf_"..i.."_ID13")
			table.insert(Erbe.Tables.Serfs.BanditsSerfTable,i,serf)
		end
	end
	if IsDestroyed("hq8") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID13)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID13)
	end
end

function SerfsAllDead_ID13()
	for i=table.getn(Erbe.Tables.Serfs.BanditsSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.BanditsSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.BanditsSerfTable,i)
		end
	end
end


Erbe.Tables.Serfs.FolklungOutpostSerfTable = {}
function CreateSerfChecker_ID14()
	if IsExisting("outpost_id4") and table.getn(Erbe.Tables.Serfs.FolklungOutpostSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(14,Entities.PU_Serf,GetPosition("Serfs_Id14"),"Serf_"..i.."_ID14")
			table.insert(Erbe.Tables.Serfs.FolklungOutpostSerfTable,i,serf)
		end
	end
	if IsDestroyed("outpost_id4") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID14)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID14)
	end
end

function SerfsAllDead_ID14()
	for i=table.getn(Erbe.Tables.Serfs.FolklungOutpostSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.FolklungOutpostSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.FolklungOutpostSerfTable,i)
		end
	end
end


Erbe.Tables.Serfs.VargOutpostSerfTable = {}
function CreateSerfChecker_ID15()
	if IsExisting("hq5") and table.getn(Erbe.Tables.Serfs.VargOutpostSerfTable) <= 0 then
		for i = 1,6,1 do
			local serf = CreateEntity(15,Entities.PU_Serf,GetPosition("Serfs_Id15"),"Serf_"..i.."_ID15")
			table.insert(Erbe.Tables.Serfs.VargOutpostSerfTable,i,serf)
		end
	end
	if IsDestroyed("hq5") then
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfTrigger_ID15)
		Trigger.UnrequestTrigger(Erbe.Trigger.SerfsDeadTrigger_ID15)
	end
end

function SerfsAllDead_ID15()
	for i=table.getn(Erbe.Tables.Serfs.VargOutpostSerfTable),1,-1 do
		if not IsExisting(Erbe.Tables.Serfs.VargOutpostSerfTable[i]) then
			table.remove(Erbe.Tables.Serfs.VargOutpostSerfTable,i)
		end
	end
end
