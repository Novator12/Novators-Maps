function GUIActionButton_EasyMode()
    XGUIEng.ShowWidget("ModeSelection_StartGame", 1)
    mode = 1;
    mode_text1 = "@color:0,128,0 Storymode"
    mode_text2 = "Willkommen bei der Schlacht um Grimsvötn @cr @cr Eure gewählte Schwierigkeit ist: @cr @cr @cr @color:0,128,0 Storymode"
    mode_text3 = "@center Schwierigkeit @color:0,128,0 Storymode @cr @color:255,255,255 Im Storymode lässt sich die Karte in einem sehr entspannten Ambiente spielen. @cr @cr Was euch erwartet: @cr -hohe Startressourcenmenge @cr -wenige feindliche Truppen @cr -mehr Verstärkungstruppen @cr -kleine Questboni @cr -größere Rohstoffschächte und Vorkommen @cr -Anzahl an Dieben (gleichzeitig): unendlich"
    XGUIEng.ShowWidget("Flag_Easy",1)
    XGUIEng.ShowWidget("Flag_Medium",0)
    XGUIEng.ShowWidget("Flag_Hard",0)
    GUITextUpdate_RightText()
    GUITextUpdate_BottomText() 
    
end

function GUIActionButton_MediumMode() 
    XGUIEng.ShowWidget("ModeSelection_StartGame", 1)
    mode = 2;
    mode_text1 = "@color:255,255,0 Krieger"
    mode_text2 = "Willkommen bei der Schlacht um Grimsvötn @cr @cr Eure gewählte Schwierigkeit ist: @cr @cr @cr @color:255,255,0 Krieger"
    mode_text3 = "@center Schwierigkeit @color:255,255,0 Krieger @cr @color:255,255,255 Im Kriegermodus erwartet euch ein abwechslungsreiches Kampferlebnis. @cr @cr Was euch erwartet: @cr -mittelmäßige Startressourcenmenge @cr -gute Anzahl an feindliche Truppen @cr -mäßige Verstärkungstruppen @cr -wenige Questboni @cr -mittelgroße Rohstoffschächte und Vorkommen @cr -Anzahl an Dieben (gleichzeitig): 2"
    XGUIEng.ShowWidget("Flag_Easy",0)
    XGUIEng.ShowWidget("Flag_Medium",1)
    XGUIEng.ShowWidget("Flag_Hard",0)
    GUITextUpdate_RightText()
    GUITextUpdate_BottomText() 

end

function GUIActionButton_HardMode() 
    XGUIEng.ShowWidget("ModeSelection_StartGame", 1)
    mode = 3;
    mode_text1 = "@color:255,0,0 Herausforderer"
    mode_text2 = "Willkommen bei der Schlacht um Grimsvötn @cr @cr Eure gewählte Schwierigkeit ist: @cr @cr @cr @color:255,0,0 Herausforderer"
    mode_text3 = "@center Schwierigkeit @color:255,0,0 Herausforderer @cr @color:255,255,255 Im Heruasforderermodus wird euch einiges abverlangt. Taktik und Geduld sind hier sehr wichtig. Dieser Spielmodus empfielt sich nicht für Anfänger. @cr @cr Was euch erwartet: @cr -geringe Startressourcenmenge @cr -große Anzahl an feindliche Truppen @cr -wenige Verstärkungstruppen @cr -keine Questboni @cr -geringe Rohstoffschächte und Vorkommen @cr -Anzahl an Dieben (gleichzeitig): 1"
    XGUIEng.ShowWidget("Flag_Easy",0)
    XGUIEng.ShowWidget("Flag_Medium",0)
    XGUIEng.ShowWidget("Flag_Hard",1)
    GUITextUpdate_RightText()
    GUITextUpdate_BottomText() 

end

function GUITextUpdate_RightText() 
    XGUIEng.SetText("ModeSelection_RightText", mode_text2)
end

function GUITextUpdate_BottomText() 
    XGUIEng.SetText("ModeSelection_Bottom_Info", mode_text3)
end

function GUIButtonAction_StartGame() 
    Logic.ResumeEntity(varg)
    Logic.ResumeEntity(trupp1)
    Logic.ResumeEntity(trupp2)
    Logic.ResumeEntity(trupp3)
    CppLogic.Entity.SetDisplayName(trupp1, "Helgar der Barbar")
    CppLogic.Entity.SetDisplayName(trupp2, "Wolfgang der Barbar")
    CppLogic.Entity.SetDisplayName(trupp3, "Rüdiger der Barbar")
    SetEntityOverheadWidget(varg,1)
    SetEntityOverheadWidget(trupp1,1)
    SetEntityOverheadWidget(trupp2,1)
    SetEntityOverheadWidget(trupp3,1)
    XGUIEng.ShowWidget("Normal", 1)
    XGUIEng.ShowWidget("Modus", 0)
    Message("@center @color:0,252,255 Schwierigkeit: "..mode_text1.." @color:0,252,255 wurde ausgewählt!")

    if mode == 1 then
        ResourceTable = {
            {Entities.XD_Stone1, 4000},
            {Entities.XD_Iron1, 4000},
            {Entities.XD_Clay1, 4000},
            {Entities.XD_Sulfur1, 4000},
            {Entities.XD_WoodPit1, 45000}
        }
    elseif mode == 2 then
        ResourceTable = {
            {Entities.XD_Stone1, 2500},
            {Entities.XD_Iron1, 2500},
            {Entities.XD_Clay1, 2500},
            {Entities.XD_Sulfur1, 2500},
            {Entities.XD_WoodPit1, 30000}
        }
    elseif mode == 3 then
        ResourceTable = {
            {Entities.XD_Stone1, 1500},
            {Entities.XD_Iron1, 1000},
            {Entities.XD_Clay1, 1500},
            {Entities.XD_Sulfur1, 1000},
            {Entities.XD_WoodPit1, 15000}
        }
    end
    
    SetMapResource(ResourceTable)

    CreateNVStart()

    if mode == 2 or mode == 3 then
        --Diebe Trigger
        TrainThiefTrigger = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_TURN,nil,"ThiefLimiter",1)
    end

end

---------------------------Comfort Funcs---------------------------------------


function SetEntityOverheadWidget(_entity,_flag) 
    local id = GetID(_entity)
    Logic.SetEntityScriptingValue(id,72,_flag)
end


