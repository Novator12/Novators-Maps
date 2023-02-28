function StopID8Def1()
	if IsDestroyed("id8_turm") then
		DefensiveArmy.StopRespawn(banditID8TowerDef)
		return true;
	end
end


function StopID8Def2()
	if IsDestroyed("id8_kanonen") then
		DefensiveArmy.StopRespawn(banditID8CanonDef)
		return true;
	end
end

function StopID8Def3()
	if IsDestroyed("id8_kaserne") then
		DefensiveArmy.StopRespawn(banditID8KasernenDef)
		return true;
	end
end

function StopID8Def4()
	if IsDestroyed("id8_archery") then
		DefensiveArmy.StopRespawn(banditID8ArcheryDef)
		return true;
	end
end

function StopID8Def5()
	if IsDestroyed("hq8") then
		DefensiveArmy.StopRespawn(banditID8HqDef)
		return true;
	end
end





function StopID7Def1()
	if IsDestroyed("id7_reiter") then
		DefensiveArmy.StopRespawn(DarioID7ReiterDef)
		return true;
	end
end


function StopID7Def2()
	if IsDestroyed("id7_kanonen") then
		DefensiveArmy.StopRespawn(DarioID7CanonDef)
		return true;
	end
end

function StopID7Def3()
	if IsDestroyed("id7_kaserne1") then
		DefensiveArmy.StopRespawn(DarioID7KasernenDef)
		return true;
	end
end

function StopID7Def4()
	if IsDestroyed("id7_archery2") then
		DefensiveArmy.StopRespawn(DarioID7ArcheryDef)
		return true;
	end
end

function StopID7Def5()
	if IsDestroyed("hq7") then
		DefensiveArmy.StopRespawn(DarioID7HqDef)
		return true;
	end
end





function StrongerID8AndID7_2()
	--Upgrade Bandits 

	DefensiveArmy.ReplaceTroopTypes(banditID8CanonDef,Entities.PV_Cannon3,Entities.PV_Cannon4)
	DefensiveArmy.ReplaceTroopTypes(banditID8KasernenDef,Entities.PU_LeaderSword3,Entities.PU_LeaderSword4)
	DefensiveArmy.ReplaceTroopTypes(banditID8ArcheryDef,Entities.PU_LeaderBow3,Entities.PU_LeaderBow4)


	--Upgrade Dario

	DefensiveArmy.ReplaceTroopTypes(DarioID7ReiterDef,Entities.PU_LeaderCavalry1,Entities.PU_LeaderCavalry2)
	DefensiveArmy.ReplaceTroopTypes(DarioID7ReiterDef,Entities.PU_LeaderHeavyCavalry1,Entities.PU_LeaderHeavyCavalry2)
	DefensiveArmy.ReplaceTroopTypes(DarioID7CanonDef,Entities.PV_Cannon3,Entities.PV_Cannon4)
	DefensiveArmy.ReplaceTroopTypes(DarioID7KasernenDef,Entities.PU_LeaderSword3,Entities.PU_LeaderSword4)
	DefensiveArmy.ReplaceTroopTypes(DarioID7ArcheryDef,Entities.PU_LeaderBow3,Entities.PU_LeaderBow4)
	DefensiveArmy.ReplaceTroopTypes(DarioID7HqDef,Entities.PU_LeaderPoleArm3,Entities.PU_LeaderPoleArm4)
	DefensiveArmy.ReplaceTroopTypes(DarioID7HqDef,Entities.PU_LeaderRifle1,Entities.PU_LeaderRifle2)

end

