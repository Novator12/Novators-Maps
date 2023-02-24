ChunkFilter = {};

function ChunkFilter.new()
	return {
		EntityCategories = {};
		FunctionFilter = {};
		FunctionFilterArgs = {};
	};
end;

function ChunkFilter.AddEntityCategory(_filter, _eCat)
	table.insert(_filter.EntityCategories, _eCat);
end;

function ChunkFilter.CheckEntity(_filter, _id)
	
	for i = 1,table.getn(_filter.EntityCategories) do
		local ecat = _filter.EntityCategories[i];
		if Logic.IsEntityInCategory(_id, ecat) == 1 then
			return true;
		end;
	end;
	
	for i = 1, table.getn(_filter.FunctionFilter) do
		if _filter.FunctionFilter[i](_id, unpack(_filter.FunctionFilterArgs[i])) then
			return true;
		end;
	end;
	
	return false;
end;

function ChunkFilter.AddFunctionFilter(_filter, _function, ...)
	table.insert(_filter.FunctionFilter, _function);
	table.insert(_filter.FunctionFilterArgs, arg);
end;


ChunkWrapper = ChunkWrapper or {chunks={}};
function ChunkWrapper.new(_filter)
	local t = {
		Entities = {};
		Dirty = false;
		LastUpdate = 0;
		
		Filter = _filter or ChunkFilter.new();
		-- chunk = <UserData>
	};
	
	table.insert(ChunkWrapper.chunks, t);
	
	return t;
end;

function ChunkWrapper.destroy(chunk)
	for i = table.getn(ChunkWrapper.chunks), 1, -1 do
		if ChunkWrapper.chunks[i] == chunk then
			table.remove(ChunkWrapper.chunks, i);
		end;
	end;
end;


function ChunkWrapper.AddEntity(chunk, _id)
	chunk.Entities[_id] = true;
	chunk.Dirty = true;	
	ChunkWrapper.Internal_GetOrInit(chunk):AddEntity(_id);
end;

function ChunkWrapper.Internal_GetOrInit(chunk)
	return (chunk.chunk or ChunkWrapper.Internal_Init(chunk) or chunk.chunk);
end;

function ChunkWrapper.RemoveEntity(chunk, _id)
	if chunk.Entities[_id] then
		chunk.Entities[_id] = nil;
		chunk.Dirty = true;
		ChunkWrapper.Internal_GetOrInit(chunk):RemoveEntity(_id);
	end;
end;

function ChunkWrapper.Internal_Init(chunk)
	chunk.chunk = CUtil.Chunks.new();
	for id, _ in pairs(chunk.Entities) do
		chunk.chunk:AddEntity(id)
	end;
end;

function ChunkWrapper.UpdatePositions(chunk)
	if chunk.Dirty or chunk.LastUpdate ~= Logic.GetTimeMs() then
		chunk.Dirty = false;
		chunk.LastUpdate = Logic.GetTimeMs();
		ChunkWrapper.Internal_GetOrInit(chunk):UpdatePositions();
	end;
end;

function ChunkWrapper.GetEntitiesInAreaInCMSorted(chunk, x, y, range)
	return ChunkWrapper.Internal_GetOrInit(chunk):GetEntitiesInAreaInCMSorted(x, y, range);
end;

function ChunkWrapper.GetEntitiesWithHealthAndNotCamouflagedAndNotConstructionSiteInAreaInCMSorted(chunk, x, y, range)
	return ChunkWrapper.Internal_GetOrInit(chunk):GetEntitiesInAreaInCMSorted(x, y, range, true, true, true);
end;


function ChunkWrapper.AddEntityApplyFilter(chunk, id)
	if ChunkFilter.CheckEntity(chunk.Filter, id) then
		ChunkWrapper.AddEntity(chunk, id);
	end;
end;

function ChunkWrapper.InitAllExistingEntities(chunk)
	for id in CEntityIterator.Iterator() do
		if ChunkFilter.CheckEntity(chunk.Filter, id) then
			ChunkWrapper.AddEntity(chunk, id);
		end;
	end;
end;

function ChunkWrapper_OnEntityDied()
	local id = Event.GetEntityID();
	for i = table.getn(ChunkWrapper.chunks), 1, -1 do
		ChunkWrapper.RemoveEntity(ChunkWrapper.chunks[i], id);
	end;
end;

function ChunkWrapper_OnEntityCreated()
	local id = Event.GetEntityID();
	
	for i = table.getn(ChunkWrapper.chunks), 1, -1 do
		local chunk = ChunkWrapper.chunks[i];
		if ChunkFilter.CheckEntity(chunk.Filter, id) then
			ChunkWrapper.AddEntity(chunk, id);
		end;
	end;
	
