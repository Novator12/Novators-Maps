function ActivateBarmeciaAttackers()

	RespawnBar = 60



	--BarmeciaAttack

	BarStrenght = 1


	function StrongerBarmeciaJob1()
		if IsExisting("BarKaserne") or IsExisting("BarArchery") or IsExisting("BarReiter") or IsExisting("BarKanonen") then
			Message("@color:255,0,0 Achtung: @color:255,255,255 Barmecia hat aufgerüstet!")
			BarStrenght = 2
		end
	end

	function StrongerBarmeciaJob2()
		if IsExisting("BarKaserne") or IsExisting("BarArchery") or IsExisting("BarReiter") or IsExisting("BarKanonen")   then
			Message("@color:255,0,0 Achtung: @color:255,255,255 Barmecia hat aufgerüstet!")
			BarStrenght = 3
		end
	end


	function DelayStrongerBarmeica1()

		if CheckMode == 1 then
			 Bar1 = 30 * 60
		elseif CheckMode == 2 then
			Bar1 = 25 * 60
		elseif CheckMode == 3 then
			Bar1 = 20 * 60
		end

		StartCountdown(Bar1,StrongerBarmeciaJob1,false)
	end


	function DelayStrongerBarmeica2()

		if CheckMode == 1 then
			Bar2 = 60 * 60
	   elseif CheckMode == 2 then
			Bar2 = 50 * 60
	   elseif CheckMode == 3 then
			Bar2 = 40 * 60
	   end

		StartCountdown(Bar2, StrongerBarmeciaJob2, false)
	end




	function BarmeciaFight1()
		if IsExisting("BarKaserne") then
			local SpawnPos = GetPosition("spawn_BarKaserne")
			if IsDestroyed("SwordBarmecia1") and IsDestroyed("SwordBarmecia2") and IsDestroyed("SwordBarmecia3") then
				if Counter.Tick2("BarmeciaFight1_1", RespawnBar) then
					if BarStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderSword2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordBarmecia" .. i)
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordBarmecia" .. i), math.random(1, 4))
						end
					elseif BarStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderSword3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordBarmecia" .. i)
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordBarmecia" .. i), math.random(1, 4))
						end
					elseif BarStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderSword4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
								, 0), "SwordBarmecia" .. i)
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("SwordBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("SwordBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("SwordBarmecia" .. i), math.random(1, 4))
						end
					end
				end
			end
			--
		end
		if IsExisting("BarArchery") then
			local SpawnPos = GetPosition("spawn_BarArchery")
			if IsDestroyed("BowBarmecia1") and IsDestroyed("BowBarmecia2") and IsDestroyed("BowBarmecia3") then
				if Counter.Tick2("BarmeciaFight1_2", RespawnBar) then
					if BarStrenght == 1 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderBow2, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowBarmecia" .. i)
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("BowBarmecia" .. i), math.random(1, 4))
						end
					elseif BarStrenght == 2 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderBow3, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowBarmecia" .. i)
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("BowBarmecia" .. i), math.random(1, 4))
						end
					elseif BarStrenght == 3 then
						for i = 1, 3 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderBow4, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "BowBarmecia" .. i)
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("BowBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("BowBarmecia" .. i, { "Nor_Waypoint1" })
							Logic.LeaderChangeFormationType(GetEntityId("BowBarmecia" .. i), math.random(1, 4))
						end
					end
				end
			end
		end
		if IsExisting("BarReiter") then
			local SpawnPos = GetPosition("spawn_BarReiter")
			if IsDestroyed("HorseBarmecia1") and IsDestroyed("HorseBarmecia2") and IsDestroyed("HorseBarmecia3") then
				if Counter.Tick2("BarmeciaFight1_3", RespawnBar) then
					if BarStrenght == 1 then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderCavalry1, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "HorseBarmecia" .. i)
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint1" })
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint2" })
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint3" })
							AddWaypoints("HorseBarmecia" .. i, { "Nor_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("HorseBarmecia" .. i), math.random(1, 4))
						end
						SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderHeavyCavalry1, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "HorseBarmecia3")
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint1" })
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint2" })
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint3" })
							AddWaypoints("HorseBarmecia3", { "Nor_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("HorseBarmecia3"), math.random(1, 4))
					elseif BarStrenght == 2 or BarStrenght == 3 then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderCavalry2, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "HorseBarmecia" .. i)
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint1" })
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint2" })
							AddWaypoints("HorseBarmecia" .. i, { "Bar_Waypoint3" })
							AddWaypoints("HorseBarmecia" .. i, { "Nor_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("HorseBarmecia" .. i), math.random(1, 4))
						end
						SetEntityName(AI.Entity_CreateFormation(3, Entities.PU_LeaderHeavyCavalry2, nil, 3, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "HorseBarmecia3")
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint1" })
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint2" })
							AddWaypoints("HorseBarmecia3", { "Bar_Waypoint3" })
							AddWaypoints("HorseBarmecia3", { "Nor_Waypoint2" })
							Logic.LeaderChangeFormationType(GetEntityId("HorseBarmecia3"), math.random(1, 4))
					end
				end
			end
		end

		if IsExisting("BarKanonen") then
			local SpawnPos = GetPosition("spawn_BarKanonen")
			if IsDestroyed("CannonBarmecia1") and IsDestroyed("CannonBarmecia2") then
				if Counter.Tick2("BarmeciaFight1_4", RespawnBar) then
					if BarStrenght == 1 then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PV_Cannon1, nil, 0, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "CannonBarmecia" .. i)
							AddWaypoints("CannonBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("CannonBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("CannonBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("CannonBarmecia" .. i, { "Nor_Waypoint1" })
						end
					elseif BarStrenght == 2 or BarStrenght == 3 then
						for i = 1, 2 do
							SetEntityName(AI.Entity_CreateFormation(3, Entities.PV_Cannon2, nil, 0, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
								, "CannonBarmecia" .. i)
							AddWaypoints("CannonBarmecia" .. i, { "Bar_Waypoint5" })
							AddWaypoints("CannonBarmecia" .. i, { "Bar_Waypoint6" })
							AddWaypoints("CannonBarmecia" .. i, { "Nor_Waypoint2" })
							AddWaypoints("CannonBarmecia" .. i, { "Nor_Waypoint1" })
						end
					end
				end
			end
		end

		if IsDead("BarKaserne") and IsDead("BarArchery") and IsDead("BarReiter") and IsDead("BarKanonen") then
			return true
		end
	end

	StartSimpleJob("BarmeciaFight1")


end


