
function ActivateIronDef() 
	if CheckMode == 1 then
       timeIronDef = 120
	elseif CheckMode == 2 then
		timeIronDef = 100
	elseif CheckMode == 3 then
		timeIronDef = 80
	end



		irondef1 = DefensiveArmy.new(5, GetPosition("iron_def_patrol1").X, GetPosition("iron_def_patrol1").Y, 4500, PlayerChunk_GetPlayerEnemyChunk(5), 600, true);
			DefensiveArmy.AddTroopSpawn(irondef1, timeIronDef, Entities.PU_LeaderSword3, 8, GetPosition("iron_def_spawn1").X, GetPosition("iron_def_spawn1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef1, timeIronDef, Entities.PU_LeaderSword3, 8, GetPosition("iron_def_spawn1").X, GetPosition("iron_def_spawn1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef1, timeIronDef, Entities.PU_LeaderBow3, 8, GetPosition("iron_def_spawn1").X, GetPosition("iron_def_spawn1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef1, timeIronDef, Entities.PU_LeaderBow3, 8, GetPosition("iron_def_spawn1").X, GetPosition("iron_def_spawn1").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef1, timeIronDef, Entities.CU_VeteranLieutenant, 4, GetPosition("iron_def_spawn1").X, GetPosition("iron_def_spawn1").Y, 0, math.random(1, 4));
		

		irondef2 = DefensiveArmy.new(5, GetPosition("iron_def_patrol2").X, GetPosition("iron_def_patrol2").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(5), 600, true);
			DefensiveArmy.AddTroopSpawn(irondef2, timeIronDef, Entities.PU_LeaderSword3, 8, GetPosition("iron_def_spawn2").X, GetPosition("iron_def_spawn2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef2, timeIronDef, Entities.PU_LeaderSword3, 8, GetPosition("iron_def_spawn2").X, GetPosition("iron_def_spawn2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef2, timeIronDef, Entities.PU_LeaderBow3, 8, GetPosition("iron_def_spawn2").X, GetPosition("iron_def_spawn2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef2, timeIronDef, Entities.PU_LeaderBow3, 8, GetPosition("iron_def_spawn2").X, GetPosition("iron_def_spawn2").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(irondef2, timeIronDef, Entities.CU_VeteranLieutenant, 4, GetPosition("iron_def_spawn2").X, GetPosition("iron_def_spawn2").Y, 0, math.random(1, 4));
		
		function StopIronDef1()
			if IsDestroyed("iron_def_tower1") then
				DefensiveArmy.StopRespawn(irondef1)
				return true;
			end
		end
		
		

		function StopIronDef2()
			if IsDestroyed("iron_def_tower2") then
				DefensiveArmy.StopRespawn(irondef2)
				return true;
			end
		end

	


		--Spawnerkontrolle aktivieren:
		SpawnerCheckerIronDef()
end

function SpawnerCheckerIronDef()
	StartSimpleJob("StopIronDef1")
	StartSimpleJob("StopIronDef2")
end
