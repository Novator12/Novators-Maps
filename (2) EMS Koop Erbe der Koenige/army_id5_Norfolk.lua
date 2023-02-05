function ActivateNorfolkAttackers()

	NorfolkStrenght = 1

	RespawnNorBar = 60

	if CheckMode == 1 then
		RespawnNorfolk = 7 * 60
	elseif CheckMode == 2 then
		RespawnNorfolk = 5 * 60
	elseif CheckMode == 3 then
		RespawnNorfolk = 3 * 60
	end


	function StrongerNorfolkJob1()
		if IsExisting("id5_bogen1") or IsExisting("id5_kaserne1")  then
			Message("@color:255,0,0 Achtung: @color:255,255,255 Norfolk's Angriffe werden stärker!")
			NorfolkStrenght = 2
		end
	end

	function StrongerNorfolkJob2()
		if IsExisting("id5_bogen1") or IsExisting("id5_kaserne1")   then
			Message("@color:255,0,0 Achtung: @color:255,255,255 Norfolk's Angriffe werden stärker!")
			NorfolkStrenght = 3
		end
	end


	function DelayStrongerNorfolk1()

		if CheckMode == 1 then
			 Norf1 = 30 * 60
		elseif CheckMode == 2 then
			Norf1 = 25 * 60
		elseif CheckMode == 3 then
			Norf1 = 20 * 60
		end

		StartCountdown(Norf1,StrongerNorfolkJob1,false)
	end


	function DelayStrongerNorfolk2()

		if CheckMode == 1 then
			Norf2 = 60 * 60
	   elseif CheckMode == 2 then
			Norf2 = 50 * 60
	   elseif CheckMode == 3 then
			Norf2 = 40 * 60
	   end

		StartCountdown(Norf2, StrongerNorfolkJob2, false)
	end


	function NorfolkAttack1()
		if IsExisting("id5_kaserne1") then
			local SpawnPos = GetPosition("spawn_id5_kaserne1")
			if IsDestroyed("SwordNorfolk1") and IsDestroyed("SwordNorfolk2") and IsDestroyed("SwordNorfolk3") then
				if Counter.Tick2("NorfolkAttack1_1", RespawnNorfolk) then
					if NorfolkStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolk" .. i)
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolk" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolk" .. i)
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolk" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolk" .. i)
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("SwordNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolk" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		--
		if IsExisting("id5_bogen1") then
			local SpawnPos = GetPosition("spawn_id5_bogen1")
			if IsDestroyed("BowNorfolk1") and IsDestroyed("BowNorfolk2") and IsDestroyed("BowNorfolk3") then
				if Counter.Tick2("NorfolkAttack1_2", RespawnNorfolk) then
					if NorfolkStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolk" .. i)
							AddWaypoints("BowNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolk" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolk" .. i)
							AddWaypoints("BowNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolk" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolk" .. i)
							AddWaypoints("BowNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BowNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolk" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		if IsDead("id5_kaserne1") and IsDead("id5_bogen1") then
			return true
		end
	end



	function NorfolkAttack2()
		if IsExisting("id5_barb1") then
			local SpawnPos = GetPosition("spawn_id5_barb1")
			if NorfolkStrenght == 1 then
				if IsDestroyed("BarbNorfolk1") and IsDestroyed("BarbNorfolk2") then
					if Counter.Tick2("NorfolkAttack2_1", RespawnNorfolk) then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BarbNorfolk" .. i)
							AddWaypoints("BarbNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolk" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 2 then
				if IsDestroyed("BarbNorfolk1") and IsDestroyed("BarbNorfolk2") and IsDestroyed("BarbNorfolk3") then
					if Counter.Tick2("NorfolkAttack2_1", RespawnNorfolk) then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BarbNorfolk" .. i)
							AddWaypoints("BarbNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolk" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 3 then
				if IsDestroyed("BarbNorfolk1") and IsDestroyed("BarbNorfolk2") and IsDestroyed("BarbNorfolk3") and IsDestroyed("BarbNorfolk4") then
					if Counter.Tick2("NorfolkAttack2_1", RespawnNorfolk) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BarbNorfolk" .. i)
							AddWaypoints("BarbNorfolk" .. i, { "VargPoint" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("BarbNorfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolk" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		--
		if IsExisting("id5_barb2") then
			local SpawnPos = GetPosition("spawn_id5_barb2")
			if NorfolkStrenght == 1 then
				if IsDestroyed("Barb2Norfolk1") and IsDestroyed("Barb2Norfolk2") then
					if Counter.Tick2("NorfolkAttack2_2", RespawnNorfolk) then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "Barb2Norfolk" .. i)
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("Barb2Norfolk" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 2 then
				if IsDestroyed("Barb2Norfolk1") and IsDestroyed("Barb2Norfolk2") and IsDestroyed("Barb2Norfolk3") then
					if Counter.Tick2("NorfolkAttack2_2", RespawnNorfolk) then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "Barb2Norfolk" .. i)
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("Barb2Norfolk" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 3 then
				if IsDestroyed("Barb2Norfolk1") and IsDestroyed("Barb2Norfolk2") and IsDestroyed("Barb2Norfolk3") and IsDestroyed("Barb2Norfolk4") then
					if Counter.Tick2("NorfolkAttack2_2", RespawnNorfolk) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "Barb2Norfolk" .. i)
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint1" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint2" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint3" })
							AddWaypoints("Barb2Norfolk" .. i, { "N_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("Barb2Norfolk" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		if IsDead("id5_barb1") and IsDead("id5_barb2") then
			return true
		end
	end




	--AttackBarmecia


	function NorfolkAttackBarmeica1()
		if IsExisting("id5_kaserne1") then
			local SpawnPos = GetPosition("spawn_id5_kaserne1")
			if IsDestroyed("SwordNorfolkBar1") and IsDestroyed("SwordNorfolkBar2") and IsDestroyed("SwordNorfolkBar3") then
				if Counter.Tick2("NorfolkAttackB1_1", RespawnNorBar) then
					if NorfolkStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolkBar" .. i)
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolkBar" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolkBar" .. i)
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolkBar" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderSword4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordNorfolkBar" .. i)
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordNorfolkBar" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		--
		if IsExisting("id5_bogen1") then
			local SpawnPos = GetPosition("spawn_id5_bogen1")
			if IsDestroyed("BowNorfolkBar1") and IsDestroyed("BowNorfolkBar2") and IsDestroyed("BowNorfolkBar3") then
				if Counter.Tick2("NorfolkAttackB1_2", RespawnNorBar) then
					if NorfolkStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolkBar" .. i)
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolkBar" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolkBar" .. i)
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolkBar" .. i), math.random(1, 4))
						end
					elseif NorfolkStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowNorfolkBar" .. i)
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint1" })
							AddWaypoints("BowNorfolkBar" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BowNorfolkBar" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		if IsExisting("id5_barb2") then
			local SpawnPos = GetPosition("spawn_id5_barb2")
			if NorfolkStrenght == 1 then
				if IsDestroyed("BarbNorfolkBar1") and IsDestroyed("BarbNorfolkBar2") and IsDestroyed("BarbNorfolkBar3") then
					if Counter.Tick2("NorfolkAttackB1_3", RespawnNorBar) then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1
								, 3, 0)
								, "BarbNorfolkBar" .. i)
							AddWaypoints("BarbNorfolkBar" .. i, { "Nor_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolkBar" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 2 then
				if IsDestroyed("BarbNorfolkBar1") and IsDestroyed("BarbNorfolkBar2") and IsDestroyed("BarbNorfolkBar3") and IsDestroyed("BarbNorfolkBar4") then
					if Counter.Tick2("NorfolkAttackB1_3", RespawnNorBar) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BarbNorfolkBar" .. i)
							AddWaypoints("BarbNorfolkBar" .. i, { "Nor_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolkBar" .. i), math.random(1, 4))
						end
					end
				end
			elseif NorfolkStrenght == 3 then
				if IsDestroyed("BarbNorfolkBar1") and IsDestroyed("BarbNorfolkBar2") and IsDestroyed("BarbNorfolkBar3") and IsDestroyed("BarbNorfolkBar4") and IsDestroyed("BarbNorfolkBar5") then
					if Counter.Tick2("NorfolkAttackB1_3", RespawnNorBar) then
						for i = 1, 5 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BarbNorfolkBar" .. i)
							AddWaypoints("BarbNorfolkBar" .. i, { "Nor_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint3" })
							AddWaypoints("BarbNorfolkBar" .. i, { "Bar_Waypoint4" })
							Logic.LeaderChangeFormationType(GetEntityId("BarbNorfolkBar" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		if IsDead("id5_kaserne1") and IsDead("id5_bogen1") and IsDead("id5_barb2") then
			return true
		end
	end

	StartSimpleJob("NorfolkAttackBarmeica1")


end

