
----------------------------------BarmeciaAI-----------------------------------------

function Erbe.SetupAIBar()
    MapEditor_SetupAI(9, CheckMode, 2500, 0, "BarmeciaPoint", 1, 0)
    CountBar = 0
    for i = 1, CheckMode do
        MapEditor_Armies[9][i + CountBar].position = GetPosition("Bar_Waypoint5")
        MapEditor_Armies[9][i + 1 + CountBar].position = GetPosition("barm_def1")
        MapEditor_Armies[9][i + 2 + CountBar].position = GetPosition("Bar_Waypoint1")
        CountBar = CountBar + 2
    end
end


CounterUpgradeBarmecia = 0
function Erbe.UpgradeBarmecia()
    CounterUpgradeBarmecia = CounterUpgradeBarmecia + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 9)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 9)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 9)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 9)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 9)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 9)
    if CounterUpgradeBarmecia == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 9)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 9)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 9)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 9)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 9)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 9)
    end
end



function Erbe.UpgradeBarmeciaAggressivness()
    --Barmecia
    CountBar = 0
    for i = 1, CheckMode do
        local _range                                        = 100000
        MapEditor_Armies[9][i + CountBar].rodeLength        = (_range * 2) / 3
        MapEditor_Armies[9][i + CountBar].baseDefenseRange  = (_range) / 3
        MapEditor_Armies[9][i + CountBar].outerDefenseRange = _range
        MapEditor_Armies[9][i + CountBar].AttackAllowed     = true
        MapEditor_Armies[9][i + 1 + CountBar].rodeLength    = (_range * 2) / 3
        MapEditor_Armies[9][i + 1 + CountBar].baseDefenseRange = (_range) / 3
        MapEditor_Armies[9][i + 1 + CountBar].outerDefenseRange = _range
        MapEditor_Armies[9][i + 1 + CountBar].AttackAllowed = true
        MapEditor_Armies[9][i + 2 + CountBar].rodeLength    = (_range * 2) / 3
        MapEditor_Armies[9][i + 2 + CountBar].baseDefenseRange = (_range) / 3
        MapEditor_Armies[9][i + 2 + CountBar].outerDefenseRange = _range
        MapEditor_Armies[9][i + 2 + CountBar].AttackAllowed = true
        CountBar                                            = CountBar + 2
    end
end

----------------------------------FolklungAI-----------------------------------------    

function Erbe.SetupAIFolk()
    --FolklungMain
    MapEditor_SetupAI(10, CheckMode, 3500, 0, "FolklungCastle", 2, 0)
    CountFolk1 = 0
    for i=1,CheckMode do
        MapEditor_Armies[10][i+CountFolk1].position	= GetPosition("FolkDef1")
        MapEditor_Armies[10][i+1+CountFolk1].position	= GetPosition("FolkDef2")
        MapEditor_Armies[10][i+2+CountFolk1].position	= GetPosition("FolkDef3")
        CountFolk1 = CountFolk1+2
    end
end

CounterUpgradeFolklungMain = 0
function Erbe.UpgradeFolklungMain()
    CounterUpgradeFolklungMain = CounterUpgradeFolklungMain + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 10)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 10)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 10)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 10)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 10)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 10)
    if CounterUpgradeFolklungMain == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 10)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 10)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 10)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 10)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 10)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 10)
    end
end


function Erbe.UpgradeFolklungAggressivness()
    --FolklungMain
    CountFolk1 = 0
    for i = 1, CheckMode do
        local _range                                           = 100000
        MapEditor_Armies[10][i + CountFolk1].rodeLength        = (_range * 2) / 3
        MapEditor_Armies[10][i + CountFolk1].baseDefenseRange  = (_range) / 3
        MapEditor_Armies[10][i + CountFolk1].outerDefenseRange = _range
        MapEditor_Armies[10][i + CountFolk1].AttackAllowed     = true
        MapEditor_Armies[10][i + 1 + CountFolk1].rodeLength    = (_range * 2) / 3
        MapEditor_Armies[10][i + 1 + CountFolk1].baseDefenseRange = (_range) / 3
        MapEditor_Armies[10][i + 1 + CountFolk1].outerDefenseRange = _range
        MapEditor_Armies[10][i + 1 + CountFolk1].AttackAllowed = true
        MapEditor_Armies[10][i + 2 + CountFolk1].rodeLength    = (_range * 2) / 3
        MapEditor_Armies[10][i + 2 + CountFolk1].baseDefenseRange = (_range) / 3
        MapEditor_Armies[10][i + 2 + CountFolk1].outerDefenseRange = _range
        MapEditor_Armies[10][i + 2 + CountFolk1].AttackAllowed = true
        CountFolk1                                             = CountFolk1 + 2
    end
