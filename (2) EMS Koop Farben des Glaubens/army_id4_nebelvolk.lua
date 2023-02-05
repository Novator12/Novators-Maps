function ActivateFogWarriors(Ndiff)




    for i=1,5,1 do
        _G["NVArmy"..i] = UnlimitedArmy:New({					
            -- benötigt
            Player = 4,
            Area = 4000,
            -- optional
            AutoDestroyIfEmpty = true,
            TransitAttackMove = true,
            Formation = UnlimitedArmy.Formations.Chaotic,
            LeaderFormation = FormationFunktion,
            AIActive = true,
            AutoRotateRange = 100000,
        })

        _G["SpawnerNebelvolk"..i] = UnlimitedArmySpawnGenerator:New(_G["NVArmy"..i], {
            -- benötigt:
            Position = GetPosition("nv"..i.."_spawn"), --position
            ArmySize = Ndiff[1], --armysize
            SpawnCounter = Ndiff[2],  --spawncounter
            SpawnLeaders = Ndiff[1],   --spawnleaders
            LeaderDesc = {
                {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
                {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
            },
            -- optional:
            Generator = "nv"..i,  --generator
        })

       
    end

    NVArmy6 = UnlimitedArmy:New({					
        -- benötigt
        Player = 4,
        Area = 4000,
        -- optional
        AutoDestroyIfEmpty = true,
        TransitAttackMove = true,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation = FormationFunktion,
        AIActive = true,
        AutoRotateRange = 100000,
    })

    SpawnerNebelvolk6 = UnlimitedArmySpawnGenerator:New(NVArmy6, {
        -- benötigt:
        Position = GetPosition("nv6_spawn"), --position
        ArmySize = Ndiff[1], --armysize
        SpawnCounter = Ndiff[2],  --spawncounter
        SpawnLeaders = Ndiff[1],   --spawnleaders
        LeaderDesc = {
            {LeaderType = Entities.CU_Evil_LeaderBearman1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
            {LeaderType = Entities.CU_Evil_LeaderSkirmisher1, SoldierNum = 16 , SpawnNum = 1, Looped = true, Experience = 3},
        },
        -- optional:
        Generator = "burg_id4",  --generator
    })

   


end