end;

if not CHUNKWRAPPER_TRIGGER then
	CHUNKWRAPPER_TRIGGER = Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, "", "ChunkWrapper_OnEntityDied", 1);
	Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED, "", "ChunkWrapper_OnEntityCreated", 1);
end;






DefensiveArmy = DefensiveArmy or {Armies={}; IDToArmy = {}; Respawn={}};

function DefensiveArmy_RespawnJob()
	local time = Logic.GetTimeMs();
	
	if DefensiveArmy.Respawn[time] then
		
		for i = 1, table.getn(DefensiveArmy.Respawn[time]) do
			if DefensiveArmy.Respawn[time][i].army.respawn then
				
				local troopDescription = DefensiveArmy.Respawn[time][i].troopDescription;
				
				local troop = Tools.CreateGroup(
					DefensiveArmy.Respawn[time][i].army.playerID,
					troopDescription.type,
					troopDescription.soldierAmount,
					troopDescription.X,
					troopDescription.Y,
					troopDescription.Orientation
				);
				
				if troopDescription.Formation then
					Logic.LeaderChangeFormationType(troop, troopDescription.Formation);
				end;
				
				DefensiveArmy.Respawn[time][i].army.entities[troop] = troopDescription;
				
				DefensiveArmy.IDToArmy[troop] = DefensiveArmy.Respawn[time][i].army;
			end;
		end;
		
		DefensiveArmy.Respawn[time] = nil;
	end;
end;

function DefensiveArmy.ScheduleRespawn(army, troopDescription, ticks)
	local time = Logic.GetTimeMs() + troopDescription.respawn * 100;
	if time <= Logic.GetTimeMs() then
		-- ERROR
		return;
	end;
	DefensiveArmy.Respawn[time] = DefensiveArmy.Respawn[time] or {};
	
	table.insert(DefensiveArmy.Respawn[time], {army=army, troopDescription = troopDescription});
end;

function DefensiveArmy_OnEntityCreated()
	local id = Event.GetEntityID();
end;

function DefensiveArmy_OnEntityDestroyed()
	local id = Event.GetEntityID();
	
	local army = DefensiveArmy.IDToArmy[id];
	
	if army then
		DefensiveArmy.IDToArmy[id] = nil;
		
		if army.respawn then
			army.entities[id].lastAttack = nil;
			army.entities[id].enemy = nil;
			DefensiveArmy.ScheduleRespawn(army, army.entities[id]);
		else
			--
		end;
		army.entities[id] = nil;
	end;
end;

if not DEFENSIVE_ARMY_TRIGGER then
	DEFENSIVE_ARMY_TRIGGER = Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED, "", "DefensiveArmy_OnEntityDestroyed", 1);
	Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED, "", "DefensiveArmy_OnEntityCreated", 1);
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN, "", "DefensiveArmy_RespawnJob", 1);
end;

function DefensiveArmy.new(playerID, x, y, range, chunkwrapper, range_back, destroy_if_no_respawn_and_empty)
	local t = {
		playerID = playerID;
		x = x;
		y = y;
		range = range;
		
		respawn = true;
		
		entities = {};
		
		chunkwrapper = chunkwrapper;
		
		range_back = range_back;
		
		destroy_if_no_respawn_and_empty = destroy_if_no_respawn_and_empty;
	};
	
	table.insert(DefensiveArmy.Armies, t);
	
	return t;
end;

function DefensiveArmy.destroy(army)
	for i = table.getn(DefensiveArmy.Armies), 1, -1 do
		if DefensiveArmy.Armies[i] == army then
			table.remove(DefensiveArmy.Armies, i);
		end;
	end;
end;

function DefensiveArmy.AddTroopSpawn(da, _respawn_delay, _type, _SoldierAmount,  _X , _Y ,_Orientation, _formation)
    local troop = Tools.CreateGroup(da.playerID, _type, _SoldierAmount, _X , _Y ,_Orientation );
    
    if _formation then
        Logic.LeaderChangeFormationType(troop, _formation);
    end;
    
    local rnd = math.rad(math.random(360));
    
    
    da.entities[troop] = {
        respawn = _respawn_delay;
        type = _type;
        soldierAmount = _SoldierAmount;
        X = _X;
        Y = _Y;
        Orientation = _Orientation;
        Formation = _formation;
        
        IdleX = math.cos(rnd) * da.range_back + da.x;
        IdleY = math.sin(rnd) * da.range_back + da.y;
    };
    
    DefensiveArmy.IDToArmy[troop] = da;
    
    da.troopDescriptions = da.troopDescriptions or {};
    table.insert(da.troopDescriptions, da.entities[troop]);
end;

