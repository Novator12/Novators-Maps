



function AnfangsBriefing()
    local briefing = {}
    local AP = function(_page) table.insert(briefing, _page) return _page end
    AP{
        title	= "@color:255,255,0 Intro",
        text	= "@color:0,255,255 Willkommen im einst idylischen Fleckchen des Glaubens. Unruhen haben sich im Land breit gemacht und ihr muesst dagegen etwas unternehmen.",
        position = GetPosition("brother1"),
        explore = 2000
    }
AP{
        title	= "@color:255,255,0 Intro",
        text	= "@color:0,255,255 Die Menschen wurden unterjocht von der Stadt des Glaubens und ihr Hab und Gut wurde zerstoert.",
		position = GetPosition("attack_castle_id5"),
        explore = 2000
    }
AP{
        title	= "@color:255,255,0 Intro",
        text	= "@color:0,255,255 Ihr und euer Mitstreiter sollt nun fuer Frieden sorgen und die Aufsaessigen besiegen.",
		position = GetPosition("Farmer-Start"),
        explore = 2000
    }
AP{
        title	= "@color:255,255,0 Intro",
        text	= "@color:0,255,255 Spieler 1 hat hier seine Burg.",
        position = GetPosition("burg_id1"),
        explore = 2000
    }
    AP{
        title	= "@color:255,255,0 Intro",
        text	= "@color:0,255,255 Spieler 2 hat hier seine Burg.",
        position = GetPosition("burg_id2"),
        explore = 2000
    }
 AP{
        title	= "@color:255,165,0 Hinweis:",
        text	= "@color:0,255,255 Tribute koennen euch von nutzen sein. Schaut ins Tributmenue.",
        position = GetPosition("johannes"),
        explore = 1500
    }
AP{
        title	= "@color:255,0,0 Wichtig!",
        text	= "@color:0,255,255 Verliert ihr eure Burg habt ihr verloren.",
        position = GetPosition("grave"),
        explore = 500,
        
    }

    briefing.finished = function() Message("Waehlt eure @color:57,245,26 Schwierigkeit @color:255,255,255 im Tributmenue!") end;
    


    StartBriefing(briefing)
end 




function AddPages( _briefing )
    local AP = function(_page) table.insert(_briefing, _page); return _page; end
    local ASP = function(_entity, _title, _text, _dialog, _explore) return AP(CreateShortPage(_entity, _title, _text, _dialog, _explore)); end
    return AP, ASP;
end

function CreateShortPage( _entity, _title, _text, _dialog, _explore) 
    local page = {
        title = _title,
        text = _text,
        position = GetPosition( _entity ),
		action = function ()Display.SetRenderFogOfWar(0) end
    };
    if _dialog then 
            if type(_dialog) == "boolean" then
                  page.dialogCamera = true; 
            elseif type(_dialog) == "number" then
                  page.explore = _dialog;
            end
      end
    if _explore then 
            if type(_explore) == "boolean" then
                  page.dialogCamera = true; 
            elseif type(_explore) == "number" then
                  page.explore = _explore;
            end
      end
    return page;
end


function StartCountdown(_Limit, _Callback, _Show)

    assert(type(_Limit) == "number")

    Counter.Index = (Counter.Index or 0) + 1
    
    if _Show and CountdownIsVisisble() then
        assert(false, "StartCountdown: A countdown is already visible")
    end
    
    Counter["counter" .. Counter.Index] = {Limit = _Limit, TickCount = 0, Callback = _Callback, Show = _Show, Finished = false}
    
    if _Show then
        MapLocal_StartCountDown(_Limit)
    end
    
    if Counter.JobId == nil then
        Counter.JobId = StartSimpleJob("CountdownTick")
    end
    
    return Counter.Index
end

function StopCountdown(_Id)

    if Counter.Index == nil then
        return
    end

    if _Id == nil then
        for i = 1, Counter.Index do
            if Counter.IsValid("counter" .. i) then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
                Counter["counter" .. i] = nil
            end
        end
    else
        if Counter.IsValid("counter" .. _Id) then
            if Counter["counter" .. _Id].Show then
                MapLocal_StopCountDown()
            end
            Counter["counter" .. _Id] = nil
        end
    end
end

function CountdownTick()

    local empty = true
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) then
            if Counter.Tick("counter" .. i) then
                Counter["counter" .. i].Finished = true
            end
            
            if Counter["counter" .. i].Finished and not IsBriefingActive() then
                if Counter["counter" .. i].Show then
                    MapLocal_StopCountDown()
                end
                
                if type(Counter["counter" .. i].Callback) == "function" then
                    Counter["counter" .. i].Callback()
                end
                
                Counter["counter" .. i] = nil
            end
            
            empty = false
        end
    end
    
    if empty then
        Counter.JobId = nil
        Counter.Index = nil
        return true
    end
end

function CountdownIsVisisble()
    for i = 1, Counter.Index do
        if Counter.IsValid("counter" .. i) and Counter["counter" .. i].Show then
            return true
        end
    end
    
    return false
end