end





--------------------------------------------OutpostFolklung---------------------------------------------
function Erbe.SetupAIOutpost()
    --FolklungOutpost
    MapEditor_SetupAI(14, CheckMode, 2500, 0, "FolklungCastle", 1, 0)
    CountFolk2 = 0
    for i=1,CheckMode do
        MapEditor_Armies[14][i+CountFolk2].position	= GetPosition("FolkOutpostDef1")
        MapEditor_Armies[14][i+1+CountFolk2].position	= GetPosition("FolkOutpostDef2")
        MapEditor_Armies[14][i+2+CountFolk2].position	= GetPosition("FolkOutpostDef3")
        CountFolk2 = CountFolk2+2
    end
end


CounterUpgradeFolklungOutpost = 0
function Erbe.UpgradeFolklungOutpost()
    CounterUpgradeFolklungOutpost = CounterUpgradeFolklungOutpost + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 14)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 14)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 14)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 14)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 14)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 14)
    if CounterUpgradeFolklungOutpost == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 14)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 14)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 14)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 14)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 14)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 14)
    end
end

function Erbe.UpgradeOutpostAggressivness()
    --FolklungOutpost
    CountFolk2 = 0
    for i=1,CheckMode do
        local _range = 100000
        MapEditor_Armies[14][i+CountFolk2].rodeLength			=	(_range*2)/3
		MapEditor_Armies[14][i+CountFolk2].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[14][i+CountFolk2].outerDefenseRange	=	_range
		MapEditor_Armies[14][i+CountFolk2].AttackAllowed		=	true
        MapEditor_Armies[14][i+1+CountFolk2].rodeLength			=	(_range*2)/3
		MapEditor_Armies[14][i+1+CountFolk2].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[14][i+1+CountFolk2].outerDefenseRange	=	_range
		MapEditor_Armies[14][i+1+CountFolk2].AttackAllowed		=	true
        MapEditor_Armies[14][i+2+CountFolk2].rodeLength			=	(_range*2)/3
		MapEditor_Armies[14][i+2+CountFolk2].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[14][i+2+CountFolk2].outerDefenseRange	=	_range
		MapEditor_Armies[14][i+2+CountFolk2].AttackAllowed		=	true
        CountFolk2 = CountFolk2+2
    end
end



--------------------------------------------VargMain---------------------------------------------
function Erbe.SetupAIVargMain()
    --VargMain
    MapEditor_SetupAI(11, CheckMode, 4000, 0, "VargCastle", 2, 0)
    CountVar1 = 0
    for i=1,CheckMode do
        MapEditor_Armies[11][i+CountVar1].position	= GetPosition("VargMainDef1")
        MapEditor_Armies[11][i+1+CountVar1].position	= GetPosition("VargMainDef2")
        MapEditor_Armies[11][i+2+CountVar1].position	= GetPosition("VargMainDef3")
        CountVar1 = CountVar1+2
    end
end



CounterUpgradeVargMain = 0
function Erbe.UpgradeVargMain()
    CounterUpgradeVargMain = CounterUpgradeVargMain + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 11)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 11)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 11)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 11)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 11)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 11)
    if CounterUpgradeVargMain == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 11)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 11)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 11)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 11)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 11)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 11)
    end
end