function StrongerID8AndID7_1()

	--Upgrade Bandits 
	DefensiveArmy.ReplaceTroopTypes(banditID8CanonDef,Entities.PV_Cannon2,Entities.PV_Cannon3)
	DefensiveArmy.ReplaceTroopTypes(banditID8KasernenDef,Entities.PU_LeaderSword2,Entities.PU_LeaderSword3)
	DefensiveArmy.ReplaceTroopTypes(banditID8ArcheryDef,Entities.PU_LeaderBow2,Entities.PU_LeaderBow3)

	--Upgrade Dario
	DefensiveArmy.ReplaceTroopTypes(DarioID7CanonDef,Entities.PV_Cannon2,Entities.PV_Cannon3)
	DefensiveArmy.ReplaceTroopTypes(DarioID7KasernenDef,Entities.PU_LeaderSword2,Entities.PU_LeaderSword3)
	DefensiveArmy.ReplaceTroopTypes(DarioID7ArcheryDef,Entities.PU_LeaderBow2,Entities.PU_LeaderBow3)
	DefensiveArmy.ReplaceTroopTypes(DarioID7HqDef,Entities.PU_LeaderPoleArm2,Entities.PU_LeaderPoleArm3)
	

	CounterDario2 = StartCountdown(20*60,StrongerID8AndID7_2,false)
end


