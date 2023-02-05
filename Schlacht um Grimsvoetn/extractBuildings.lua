--##########################################################################
--##      			Beliebige Resourcen abbauen                           ##
--## es kann jede Entity benutzt werden. Sobald sich ein Serf in der Nähe ##
--## befindet, beginnt er mit der Arbeit und baut diesen z.B. Stein ab.   ##
--## Am Ende wird diese Entity gelöscht.                                  ##
--##       			by Peter-FS  05/2011		                          ##
--##########################################################################
--	Funktionsaufruf mit:
--	CreateStone("stein1",1500,"TL_SERF_EXTRACT_RESOURCE","stone",450)


EntitiesArea1ToCheckTable = {
	[1] = {Entities.XD_RuinFragment2},
	[2] = {Entities.XD_RuinFragment4},
	[3] = {Entities.XD_RuinFragment6},
	[4] = {Entities.XD_RuinResidence2},
	[5] = {Entities.XD_RuinHouse2},
	[6] = {Entities.XD_RuinMonastery2},
	[7] = {Entities.XD_RuinSmallTower2},
	[8] = {Entities.XD_RuinSmallTower4},
	[9] = {Entities.XD_RuinTower2},
	[10] = {Entities.XD_RuinWall2},
	[11] = {Entities.XD_RuinWall4},
	[12] = {Entities.XD_RuinWall6},
	[13] = {Entities.XD_Evil_Camp01},
	[14] = {Entities.XD_Evil_Camp02},
	[15] = {Entities.XD_Evil_Camp03},
	[16] = {Entities.XD_Evil_Camp04},
	[17] = {Entities.XD_Evil_Camp06},
	[18] = {Entities.XD_Signpost1},
}
function ScanRuinsArea1()
	for i= 1, table.getn(EntitiesArea1ToCheckTable), 1 do
		EntitiesArea1ToCheckTable[i][2] = {Logic.GetEntitiesInArea(EntitiesArea1ToCheckTable[i][1],GetPosition("ruin_area1").X,GetPosition("ruin_area1").Y,3000,16)}
		table.remove(EntitiesArea1ToCheckTable[i][2],1)
	end
end

function MakeRuinsExtractableArea1()
	for i = 1,table.getn(EntitiesArea1ToCheckTable),1 do
		for n = 1, table.getn(EntitiesArea1ToCheckTable[i][2]) do
			local ruinId = GetID(EntitiesArea1ToCheckTable[i][2][n])
			CreateStone(ruinId,25,"TL_SERF_EXTRACT_RESOURCE","stone",500,1)
		end
	end
end

EntitiesArea2ToCheckTable = {
	[1] = {Entities.XD_RuinFragment2},
	[2] = {Entities.XD_RuinFragment4},
	[3] = {Entities.XD_RuinFragment6},
	[4] = {Entities.XD_RuinResidence2},
	[5] = {Entities.XD_RuinHouse2},
	[6] = {Entities.XD_RuinMonastery2},
	[7] = {Entities.XD_RuinSmallTower2},
	[8] = {Entities.XD_RuinSmallTower4},
	[9] = {Entities.XD_RuinTower2},
	[10] = {Entities.XD_RuinWall2},
	[11] = {Entities.XD_RuinWall4},
	[12] = {Entities.XD_RuinWall6},
	[13] = {Entities.XD_Signpost1},
	[14] = {Entities.XD_Signpost2},
	[15] = {Entities.XD_Signpost3},
}

function ScanRuinsArea2()
	for i= 1, table.getn(EntitiesArea2ToCheckTable), 1 do
		EntitiesArea2ToCheckTable[i][2]= {Logic.GetEntitiesInArea(EntitiesArea2ToCheckTable[i][1],GetPosition("ruin_area2").X,GetPosition("ruin_area2").Y,4000,16)}
		table.remove(EntitiesArea2ToCheckTable[i][2],1)
	end
end

function MakeRuinsExtractableArea2()
	for i = 1,table.getn(EntitiesArea2ToCheckTable),1 do
		for n = 1, table.getn(EntitiesArea2ToCheckTable[i][2]) do
			local ruinId = GetID(EntitiesArea2ToCheckTable[i][2][n])
			CreateStone(ruinId,25,"TL_SERF_EXTRACT_RESOURCE","stone",500,1)
		end
	end
end

