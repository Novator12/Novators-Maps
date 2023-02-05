function StrongerBarbariansJob1()
	BarbStrenght = 2
end

function StrongerBarbariansJob2()
	BarbStrenght = 3
end


function DelayStrongerBarbarians1()

	if CheckMode == 1 then
		 Barbs1 = 100 * 60
	elseif CheckMode == 2 then
		Barbs1 = 80 * 60
	elseif CheckMode == 3 then
		Barbs1 = 60 * 60
	end

	StartCountdown(Barbs1,StrongerBarbariansJob1,false)
end


function DelayStrongerBarbarians2()

	if CheckMode == 1 then
		Barbs2 = 120 * 60
   elseif CheckMode == 2 then
		Barbs2 = 100 * 60
   elseif CheckMode == 3 then
		Barbs2 = 80 * 60
   end

	StartCountdown(Barbs2, StrongerBarbariansJob2, false)
end


function ActivateBarbarenAttackers()

	BarbStrenght = 1

	RespawnBarb = 70

	

	if table.getn(GetActivePlayers())>1 then
		Syncer.InvokeEvent(SyncEventID1)
		Syncer.InvokeEvent(SyncEventID2)
	else
		DelayStrongerBarbarians1()
		DelayStrongerBarbarians2()
	end
	function BarbarianAttack1()
		for j = 1, 3, 1 do
			if IsExisting("tentBarb" .. j) then
				local SpawnPos = GetPosition("spawn_tentBarb" .. j)
				if BarbStrenght == 1 then
					if IsDestroyed("SwordBarbarians1_" .. j) and IsDestroyed("SwordBarbarians2_" .. j) and IsDestroyed("SwordBarbarians3_" .. j) then
						if Counter.Tick2("BarbAttack1_" .. j, RespawnBarb) then
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians1_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians2_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_VeteranLieutenant, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians3_" .. j)
							for i = 1, 3, 1 do
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint1" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint2" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint3" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordBarbarians" .. i .. "_" .. j), math.random(1, 4))
							end
						end
					end
				elseif BarbStrenght == 2 then
					if IsDestroyed("SwordBarbarians1_"..j) and IsDestroyed("SwordBarbarians2_"..j) and IsDestroyed("SwordBarbarians3_"..j) and IsDestroyed("SwordBarbarians4_"..j) then
						if Counter.Tick2("BarbAttack1_"..j, RespawnBarb) then
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians1_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians2_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_VeteranLieutenant, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians3_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_VeteranLieutenant, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians4_" .. j)
							for i = 1, 4, 1 do
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint1" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint2" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint3" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordBarbarians" .. i .. "_" .. j), math.random(1, 4))
							end
						end
					end
				elseif BarbStrenght == 3 then
					if IsDestroyed("SwordBarbarians1_"..j) and IsDestroyed("SwordBarbarians2_"..j) and IsDestroyed("SwordBarbarians3_"..j) and IsDestroyed("SwordBarbarians4_"..j) and IsDestroyed("SwordBarbarians5_"..j) then
						if Counter.Tick2("BarbAttack1_"..j, RespawnBarb) then
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians1_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians2_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_Barbarian_LeaderClub1, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians3_" .. j)
							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_VeteranLieutenant, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians4_" .. j)

							SetEntityName(AI.Entity_CreateFormation(5, Entities.CU_VeteranLieutenant, nil, 4, SpawnPos.X, SpawnPos.Y, 0,
								1, 3
								, 0), "SwordBarbarians5_" .. j)
							for i = 1, 5, 1 do
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint1" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint2" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint3" })
								AddWaypoints("SwordBarbarians" .. i .. "_" .. j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordBarbarians" .. i .. "_" .. j), math.random(1, 4))
							end
						end
					end
				end
			end

		end

		if IsDead("tentBarb1") and IsDead("tentBarb2") and IsDead("tentBarb3") then
			return true
		end
	end


	StartSimpleJob("BarbarianAttack1")





	function BarbarianAttack2()
		for j = 1, 2, 1 do
			if IsExisting("id5_BF_tower"..j) then
				local SpawnPos = GetPosition("spawn_id5_BF_tower"..j)
				if BarbStrenght == 1 then
					if IsDestroyed("BowBarbarians1_"..j) and IsDestroyed("BowBarbarians2_"..j) then
						if Counter.Tick2("BarbAttack2_"..j, RespawnBarb) then
							for i = 1, 2 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowBarbarians"..i.."_"..j)
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowBarbarians"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif BarbStrenght == 2 then
					if IsDestroyed("BowBarbarians1_"..j) and IsDestroyed("BowBarbarians2_"..j) and IsDestroyed("BowBarbarians3_"..j) then
						if Counter.Tick2("BarbAttack2_"..j, RespawnBarb) then
							for i = 1, 3 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowBarbarians"..i.."_"..j)
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowBarbarians"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif BarbStrenght == 3 then
					if IsDestroyed("BowBarbarians1_"..j) and IsDestroyed("BowBarbarians2_"..j) and IsDestroyed("BowBarbarians3_"..j) and IsDestroyed("BowBarbarians4_"..j) then
						if Counter.Tick2("BarbAttack2_"..j, RespawnBarb) then
							for i = 1, 4 do
								SetEntityName(AI.Entity_CreateFormation(5, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "BowBarbarians"..i.."_"..j)
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint1" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint2" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint3" })
								AddWaypoints("BowBarbarians"..i.."_"..j, { "Barb_Waypoint4" })
								Logic.LeaderChangeFormationType(GetEntityId("BowBarbarians"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				end
			end

		end

		if IsDead("id5_BF_tower1") and IsDead("id5_BF_tower2") then
			return true
		end
	end


	StartSimpleJob("BarbarianAttack2")


	function BarbarianAttack3()
		if IsExisting("id5_kanonen") then
			local SpawnPos = GetPosition("spawn_id5_kanonen")
			if BarbStrenght == 1 then
				if IsDestroyed("CanonBarb1") and IsDestroyed("CanonBarb2") and IsDestroyed("CanonBarb3") then
					if Counter.Tick2("BarbAttack3_1", RespawnBarb) then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PV_Cannon3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "CanonBarb" .. i)
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint1" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint2" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint3" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint4" })
						end
					end
				end
			elseif BarbStrenght == 2 then
				if IsDestroyed("CanonBarb1") and IsDestroyed("CanonBarb2") and IsDestroyed("CanonBarb3") and IsDestroyed("CanonBarb4") then
					if Counter.Tick2("BarbAttack3_1", RespawnBarb) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PV_Cannon3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "CanonBarb" .. i)
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint1" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint2" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint3" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint4" })
						end
					end
				end
			elseif BarbStrenght == 3 then
				if IsDestroyed("CanonBarb1") and IsDestroyed("CanonBarb2") and IsDestroyed("CanonBarb3") and IsDestroyed("CanonBarb4") and IsDestroyed("CanonBarb5") then
					if Counter.Tick2("BarbAttack3_1", RespawnBarb) then
						for i = 1, 5 do
							SetEntityName(AI.Entity_CreateFormation(5, Entities.PV_Cannon4, nil, 0, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "CanonBarb" .. i)
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint1" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint2" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint3" })
							AddWaypoints("CanonBarb"..i, { "Barb_Waypoint4" })
						end
					end
				end
			end
		end

		if IsDead("id5_kanonen") then
			return true
		end
	end


	StartSimpleJob("BarbarianAttack3")

end


--FolklungAttack


function StrongerFolklungJob1()
	FolkStrenght = 2
end

function StrongerFolklungJob2()
	FolkStrenght = 3
end


function DelayStrongerFolklungJob1()

	if CheckMode == 1 then
		 Folk1 = 100 * 60
	elseif CheckMode == 2 then
		Folk1 = 80 * 60
	elseif CheckMode == 3 then
		Folk1 = 60 * 60
	end

	StartCountdown(Folk1,StrongerFolklungJob1,false)
end


function DelayStrongerFolklungJob2()

	if CheckMode == 1 then
		Folk2 = 120 * 60
   elseif CheckMode == 2 then
		Folk2 = 100 * 60
   elseif CheckMode == 3 then
		Folk2 = 80 * 60
   end

	StartCountdown(Folk2, StrongerFolklungJob2, false)
end


function ActivateFolklungAttackers()
	FolkStrenght = 1

	RespawnFolk = 55


	if table.getn(GetActivePlayers())>1 then
		Syncer.InvokeEvent(SyncEventID3)
		Syncer.InvokeEvent(SyncEventID4)
	else
		DelayStrongerFolklungJob1()
		DelayStrongerFolklungJob2()
	end

	function FolklungAttack1()
		for j = 1, 3, 1 do
			if IsExisting("id4_kaserne"..j) then
				local SpawnPos = GetPosition("spawn_id4_kaserne"..j)
				if FolkStrenght == 1 then
					if IsDestroyed("SwordFolklung1_"..j) and IsDestroyed("SwordFolklung2_"..j) then
						if Counter.Tick2("FolklungAttack1_"..j, RespawnFolk) then
							for i = 1, 2 do
								SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderSword3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordFolklung"..i.."_"..j)
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint1" })
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint2" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordFolklung"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif FolkStrenght == 2 then
					if IsDestroyed("SwordFolklung1_"..j) and IsDestroyed("SwordFolklung2_"..j) and IsDestroyed("SwordFolklung3_"..j) then
						if Counter.Tick2("FolklungAttack1_"..j, RespawnFolk) then
							for i = 1, 3 do
								SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderSword3, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordFolklung"..i.."_"..j)
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint1" })
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint2" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordFolklung"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				elseif FolkStrenght == 3 then
					if IsDestroyed("SwordFolklung1_"..j) and IsDestroyed("SwordFolklung2_"..j) and IsDestroyed("SwordFolklung3_"..j) and IsDestroyed("SwordFolklung4_"..j) then
						if Counter.Tick2("FolklungAttack1_"..j, RespawnFolk) then
							for i = 1, 4 do
								SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderSword4, nil, 8, SpawnPos.X, SpawnPos.Y, 0,
									1, 3
									, 0), "SwordFolklung"..i.."_"..j)
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint1" })
								AddWaypoints("SwordFolklung"..i.."_"..j, { "F_Waypoint2" })
								Logic.LeaderChangeFormationType(GetEntityId("SwordFolklung"..i.."_"..j), math.random(1, 4))
							end
						end
					end
				end
			end

		end

		if IsDead("id4_kaserne1") and IsDead("id4_kaserne2") and IsDead("id4_kaserne3") then
			return true
		end
	end

	StartSimpleJob("FolklungAttack1")

	function FolklungAttack2()
		if IsExisting("id4_archery") then
			local SpawnPos = GetPosition("spawn_id4_archery")
			if FolkStrenght == 1 then
				if IsDestroyed("BowFolklung1") and IsDestroyed("BowFolklung2") then
					if Counter.Tick2("FolklungAttack2_1", RespawnFolk) then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BowFolklung" .. i)
							AddWaypoints("BowFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("BowFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("BowFolklung" .. i), math.random(1, 4))
						end
					end
				end
			elseif FolkStrenght == 2 then
				if IsDestroyed("BowFolklung1") and IsDestroyed("BowFolklung2") and IsDestroyed("BowFolklung3") then
					if Counter.Tick2("FolklungAttack2_1", RespawnFolk) then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BowFolklung" .. i)
							AddWaypoints("BowFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("BowFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("BowFolklung" .. i), math.random(1, 4))
						end
					end
				end
			elseif FolkStrenght == 3 then
				if IsDestroyed("BowFolklung1") and IsDestroyed("BowFolklung2") and IsDestroyed("BowFolklung3") and IsDestroyed("BowFolklung4") then
					if Counter.Tick2("FolklungAttack2_1", RespawnFolk) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "BowFolklung" .. i)
							AddWaypoints("BowFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("BowFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("BowFolklung" .. i), math.random(1, 4))
						end
					end
				end
			end
		end

		if IsDead("id4_archery") then
			return true
		end
	end


	StartSimpleJob("FolklungAttack2")


	function FolklungAttack3()
		if IsExisting("id4_reiter") then
			local SpawnPos = GetPosition("spawn_id4_reiter")
			if FolkStrenght == 1 then
				if IsDestroyed("ReiterFolklung1") and IsDestroyed("ReiterFolklung2") then
					if Counter.Tick2("FolklungAttack3_1", RespawnFolk) then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderCavalry1, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "ReiterFolklung" .. i)
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("ReiterFolklung" .. i), math.random(1, 4))
						end
					end
				end
			elseif FolkStrenght == 2 then
				if IsDestroyed("ReiterFolklung1") and IsDestroyed("ReiterFolklung2") and IsDestroyed("ReiterFolklung3") then
					if Counter.Tick2("FolklungAttack3_1", RespawnFolk) then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderCavalry1, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "ReiterFolklung" .. i)
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("ReiterFolklung" .. i), math.random(1, 4))
						end
					end
				end
			elseif FolkStrenght == 3 then
				if IsDestroyed("ReiterFolklung1") and IsDestroyed("ReiterFolklung2") and IsDestroyed("ReiterFolklung3") and IsDestroyed("ReiterFolklung4") then
					if Counter.Tick2("FolklungAttack3_1", RespawnFolk) then
						for i = 1, 4 do
							SetEntityName(AI.Entity_CreateFormation(4, Entities.PU_LeaderCavalry2, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0), "ReiterFolklung" .. i)
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint1" })
							AddWaypoints("ReiterFolklung"..i, { "F_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("ReiterFolklung" .. i), math.random(1, 4))
						end
					end
				end
			end
		end

		if IsDead("id4_reiter") then
			return true
		end
	end


	StartSimpleJob("FolklungAttack3")
end