function Erbe.UpgradeVargMainAggressivness()
    --VargMain
    CountVar1 = 0
    for i=1,CheckMode do
        local _range = 100000
        MapEditor_Armies[11][i+CountVar1].rodeLength			=	(_range*2)/3
        MapEditor_Armies[11][i+CountVar1].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[11][i+CountVar1].outerDefenseRange	=	_range
        MapEditor_Armies[11][i+CountVar1].AttackAllowed		=	true
        MapEditor_Armies[11][i+1+CountVar1].rodeLength			=	(_range*2)/3
        MapEditor_Armies[11][i+1+CountVar1].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[11][i+1+CountVar1].outerDefenseRange	=	_range
        MapEditor_Armies[11][i+1+CountVar1].AttackAllowed		=	true
        MapEditor_Armies[11][i+2+CountVar1].rodeLength			=	(_range*2)/3
        MapEditor_Armies[11][i+2+CountVar1].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[11][i+2+CountVar1].outerDefenseRange	=	_range
        MapEditor_Armies[11][i+2+CountVar1].AttackAllowed		=	true
        CountVar1 = CountVar1+2
    end
end



--------------------------------------------VargOutpost---------------------------------------------

function Erbe.SetupAIVargOutpost()
    --VargOutpost
    MapEditor_SetupAI(15, CheckMode, 4000, 0, "VargPoint", 1, 0)
    CountVar2 = 0
    for i=1,CheckMode do
        MapEditor_Armies[15][i+CountVar2].position	= GetPosition("VargPoint")
        MapEditor_Armies[15][i+1+CountVar2].position	= GetPosition("VargPoint2")
        MapEditor_Armies[15][i+2+CountVar2].position	= GetPosition("VargPoint3")
        CountVar2 = CountVar2+2
    end
end


CounterUpgradeVargOutpost = 0
function Erbe.UpgradeVargOutpost()
    CounterUpgradeVargOutpost = CounterUpgradeVargOutpost + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 15)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 15)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 15)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 15)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 15)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 15)
    if CounterUpgradeVargOutpost == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 15)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 15)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 15)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 15)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 15)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 15)
    end
end

function Erbe.UpgradeVargOutpostAggressivness()
    --VargOutpost
    CountVar2 = 0
    for i=1,CheckMode do
        local _range = 100000
        MapEditor_Armies[15][i+CountVar2].rodeLength			=	(_range*2)/3
        MapEditor_Armies[15][i+CountVar2].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[15][i+CountVar2].outerDefenseRange	=	_range
        MapEditor_Armies[15][i+CountVar2].AttackAllowed		=	true
        MapEditor_Armies[15][i+1+CountVar2].rodeLength			=	(_range*2)/3
        MapEditor_Armies[15][i+1+CountVar2].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[15][i+1+CountVar2].outerDefenseRange	=	_range
        MapEditor_Armies[15][i+1+CountVar2].AttackAllowed		=	true
        MapEditor_Armies[15][i+2+CountVar2].rodeLength			=	(_range*2)/3
        MapEditor_Armies[15][i+2+CountVar2].baseDefenseRange		=	(_range)/3
        MapEditor_Armies[15][i+2+CountVar2].outerDefenseRange	=	_range
        MapEditor_Armies[15][i+2+CountVar2].AttackAllowed		=	true
        CountVar2 = CountVar2+2
    end
end


--------------------------------------------Dario---------------------------------------------
function Erbe.SetupAIDario()
    --Dario
    MapEditor_SetupAI(12, CheckMode, 4000, 0, "DarioDef1", 2, 0)
    CountDar = 0
    for i=1,CheckMode do
        MapEditor_Armies[12][i+CountDar].position	= GetPosition("DarioDef1")
        MapEditor_Armies[12][i+1+CountDar].position	= GetPosition("DarioDef2")
        MapEditor_Armies[12][i+2+CountDar].position	= GetPosition("DarioDef3")
        CountDar = CountDar+2
    end
end



CounterUpgradeDario = 0
function Erbe.UpgradeDario()
    CounterUpgradeDario = CounterUpgradeDario + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 12)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 12)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 12)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 12)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 12)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 12)
    if CounterUpgradeDario == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 12)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 12)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 12)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 12)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 12)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 12)
    end
