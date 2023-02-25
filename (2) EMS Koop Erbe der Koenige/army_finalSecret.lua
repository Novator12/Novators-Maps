--------------------------Barmecia-------------------------------------------------------------------------------------------------------------------------------------------
function SetupBarmeciaFinal4()
	if CheckMode == 1 then
		RespawnBarF = 7 * 60
		BarSwordFTable = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnBarF = 5 * 60
		BarSwordFTable = {
			[1] = Entities.PU_LeaderSword4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnBarF = 3 * 60
		BarSwordFTable = {
			[1] = Entities.PU_LeaderSword4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnBarF = 7 * 60
		BarBowFTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnBarF = 5 * 60
		BarBowFTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnBarF = 3 * 60
		BarBowFTable = {
			[1] = Entities.PU_LeaderBow4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnBarF = 7 * 60
		BarCanon1FTable = {
			[1] = Entities.PV_Cannon1, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnBarF = 5 * 60
		BarCanon1FTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnBarF = 3 * 60
		BarCanon1FTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnBarF = 7 * 60
		BarCanon2FTable = {
			[1] = Entities.PV_Cannon2, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnBarF = 5 * 60
		BarCanon2FTable = {
			[1] = Entities.PV_Cannon4, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnBarF = 3 * 60
		BarCanon2FTable = {
			[1] = Entities.PV_Cannon4, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnBarF = 7 * 60
		BarCavFTable = {
			[1] = Entities.PU_LeaderHeavyCavalry1, --Truppentyp
			[2] = 3 --SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnBarF = 5 * 60
		BarCavFTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnBarF = 3 * 60
		BarCavFTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	end

end


function ActivateBarmeciaFinal4()

	function BarmeciaSwordFAttack()
		if IsExisting("BarKaserne") then
			local SpawnPos = GetPosition("spawn_BarKaserne")
			if IsDestroyed("SwordBarF1") and IsDestroyed("SwordBarF2") and IsDestroyed("SwordBarF3") and IsDestroyed("SwordBarF4") then
				if Counter.Tick2("BarFAttack1", RespawnBarF) then
					for i = 1, 4 do
						SetEntityName(AI.Entity_CreateFormation(3, BarSwordFTable[1], nil, BarSwordFTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "SwordBarF" .. i)
						AddWaypoints("SwordBarF" .. i, { "VargPoint2" })
						AddWaypoints("SwordBarF" .. i, { "N_Waypoint3" })
						AddWaypoints("SwordBarF" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("SwordBarF" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("BarKaserne") then
			return true
		end
	end

	StartSimpleJob("BarmeciaSwordFAttack")



	function BarmeciaBowFAttack()
		if IsExisting("BarArchery") then
			local SpawnPos = GetPosition("spawn_BarArchery")
			if IsDestroyed("BowBarF1") and IsDestroyed("BowBarF2") and IsDestroyed("BowBarF3") and IsDestroyed("BowBarF4") then
				if Counter.Tick2("BarFAttack2", RespawnBarF) then
					for i = 1, 4 do
						SetEntityName(AI.Entity_CreateFormation(3, BarBowFTable[1], nil, BarBowFTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "BowBarF" .. i)
						AddWaypoints("BowBarF" .. i, { "VargPoint2" })
						AddWaypoints("BowBarF" .. i, { "N_Waypoint3" })
						AddWaypoints("BowBarF" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("BowBarF" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("BarArchery") then
			return true
		end
	end

	StartSimpleJob("BarmeciaBowFAttack")



	function BarmeciaCanon1FAttack()
		if IsExisting("BarKanonen") then
			local SpawnPos = GetPosition("spawn_BarKanonen")
			if IsDestroyed("Canon1BarF1") and IsDestroyed("Canon1BarF2") then
				if Counter.Tick2("BarFAttack3", RespawnBarF) then
					for i = 1, 2 do
						SetEntityName(AI.Entity_CreateFormation(3, BarCanon1FTable[1], nil, BarCanon1FTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "Canon1BarF" .. i)
						AddWaypoints("Canon1BarF" .. i, { "VargPoint2" })
						AddWaypoints("Canon1BarF" .. i, { "N_Waypoint3" })
						AddWaypoints("Canon1BarF" .. i, { "N_Waypoint4" })
					end
				end
			end
		end
		if IsDead("BarKanonen") then
			return true
		end
	end

	StartSimpleJob("BarmeciaCanon1FAttack")


	function BarmeciaCanon2FAttack()
		if IsExisting("BarKanonen") then
			local SpawnPos = GetPosition("spawn_BarKanonen")
			if IsDestroyed("Canon2BarF1") and IsDestroyed("Canon2BarF2") then
				if Counter.Tick2("BarFAttack4", RespawnBarF) then
					for i = 1, 2 do
						SetEntityName(AI.Entity_CreateFormation(3, BarCanon2FTable[1], nil, BarCanon2FTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "Canon2BarF" .. i)
						AddWaypoints("Canon2BarF" .. i, { "VargPoint2" })
						AddWaypoints("Canon2BarF" .. i, { "N_Waypoint3" })
						AddWaypoints("Canon2BarF" .. i, { "N_Waypoint4" })
					end
				end
			end
		end
		if IsDead("BarKanonen") then
			return true
		end
	end

	StartSimpleJob("BarmeciaCanon2FAttack")


	function BarmeciaCavFAttack()
		if IsExisting("BarReiter") then
			local SpawnPos = GetPosition("spawn_BarReiter")
			if IsDestroyed("CavBarF1") and IsDestroyed("CavBarF2") and IsDestroyed("CavBarF3") then
				if Counter.Tick2("BarFAttack5", RespawnBarF) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(3, BarSwordFTable[1], nil, BarSwordFTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "CavBarF" .. i)
						AddWaypoints("CavBarF" .. i, { "VargPoint2" })
						AddWaypoints("CavBarF" .. i, { "N_Waypoint3" })
						AddWaypoints("CavBarF" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("CavBarF" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("BarReiter") then
			return true
		end
	end

	StartSimpleJob("BarmeciaCavFAttack")
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------Folklung-----------------------------------------------------------------------------------------------------------------------------------

function SetupFolklungFinal4()
	if CheckMode == 1 then
		RespawnFolkF = 7 * 60
		FolkSword1Table = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnFolkF = 5 * 60
		FolkSword1Table = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnFolkF = 3 * 60
		FolkSword1Table = {
			[1] = Entities.PU_LeaderSword4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnFolkF = 7 * 60
		FolkBowTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnFolkF = 5 * 60
		FolkBowTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnFolkF = 3 * 60
		FolkBowTable = {
			[1] = Entities.PU_LeaderBow4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnFolkF = 7 * 60
		FolkCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry1, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnFolkF = 5 * 60
		FolkCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnFolkF = 3 * 60
		FolkCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	end
end

function ActivateFolklungFinal4()

	function FolklungSwordFin1()
		if IsExisting("id4_kaserne1") then
			local SpawnPos = GetPosition("spawn_id4_kaserne1")
			if IsDestroyed("FolkSword1_1") and IsDestroyed("FolkSword1_2") and IsDestroyed("FolkSword1_3") then
				if Counter.Tick2("FolkAttack1", RespawnFolkF) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(4, FolkSword1Table[1], nil, FolkSword1Table[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "FolkSword1_" .. i)
						AddWaypoints("FolkSword1_" .. i, { "Varg_MainDef2" })
						AddWaypoints("FolkSword1_" .. i, { "Bar_Waypoint3" })
						AddWaypoints("FolkSword1_" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("FolkSword1_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id4_kaserne1") then
			return true
		end
	end

	StartSimpleJob("FolklungSwordFin1")


	function FolklungSwordFin2()
		if IsExisting("id4_kaserne2") then
			local SpawnPos = GetPosition("spawn_id4_kaserne2")
			if IsDestroyed("FolkSword2_1") and IsDestroyed("FolkSword2_2") and IsDestroyed("FolkSword2_3") then
				if Counter.Tick2("FolkAttack2", RespawnFolkF) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(4, FolkSword1Table[1], nil, FolkSword1Table[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "FolkSword2_" .. i)
						AddWaypoints("FolkSword2_" .. i, { "Varg_MainDef2" })
						AddWaypoints("FolkSword2_" .. i, { "Bar_Waypoint3" })
						AddWaypoints("FolkSword2_" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("FolkSword2_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id4_kaserne2") then
			return true
		end
	end

	StartSimpleJob("FolklungSwordFin2")


	function FolklungSwordFin3()
		if IsExisting("id4_kaserne3") then
			local SpawnPos = GetPosition("spawn_id4_kaserne3")
			if IsDestroyed("FolkSword3_1") and IsDestroyed("FolkSword3_2") and IsDestroyed("FolkSword3_3") then
				if Counter.Tick2("FolkAttack3", RespawnFolkF) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(4, FolkSword1Table[1], nil, FolkSword1Table[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "FolkSword3_" .. i)
						AddWaypoints("FolkSword3_" .. i, { "Varg_MainDef2" })
						AddWaypoints("FolkSword3_" .. i, { "Bar_Waypoint3" })
						AddWaypoints("FolkSword3_" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("FolkSword3_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id4_kaserne3") then
			return true
		end
	end

	StartSimpleJob("FolklungSwordFin3")



	function FolklungBowFin()
		if IsExisting("id4_archery") then
			local SpawnPos = GetPosition("spawn_id4_archery")
			if IsDestroyed("FolkBow1") and IsDestroyed("FolkBow2") and IsDestroyed("FolkBow3") then
				if Counter.Tick2("FolkAttack4", RespawnFolkF) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(4, FolkBowTable[1], nil, FolkBowTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "FolkBow" .. i)
						AddWaypoints("FolkBow" .. i, { "Varg_MainDef2" })
						AddWaypoints("FolkBow" .. i, { "Bar_Waypoint3" })
						AddWaypoints("FolkBow" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("FolkBow" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id4_archery") then
			return true
		end
	end

	StartSimpleJob("FolklungBowFin")


	function FolklungCavFin()
		if IsExisting("id4_reiter") then
			local SpawnPos = GetPosition("spawn_id4_reiter")
			if IsDestroyed("FolkCav1") and IsDestroyed("FolkCav2") and IsDestroyed("FolkCav3") and IsDestroyed("FolkCav4") and IsDestroyed("FolkCav5") then
				if Counter.Tick2("FolkAttack5", RespawnFolkF) then
					for i = 1, 5 do
						SetEntityName(AI.Entity_CreateFormation(4, FolkCavTable[1], nil, FolkCavTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "FolkCav" .. i)
						AddWaypoints("FolkCav" .. i, { "Varg_MainDef2" })
						AddWaypoints("FolkCav" .. i, { "Bar_Waypoint3" })
						AddWaypoints("FolkCav" .. i, { "N_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("FolkCav" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id4_reiter") then
			return true
		end
	end

	StartSimpleJob("FolklungCavFin")

end




-------------------------------------Outpost Folklung-------------------------------------------------------------------------------------------------------------------------------
function SetupOutpostFinal4()
	if CheckMode == 1 then
		RespawnOut = 7 * 60
		OutSwordTable = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnOut = 5 * 60
		OutSwordTable = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnOut = 3 * 60
		OutSwordTable = {
			[1] = Entities.PU_LeaderSword4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnOut = 7 * 60
		OutBowTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnOut = 5 * 60
		OutBowTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnOut = 3 * 60
		OutBowTable = {
			[1] = Entities.PU_LeaderBow4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end

	if CheckMode == 1 then
		RespawnOut = 7 * 60
		OutCanTable = {
			[1] = Entities.PV_Cannon2, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnOut = 5 * 60
		OutCanTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnOut = 3 * 60
		OutCanTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnOut = 7 * 60
		OutCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry1, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnOut = 5 * 60
		OutCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnOut = 3 * 60
		OutCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	end
end


function ActivateOutpostFinal4()

	function OutSword()
		if IsExisting("out_kaserne") then
			local SpawnPos = GetPosition("spawn_out_kaserne")
			if IsDestroyed("OutSword1") and IsDestroyed("OutSword2") and IsDestroyed("OutSword3") and IsDestroyed("OutSword4") then
				if Counter.Tick2("OutAttack1", RespawnOut) then
					for i = 1, 4 do
						SetEntityName(AI.Entity_CreateFormation(4, OutSwordTable[1], nil, OutSwordTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "OutSword" .. i)
						AddWaypoints("OutSword" .. i, { "B_Waypoint2" })
						AddWaypoints("OutSword" .. i, { "B_Waypoint3" })
						AddWaypoints("OutSword" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("OutSword" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("out_kaserne") then
			return true
		end
	end

	StartSimpleJob("OutSword")



	function OutBow()
		if IsExisting("out_archery") then
			local SpawnPos = GetPosition("spawn_out_archery")
			if IsDestroyed("OutBow1") and IsDestroyed("OutBow2") and IsDestroyed("OutBow3") and IsDestroyed("OutBow4") then
				if Counter.Tick2("OutAttack2", RespawnOut) then
					for i = 1, 4 do
						SetEntityName(AI.Entity_CreateFormation(4, OutBowTable[1], nil, OutBowTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "OutBow" .. i)
						AddWaypoints("OutBow" .. i, { "B_Waypoint2" })
						AddWaypoints("OutBow" .. i, { "B_Waypoint3" })
						AddWaypoints("OutBow" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("OutBow" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("out_archery") then
			return true
		end
	end

	StartSimpleJob("OutBow")


	function OutCannon()
		if IsExisting("out_kanonen") then
			local SpawnPos = GetPosition("spawn_out_kanonen")
			if IsDestroyed("OutCan1") and IsDestroyed("OutCan2") and IsDestroyed("OutCan3") then
				if Counter.Tick2("OutAttack3", RespawnOut) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(4, OutCanTable[1], nil, OutCanTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "OutCan" .. i)
						AddWaypoints("OutCan" .. i, { "B_Waypoint2" })
						AddWaypoints("OutCan" .. i, { "B_Waypoint3" })
						AddWaypoints("OutCan" .. i, { "B_Waypoint4" })
					end
				end
			end
		end
		if IsDead("out_kanonen") then
			return true
		end
	end

	StartSimpleJob("OutCannon")



	function OutCav()
		if IsExisting("out_stable") then
			local SpawnPos = GetPosition("spawn_out_stable")
			if IsDestroyed("OutCav1") and IsDestroyed("OutCav2") and IsDestroyed("OutCav3") and IsDestroyed("OutCav4") then
				if Counter.Tick2("OutAttack4", RespawnOut) then
					for i = 1, 4 do
						SetEntityName(AI.Entity_CreateFormation(4, OutCavTable[1], nil, OutCavTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "OutCav" .. i)
						AddWaypoints("OutCav" .. i, { "B_Waypoint2" })
						AddWaypoints("OutCav" .. i, { "B_Waypoint3" })
						AddWaypoints("OutCav" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("OutCav" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("out_stable") then
			return true
		end
	end

	StartSimpleJob("OutCav")
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------Dario-----------------------------------------------------------------------------
function SetupDarioFinal4()

	if CheckMode == 1 then
		RespawnDar = 7 * 60
		DarSwordTable = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnDar = 5 * 60
		DarSwordTable = {
			[1] = Entities.PU_LeaderSword3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnDar = 3 * 60
		DarSwordTable = {
			[1] = Entities.PU_LeaderSword4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnDar = 7 * 60
		DarBowTable = {
			[1] = Entities.PU_LeaderBow3, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnDar = 5 * 60
		DarBowTable = {
			[1] = Entities.PU_LeaderBow4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnDar = 3 * 60
		DarBowTable = {
			[1] = Entities.PU_LeaderBow4, --Truppentyp
			[2] = 8	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnDar = 7 * 60
		DarCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry1, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnDar = 5 * 60
		DarCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3 --SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnDar = 3 * 60
		DarCavTable = {
			[1] = Entities.PU_LeaderHeavyCavalry2, --Truppentyp
			[2] = 3	--SoldierAnzahl
		}
	end


	if CheckMode == 1 then
		RespawnDar = 7 * 60
		DarCanTable = {
			[1] = Entities.PV_Cannon2, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 2 then
		RespawnDar = 5 * 60
		DarCanTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	elseif CheckMode == 3 then
		RespawnDar = 3 * 60
		DarCanTable = {
			[1] = Entities.PV_Cannon3, --Truppentyp
			[2] = 0	--SoldierAnzahl
		}
	end
end

function ActivateDarioFinal4()

	function DarioSword1()
		if IsExisting("id7_kaserne1") then
			local SpawnPos = GetPosition("spawn_id7_kaserne1")
			if IsDestroyed("DarSword1_1") and IsDestroyed("DarSword1_2") and IsDestroyed("DarSword1_3") then
				if Counter.Tick2("DarAttack1", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarSwordTable[1], nil, DarSwordTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarSword1_" .. i)
						AddWaypoints("DarSword1_" .. i, { "DarioDef3" })
						AddWaypoints("DarSword1_" .. i, { "B_Waypoint2" })
						AddWaypoints("DarSword1_" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("DarSword1_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id7_kaserne1") then
			return true
		end
	end

	StartSimpleJob("DarioSword1")


	function DarioSword2()
		if IsExisting("id7_kaserne2") then
			local SpawnPos = GetPosition("spawn_id7_kaserne2")
			if IsDestroyed("DarSword2_1") and IsDestroyed("DarSword2_2") and IsDestroyed("DarSword2_3") then
				if Counter.Tick2("DarAttack2", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarSwordTable[1], nil, DarSwordTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarSword2_" .. i)
						AddWaypoints("DarSword2_" .. i, { "DarioDef3" })
						AddWaypoints("DarSword2_" .. i, { "B_Waypoint2" })
						AddWaypoints("DarSword2_" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("DarSword2_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id7_kaserne2") then
			return true
		end
	end

	StartSimpleJob("DarioSword2")



	function DarioBow1()
		if IsExisting("id7_archery1") then
			local SpawnPos = GetPosition("spawn_id7_archery1")
			if IsDestroyed("DarBow1_1") and IsDestroyed("DarBow1_2") and IsDestroyed("DarBow1_3") then
				if Counter.Tick2("DarAttack3", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarBowTable[1], nil, DarBowTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarBow1_" .. i)
						AddWaypoints("DarBow1_" .. i, { "DarioDef3" })
						AddWaypoints("DarBow1_" .. i, { "B_Waypoint2" })
						AddWaypoints("DarBow1_" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("DarBow1_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id7_archery1") then
			return true
		end
	end

	StartSimpleJob("DarioBow1")


	function DarioBow2()
		if IsExisting("id7_archery2") then
			local SpawnPos = GetPosition("spawn_id7_archery2")
			if IsDestroyed("DarBow2_1") and IsDestroyed("DarBow2_2") and IsDestroyed("DarBow2_3") then
				if Counter.Tick2("DarAttack4", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarBowTable[1], nil, DarBowTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarBow2_" .. i)
						AddWaypoints("DarBow2_" .. i, { "DarioDef3" })
						AddWaypoints("DarBow2_" .. i, { "B_Waypoint2" })
						AddWaypoints("DarBow2_" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("DarBow2_" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id7_archery2") then
			return true
		end
	end

	StartSimpleJob("DarioBow2")


	function DarioStable()
		if IsExisting("id7_reiter") then
			local SpawnPos = GetPosition("spawn_id7_reiter")
			if IsDestroyed("DarCav1") and IsDestroyed("DarCav2") and IsDestroyed("DarCav3") then
				if Counter.Tick2("DarAttack5", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarCavTable[1], nil, DarCavTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarCav" .. i)
						AddWaypoints("DarCav" .. i, { "DarioDef3" })
						AddWaypoints("DarCav" .. i, { "B_Waypoint2" })
						AddWaypoints("DarCav" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("DarCav" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("id7_reiter") then
			return true
		end
	end

	StartSimpleJob("DarioStable")



	function DarioCannon()
		if IsExisting("id7_kanonen") then
			local SpawnPos = GetPosition("spawn_id7_kanonen")
			if IsDestroyed("DarCan1") and IsDestroyed("DarCan2") and IsDestroyed("DarCan3") then
				if Counter.Tick2("DarAttack6", RespawnDar) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(7, DarCanTable[1], nil, DarCanTable[2], SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "DarCan" .. i)
						AddWaypoints("DarCan" .. i, { "DarioDef3" })
						AddWaypoints("DarCan" .. i, { "B_Waypoint2" })
						AddWaypoints("DarCan" .. i, { "B_Waypoint4" })
					end
				end
			end
		end
		if IsDead("id7_kanonen") then
			return true
		end
	end

	StartSimpleJob("DarioCannon")

end

function SetupFinalFight4()
	SetupBarmeciaFinal4()
	SetupFolklungFinal4()
	SetupOutpostFinal4()
	SetupDarioFinal4()
end

function CreateFinalFight4()
	ActivateBarmeciaFinal4()
	ActivateFolklungFinal4()
	ActivateOutpostFinal4()
	ActivateDarioFinal4()
end