CppLogic.API.CreateExtraDataTables()

--- ModLoader tries to load the file ModLoader.lua in your map folder.
-- this happens on starting a new map as well as loading a savegame.
-- make sure, nothing breaks, if this file gets loaded again.
ModLoader = {
	--- if this flag is set, then the s5x archive is kept in the internal filesystem, after the map is loaded.
	-- this is not required for most ModLoader functionality, but you might want to load something out of it at a later time.
	--- you need this, if you have sounds packed in your s5x.
	-- also please set it, if you load another archive (and using a s5x).
	KeepArchive = true,
	--- anything in Manifest gest applied by calling ModLoader.ApplyManifest() from ModLoader.Initialize()
	--- order in which items appear in here do not matter, ModLoader.ApplyManifest() does take care of preloading.
	Manifest = {
		--- EntityTypes to load or reload. put in a string to load, and a number to reload (Entities.Typename).
		EntityTypes = {
			"CB_Signalfire_Base",
			"CB_Signalfire_Fire",
			"CB_Barbarian_Castle3",
			"CB_Barbarian_Castle2",
			"CB_Barbarian_Castle1",
			"XD_Smallboat",
			"XD_Wreckage",
			"XD_Dragonboat",
			"XD_Kogge_Wreck",
			"PB_VillageCenterBarbarian",
			"XD_VillageCenter_Building",
			"PB_WatchTower_Barb",
			"PB_WatchTower_Barb2",
			"PB_Missle1",
			"PB_Missle2",
			"PB_WatchTower_Barb2_ArrowLauncher1",
			"PB_WatchTower_Barb2_ArrowLauncher2",
			"PB_WatchTower_Barb2_ArrowLauncher3",
			"XD_WoodPit1",
			"PB_WoodMine1",
			"PB_WoodMine2",
			"PB_WoodMine3",
			"CB_Barbarian_Arena",
			"XD_Construction_Site1",
			"XD_Construction_Site1_Small",
			"XD_Construction_SiteTower",
			Entities.CB_Evil_Tower1,
			Entities.CB_Evil_Tower1_ArrowLauncher,
			Entities.CU_Barbarian_Hero,
			Entities.CU_Barbarian_Hero_wolf,
			Entities.CU_Barbarian_LeaderClub1,
			Entities.PU_Serf,
			Entities.PB_GenericMine,
			Entities.CU_VeteranLieutenant,
			Entities.XD_BuildBlockScriptEntity,
			Entities.XD_Sparkles,
			Entities.XD_Driftwood1,
			Entities.XD_Driftwood2,
			Entities.PU_Thief,
			Entities.XD_PalisadeGate2,
			Entities.XD_BlendingFog,
			--
			Entities.CU_BanditLeaderBow1,
			Entities.CU_BanditSoldierBow1,
			--
			"CU_BanditLeaderBow2",
			"CU_BanditSoldierBow2",
			--
			Entities.CU_BanditLeaderSword1,
			Entities.CU_BanditSoldierSword1,
			--
			Entities.CU_BanditLeaderSword2,
			Entities.CU_BanditSoldierSword2,
			"CB_EvilBoat",
			"XD_EvilBoat_Wreckage",
			Entities.PU_LeaderCavalry2,
			Entities.CU_Evil_LeaderBearman1,
			Entities.CU_Evil_LeaderSkirmisher1,
			Entities.CU_Evil_SoldierBearman1,
			Entities.CU_Evil_SoldierSkirmisher1,
			Entities.PB_Beautification01,
			Entities.PB_Beautification02,
			Entities.PB_Beautification03,
			Entities.PB_Beautification04,
			Entities.PB_Beautification05,
			Entities.PB_Beautification06,
			Entities.PB_Beautification07,
			Entities.PB_Beautification08,
			Entities.PB_Beautification09,
			Entities.PB_Beautification10,
			Entities.PB_Beautification11,
			Entities.PB_Beautification12,
			Entities.PB_Barracks1,
			Entities.PB_Barracks2,
			Entities.PB_Archery1,
			Entities.PB_Archery2,
			Entities.PB_Stable1,
			Entities.PB_Stable2,
			Entities.PB_Blacksmith3,
			Entities.PB_Farm2,
			Entities.PB_Farm3,
			Entities.PU_LeaderRifle2,
			Entities.PU_SoldierRifle2,
		},
		--- EffectTypes to load or reload. put in a string to load, and a number to reload (GGL_Effects.Typename).
		EffectTypes = {
		},
		--- TaskLists to load or reload. put in a string to load, and a number to reload (TaskLists.Typename).
		TaskLists = {
			"TL_MINER_WOODMINE_WORK_INSIDE",
			"TL_MINER_WOODMINE_WORK_INSIDE_START",
			"TL_TRAIN1_BARBARENA",
			"TL_TRAIN2_BARBARENA",
			"TL_TRAIN3_BARBARENA",
			"TL_LEAVE_BARBARENA",
		},
		--- Technologies to load or reload. put in a string to load, and a number to reload (Technologies.Typename).
		Technologies = {
			"GT_BarbarianBuildings",
			"GT_BarbarianBuildings1",
			"GT_BarbarianBuildings2",
			"GT_BuyBarbarian",
			"B_BarbTower",
			"UP1_BarbTower",
			"B_BarbVillage",
			"B_Woodmine",
			"B_BarbArena",
			"UP1_Woodmine",
			"UP2_Woodmine",
			"B_BarbarianHeadquarter",
			"UP1_BarbarianHeadquarter",
			"UP2_BarbarianHeadquarter",
			"MU_LeaderBanditBow",
			"MU_LeaderBanditBow2",
			"MU_LeaderBanditSword",
			"MU_LeaderBanditSword2",
			"T_UpgradeBanditSword1",
			"T_UpgradeBanditBow1",
			"T_BetterBanditArmor",
			"T_BetterBanditDamage",
			Technologies.GT_Alloying,
			Technologies.GT_Architecture,
			Technologies.GT_Binocular,
			Technologies.GT_ChainBlock,
			Technologies.GT_Chemistry,
			Technologies.GT_GearWheel,
			Technologies.GT_Library,
			Technologies.GT_Matchlock,
			Technologies.GT_Metallurgy,
			Technologies.GT_Printing,
			Technologies.GT_PulledBarrel,
			Technologies.GT_StandingArmy,
			Technologies.GT_Strategies,
			Technologies.GT_Tactics,
			Technologies.GT_Trading,
			Technologies.T_UpgradeBow3,
			Technologies.T_UpgradeSword3,
			Technologies.T_UpgradeSpear3,
		},
		--- Experience classes to load. use [nameOfExperienceClass]=entityCategory.
		ExperienceClasses = {

		},
		--- Models to load or reload. put in a string to load, and a number to reload (Models.Typename).
		Models = {
			"CB_Signalfire_Base",
			"PB_VillageCenterBarbarian",
			"XD_VillageCenter_Building",
			"CB_Signalfire_Fire",
			"CB_Barbarian_Castle3",
			"CB_Barbarian_Castle2",
			"CB_Barbarian_Castle1",
			"XD_Smallboat",
			"XD_Wreckage",
			"XD_Dragonboat",
			"XD_Kogge_Wreck",
			"PB_WatchTower_Barb",
			"PB_WatchTower_Barb2",
			"PB_Missle1",
			"PB_Missle2",
			"PB_WatchTower_Barb2_ArrowLauncher1",
			"PB_WatchTower_Barb2_ArrowLauncher2",
			"PB_WatchTower_Barb2_ArrowLauncher3",
			"XD_WoodPit1",
			"PB_WoodMine1",
			"PB_WoodMine2",
			"PB_WoodMine3",
			"CB_Barbarian_Arena",
			"CU_Barbarian_Hero",
			Models.CU_Barbarian_LeaderClub1,
			--
			Models.CU_LeaderOutlaw1,
			"CU_LeaderOutlaw2",
			--
			Models.CU_SoldierOutlaw1,
			"CU_SoldierOutlaw2",
			--
			"CU_BanditLeaderBow2",
			"CU_BanditSoldierBow2",
			--
			"Varg_Wolf",
			"XD_Construction_Site1",
			"XD_Construction_Site1_Small",
			"XD_Construction_SiteTower",
			"CB_EvilBoat",
			"XD_EvilBoat_Wreckage",
			
		},
		--- Animations to load or reload. put in a string to load, and a number to reload (Animations.Typename).
		Animations = {
			"CU_Veteran_Dead"
		},
		--- AnimSets to load or reload. put in a string to load, and a number to reload (AnimSets.Typename).
		AnimSets = {
			AnimSets.SET_CU_BARBARIAN_SOLDIERCLUB1
		},
		--- Selection Textures to add.
		SelectionTextures_Add = {

		},
		--- Selection Textures to reload.
		SelectionTextures_Reload = {
	
		},
		--- GUI Textures to add.
		GUITextures_Add = {

		},
		--- GUI Textures to reload.
		GUITextures_Reload = {

		},
		--- Settler Upgradde Categories to add. use in [nameUCat]=nameFirstEntity.
		SettlerUpgradeCategory = {
			
		},
		--- Building Upgradde Categories to add. use in [nameUCat]=nameFirstEntity.
		BuildingUpgradeCategory = {
			BarbarianHQ = "CB_Barbarian_Castle1",
			VillageCenterBarbarian = "PB_VillageCenterBarbarian",
			BarbarianTower = "PB_WatchTower_Barb",
			WoodMine = "PB_WoodMine1",
			Arena = "CB_Barbarian_Arena",
			EvilBoat = "CB_EvilBoat"
		},
		--- Terrain Textures to add.
		TerrainTextures_Add = {

		},
		--- Terrain Textures to reload.
		TerrainTextures_Reload = {

		},
		--- Water Types to load or reload. put in a string to load, and a number to reload (WaterTypes.Typename).
		WaterTypes = {
			WaterTypes.WaterE,
		},
		--- Terrain Types to load or reload. put in a string to load, and a number to reload (TerrainTypes.Typename).
		TerrainTypes = {

		},
		--- Sound (Groups) to load. use arrays of names to load.
		SoundGroups = {
            {"girlscream"},
        },
		--- DirectX Effects to load. no difference between load and reload (requires keeping the bba/s5x that contains them loaded).
		DirectXEffects = {
		}
	},
}

