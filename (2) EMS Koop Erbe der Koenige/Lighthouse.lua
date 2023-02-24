-----------------------------------NewDZs--------------------------------------------------------------------------------------------------
CounterTable = {}
LighthouseTable = {}

LighthouseTable[1] = {
    LighthouseID = 0,
    DefTowerID = 0,
    ConSiteID = 0,
    LighthouseBuild = false,
    DefTowerBuild = false,
    TributeAdded = true,  
}
LighthouseTable[2] = {
    LighthouseID = 0,
    DefTowerID = 0,
    ConSiteID = 0,
    LighthouseBuild = false,
    DefTowerBuild = false,
    TributeAdded = true,
}

CLogic.SetBuildingsAttractionLimit(Entities.CB_Lighthouse, 50)

function Erbe.AdditionalDZ(_tableTribute)
    
	GUIAction_ToggleMenu( gvGUI_WidgetID.TradeWindow,0)
	
    local delEntities = {
        Entities.XD_MiscBarrel1,
        Entities.XD_MiscBarrel2,
        Entities.XD_MiscBox2,
        Entities.XD_MiscBox1,
        Entities.XD_MiscTrolley1,
        Entities.XD_MiscTrolley2,
        Entities.XD_MiscTrolley3,
        Entities.XD_MiscTable1,
        Entities.XD_MiscSack1,
        Entities.XD_MiscSack2,
        Entities.XD_MiscHaybale1,
        Entities.XD_MiscHaybale2,
        Entities.XD_MiscHaybale3,
        Entities.XD_IronGrid4,
        Entities.XD_RuinTower1,   --Gebäude welches beim Abriss entsteht
    }
    local currentEntTab = {}
    LighthouseTable[_tableTribute.pId].LightPos = GetPosition("AddDz_Id" .. _tableTribute.pId);
    local x, y = LighthouseTable[_tableTribute.pId].LightPos.X, LighthouseTable[_tableTribute.pId].LightPos.Y;
    for i =table.getn(delEntities),1,-1 do
        currentEntTab = {Logic.GetEntitiesInArea(delEntities[i], x, y,900,16)}
        for j = 2, table.getn(currentEntTab) do
            DestroyEntity(currentEntTab[j])
        end;
    end

    LighthouseTable[_tableTribute.pId].LighthouseBuild = false
    LighthouseTable[_tableTribute.pId].TributeAdded = false
    LighthouseTable[_tableTribute.pId].ConSiteID = Logic.CreateConstructionSite(x,y, 0, Entities.PB_Residence1, _tableTribute.pId);
    _,LighthouseTable[_tableTribute.pId].LighthouseID = Logic.GetEntitiesInArea(Entities.PB_Residence,x,y, 200, 2)
    Logic.SetModelAndAnimSet(LighthouseTable[_tableTribute.pId].LighthouseID ,Models.CB_Lighthouse,nil);
   
end


function LighthouseTribut(_player)
	local TrMod1 =  {}
    TrMod1.pId = _player
    TrMod1.text = "Erstellt beim Kauf eine Baustelle für einen @color:57,245,26 Leuchtturm @color:255,255,255 mit besonderen Funktionen! @cr @cr Kosten: 1000 Taler, 500 Holz, 500 Stein."
    TrMod1.cost = { Gold = 1000, Wood = 500, Stone = 500 }
    TrMod1.Callback = Erbe.AdditionalDZ
    AddTribute(TrMod1)
end





function ConstructionLighthouseDestroied()
    for player=1,2 do
        if IsDestroyed(LighthouseTable[player].ConSiteID) and LighthouseTable[player].LighthouseBuild == false and LighthouseTable[player].TributeAdded == false then
            LighthouseTribut(player)
            CreateEntity(player,Entities.XD_RuinTower1,LighthouseTable[player].LightPos,"LightRuin"..player)  
            LighthouseTable[player].TributeAdded = true
        end
    end
end

StartSimpleJob("ConstructionLighthouseDestroied")

function SetLighthouse(_player)
    LighthouseTable[_player].LighthouseBuild = true
    LighthouseTable[_player].LighthouseID  = ReplaceEntity(LighthouseTable[_player].LighthouseID,Entities.CB_Lighthouse);
    return true;
end


