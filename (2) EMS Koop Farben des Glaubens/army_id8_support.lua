
function ActivateSupp1(Sdiff)     

------------------------------------------Verbündete KI 2-----------------------------------------------

       Support1 = UnlimitedArmy:New({					
			-- benötigt
			Player = 8,
			Area = 4000,
			-- optional
			AutoDestroyIfEmpty = true,
			TransitAttackMove = true,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation = FormationFunktion,
			AIActive = true,
			AutoRotateRange = 100000,
		})
		SpawnerSupport1 = UnlimitedArmySpawnGenerator:New(Support1, {
			-- benötigt:
			Position = GetPosition("spawn_supp1"), --position
			ArmySize = Sdiff[1], --armysize
 			SpawnCounter = Sdiff[2],  --spawncounter
			SpawnLeaders = Sdiff[1],   --spawnleaders
			LeaderDesc = {
                {LeaderType = Entities.PU_LeaderHeavyCavalry2, SoldierNum = 3 , SpawnNum = 2, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
			},
 			-- optional:
 			Generator = supp_church2,  --generator
 		})

         Support1: AddCommandLuaFunc(AttackIt,true)

end


function ActivateSupp2(Sdiff) 
------------------------------------------Verbündete KI 2-------------------------------------------------

         Support2 = UnlimitedArmy:New({					
			-- benötigt
			Player = 8,
			Area = 4000,
			-- optional
			AutoDestroyIfEmpty = true,
			TransitAttackMove = true,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation = FormationFunktion,
			AIActive = true,
			AutoRotateRange = 100000,
		})
		SpawnerSupport2 = UnlimitedArmySpawnGenerator:New(Support2, {
			-- benötigt:
			Position = GetPosition("spawn_supp2"), --position
			ArmySize = Sdiff[1], --armysize
 			SpawnCounter = Sdiff[2],  --spawncounter
			SpawnLeaders = Sdiff[1],   --spawnleaders
			LeaderDesc = {
				{LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
			},
 			-- optional:
 			Generator = supp_tower2,  --generator
 		})
	
         Support2: AddCommandLuaFunc(AttackIt,true)
end

function ActivateSupp3(Sdiff) 
------------------------------------------Verbündete KI 2-------------------------------------------------

         Support3 = UnlimitedArmy:New({					
			-- benötigt
			Player = 8,
			Area = 4000,
			-- optional
			AutoDestroyIfEmpty = true,
			TransitAttackMove = true,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation = FormationFunktion,
			AIActive = true,
			AutoRotateRange = 100000,
		})
		SpawnerSupport3 = UnlimitedArmySpawnGenerator:New(Support3, {
			-- benötigt:
			Position = GetPosition("spawn_supp3"), --position
			ArmySize = Sdiff[1], --armysize
 			SpawnCounter = Sdiff[2],  --spawncounter
			SpawnLeaders = Sdiff[1],   --spawnleaders
			LeaderDesc = {
				{LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderPoleArm4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
			},
 			-- optional:
 			Generator = supp_shot2,  --generator
 		})
	
         Support3: AddCommandLuaFunc(AttackIt,true)
end







------------------------------------------------------------------Update CommandQueue---------------------------------------------



function AttackIt(self)
    if self:IsIdle() then
       if IsAlive("burg_id3") then
            return true, UnlimitedArmy.CreateCommandMove(GetPosition("attack1_id8"))   
       elseif IsAlive("burg_id4") then
            return true, UnlimitedArmy.CreateCommandMove(GetPosition("attack4_id8"))
       elseif IsAlive("burg_id5") then
            return true, UnlimitedArmy.CreateCommandMove(GetPosition("attack7_id8"))
       end
    end
    return false;
end