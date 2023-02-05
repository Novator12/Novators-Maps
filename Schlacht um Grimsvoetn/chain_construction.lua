--by Novator12 , angelehnt an Kimichuras construction chain

CHAIN_CONSTRUCTION_MAX_DISTANCE = 3500;

function GetConstructionSiteAt(_x, _y)
	for id in CppLogic.Entity.EntityIterator(CppLogic.Entity.Predicates.And(CppLogic.Entity.Predicates.Or(
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite2),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite3),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite4),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite5),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteArchery1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBarracks1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBlacksmith1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBridge1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteFarm1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteIronMine1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMarket1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMint1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMonastery1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteResidence1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteSilverMine1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStables1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStoneMine1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStonemason1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteSulfurMine1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteTower1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteUniversity1),
    CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteVillageCenter1)),
    CppLogic.Entity.Predicates.InCircle(_x, _y, 0))) do
		return id;
	end;
	
	return;
end;

function ActivateCC()

GameCallback_OnBuildingConstructionCompleteCC=GameCallback_OnBuildingConstructionComplete
    function GameCallback_OnBuildingConstructionComplete(_BuildingID,_PlayerID)
        GameCallback_OnBuildingConstructionCompleteCC(_BuildingID,_PlayerID)

        local x,y = Logic.EntityGetPos(_BuildingID);
        local csite;
        for id in CppLogic.Entity.EntityIterator(CppLogic.Entity.Predicates.And(CppLogic.Entity.Predicates.OfPlayer(_PlayerID), 
        CppLogic.Entity.Predicates.Or(CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite2),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite3),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite4),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSite5),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteArchery1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBarracks1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBlacksmith1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteBridge1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteFarm1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteIronMine1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMarket1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMint1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteMonastery1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteResidence1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteSilverMine1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStables1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStoneMine1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteStonemason1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteSulfurMine1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteTower1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteUniversity1),
        CppLogic.Entity.Predicates.OfType(Entities.ZB_ConstructionSiteVillageCenter1)), 
        CppLogic.Entity.Predicates.InCircle(x,y, 0))) do
            csite = id;
        end;

        if csite then
            local serfs = {}
            serfs = { Logic.GetEntitiesInArea(Entities.PU_Serf,GetPosition(csite).X,GetPosition(csite).Y,CHAIN_CONSTRUCTION_MAX_DISTANCE,8)}
            table.remove(serfs,1)
            for i= table.getn(serfs),1,-1 do
                local tasklist = Logic.GetCurrentTaskList(serfs[i])
                if not tasklist == "TL_SERF_IDLE" then
                    table.remove(serfs,i)
                end
            end
            --LuaDebugger.Log(serfs);
            
            local buildings = {};
            for id in CppLogic.Entity.EntityIterator(CppLogic.Entity.Predicates.OfPlayer(_PlayerID)) do
                if id ~= _BuildingID and Logic.IsBuilding(id) and Logic.IsConstructionComplete(id) == 0 then
                    table.insert(buildings, id);
                end;
            end;
            
            
            local sorted = {};
            for i = 1,table.getn(buildings) do
                local building = buildings[i];
                local x_, y_ = Logic.EntityGetPos(building);
                local dist = math.sqrt((x_ - x)^2 + (y_ - y)^2);
                if dist <= CHAIN_CONSTRUCTION_MAX_DISTANCE then
                    table.insert(sorted, { building, dist });
                end;
            end;
            table.sort(sorted, function(a,b) return a[2] > b[2] end);
            
            
            --LuaDebugger.Log(sorted);
            
            for i = 1,table.getn(serfs) do
                local serf = serfs[i];
                local sector_serf = Logic.GetSector(serf);
                --for j = 1,table.getn(buildings) do
                for _, pair in pairs(sorted) do
                    local building = pair[1];
                    local sector_building = Logic.GetSector(building);
                    
                    if sector_serf == sector_building then
                        local csite = GetConstructionSiteAt(Logic.EntityGetPos(building));
                        
                        if csite then
                            local bID = CppLogic.Entity.Building.ConstructionSiteGetBuilding(csite)
                            local free = CppLogic.Entity.Building.GetNearestFreeConstructionSlotFor(bID,GetPosition(serf))
                            local tasklist = Logic.GetCurrentTaskList(serfs[i])
                            if free ~= -1 and Logic.EntityGetPlayer(serf) == 1 and tasklist == "TL_SERF_BUILD" then  --neu. Test ob klappt
                                CppLogic.Entity.Settler.CommandSerfConstructBuilding(serf, building);
                            end;
                        end;
                    end;
                end;
            end;
            
            --LuaDebugger.Log(construction_sites);
            
        end;
    end;

end