-------Lighthouse Selection
function LighthouseSelection()
    GameCallback_GUI_SelectionChangedLH = GameCallback_GUI_SelectionChanged
    function GameCallback_GUI_SelectionChanged()
        GameCallback_GUI_SelectionChangedLH()
        local player = GUI.GetPlayerID()
        local sel = GUI.GetSelectedEntity()
        if sel and Logic.GetEntityType(sel) == Entities.CB_Lighthouse then
            XGUIEng.ShowWidget("Lighthouse", 1)
        end
        if LighthouseTable[player] then
            if LighthouseTable[player].DefTowerBuild == true then
                XGUIEng.ShowWidget("Upgrade_Lighthouse",0)
            else
                XGUIEng.ShowWidget("Upgrade_Lighthouse",1)
            end
        end
        if sel == LighthouseTable[player].DefTowerID then
            GUI.DeselectEntity(LighthouseTable[player].DefTowerID)
        end
    end
end


LighthouseSelection()

function UpgradeDefLighthouse()
    CNetwork.SendCommand("BuildDefTower", GUI.GetSelectedEntity());
end

LighthouseDefCostTable = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 400,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 700,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 200,
    [ResourceType.Silver] = 0,
}

function BuildDefTower(_name,_entity)
    local LightID = _entity
    local player =  Logic.EntityGetPlayer(_entity)
    if Logic.IsEntityAlive(_entity) and CNetwork.IsAllowedToManipulatePlayer(_name, Logic.EntityGetPlayer(_entity)) and LighthouseTable[player].DefTowerBuild == false and CheckAndSubResources(player, LighthouseDefCostTable) then
        LighthouseTable[player].DefTowerID = Logic.CreateEntity(Entities.PB_Tower3,GetPosition(LightID).X,GetPosition(LightID).Y-100,0,player)
        LighthouseTable[player].DefTowerBuild = true
        SVLib.SetEntitySize(LighthouseTable[player].DefTowerID,0.1)
        Logic.SetEntityInvulnerabilityFlag(LighthouseTable[player].DefTowerID,1)
        if GUI.GetPlayerID() == player then
            XGUIEng.ShowWidget("Upgrade_Lighthouse",0) --Bei Klick verschwindet der button nicht, erst bei abselektion
        end
    end
end


CNetwork.SetNetworkHandler("BuildDefTower", BuildDefTower); --Init für CNetwork.SendCommand


function CheckDefTower()
    for player = 1, 2 do
        if IsExisting(LighthouseTable[player].DefTowerID) and not IsExisting(LighthouseTable[player].LighthouseID) and LighthouseTable[player].TributeAdded == false then
            Logic.SetEntityInvulnerabilityFlag(LighthouseTable[player].DefTowerID, 0)
            DestroyEntity(LighthouseTable[player].DefTowerID)
            LighthouseTable[player].DefTowerBuild = false
            LighthouseTable[player].LighthouseBuild = false
            LighthouseTribut(player)
            LighthouseTable[player].TributeAdded = true
        end
        if IsExisting(LighthouseTable[player].LighthouseID) 
        and Logic.GetEntityType(LighthouseTable[player].LighthouseID) == Entities.CB_Lighthouse 
        and not IsExisting(LighthouseTable[player].DefTowerID) 
        and LighthouseTable[player].DefTowerBuild == true then
            LighthouseTable[player].DefTowerID = Logic.CreateEntity(Entities.PB_Tower3,
                GetPosition(LighthouseTable[player].LighthouseID).X,
                GetPosition(LighthouseTable[player].LighthouseID).Y - 100, 0, player)
            SVLib.SetEntitySize(LighthouseTable[player].DefTowerID, 0.1)
        end
    end
end

StartSimpleHiResJob("CheckDefTower")


function GUITooltip_UpgradeLighthouse()
	XGUIEng.SetText("TooltipBottomText", "@color:101,67,33 Verteidigungsturm @cr @color:255,255,255 Rüstet den Leuchtturm mit einem Kanonengeschütz aus.")
    XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(LighthouseDefCostTable))
end


---Banditenbogenschützen Lighthouse

