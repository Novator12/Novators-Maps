
function ActivateBandits()    
	if CheckMode == 1 then
       timeBandits = 120
	elseif CheckMode == 2 then
		timeBandits = 100
	elseif CheckMode == 3 then
		timeBandits = 80
	end


	--Für Spieler 1:

		bandit1 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tent1").X, GetPosition("sp1_patrol1_tent1").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit1, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent1_spawn").X, GetPosition("bandit1_tent1_spawn").Y, 0, math.random(1, 4));
		end

		bandit2 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tent2").X, GetPosition("sp1_patrol1_tent2").Y, 5000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 or CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit2, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent2_spawn").X, GetPosition("bandit1_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit2, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent2_spawn").X, GetPosition("bandit1_tent2_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit2, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tent2_spawn").X, GetPosition("bandit1_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit2, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tent2_spawn").X, GetPosition("bandit1_tent2_spawn").Y, 0, math.random(1, 4));
		end
		

		function StopSP1BanditTent1()
			if IsDestroyed("sp1_bandit1_tent1") then
				DefensiveArmy.StopRespawn(bandit1)
				return true;
			end
		end

		function StopSP1BanditTent2()
			if IsDestroyed("sp1_bandit1_tent2") then
				DefensiveArmy.StopRespawn(bandit2)
				return true;
			end
		end



		bandit3 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tower1").X, GetPosition("sp1_patrol1_tower1").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit3, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower1_spawn").X, GetPosition("bandit1_tower1_spawn").Y, 0, math.random(1, 4));
		end
		
		function StopSP1BanditTower1()
			if IsDestroyed("sp1_bandit1_tower1") then
				DefensiveArmy.StopRespawn(bandit3)
				return true;
			end
		end


		bandit4 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tower2").X, GetPosition("sp1_patrol1_tower2").Y, 2500, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit4, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower2_spawn").X, GetPosition("bandit1_tower2_spawn").Y, 0, math.random(1, 4));
		end
		
		function StopSP1BanditTower2()
			if IsDestroyed("sp1_bandit1_tower2") then
				DefensiveArmy.StopRespawn(bandit4)
				return true;
			end
		end


		bandit5 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tower3").X, GetPosition("sp1_patrol1_tower3").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0);
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0);
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit5, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower3_spawn").X, GetPosition("bandit1_tower3_spawn").Y, 0);
		end
		
		function StopSP1BanditTower3()
			if IsDestroyed("sp1_bandit1_tower3") then
				DefensiveArmy.StopRespawn(bandit5)
				return true;
			end
		end


		bandit6 = DefensiveArmy.new(8, GetPosition("sp1_patrol1_tower4").X, GetPosition("sp1_patrol1_tower4").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0);
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0);
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit6, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit1_tower4_spawn").X, GetPosition("bandit1_tower4_spawn").Y, 0);
		end
		
		function StopSP1BanditTower4()
			if IsDestroyed("sp1_bandit1_tower4") then
				DefensiveArmy.StopRespawn(bandit6)
				return true;
			end
		end		

		
		bandit7 = DefensiveArmy.new(8, GetPosition("sp2_patrol1_tent1").X, GetPosition("sp2_patrol1_tent1").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit7, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent1_spawn").X, GetPosition("bandit2_tent1_spawn").Y, 0, math.random(1, 4));
		end

		function StopSP2BanditTent1()
			if IsDestroyed("sp2_bandit1_tent1") then
				DefensiveArmy.StopRespawn(bandit7)
				return true;
			end
		end

		bandit8 = DefensiveArmy.new(8, GetPosition("sp2_patrol1_tower1").X, GetPosition("sp2_patrol1_tower1").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0);
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0);
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit8, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tower1_spawn").X, GetPosition("bandit2_tower1_spawn").Y, 0);
		end

		function StopSP2BanditTower1()
			if IsDestroyed("sp2_bandit1_tower1") then
				DefensiveArmy.StopRespawn(bandit8)
				return true;
			end
		end


		bandit9 = DefensiveArmy.new(8, GetPosition("sp2_patrol1_tent2").X, GetPosition("sp2_patrol1_tent2").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0);
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0);
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit9, timeBandits, Entities.PV_Cannon2, 0, GetPosition("bandit2_tent2_spawn").X, GetPosition("bandit2_tent2_spawn").Y, 0);
		end

		function StopSP2BanditTent2()
			if IsDestroyed("sp2_bandit1_tent2") then
				DefensiveArmy.StopRespawn(bandit9)
				return true;
			end
		end

		bandit10 = DefensiveArmy.new(8, GetPosition("sp2_patrol1_tent3").X, GetPosition("sp2_patrol1_tent3").Y, 3000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
		if CheckMode == 1 then
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 2 then
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
		elseif CheckMode == 3 then
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderSword1, 8, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
			DefensiveArmy.AddTroopSpawn(bandit10, timeBandits, Entities.CU_BanditLeaderBow1, 4, GetPosition("bandit2_tent3_spawn").X, GetPosition("bandit2_tent3_spawn").Y, 0, math.random(1, 4));
		end

		function StopSP2BanditTent3()
			if IsDestroyed("sp2_bandit1_tent3") then
				DefensiveArmy.StopRespawn(bandit10)
				return true;
			end
		end




		--Spawnerkontrolle aktivieren:
		SpawnerCheckerSP1_Bandits()
		SpawnerCheckerSP2_Bandits()
end

function SpawnerCheckerSP1_Bandits()
	StartSimpleJob("StopSP1BanditTent1")
	StartSimpleJob("StopSP1BanditTent2")
	StartSimpleJob("StopSP1BanditTower1")
	StartSimpleJob("StopSP1BanditTower2")
	StartSimpleJob("StopSP1BanditTower3")
	StartSimpleJob("StopSP1BanditTower4")
end

function SpawnerCheckerSP2_Bandits()
	StartSimpleJob("StopSP2BanditTent1")
	StartSimpleJob("StopSP2BanditTower1")
	StartSimpleJob("StopSP2BanditTent2")
	StartSimpleJob("StopSP2BanditTent3")
end



function ActivateBanditIron()


	if CheckMode == 1 then
		timeBIron = 120
	 elseif CheckMode == 2 then
		timeBIron = 100
	 elseif CheckMode == 3 then
		timeBIron = 80
	 end



	bandit11 = DefensiveArmy.new(8, GetPosition("biron_patrol1").X, GetPosition("biron_patrol1").Y, 6000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
	if CheckMode == 1 then
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
	elseif CheckMode == 2 then
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
	elseif CheckMode == 3 then
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit11, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn1").X, GetPosition("biron_spawn1").Y, 0, math.random(1, 4));
	end


	function StopBanditIron1()
		if IsDestroyed("biron_tower1") then
			DefensiveArmy.StopRespawn(bandit11)
			return true;
		end
	end

	bandit12 = DefensiveArmy.new(8, GetPosition("biron_patrol2").X, GetPosition("biron_patrol2").Y, 6000, PlayerChunk_GetPlayerEnemyChunk(8), 600, true);
	if CheckMode == 1 then
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
	elseif CheckMode == 2 then
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
	elseif CheckMode == 3 then
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderSword1, 8, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.CU_BanditLeaderBow1, 4, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
		DefensiveArmy.AddTroopSpawn(bandit12, timeBIron, Entities.PV_Cannon2, 0, GetPosition("biron_spawn2").X, GetPosition("biron_spawn2").Y, 0, math.random(1, 4));
	end


	function StopBanditIron2()
		if IsDestroyed("biron_tower2") then
			DefensiveArmy.StopRespawn(bandit12)
			return true;
		end
	end


	--Spawnerkontrolle aktivieren:
	SpawnerCheckerBanditsIron()
end


function SpawnerCheckerBanditsIron()
	StartSimpleJob("StopBanditIron1")
	StartSimpleJob("StopBanditIron2")
end




function StrongerBanditsJob1()
	if IsExisting("B_Attack2") then
		Message("@color:255,0,0 Achtung: @color:255,255,255 Die Banditenangriffe werden stärker!")
	end
	StartSimpleJob("BanditAttack2")
end

function StrongerBanditsJob2()
	if IsExisting("B_Attack3") then
		Message("@color:255,0,0 Achtung: @color:255,255,255 Die Banditenangriffe werden stärker!")
	end
	StartSimpleJob("BanditAttack3")
end

function DelayStrongerBandits1()

	if CheckMode == 1 then
		 Val1 = 20 * 60
	elseif CheckMode == 2 then
		 Val1 = 15 * 60
	elseif CheckMode == 3 then
		 Val1 = 10 * 60
	end

	StartCountdown(Val1,StrongerBanditsJob1,false)
end


function DelayStrongerBandits2()

	if CheckMode == 1 then
		Val2 = 30 * 60
   elseif CheckMode == 2 then
		Val2 = 20 * 60
   elseif CheckMode == 3 then
		Val2 = 15 * 60
   end

	StartCountdown(Val2, StrongerBanditsJob2, false)
end



function ActivateBanditAttackers()


	if CheckMode == 1 then
		RespawnBIron = 7 * 60
	elseif CheckMode == 2 then
		RespawnBIron = 5 * 60
	elseif CheckMode == 3 then
		RespawnBIron = 3 * 60
	end



	
	DelayStrongerBandits1()
	DelayStrongerBandits2()
	

	function BanditAttack1()
		if IsExisting("B_Attack1") then
			local SpawnPos = GetPosition("Spawn_B_Attack1")
			if IsDestroyed("SwordBanditIron1") and IsDestroyed("SwordBanditIron2") and IsDestroyed("SwordBanditIron3") then
				if Counter.Tick2("BanditAttack1_1", RespawnBIron) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.CU_BanditLeaderSword1, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "SwordBanditIron" .. i)
						AddWaypoints("SwordBanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("SwordBanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("SwordBanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("SwordBanditIron" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("SwordBanditIron" .. i), math.random(1, 4))
					end
				end
			end
			--
			if IsDestroyed("BowBanditIron1") and IsDestroyed("BowBanditIron2") and IsDestroyed("BowBanditIron3") then
				if Counter.Tick2("BanditAttack1_2", RespawnBIron) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.CU_BanditLeaderBow1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
							, "BowBanditIron" .. i)
						AddWaypoints("BowBanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("BowBanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("BowBanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("BowBanditIron" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("BowBanditIron" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("B_Attack1") then
			return true
		end
	end

	StartSimpleJob("BanditAttack1")


	function BanditAttack2()
		if IsExisting("B_Attack2") then
			local SpawnPos = GetPosition("Spawn_B_Attack2")
			if IsDestroyed("Sword2BanditIron1") and IsDestroyed("Sword2BanditIron2") then
				if Counter.Tick2("BanditAttack2_1", RespawnBIron) then
					for i = 1, 2 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.CU_BanditLeaderSword1, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "Sword2BanditIron" .. i)
						AddWaypoints("Sword2BanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("Sword2BanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("Sword2BanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("Sword2BanditIron" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("Sword2BanditIron" .. i), math.random(1, 4))
					end
				end
			end
			--
			if IsDestroyed("CanonBanditIron1") and IsDestroyed("CanonBanditIron1") then
				if Counter.Tick2("BanditAttack2_2", RespawnBIron) then
					for i = 1, 2 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.PV_Cannon2, nil, 0, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
							, "CanonBanditIron" .. i)
						AddWaypoints("CanonBanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("CanonBanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("CanonBanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("CanonBanditIron" .. i, { "B_Waypoint4" })
					end
				end
			end
		end
		if IsDead("B_Attack2") then
			return true
		end
	end



	function BanditAttack3()
		if IsExisting("B_Attack3") then
			local SpawnPos = GetPosition("Spawn_B_Attack3")
			if IsDestroyed("Sword3BanditIron1") and IsDestroyed("Sword3BanditIron2") then
				if Counter.Tick2("BanditAttack3_1", RespawnBIron) then
					for i = 1, 2 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.CU_BanditLeaderSword1, nil, 8, SpawnPos.X, SpawnPos.Y, 0, 1, 3
							, 0), "Sword3BanditIron" .. i)
						AddWaypoints("Sword3BanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("Sword3BanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("Sword3BanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("Sword3BanditIron" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("Sword3BanditIron" .. i), math.random(1, 4))
					end
				end
			end
			--
			if IsDestroyed("Bow2BanditIron1") and IsDestroyed("Bow2BanditIron2") and IsDestroyed("Bow2BanditIron3") then
				if Counter.Tick2("BanditAttack3_2", RespawnBIron) then
					for i = 1, 3 do
						SetEntityName(AI.Entity_CreateFormation(8, Entities.CU_BanditLeaderBow1, nil, 4, SpawnPos.X, SpawnPos.Y, 0, 1, 3, 0)
							, "Bow2BanditIron" .. i)
						AddWaypoints("Bow2BanditIron" .. i, { "B_Waypoint1" })
						AddWaypoints("Bow2BanditIron" .. i, { "B_Waypoint2" })
						AddWaypoints("Bow2BanditIron" .. i, { "B_Waypoint3" })
						AddWaypoints("Bow2BanditIron" .. i, { "B_Waypoint4" })
						Logic.LeaderChangeFormationType(GetEntityId("Bow2BanditIron" .. i), math.random(1, 4))
					end
				end
			end
		end
		if IsDead("B_Attack3") then
			return true
		end
	end
	

end