EntitiesArea3ToCheckTable = {
	[1] = {Entities.XD_RuinFragment2},
	[2] = {Entities.XD_RuinFragment4},
	[3] = {Entities.XD_RuinFragment6},
	[4] = {Entities.XD_RuinResidence2},
	[5] = {Entities.XD_RuinHouse2},
	[6] = {Entities.XD_RuinMonastery2},
	[7] = {Entities.XD_RuinSmallTower2},
	[8] = {Entities.XD_RuinSmallTower4},
	[9] = {Entities.XD_RuinTower2},
	[10] = {Entities.XD_RuinWall2},
	[11] = {Entities.XD_RuinWall4},
	[12] = {Entities.XD_RuinWall6},
	[13] = {Entities.XD_Evil_Camp01},
	[14] = {Entities.XD_Evil_Camp02},
	[15] = {Entities.XD_Evil_Camp03},
	[16] = {Entities.XD_Evil_Camp04},
	[17] = {Entities.XD_Evil_Camp06},
	[18] = {Entities.XD_Signpost1},
}

function ScanRuinsArea3()
	for i= 1, table.getn(EntitiesArea3ToCheckTable), 1 do
		EntitiesArea3ToCheckTable[i][2]= {Logic.GetEntitiesInArea(EntitiesArea3ToCheckTable[i][1],GetPosition("ruin_area3").X,GetPosition("ruin_area3").Y,3000,16)}
		table.remove(EntitiesArea3ToCheckTable[i][2],1)
	end
end

function MakeRuinsExtractableArea3()
	for i = 1,table.getn(EntitiesArea3ToCheckTable),1 do
		for n = 1, table.getn(EntitiesArea3ToCheckTable[i][2]) do
			local ruinId = GetID(EntitiesArea3ToCheckTable[i][2][n])
			CreateStone(ruinId,25,"TL_SERF_EXTRACT_RESOURCE","stone",500,1)
		end
	end
end

EntitiesArea4ToCheckTable = {
	[1] = {Entities.XD_RuinFragment2},
	[2] = {Entities.XD_RuinFragment4},
	[3] = {Entities.XD_RuinFragment6},
	[4] = {Entities.XD_RuinResidence2},
	[5] = {Entities.XD_RuinHouse2},
	[6] = {Entities.XD_RuinMonastery2},
	[7] = {Entities.XD_RuinSmallTower2},
	[8] = {Entities.XD_RuinSmallTower4},
	[9] = {Entities.XD_RuinTower2},
	[10] = {Entities.XD_RuinWall2},
	[11] = {Entities.XD_RuinWall4},
	[12] = {Entities.XD_RuinWall6},
	[13] = {Entities.XD_Evil_Camp01},
	[14] = {Entities.XD_Evil_Camp02},
	[15] = {Entities.XD_Evil_Camp03},
	[16] = {Entities.XD_Evil_Camp04},
	[17] = {Entities.XD_Evil_Camp06},
	[18] = {Entities.XD_Signpost1},
}

function ScanRuinsArea4()
	for i= 1, table.getn(EntitiesArea4ToCheckTable), 1 do
		EntitiesArea4ToCheckTable[i][2]= {Logic.GetEntitiesInArea(EntitiesArea4ToCheckTable[i][1],GetPosition("ruin_area4").X,GetPosition("ruin_area4").Y,3000,16)}
		table.remove(EntitiesArea4ToCheckTable[i][2],1)
	end
end

function MakeRuinsExtractableArea4()
	for i = 1,table.getn(EntitiesArea4ToCheckTable),1 do
		for n = 1, table.getn(EntitiesArea4ToCheckTable[i][2]) do
			local ruinId = GetID(EntitiesArea4ToCheckTable[i][2][n])
			CreateStone(ruinId,25,"TL_SERF_EXTRACT_RESOURCE","stone",500,1)
		end
	end
end

function ActivateRuinExtraction()
	ScanRuinsArea1()
	MakeRuinsExtractableArea1()
	ScanRuinsArea2()
	MakeRuinsExtractableArea2()
	ScanRuinsArea3()
	MakeRuinsExtractableArea3()
	ScanRuinsArea4()
	MakeRuinsExtractableArea4()
end

function CreateStone(_pos,_amount,_how,_addresource,_distance,_player)
	if _distance==nil then _distance=550 end
	if _player==nil then _player=1 end
	
	Steintable = Steintable or {}
	local data = {
		player = _player,
		how=_how,
		pos = _pos,
		sAmount = _amount,
		bishier = 0,
		addResource=_addresource,
		distance=_distance,
	}
	table.insert(Steintable,data)
	if StoneJobIsRunning==nil or StoneJobIsRunning==false then
		StartSimpleJob("ControlStone")
		StoneJobIsRunning=true
	end                         
