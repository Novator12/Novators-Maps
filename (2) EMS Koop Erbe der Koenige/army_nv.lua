
function StartNVRush()

if CheckMode == 1 then
	RespawnNV = 7 * 60
	EvilTable = {
		[1] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[2] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[3] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[4] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[5] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[6] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[7] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[8] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[9] = 8	--SoldierAnzahl
	}
elseif CheckMode == 2 then
	RespawnNV = 5 * 60
	EvilTable = {
		[1] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[2] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[3] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[4] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[5] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[6] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[7] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[8] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[9] = 16	--SoldierAnzahl
	}
elseif CheckMode == 3 then
	RespawnNV = 3 * 60
	EvilTable = {
		[1] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[2] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[3] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[4] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[5] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[6] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[7] = Entities.CU_Evil_LeaderBearman1, --Truppentyp
		[8] = Entities.CU_Evil_LeaderSkirmisher1, --Truppentyp
		[9] = 16	--SoldierAnzahl
	}
end



function NVAttack1()
	if IsExisting("secretdef1_1") then
		local SpawnPos = GetPosition("secret_attack1")
		if IsDestroyed("NV1_1") and IsDestroyed("NV2_1") and IsDestroyed("NV3_1") and IsDestroyed("NV4_1") and IsDestroyed("NV5_1") and IsDestroyed("NV6_1") and IsDestroyed("NV7_1") and IsDestroyed("NV8_1") then
			if Counter.Tick2("NVAttackCount1", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_1")
					AddWaypoints("NV"..i.."_1", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_1", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_1", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef1_1") then
		return true
	end
end

StartSimpleJob("NVAttack1")


function NVAttack2()
	if IsExisting("secretdef2_1") then
		local SpawnPos = GetPosition("secret_attack2")
		if IsDestroyed("NV1_2") and IsDestroyed("NV2_2") and IsDestroyed("NV3_2") and IsDestroyed("NV4_2") and IsDestroyed("NV5_2") and IsDestroyed("NV6_2") and IsDestroyed("NV7_2") and IsDestroyed("NV8_2") then
			if Counter.Tick2("NVAttackCount2", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_2")
					AddWaypoints("NV"..i.."_2", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_2", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_2", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef2_1") then
		return true
	end
end

StartSimpleJob("NVAttack2")

function NVAttack3()
	if IsExisting("secretdef3_1") then
		local SpawnPos = GetPosition("secret_attack3")
		if IsDestroyed("NV1_3") and IsDestroyed("NV2_3") and IsDestroyed("NV3_3") and IsDestroyed("NV4_3") and IsDestroyed("NV5_3") and IsDestroyed("NV6_3") and IsDestroyed("NV7_3") and IsDestroyed("NV8_3") then
			if Counter.Tick2("NVAttackCount3", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_3")
					AddWaypoints("NV"..i.."_3", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_3", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_3", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef3_1") then
		return true
	end
end

StartSimpleJob("NVAttack3")

function NVAttack4()
	if IsExisting("secretdef4_1") then
		local SpawnPos = GetPosition("secret_attack4")
		if IsDestroyed("NV1_4") and IsDestroyed("NV2_4") and IsDestroyed("NV3_4") and IsDestroyed("NV4_4") and IsDestroyed("NV5_4") and IsDestroyed("NV6_4") and IsDestroyed("NV7_4") and IsDestroyed("NV8_4") then
			if Counter.Tick2("NVAttackCount4", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_4")
					AddWaypoints("NV"..i.."_4", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_4", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_4", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef4_1") then
		return true
	end
end

StartSimpleJob("NVAttack4")


function NVAttack5()
	if IsExisting("secretdef5_1") then
		local SpawnPos = GetPosition("secret_attack5")
		if IsDestroyed("NV1_5") and IsDestroyed("NV2_5") and IsDestroyed("NV3_5") and IsDestroyed("NV4_5") and IsDestroyed("NV5_5") and IsDestroyed("NV6_5") and IsDestroyed("NV7_5") and IsDestroyed("NV8_5") then
			if Counter.Tick2("NVAttackCount5", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_5")
					AddWaypoints("NV"..i.."_5", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_5", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_5", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef5_1") then
		return true
	end
end

StartSimpleJob("NVAttack5")



function NVAttack6()
	if IsExisting("secretdef6_1") then
		local SpawnPos = GetPosition("secret_attack6")
		if IsDestroyed("NV1_6") and IsDestroyed("NV2_6") and IsDestroyed("NV3_6") and IsDestroyed("NV4_6") and IsDestroyed("NV5_6") and IsDestroyed("NV6_6") and IsDestroyed("NV7_6") and IsDestroyed("NV8_6") then
			if Counter.Tick2("NVAttackCount6", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_6")
					AddWaypoints("NV"..i.."_6", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_6", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_6", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef6_1") then
		return true
	end
end

StartSimpleJob("NVAttack6")



function NVAttack7()
	if IsExisting("secretdef7_1") then
		local SpawnPos = GetPosition("secret_attack7")
		if IsDestroyed("NV1_7") and IsDestroyed("NV2_7") and IsDestroyed("NV3_7") and IsDestroyed("NV4_7") and IsDestroyed("NV5_7") and IsDestroyed("NV6_7") and IsDestroyed("NV7_7") and IsDestroyed("NV8_7") then
			if Counter.Tick2("NVAttackCount7", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_7")
					AddWaypoints("NV"..i.."_7", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_7", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_7", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef7_1") then
		return true
	end
end

StartSimpleJob("NVAttack7")


function NVAttack8()
	if IsExisting("secretdef8_1") then
		local SpawnPos = GetPosition("secret_attack8")
		if IsDestroyed("NV1_8") and IsDestroyed("NV2_8") and IsDestroyed("NV3_8") and IsDestroyed("NV4_8") and IsDestroyed("NV5_8") and IsDestroyed("NV6_8") and IsDestroyed("NV7_8") and IsDestroyed("NV8_8") then
			if Counter.Tick2("NVAttackCount8", RespawnNV) then
				for i = 1, 8 do
					SetEntityName(AI.Entity_CreateFormation(16, EvilTable[i], nil, EvilTable[9], SpawnPos.X, SpawnPos.Y, 0, 1, 3
						, 0), "NV"..i.."_8")
					AddWaypoints("NV"..i.."_8", { "N_Waypoint1" })
					AddWaypoints("NV"..i.."_8", { "N_Waypoint3" })
					AddWaypoints("NV"..i.."_8", { "N_Waypoint4" })
				end
			end
		end
	end
	if IsDead("secretdef8_1") then
		return true
	end
end

StartSimpleJob("NVAttack8")

end