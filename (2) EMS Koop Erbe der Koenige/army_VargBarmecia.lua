function StrongerVargBarJob1()
	VargBarStrenght = 2
end

function StrongerVargBarJob2()
	VargBarStrenght = 3
end


function DelayStrongerVargBar1()

	if CheckMode == 1 then
		 VarBar1 = 110 * 60
	elseif CheckMode == 2 then
		VarBar1 = 90 * 60
	elseif CheckMode == 3 then
		VarBar1 = 70 * 60
	end

	StartCountdown(VarBar1,StrongerVargBarJob1,false)
end


function DelayStrongerVargBar2()

	if CheckMode == 1 then
		VarBar2 = 130 * 60
   elseif CheckMode == 2 then
		VarBar2 = 110 * 60
   elseif CheckMode == 3 then
		VarBar2 = 90 * 60
   end

	StartCountdown(VarBar2, StrongerVargBarJob2, false)
end

function ActivateVargFlankeAttackers()

	VargBarStrenght = 1

	RespawnVargBar = 120

	

	

	
	DelayStrongerVargBar1()
	DelayStrongerVargBar2()
	
	


	function VarBarAttack1()
		for j = 1, 2, 1 do
			if IsExisting("id5_maint"..j) then
				local SpawnPos = GetPosition("spawn_id5_maint"..j)
				if VargBarStrenght == 1 then
					if IsDestroyed("BowVarBar1_"..j) and IsDestroyed("BowVarBar2_"..j) then
						if Counter.Tick2("VarBarAttack1_"..j, RespawnVargBar) then
							for i = 1, 2 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow2, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowVarBar"..i.."_"..j)
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif VargBarStrenght == 2 then
					if IsDestroyed("BowVarBar1_"..j) and IsDestroyed("BowVarBar2_"..j) and IsDestroyed("BowVarBar3_"..j) then
						if Counter.Tick2("VarBarAttack1_"..j, RespawnVargBar) then
							for i = 1, 3 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowVarBar"..i.."_"..j)
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif VargBarStrenght == 3 then
					if IsDestroyed("BowVarBar1_"..j) and IsDestroyed("BowVarBar2_"..j) and IsDestroyed("BowVarBar3_"..j) and IsDestroyed("BowVarBar4_"..j) then
						if Counter.Tick2("VarBarAttack1_"..j, RespawnVargBar) then
							for i = 1, 4 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowVarBar"..i.."_"..j)
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowVarBar"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				end
			end

		end

		if IsDead("id5_maint1") and IsDead("id5_maint2") then
			return true
		end
	end


	StartSimpleJob("VarBarAttack1")


	function VarBarAttack2()
		for j = 1, 2, 1 do
			if IsExisting("id5_maint"..j) then
				local SpawnPos = GetPosition("spawn_id5_maint"..j)
				if VargBarStrenght == 1 then
					if IsDestroyed("SwordVarBar1_"..j) and IsDestroyed("SwordVarBar2_"..j) then
						if Counter.Tick2("VarBarAttack2_"..j, RespawnVargBar) then
							for i = 1, 2 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordVarBar"..i.."_"..j)
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W1" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W2" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W3" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif VargBarStrenght == 2 then
					if IsDestroyed("SwordVarBar1_"..j) and IsDestroyed("SwordVarBar2_"..j) and IsDestroyed("SwordVarBar3_"..j) then
						if Counter.Tick2("VarBarAttack2_"..j, RespawnVargBar) then
							for i = 1, 3 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordVarBar"..i.."_"..j)
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W1" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W2" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W3" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif VargBarStrenght == 3 then
					if IsDestroyed("SwordVarBar1_"..j) and IsDestroyed("SwordVarBar2_"..j) and IsDestroyed("SwordVarBar3_"..j) and IsDestroyed("SwordVarBar4_"..j) then
						if Counter.Tick2("VarBarAttack2_"..j, RespawnVargBar) then
							for i = 1, 4 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordVarBar"..i.."_"..j)
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W1" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W2" })
								AddWaypoints("SwordVarBar"..i.."_"..j, { "Bar_Flanke_W3" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordVarBar"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				end
			end

		end

		if IsDead("id5_maint1") and IsDead("id5_maint2") then
			return true
		end
	end


	StartSimpleJob("VarBarAttack2")


end