end
function ControlStone()
	local i,j
	for i = table.getn(Steintable), 1, -1 do
		if AreEntitiesInArea(Steintable[i].player,Entities.PU_Serf,GetPosition(Steintable[i].pos),Steintable[i].distance,1) then
			serf1 = SucheAufDerWelt(Steintable[i].player,Entities.PU_Serf,Steintable[i].distance,GetPosition(Steintable[i].pos))
			for j = 1,table.getn(serf1) do
				if Steintable[i].how=="" then
					Logic.SetTaskList(serf1[j],TaskLists.TL_SERF_EXTRACT_RESOURCE)				
				elseif Steintable[i].how=="TL_SERF_EXTRACT_WOOD" then
				    Logic.SetTaskList(serf1[j],TaskLists.TL_SERF_EXTRACT_WOOD)
				elseif Steintable[i].how=="TL_SERF_BUILD" then
				    Logic.SetTaskList(serf1[j],TaskLists.TL_SERF_BUILD)				
				elseif Steintable[i].how=="TL_SERF_EXTRACT_RESOURCE" then
				    Logic.SetTaskList(serf1[j],TaskLists.TL_SERF_EXTRACT_RESOURCE)
				end
				LookAt(serf1[j],Steintable[i].pos)
			end
			Steintable[i].bishier = Steintable[i].bishier + table.getn(serf1)
			if Steintable[i].addResource == "stone" then
                AddStone(Steintable[i].player,table.getn(serf1))
            elseif Steintable[i].addResource == "gold" then
                AddGold(Steintable[i].player,table.getn(serf1))
            elseif Steintable[i].addResource == "clay" then
				AddClay(Steintable[i].player,table.getn(serf1))
            elseif Steintable[i].addResource == "sulfur" then
				AddSulfur(Steintable[i].player,table.getn(serf1))
            elseif Steintable[i].addResource == "iron" then
				AddIron(Steintable[i].player,table.getn(serf1))
            elseif Steintable[i].addResource == "wood" then
				AddWood(Steintable[i].player,table.getn(serf1))
			end
		end
		if Steintable[i].sAmount <= Steintable[i].bishier then-- Menge erreicht?
			serfs = SucheAufDerWelt(Steintable[i].player,Entities.PU_Serf,Steintable[i].distance,GetPosition(Steintable[i].pos))
			for i = 1,table.getn(serfs) do
				Logic.SetTaskList(serfs[i],TaskLists.TL_SERF_IDLE)
			end
			local _pos = GetPosition(Steintable[i].pos)
			Logic.CreateEffect( GGL_Effects.FXBuildingSmoke, _pos.X, _pos.Y, 0 );
			DestroyEntity(Steintable[i].pos)
			table.remove(Steintable,i)
			if table.getn(Steintable)==0 then
			    StoneJobIsRunning=false
				return true
			end
		end
	end
end

function SucheAufDerWelt(_player, _entity, _groesse, _punkt)
	local punktX1, punktX2, punktY1, punktY2, data
	local gefunden = {}
	local rueck
	if not _groesse then
		_groesse = Logic.WorldGetSize() 
	end
	if not _punkt then
		_punkt = {X = _groesse/2, Y = _groesse/2}
	end
	if _player == 0 then
		data ={Logic.GetEntitiesInArea(_entity, _punkt.X, _punkt.Y, math.floor(_groesse * 0.71), 16)}
	else
		data ={Logic.GetPlayerEntitiesInArea(_player,_entity, _punkt.X, _punkt.Y, math.floor(_groesse * 0.71), 16)}
	end
	if data[1] >= 16 then
		local _klgroesse = _groesse / 2 
		local punktX1 = _punkt.X - _groesse / 4
		local punktX2 = _punkt.X + _groesse / 4
		local punktY1 = _punkt.Y - _groesse / 4
		local punktY2 = _punkt.Y + _groesse / 4
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX1,Y=punktY1})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX1,Y=punktY2})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX2,Y=punktY1})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
		rueck = SucheAufDerWelt(_player, _entity, _klgroesse, {X=punktX2,Y=punktY2})
		for i = 1, table.getn(rueck) do
			if not IstDrin(rueck[i], gefunden) then
				table.insert(gefunden, rueck[i])
			end
		end
	else
		table.remove(data,1)
		for i = 1, table.getn(data) do
			if not IstDrin(data[i], gefunden) then
				table.insert(gefunden, data[i])
			end
		end
	end
	return gefunden
end
function IstDrin(_wert, _table)
	for i = 1, table.getn(_table) do
		if _table[i] == _wert then 
			return true 
		end 
	end
	return false
end