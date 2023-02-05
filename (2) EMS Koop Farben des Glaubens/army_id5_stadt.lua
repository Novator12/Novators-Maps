
  function ActivateCity(Cdiff)     
       
    ------------------------------------Stadttürme----------------------------------------------------   

    for i =1,2,1 do
       _G["Citytower"..i] = UnlimitedArmy:New({					
			-- benötigt
			Player = 5,
			Area = 4000,
			-- optional
			AutoDestroyIfEmpty = true,
			TransitAttackMove = true,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation = FormationFunktion,
			AIActive = true,
			AutoRotateRange = 100000,
		})
		_G["SpawnerCitytower"..i] = UnlimitedArmySpawnGenerator:New(_G["Citytower"..i], {
			-- benötigt:
			Position = GetPosition("spawn_tower"..i.."_id5"), --position
			ArmySize = Cdiff[1], --armysize
 			SpawnCounter = Cdiff[2],  --spawncounter
			SpawnLeaders = Cdiff[1],   --spawnleaders
			LeaderDesc = {
				{LeaderType = Entities.CU_VeteranMajor, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_VeteranLieutenant, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_VeteranLieutenant, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_VeteranLieutenant, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_VeteranLieutenant, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
			},
 			-- optional:
 			Generator = "tower"..i.."_id5",  --generator
 		})
	
     
	end    

--------------------------------------Stadtkasernen--------------------------------------------------------------

for i =1,2,1 do
    _G["CityBarracks"..i] = UnlimitedArmy:New({					
         -- benötigt
         Player = 5,
         Area = 4000,
         -- optional
         AutoDestroyIfEmpty = true,
         TransitAttackMove = true,
         Formation = UnlimitedArmy.Formations.Chaotic,
         LeaderFormation = FormationFunktion,
         AIActive = true,
         AutoRotateRange = 100000,
     })
     _G["SpawnerCityBarracks"..i] = UnlimitedArmySpawnGenerator:New(_G["CityBarracks"..i], {
         -- benötigt:
         Position = GetPosition("spawn_barracks"..i.."_id5"), --position
         ArmySize = Cdiff[1], --armysize
         SpawnCounter = Cdiff[2],  --spawncounter
         SpawnLeaders = Cdiff[1],   --spawnleaders
         LeaderDesc = {
            {LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderPoleArm4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderPoleArm4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
         },
          -- optional:
          Generator = "barracks"..i.."_id5",  --generator
      })

 

 end  

-----------------------------Stadtschießplatz-------------------------------------------------------------------------

for i =1,2,1 do
    _G["CityArchery"..i] = UnlimitedArmy:New({					
         -- benötigt
         Player = 5,
         Area = 4000,
         -- optional
         AutoDestroyIfEmpty = true,
         TransitAttackMove = true,
         Formation = UnlimitedArmy.Formations.Chaotic,
         LeaderFormation = FormationFunktion,
         AIActive = true,
         AutoRotateRange = 100000,
     })
     _G["SpawnerCityArchery"..i] = UnlimitedArmySpawnGenerator:New(_G["CityArchery"..i], {
         -- benötigt:
         Position = GetPosition("spawn_archery"..i.."_id5"), --position
         ArmySize = Cdiff[1], --armysize
         SpawnCounter = Cdiff[2],  --spawncounter
         SpawnLeaders = Cdiff[1],   --spawnleaders
         LeaderDesc = {
            {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderRifle1, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderRifle1, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
         },
          -- optional:
          Generator = "archery"..i.."_id5",  --generator
      })

   
      
 end  

	-----------------------------Stadtställe-------------------------------------------------------------------------

    for i =1,2,1 do
        _G["CityStable"..i] = UnlimitedArmy:New({					
             -- benötigt
             Player = 5,
             Area = 4000,
             -- optional
             AutoDestroyIfEmpty = true,
             TransitAttackMove = true,
             Formation = UnlimitedArmy.Formations.Chaotic,
             LeaderFormation = FormationFunktion,
             AIActive = true,
             AutoRotateRange = 100000,
         })
         _G["SpawnerCityStable"..i] = UnlimitedArmySpawnGenerator:New(_G["CityStable"..i], {
             -- benötigt:
             Position = GetPosition("spawn_stable"..i.."_id5"), --position
             ArmySize = Cdiff[1], --armysize
             SpawnCounter = Cdiff[2],  --spawncounter
             SpawnLeaders = Cdiff[1],   --spawnleaders
             LeaderDesc = {
                {LeaderType = Entities.PU_LeaderHeavyCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderHeavyCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderHeavyCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
             
             },
              -- optional:
              Generator = "stable"..i.."_id5",  --generator
          })

       
     
     end  

	-----------------------------Stadtkanonengießerein-------------------------------------------------------------------------

    for i =1,2,1 do
        _G["CityFoundry"..i] = UnlimitedArmy:New({					
             -- benötigt
             Player = 5,
             Area = 4000,
             -- optional
             AutoDestroyIfEmpty = true,
             TransitAttackMove = true,
             Formation = UnlimitedArmy.Formations.Chaotic,
             LeaderFormation = FormationFunktion,
             AIActive = true,
             AutoRotateRange = 100000,
         })
         _G["SpawnerCityFoundry"..i] = UnlimitedArmySpawnGenerator:New(_G["CityFoundry"..i], {
             -- benötigt:
             Position = GetPosition("spawn_foundry"..i.."_id5"), --position
             ArmySize = Cdiff[1], --armysize
             SpawnCounter = Cdiff[2],  --spawncounter
             SpawnLeaders = Cdiff[1],   --spawnleaders
             LeaderDesc = {
                {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
                {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
                {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
                {LeaderType = Entities.PV_Cannon4, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
                {LeaderType = Entities.PV_Cannon4, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
             
             },
              -- optional:
              Generator = "foundry"..i.."_id5",  --generator
          })

     
     
     end  


    -----------------------------Stadtburg-------------------------------------------------------------------------

	CityCastle = UnlimitedArmy:New({					
        -- benötigt
        Player = 5,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
    })

    SpawnerCityCastle = UnlimitedArmySpawnGenerator:New(CityCastle, {
        -- benötigt:
        Position = GetPosition("spawn_burg_id5"), --position
        ArmySize = Cdiff[1], --armysize
        SpawnCounter = Cdiff[2],  --spawncounter
        SpawnLeaders = Cdiff[1],   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.PU_LeaderHeavyCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderCavalry2, SoldierNum = 3 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PV_Cannon4, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
        },
        -- optional:
        Generator = "burg_id5",  --generator
    })

 
     


    end