function ActivateID8FightID7() 
	
	TimeID8AttackID7 = 120
	
	CounterDario1 = StartCountdown(80*60,StrongerID8AndID7_1,false)

	--Banditenangriff:

		banditID8TowerDef = DefensiveArmy.new(8, GetPosition("id8_defpoint").X, GetPosition("id8_defpoint").Y, 12000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
			DefensiveArmy.AddTroopSpawn(banditID8TowerDef, TimeID8AttackID7, Entities.CU_BanditLeaderSword1, 8, GetPosition("spawn_id8_turm").X, GetPosition("spawn_id8_turm").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8TowerDef, TimeID8AttackID7, Entities.CU_BanditLeaderSword1, 8, GetPosition("spawn_id8_turm").X, GetPosition("spawn_id8_turm").Y, 0, math.random(1, 4));
		

		banditID8CanonDef = DefensiveArmy.new(8, GetPosition("id8_defpoint").X, GetPosition("id8_defpoint").Y, 12000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
			DefensiveArmy.AddTroopSpawn(banditID8CanonDef, TimeID8AttackID7, Entities.PV_Cannon2, 8, GetPosition("spawn_id8_kanonen").X, GetPosition("spawn_id8_kanonen").Y, 0);
			DefensiveArmy.AddTroopSpawn(banditID8CanonDef, TimeID8AttackID7, Entities.PV_Cannon2, 8, GetPosition("spawn_id8_kanonen").X, GetPosition("spawn_id8_kanonen").Y, 0);

		banditID8KasernenDef = DefensiveArmy.new(8, GetPosition("id8_defpoint").X, GetPosition("id8_defpoint").Y, 12000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
			DefensiveArmy.AddTroopSpawn(banditID8KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id8_kaserne").X, GetPosition("spawn_id8_kaserne").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id8_kaserne").X, GetPosition("spawn_id8_kaserne").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id8_kaserne").X, GetPosition("spawn_id8_kaserne").Y, 0, math.random(1, 4));

		banditID8ArcheryDef = DefensiveArmy.new(8, GetPosition("id8_defpoint").X, GetPosition("id8_defpoint").Y, 12000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
			DefensiveArmy.AddTroopSpawn(banditID8ArcheryDef, TimeID8AttackID7, Entities.CU_BanditLeaderBow1, 8, GetPosition("spawn_id8_archery").X, GetPosition("spawn_id8_archery").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8ArcheryDef, TimeID8AttackID7, Entities.CU_BanditLeaderBow1, 8, GetPosition("spawn_id8_archery").X, GetPosition("spawn_id8_archery").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id8_archery").X, GetPosition("spawn_id8_archery").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id8_archery").X, GetPosition("spawn_id8_archery").Y, 0, math.random(1, 4));

		banditID8HqDef = DefensiveArmy.new(8, GetPosition("id8_defpoint").X, GetPosition("id8_defpoint").Y, 12000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
			DefensiveArmy.AddTroopSpawn(banditID8HqDef, TimeID8AttackID7, Entities.CU_VeteranLieutenant, 8, GetPosition("spawn_hq8").X, GetPosition("spawn_hq8").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(banditID8HqDef, TimeID8AttackID7, Entities.CU_Barbarian_LeaderClub1, 8, GetPosition("spawn_hq8").X, GetPosition("spawn_hq8").Y, 0, math.random(1, 4));
		
		
	

	


		--Spawnerkontrolle aktivieren:
		SpawnerCheckerID8Def()


		---Dario Angriff

		DarioID7ReiterDef = DefensiveArmy.new(7, GetPosition("id7_defpoint").X, GetPosition("id7_defpoint").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(7), 600, true);
			DefensiveArmy.AddTroopSpawn(DarioID7ReiterDef, TimeID8AttackID7, Entities.PU_LeaderCavalry1, 8, GetPosition("spawn_id7_reiter").X, GetPosition("spawn_id7_reiter").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7ReiterDef, TimeID8AttackID7, Entities.PU_LeaderHeavyCavalry1, 8, GetPosition("spawn_id7_reiter").X, GetPosition("spawn_id7_reiter").Y, 0, math.random(1, 4));
		

		DarioID7CanonDef = DefensiveArmy.new(7, GetPosition("id7_defpoint").X, GetPosition("id7_defpoint").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(7), 600, true);
			DefensiveArmy.AddTroopSpawn(DarioID7CanonDef, TimeID8AttackID7, Entities.PV_Cannon2, 8, GetPosition("spawn_id7_kanonen").X, GetPosition("spawn_id7_kanonen").Y, 0);
			DefensiveArmy.AddTroopSpawn(DarioID7CanonDef, TimeID8AttackID7, Entities.PV_Cannon2, 8, GetPosition("spawn_id7_kanonen").X, GetPosition("spawn_id7_kanonen").Y, 0);

		DarioID7KasernenDef = DefensiveArmy.new(7, GetPosition("id7_defpoint").X, GetPosition("id7_defpoint").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(7), 600, true);
			DefensiveArmy.AddTroopSpawn(DarioID7KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id7_kaserne1").X, GetPosition("spawn_id7_kaserne1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id7_kaserne1").X, GetPosition("spawn_id7_kaserne1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7KasernenDef, TimeID8AttackID7, Entities.PU_LeaderSword2, 8, GetPosition("spawn_id7_kaserne1").X, GetPosition("spawn_id7_kaserne1").Y, 0, math.random(1, 4));

		DarioID7ArcheryDef = DefensiveArmy.new(7, GetPosition("id7_defpoint").X, GetPosition("id7_defpoint").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(7), 600, true);
			DefensiveArmy.AddTroopSpawn(DarioID7ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id7_archery2").X, GetPosition("spawn_id7_archery2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id7_archery2").X, GetPosition("spawn_id7_archery2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id7_archery2").X, GetPosition("spawn_id7_archery2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7ArcheryDef, TimeID8AttackID7, Entities.PU_LeaderBow2, 8, GetPosition("spawn_id7_archery2").X, GetPosition("spawn_id7_archery2").Y, 0, math.random(1, 4));

		DarioID7HqDef = DefensiveArmy.new(7, GetPosition("id7_defpoint").X, GetPosition("id7_defpoint").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(7), 600, true);
			DefensiveArmy.AddTroopSpawn(DarioID7HqDef, TimeID8AttackID7, Entities.PU_LeaderRifle1, 8, GetPosition("spawn_hq7").X, GetPosition("spawn_hq7").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(DarioID7HqDef, TimeID8AttackID7, Entities.PU_LeaderPoleArm2, 8, GetPosition("spawn_hq7").X, GetPosition("spawn_hq7").Y, 0, math.random(1, 4));
			
	
		
			--Spawnerkontrolle aktivieren:
			SpawnerCheckerID7Def()


end

function SpawnerCheckerID8Def()
	StartSimpleJob("StopID8Def1")
	StartSimpleJob("StopID8Def2")
	StartSimpleJob("StopID8Def3")
	StartSimpleJob("StopID8Def4")
	StartSimpleJob("StopID8Def5")
end

function SpawnerCheckerID7Def()
	StartSimpleJob("StopID7Def1")
	StartSimpleJob("StopID7Def2")
	StartSimpleJob("StopID7Def3")
	StartSimpleJob("StopID7Def4")
	StartSimpleJob("StopID7Def5")
end