end


function Erbe.UpgradeDarioAggressivness()
  --Dario
  CountDar = 0
  for i=1,CheckMode do
      local _range = 100000
      MapEditor_Armies[12][i+CountDar].rodeLength			=	(_range*2)/3
      MapEditor_Armies[12][i+CountDar].baseDefenseRange		=	(_range)/3
      MapEditor_Armies[12][i+CountDar].outerDefenseRange	=	_range
      MapEditor_Armies[12][i+CountDar].AttackAllowed		=	true
      MapEditor_Armies[12][i+1+CountDar].rodeLength			=	(_range*2)/3
      MapEditor_Armies[12][i+1+CountDar].baseDefenseRange		=	(_range)/3
      MapEditor_Armies[12][i+1+CountDar].outerDefenseRange	=	_range
      MapEditor_Armies[12][i+1+CountDar].AttackAllowed		=	true
      MapEditor_Armies[12][i+2+CountDar].rodeLength			=	(_range*2)/3
      MapEditor_Armies[12][i+2+CountDar].baseDefenseRange		=	(_range)/3
      MapEditor_Armies[12][i+2+CountDar].outerDefenseRange	=	_range
      MapEditor_Armies[12][i+2+CountDar].AttackAllowed		=	true
      CountDar = CountDar+2
  end

end

--------------------------------------------Banditen---------------------------------------------

function Erbe.SetupAIBanditen()
	--Bandits
    MapEditor_SetupAI(13, CheckMode, 2000, 0, "BanditDef1", 1, 0)
    CountBan = 0
    for i=1,CheckMode do
        MapEditor_Armies[13][i+CountBan].position	= GetPosition("BanditDef1")
        MapEditor_Armies[13][i+1+CountBan].position	= GetPosition("BanditDef2")
        MapEditor_Armies[13][i+2+CountBan].position	= GetPosition("BanditDef3")
        CountBan = CountBan+2
    end

end



CounterUpgradeBandits = 0
function Erbe.UpgradeBandits()
    CounterUpgradeBandits = CounterUpgradeBandits + 1
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 13)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 13)
    Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 13)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 13)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 13)
    Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 13)
    if CounterUpgradeBandits == 3 then
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 13)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 13)
        Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 13)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 13)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 13)
        Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 13)
    end
end


function Erbe.UpgradeBanditenAggressivness()
    --Bandits
    CountBan = 0
    for i=1,CheckMode do
        local _range = 100000
        MapEditor_Armies[13][i+CountBan].rodeLength			=	(_range*2)/3
		MapEditor_Armies[13][i+CountBan].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[13][i+CountBan].outerDefenseRange	=	_range
		MapEditor_Armies[13][i+CountBan].AttackAllowed		=	true
        MapEditor_Armies[13][i+1+CountBan].rodeLength			=	(_range*2)/3
		MapEditor_Armies[13][i+1+CountBan].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[13][i+1+CountBan].outerDefenseRange	=	_range
		MapEditor_Armies[13][i+1+CountBan].AttackAllowed		=	true
        MapEditor_Armies[13][i+2+CountBan].rodeLength			=	(_range*2)/3
		MapEditor_Armies[13][i+2+CountBan].baseDefenseRange		=	(_range)/3
		MapEditor_Armies[13][i+2+CountBan].outerDefenseRange	=	_range
		MapEditor_Armies[13][i+2+CountBan].AttackAllowed		=	true
        CountBan = CountBan+2
    end
end


--Upgrade der AI

UpgradeStateAI = 1

function UpgradeAI()
    Erbe.UpgradeBandits()
    Erbe.UpgradeBarmecia()
    Erbe.UpgradeDario()
    Erbe.UpgradeFolklungMain()
    Erbe.UpgradeFolklungOutpost()
    Erbe.UpgradeVargMain()
    Erbe.UpgradeVargOutpost()
    if UpgradeStateAI < 3 then
        UpgradeStateAI = UpgradeStateAI + 1
        StartCountdown(60*20,UpgradeAI,false)
    end
end