--- this function gets called after ModLoader loads this file.
-- called on both map start and save load.
-- this is the place to modify something like EntityTypes, as all entities get created after this method,
-- so even changing behaviors completely works without problems.
-- it is recommended, that you edit data required by others first. so as an example, first add an model, and after that the entitytytpe requiring it.
function ModLoader.Initialize()
	-- CppLogic.Logic.AddArchive("extra2\\shr\\maps\\user\\Schlacht um Grimsvoetn\\extension.bba") bei Ordnerform
	--- applying everything in Manifest
	ModLoader.ApplyManifest()

	--- manual code should go here
	CppLogic.ModLoader.RefreshEntityCategoryCache()
end

--- this function gets called after Initialize, only if the map starts fresh.
function  ModLoader.MapStart()
	
end

--- this function gets called after Initialize, only if a savegame gets loaded.
function ModLoader.LoadSave()
	
end

--- applying everything in Manifest
function ModLoader.ApplyManifest()
	ModLoader.PreloadManifestType(ModLoader.Manifest.EffectTypes, CppLogic.ModLoader.PreLoadEffectType, GGL_Effects)
	ModLoader.PreloadManifestType(ModLoader.Manifest.TaskLists, CppLogic.ModLoader.PreLoadTaskList, TaskLists)
	ModLoader.PreloadManifestType(ModLoader.Manifest.EntityTypes, CppLogic.ModLoader.PreLoadEntityType, Entities)
	ModLoader.PreloadManifestType(ModLoader.Manifest.Technologies, CppLogic.ModLoader.PreLoadTechnology, Technologies)
	for uc, et in pairs(ModLoader.Manifest.SettlerUpgradeCategory) do
		CppLogic.ModLoader.PreLoadUpgradeCategory(uc)
	end
	for uc, et in pairs(ModLoader.Manifest.BuildingUpgradeCategory) do
		CppLogic.ModLoader.PreLoadUpgradeCategory(uc)
	end

	for _,n in ipairs(ModLoader.Manifest.DirectXEffects) do
		CppLogic.ModLoader.LoadDirectXEffect(n)
	end
	for _,n in ipairs(ModLoader.Manifest.TerrainTextures_Add) do
		CppLogic.ModLoader.AddTerrainTexture(n)
	end
	for _,n in ipairs(ModLoader.Manifest.TerrainTextures_Reload) do
		CppLogic.ModLoader.ReloadTerrainTexture(n)
	end
	ModLoader.HandleManifestType(ModLoader.Manifest.WaterTypes, CppLogic.ModLoader.AddWaterType, CppLogic.ModLoader.ReloadWaterType, WaterTypes)
	ModLoader.HandleManifestType(ModLoader.Manifest.TerrainTypes, CppLogic.ModLoader.AddTerrainType, CppLogic.ModLoader.ReloadTerrainType, TerrainTypes)
	for _,n in ipairs(ModLoader.Manifest.SelectionTextures_Add) do
		CppLogic.ModLoader.AddSelectionTexture(n)
	end
	for _,n in ipairs(ModLoader.Manifest.SelectionTextures_Reload) do
		CppLogic.ModLoader.ReloadSelectionTexture(n)
	end
	ModLoader.HandleManifestType(ModLoader.Manifest.Animations, CppLogic.ModLoader.AddAnimation, CppLogic.ModLoader.ReloadAnimation, Animations)
	ModLoader.HandleManifestType(ModLoader.Manifest.AnimSets, CppLogic.ModLoader.AddAnimSet, CppLogic.ModLoader.ReloadAnimSet, AnimSets)
	ModLoader.HandleManifestType(ModLoader.Manifest.Models, CppLogic.ModLoader.AddModel, CppLogic.ModLoader.ReloadModel, Models)
	ModLoader.HandleManifestType(ModLoader.Manifest.EffectTypes, CppLogic.ModLoader.AddEffectType, CppLogic.ModLoader.ReloadEffectType, GGL_Effects)
	ModLoader.HandleManifestType(ModLoader.Manifest.TaskLists, CppLogic.ModLoader.AddTaskList, CppLogic.ModLoader.ReloadTaskList, TaskLists)
	ModLoader.HandleManifestType(ModLoader.Manifest.EntityTypes, CppLogic.ModLoader.AddEntityType, CppLogic.ModLoader.ReloadEntityType, Entities)
	ModLoader.HandleManifestType(ModLoader.Manifest.Technologies, CppLogic.ModLoader.AddTechnology, CppLogic.ModLoader.ReloadTechnology, Technologies)
	for _,n in ipairs(ModLoader.Manifest.GUITextures_Add) do
		CppLogic.ModLoader.AddGUITexture(n)
	end
	for _,n in ipairs(ModLoader.Manifest.GUITextures_Reload) do
		CppLogic.ModLoader.ReloadGUITexture(n)
	end
	for uc, et in pairs(ModLoader.Manifest.SettlerUpgradeCategory) do
		CppLogic.ModLoader.AddSettlerUpgradeCategory(uc, Entities[et])
	end
	for uc, et in pairs(ModLoader.Manifest.BuildingUpgradeCategory) do
		CppLogic.ModLoader.AddBuildingUpgradeCategory(uc, Entities[et])
	end
	for xp, ec in pairs(ModLoader.Manifest.ExperienceClasses) do
		CppLogic.ModLoader.AddExperienceClass(xp, ec)
	end
	for _,a in ipairs(ModLoader.Manifest.SoundGroups) do
		CppLogic.ModLoader.AddSounds(unpack(a))
	end
end
function ModLoader.PreloadManifestType(en, preload, data)
	for _, k in ipairs(en) do
		if type(k) == "string" and not data[k] then
			preload(k)
		end
	end
end
function ModLoader.HandleManifestType(en, add, reload, data)
	for _, k in ipairs(en) do
		if type(k) == "string" and not data[k] then
			add(k)
		else
			reload(k)
		end
	end
end

--- this function gets called when someone leaves a map for any reason.
-- cleanup code should go here.
-- after this method got executed, any extra archives get removed from the filesystem.
-- after that, any data that is marked for cleanup gets removed or reloaded.
-- ModLoader functions automatically mark data for cleanup, but you might have to do some manual cleanup if you use some other CppLogic functions.
-- after the automatic cleanup, ModLoader assumes all data to be back in the original state it was loaded from the games bbas.
function ModLoader.Cleanup()
	
end