BanditBowCost = {
    [ResourceType.Gold] = 270,
    [ResourceType.Wood] = 180,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUIAction_BuyBanditBow()
    local player = Logic.EntityGetPlayer(GUI.GetSelectedEntity())
    if InterfaceTool_HasPlayerEnoughResources_Feedback(BanditBowCost) == 1 and Logic.GetPlayerAttractionLimit(player)>Logic.GetPlayerAttractionUsage(player) then
        CNetwork.SendCommand("BuyBanditBow", GUI.GetSelectedEntity());
    end
end

function BuyBanditBow(_name,_entity)  --_name von Server ergänzt
    if Logic.IsEntityAlive(_entity) and CNetwork.IsAllowedToManipulatePlayer(_name, Logic.EntityGetPlayer(_entity)) then
        local bow_table = {}
        local player = Logic.EntityGetPlayer(_entity)
        bow_table.X , bow_table.Y = Logic.EntityGetPos(_entity)
        bow_table.X = bow_table.X -550
        bow_table.Y = bow_table.Y -50
        if cooldown_BanditBow == CounterTable.BanditBow_Counter[player] and CheckAndSubResources(player,BanditBowCost) == true then
            CounterTable.BanditBow_Counter[player] = 0;
            CreateMilitaryGroup(player,Entities.CU_BanditLeaderBow1,4,bow_table)
            --XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
        end
    end
end

CNetwork.SetNetworkHandler("BuyBanditBow", BuyBanditBow); --Init für CNetwork.SendCommand

function GUIUpdate_BuyBanditBowCount()

    local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local player = GUI.GetPlayerID()
    if not LighthouseTable[player] then
        return
    end
	if CounterTable.BanditBow_Counter[player] < cooldown_BanditBow then
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,214,44,24,189)						
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_BanditBow_Lighthouse"),1)
	end
	if CounterTable.BanditBow_Counter[player] >= cooldown_BanditBow then		
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,0,0,0,0)
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_BanditBow_Lighthouse"),0)
	end
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CounterTable.BanditBow_Counter[player], cooldown_BanditBow)

end


cooldown_BanditBow = 30
CounterTable.BanditBow_Counter = {}
CounterTable.BanditBow_Counter[1] = 0; -- wenn BanditBow_Counter = cooldown_BanditBow zum mapstart direkt aktiv, bei BanditBow_Counter = 0 zum mapstart erst laden
CounterTable.BanditBow_Counter[2] = 0;

function BanitBowCounter()
    for i=1,2 do
        if CounterTable.BanditBow_Counter[i] < cooldown_BanditBow then
            CounterTable.BanditBow_Counter[i] = CounterTable.BanditBow_Counter[i] +1;
        end
    end
end

StartSimpleJob("BanitBowCounter")

function GUITooltip_BuyBanditBow()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Banditenbogenschützen @cr @color:255,255,255 Kauft ein Trupp Banditenbogenschützen.")
    XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BanditBowCost))
end



---Elitebarbaren Lighthouse 

ElitBarbsCost = {
    [ResourceType.Gold] = 500,
    [ResourceType.Wood] = 0,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 250,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUIAction_BuyElitBarbs()
    local player = Logic.EntityGetPlayer(GUI.GetSelectedEntity())
    if InterfaceTool_HasPlayerEnoughResources_Feedback(BanditBowCost) == 1 and Logic.GetPlayerAttractionLimit(player)>Logic.GetPlayerAttractionUsage(player) then
        CNetwork.SendCommand("BuyEliteBarbs", GUI.GetSelectedEntity());
    end
end

function BuyEliteBarbs(_name,_entity)  --_name von Server ergänzt
    if Logic.IsEntityAlive(_entity) and CNetwork.IsAllowedToManipulatePlayer(_name, Logic.EntityGetPlayer(_entity)) then
        local barb_table = {}
        local player = Logic.EntityGetPlayer(_entity)
        barb_table.X , barb_table.Y = Logic.EntityGetPos(_entity)
        barb_table.X = barb_table.X -550
        barb_table.Y = barb_table.Y -50
        if cooldown_EliteBarb == CounterTable.ElitBarb_Counter[player] and CheckAndSubResources(player,ElitBarbsCost) == true then
            CounterTable.ElitBarb_Counter[player] = 0;
            CreateMilitaryGroup(player,Entities.CU_VeteranLieutenant,4,barb_table)
            --XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
        end
    end
end


CNetwork.SetNetworkHandler("BuyEliteBarbs", BuyEliteBarbs); --Init für CNetwork.SendCommand

function GUIUpdate_BuyElitBarbCount()

    local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local player = GUI.GetPlayerID()
	if CounterTable.ElitBarb_Counter[player] < cooldown_EliteBarb then
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,214,44,24,189)						
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_ElitBarb_Lighthouse"),1)
	end
	if CounterTable.ElitBarb_Counter[player] >= cooldown_EliteBarb then		
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,0,0,0,0)
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_ElitBarb_Lighthouse"),0)
	end
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,CounterTable.ElitBarb_Counter[player], cooldown_EliteBarb)