function DefensiveArmy.ReplaceTroopTypes(da, _oldType, _newType)
    if da.troopDescriptions then
        for i = 1,table.getn(da.troopDescriptions) do
            if _oldType == da.troopDescriptions[i].type then
                da.troopDescriptions[i].type = _newType;
            end;
        end;
    end;
end;


function DefensiveArmy.StopRespawn(da)
	da.respawn = false;
end;

function DefensiveArmy_Distance(x, y, x2, y2)
	return math.sqrt((x-x2)^2 + (y-y2)^2);
end;

function DefensiveArmy_Update()
	for i = table.getn(DefensiveArmy.Armies), 1, -1 do
		local da = DefensiveArmy.Armies[i];
		
		
		ChunkWrapper.UpdatePositions(da.chunkwrapper);
		
		local enemies = ChunkWrapper.GetEntitiesWithHealthAndNotCamouflagedAndNotConstructionSiteInAreaInCMSorted(da.chunkwrapper, da.x, da.y, da.range);
		
		local empty = true;
		
		for id, troopDescription in pairs(da.entities) do
			empty = false;
			local x, y = Logic.EntityGetPos(id);
			--local enemies2 = ChunkWrapper.GetEntitiesInAreaInCMSorted(da.chunkwrapper, x, y, da.range);
			
			if not troopDescription.lastAttack
			or troopDescription.lastAttack + 3500 < Logic.GetTimeMs()
			or (Logic.IsEntityAlive(troopDescription.enemy) == false and enemies[1]) then
			
				troopDescription.lastAttack = Logic.GetTimeMs();
				
				-- TODO do not switch if enemy is still in range (except buildings -> leader, serf > building > rest)
				
				
				if troopDescription.enemy and Logic.IsEntityAlive(troopDescription.enemy) then
					if DefensiveArmy_Distance(da.x, da.y, Logic.EntityGetPos(troopDescription.enemy)) >= da.range then
						troopDescription.enemy = nil;
					end;
				end;
				
				if troopDescription.enemy == nil or true then
					
					if enemies[1] == nil then
						-- walk back
						if math.abs(troopDescription.IdleX - x) > 200 and math.abs(troopDescription.IdleY - y) > 200 then
							Logic.MoveSettler(id, troopDescription.IdleX, troopDescription.IdleY);
						end;
					else
						
						-- look for new target
						local t = {};
						for i = 1, table.getn(enemies) do
							local enemyid = enemies[i];
							local dist = DefensiveArmy_Distance(x, y, Logic.EntityGetPos(enemyid));
							---@diagnostic disable-next-line: redundant-parameter
							local att = CEntity.GetAttachedEntities(enemyid)[37];
							local attacker_target_n = att and table.getn(att) or 0;
							dist = dist - attacker_target_n * 50;

							--additional Stuff 
							local currentSec = Logic.GetSector(id)
							local enemySec = Logic.GetSector(enemyid)

							if (Logic.IsWorker(enemyid) == 1
							and (Logic.IsSettlerAtWork(enemyid) == 1
							or Logic.IsSettlerAtFarm(enemyid) == 1
							or Logic.IsSettlerAtResidence(enemyid) == 1)
							or currentSec ~= enemySec  --additional Stuff
							) then
							
							else
								table.insert(t, {id=enemyid,dist=dist});
							end;
						end;
						
						table.sort(t, function(a,b) return a.dist < b.dist end);
						
						if t[1] then
						--if t[1].id ~= troopDescription.enemy then
							Logic.GroupAttack(id, t[1].id);
							troopDescription.enemy = t[1].id;
						--end
						end;
					end;
				end;
				
				--[[
				
				if enemies2[1] and DefensiveArmy_Distance(da.x, da.y, Logic.EntityGetPos(enemies2[1])) < da.range then
					if troopDescription.enemy ~= enemies2[1] then
						troopDescription.enemy = enemies2[1];
						Logic.GroupAttack(id, enemies2[1]);
					end;
				elseif enemies[1] then
					if troopDescription.enemy ~= enemies[1] then
						troopDescription.enemy = enemies[1];
						Logic.GroupAttack(id, enemies[1]);
					end;
				else
					troopDescription.enemy = nil;
					if math.abs(troopDescription.IdleX - x) > 200 and math.abs(troopDescription.IdleY - y) > 200 then
						Logic.MoveSettler(id, troopDescription.IdleX, troopDescription.IdleY);
					end;
					
				end;
				]]
			end;
			
		end;
		
		if empty and not da.respawn and da.destroy_if_no_respawn_and_empty then
			DefensiveArmy.destroy(da);
		end;
	end;
end;

Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN, "", "DefensiveArmy_Update", 1);
