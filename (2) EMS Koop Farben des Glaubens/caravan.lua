function CreateCaravan()
    for i=1,4, 1 do
        CreateEntity(8,Entities.PU_Travelling_Salesman,GetPosition("spawn_carv"..i),"CaravanMan"..i)
    end

    local Quest = {}
    Quest.Unit  = "CaravanMan"
    Quest.Waypoint = {}

    for i = 1,10,1 do
        Quest.Waypoint[i] = {Name = "carv_wp"..i, WaitTime = 15}
    end

    Quest.Remove = true
    Quest.Callback = CreateCaravan
    Quest.ArrivedCallback = nil;

    SetupCaravan(Quest)



end






 function Caravan_Action(_Index)

	local Quest = DataTable[_Index]

	-- All dead
	if CaravanAllUnitsDead(Quest) then
		
		-- Callback
		QuestCallback(_Index)
		-- destroy quest
		return true
	end
	
	-- Last waypoint
	if Quest.currentWaypoint == table.getn(Quest.Waypoint) then
		
		-- should not remove, but should stop
		local targetReached = false
		
		-- first Unit reached target
		local i
		for i=1, table.getn(Quest.Unit) do
			
			if IsAlive(Quest.Unit[i].Name) then
				
				-- at end position
				if IsNear(Quest.Unit[i].Name, Quest.Waypoint[Quest.currentWaypoint].Name, 100) then
					
					-- remember and remove ariver
					Caravan_IncreaseArivedCount(Quest)

					if Quest.Remove == true then

						DestroyEntity(Quest.Unit[i].Name)

						-- continue moving to target
						Quest.state = 1
						return false

					else
						targetReached = true
					end
					
				elseif targetReached then
					Caravan_IncreaseArivedCount(Quest)
				end
				
			end
		end
	
		-- reached
		if targetReached == true then
			-- Callback
			QuestCallback(_Index)
			-- destroy quest
			return true			
		else
			return false
		end
			
	end

	-- Wait
	Quest.waitingTime = Quest.waitingTime - 1

	-- wait done?
	if Quest.waitingTime <= 0 then
		
		--next waypoint
		Quest.currentWaypoint = Quest.currentWaypoint + 1
		
		-- continue moving
		Quest.state = 1
	end
end