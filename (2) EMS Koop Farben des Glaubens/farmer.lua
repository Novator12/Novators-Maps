--Novator12s FarmSimulator 2021

--Instruction: Bitte das Brush: Farm (farmer-skript), erhältlich von Novator12, im Mapeditor platzieren und als start_posX & start_posY die Koordinaten
--             der SkriptEntity mit dem Namen "Farmer-Start" in der Funktion StartFarming(start_posX,start_posY,player_id) angeben. Die player_id des 
--             Bauern ist frei wählbar.



--Check im welchem Durchlauf man sich befindet
status_farmer = 1;

function StartFarming(start_posX,start_posY,farmer_id)

    farmID = farmer_id
    --Erzeugt den Bauern der pflanzt
    farmer = Logic.CreateEntity(Entities.CU_FarmerIdle, start_posX, start_posY, 0, farmID)

    --Wegpunkte die der Bauer abläuft
    startX = start_posX;
    startY = start_posY;

    wp1_X = start_posX +700;
    wp1_Y = start_posY;

    wp2_X = wp1_X;
    wp2_Y = wp1_Y - 250;

    wp3_X = wp2_X + 1300;
    wp3_Y = wp2_Y;

    wp4_X = wp3_X;
    wp4_Y = wp3_Y + 2300;

    wp5_X = wp4_X - 300;
    wp5_Y = wp4_Y;

    wp6_X = wp5_X;
    wp6_Y = wp5_Y - 2000;

    wp7_X = wp6_X - 300;
    wp7_Y = wp6_Y;

    wp8_X = wp7_X;
    wp8_Y = wp7_Y + 2000

    wp9_X = wp8_X - 400;
    wp9_Y = wp8_Y - 1900;


    --Erster Bewegungsbefehl ins Feld
    Logic.SetTaskList(farmer, TaskLists.TL_NPC_WALK)
    Logic.MoveEntity(farmer, wp1_X, wp1_Y)
    --Abfrage der Punkte
    StartSimpleJob("WaypointCheck")
    --Statusabfrage: Darf er neu pflanzen
    if status_farmer == 1 then
        StartSimpleJob("CheckFirstPoint")
    end
    --Statusabfrage: Erntecheck
    if status_farmer == 2 then 
       HarvestJob = StartSimpleHiResJob("Harvest")
    end
end


function CheckFirstPoint()
    --Ist der Bauer am ersten Punkt auf dem Feld?
    if GetDistance(farmer,{X = wp1_X, Y = wp1_Y}) <= 100 then
        StartSimpleJob("CounterSeeds")
        return true;
    end
end

function Harvest()
    --Check ob man in der Erntephase 1 ist: status_farmer = 2
    if status_farmer == 2 then
        for b= 1, table.getn(seed_table),1 do
            if GetDistance(farmer,seed_table[b]) <= 150 then
                --Ernten des Korns
                seed_table[b] = ReplaceEntity(seed_table[b], Entities.XD_Rock1)
                Logic.SetModelAndAnimSet(seed_table[b],Models.XD_MiscHaybale2,nil);
            end
        end
    --Check ob man in Erntephase 2 ist: status_farmer = 3
    elseif status_farmer == 3 then
        for i= 1, table.getn(seed_table),1 do
            if GetDistance(farmer,seed_table[i]) <= 150 then
                --Sammelt das Korn
                DestroyEntity(seed_table[i])
            end
        end    
    end

end

helpCounter_farmer = 1
-- Wie nah ist der Bauer an jedem Punkt?
function WaypointCheck()
    if GetDistance(farmer, {X = _G["wp"..helpCounter_farmer.."_X"], Y = _G["wp"..helpCounter_farmer.."_Y"]}) <= 100 then 
        --Durchlauf des Feldes
        helpCounter_farmer = helpCounter_farmer+1;
        if helpCounter_farmer == 10 then
            Logic.SetTaskList(farmer, TaskLists.TL_NPC_WALK)
            Logic.MoveEntity(farmer, startX, startY)
            --Check ob Phase 1 beendet wurde
            if status_farmer == 1  then
                helpCounter_farmer=1;
                return true;
            --Check ob Phase 2 beendet wurde
            elseif status_farmer == 2 or status_farmer == 3 then
                StartSimpleJob("WaypointCheckHelper")
                helpCounter_farmer=1;
                return true;
            end
        end
        Logic.SetTaskList(farmer, TaskLists.TL_NPC_WALK)
        Logic.MoveEntity(farmer, _G["wp"..helpCounter_farmer.."_X"], _G["wp"..helpCounter_farmer.."_Y"])
    end  
end

function WaypointCheckHelper()
    if status_farmer == 2 and GetDistance(farmer, {X = startX, Y = startY}) <= 50 then
        status_farmer = 3;
        DestroyEntity(farmer)
        StartFarming(startX,startY,farmID)
        return true;
    elseif status_farmer == 3 and GetDistance(farmer, {X = startX, Y = startY}) <= 50 then
        status_farmer = 1;
        EndJob(HarvestJob)
        DestroyEntity(farmer)
        StartFarming(startX,startY,farmID)
        return true;
    end
end





seed_table = {}
countSeeds = 1

function CounterSeeds()
    --Platzieren der Samen die in einer Table gespeichert werden
    var_plant = Logic.CreateEntity(Entities.XD_GreeneryVertical2,GetPosition(farmer).X,GetPosition(farmer).Y,0,0)
    if var_plant ~= 0 then
        seed_table[countSeeds] = var_plant
        countSeeds = countSeeds +1;
    end
    
    --Check ob der Bauer am Ende seiner Route ist
    if GetDistance(farmer, {X = wp9_X, Y = wp9_Y}) <= 100 then
        StartSimpleJob("GrowPhase1")
        countSeeds = 1
        return true;
    end

end

countGrow1 = 1
function GrowPhase1()
    countGrow1 = countGrow1 +1;
    if countGrow1 >= 10 then
        for g=1, table.getn(seed_table),1 do
            seed_table[g] = ReplaceEntity(seed_table[g], Entities.XD_Bush3)
        end
        StartSimpleJob("GrowPhase2")
        countGrow =1
        return true;
    end
end

countGrow2 = 1
function GrowPhase2()
    countGrow2 = countGrow2 +1;
    if countGrow2 >= 10 then
        for g=1, table.getn(seed_table),1 do
            seed_table[g] = ReplaceEntity(seed_table[g], Entities.XD_BushMoor4)
        end
        StartSimpleJob("GrowPhase3")
        countGrow2 = 1
        return true;
    end
end

countGrow3 = 1
function GrowPhase3()
    countGrow3 = countGrow3 +1;
    if countGrow3 >= 10 then
        for g=1, table.getn(seed_table),1 do
            seed_table[g] = ReplaceEntity(seed_table[g], Entities.XD_Corn1)
        end
        DestroyEntity(farmer)
        status_farmer = 2
        StartFarming(startX,startY,farmID)
        countGrow3 = 1
        return true;
    end
end

---Comfort s5c lib 

function GetDistance(_pos1,_pos2)
    if (type(_pos1) == "string") or (type(_pos1) == "number") then
        _pos1 = GetPosition(_pos1);
    end
    assert(type(_pos1) == "table");
    if (type(_pos2) == "string") or (type(_pos2) == "number") then
        _pos2 = GetPosition(_pos2);
    end
    assert(type(_pos2) == "table");
    local xDistance = (_pos1.X - _pos2.X);
    local yDistance = (_pos1.Y - _pos2.Y);
    return math.sqrt((xDistance^2) + (yDistance^2));
end