end

CounterTable.ElitBarb_Counter = {}
cooldown_EliteBarb = 30
CounterTable.ElitBarb_Counter[1] = 0; -- wenn ElitBarb_Counter = cooldown_BanditBow zum mapstart direkt aktiv, bei ElitBarb_Counter = 0 zum mapstart erst laden
CounterTable.ElitBarb_Counter[2] = 0;

function ElitBarbCounter()
    for i = 1, 2 do
        if CounterTable.ElitBarb_Counter[i] < cooldown_EliteBarb then
            CounterTable.ElitBarb_Counter[i] = CounterTable.ElitBarb_Counter[i] + 1;
        end
    end
end

StartSimpleJob("ElitBarbCounter")

function GUITooltip_BuyElitBarbs()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Elitebarbaren @cr @color:255,255,255 Kauft ein Trupp Elitebarbaren.")
    XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(ElitBarbsCost))
end


----Kimichuras Resource Checker


function CheckAndSubResources(_playerID, _costTable)
    
    _costTable[ResourceType.WeatherEnergy] = _costTable[ResourceType.WeatherEnergy] or 0;
    _costTable[ResourceType.Knowledge] = _costTable[ResourceType.Knowledge] or 0;
    _costTable[ResourceType.Faith] = _costTable[ResourceType.Faith] or 0;
    
    
    local Clay = GetClay(_playerID);
    local Wood = GetWood(_playerID);
    local Gold = GetGold(_playerID);
    local Stone = GetStone(_playerID);
    local Iron = GetIron(_playerID);
    local Sulfur = GetSulfur(_playerID);
    
    local Faith = Logic.GetPlayersGlobalResource( _playerID, ResourceType.Faith );
    local Silver = Logic.GetPlayersGlobalResource( _playerID, ResourceType.Silver ) + Logic.GetPlayersGlobalResource( _playerID, ResourceType.SilverRaw)
    local WeatherEnergy = Logic.GetPlayersGlobalResource( _playerID, ResourceType.WeatherEnergy );
    local Knowledge = Logic.GetPlayersGlobalResource( _playerID, ResourceType.Knowledge );

    
    if Sulfur >= _costTable[ResourceType.Sulfur]
    and Iron >= _costTable[ResourceType.Iron]
    and Stone >= _costTable[ResourceType.Stone]
    and Gold >= _costTable[ResourceType.Gold]
    and Wood >= _costTable[ResourceType.Wood]
    and Clay >= _costTable[ResourceType.Clay]
    and Faith >= _costTable[ResourceType.Faith]
    and Silver >= _costTable[ResourceType.Silver]
    and WeatherEnergy >= _costTable[ResourceType.WeatherEnergy]
    and Knowledge >= _costTable[ResourceType.Knowledge]
    then
        AddGold(_playerID, - _costTable[ResourceType.Gold]);
        AddClay(_playerID, - _costTable[ResourceType.Clay]);
        AddWood(_playerID, - _costTable[ResourceType.Wood]);
        AddStone(_playerID, - _costTable[ResourceType.Stone]);
        AddIron(_playerID, - _costTable[ResourceType.Iron]);
        AddSulfur(_playerID, - _costTable[ResourceType.Sulfur]);
        
       Logic.AddToPlayersGlobalResource(_playerID, ResourceType.Faith, - _costTable[ResourceType.Faith]);
       Logic.AddToPlayersGlobalResource(_playerID, ResourceType.Silver, - _costTable[ResourceType.Silver]);
       Logic.AddToPlayersGlobalResource(_playerID, ResourceType.WeatherEnergy, - _costTable[ResourceType.WeatherEnergy]);
       Logic.AddToPlayersGlobalResource(_playerID, ResourceType.Knowledge, - _costTable[ResourceType.Knowledge]);
        
        return true;
    end;
    return false;
end;
