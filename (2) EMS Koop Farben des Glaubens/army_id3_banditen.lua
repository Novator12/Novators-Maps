
  function ActivateBandits(Bdiff)     
       
    ------------------------------------Banditentürme----------------------------------------------------   

    for i =1,4,1 do
       _G["Bandit"..i] = LazyUnlimitedArmy:New({					
			-- benötigt
			Player = 3,
			Area = 4600,
			-- optional
			AutoDestroyIfEmpty = true,
			TransitAttackMove = true,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation = FormationFunktion,
			AIActive = true,
			AutoRotateRange = 100000,
            HiResJob = true
        },i,24)
		_G["SpawnerBanditen"..i] = UnlimitedArmySpawnGenerator:New(_G["Bandit"..i], {
			-- benötigt:
			Position = GetPosition("spawn_tower"..i.."_id3"), --position
			ArmySize = Bdiff[1], --armysize
 			SpawnCounter = Bdiff[2],  --spawncounter
			SpawnLeaders = Bdiff[1],   --spawnleaders
			LeaderDesc = {
				{LeaderType = Entities.PU_LeaderSword3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
                {LeaderType = Entities.PU_LeaderBow3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
                {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
			},
 			-- optional:
 			Generator = "tower"..i.."_id3",  --generator
 		})
	
	
	end    

--------------------------------------Banditenzelt--------------------------------------------------------------

	Bandit5 = LazyUnlimitedArmy:New({					
        -- benötigt
        Player = 3,
        Area = 4600,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true
    },5,24)

    SpawnerBanditen5 = UnlimitedArmySpawnGenerator:New(Bandit5, {
        -- benötigt:
        Position = GetPosition("spawn_tent1_id3"), --position
        ArmySize = Bdiff[1], --armysize
        SpawnCounter = Bdiff[2],  --spawncounter
        SpawnLeaders = Bdiff[1],   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.PU_LeaderSword3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
        },
        -- optional:
        Generator = "tent1_id3",  --generator
    })

    

-----------------------------Banditenoutpost-------------------------------------------------------------------------

	Bandit6 = LazyUnlimitedArmy:New({					
        -- benötigt
        Player = 3,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true
    },6,24)

    SpawnerBanditen6 = UnlimitedArmySpawnGenerator:New(Bandit6, {
        -- benötigt:
        Position = GetPosition("spawn_outpost_id3"), --position
        ArmySize = Bdiff[1], --armysize
        SpawnCounter = Bdiff[2],  --spawncounter
        SpawnLeaders = Bdiff[1],   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.PU_LeaderSword3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
        },
        -- optional:
        Generator = "outpost_id3",  --generator
    })

   

	-----------------------------Banditenburg-------------------------------------------------------------------------

	Bandit7 = UnlimitedArmy:New({					
        -- benötigt
        Player = 3,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
        HiResJob = true
    },7,24)

    SpawnerBanditen7 = UnlimitedArmySpawnGenerator:New(Bandit7, {
        -- benötigt:
        Position = GetPosition("spawn_burg_id3"), --position
        ArmySize = Bdiff[1], --armysize
        SpawnCounter = Bdiff[2],  --spawncounter
        SpawnLeaders = Bdiff[1],   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.PU_LeaderSword3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow3, SoldierNum = 8 , SpawnNum = 2, Looped = true, Experience = 3},
            {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
        },
        -- optional:
        Generator = "burg_id3",  --generator
    })

  


end

function ActivateBossTower()
	-----------------------------Banditenburg-------------------------------------------------------------------------

	Bandit8 = LazyUnlimitedArmy:New({					
        -- benötigt
        Player = 3,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
    })

    SpawnerBanditen8 = UnlimitedArmySpawnGenerator:New(Bandit8, {
        -- benötigt:
        Position = GetPosition("spawn_elit_tower"), --position
        ArmySize = 8, --armysize
        SpawnCounter = 20,  --spawncounter
        SpawnLeaders = 3,   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities.PV_Cannon3, SoldierNum = 0 , SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities.CU_VeteranMajor, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.CU_VeteranLieutenant, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderSword4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderPoleArm4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderBow4, SoldierNum = 8 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.PU_LeaderRifle1, SoldierNum = 4 , SpawnNum = 1, Looped = true, Experience = 3},
        },
        -- optional:
        Generator = "elit_tower",  --generator
    })

end