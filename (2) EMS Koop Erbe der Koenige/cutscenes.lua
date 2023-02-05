----------------------------------------------------------------------Cutscene VillageFlight-----------------------------------------------------------------------------



-- Start-Funktion für die Intro-Cutscene
function Cutscene_introcutscene_Start()
 
    -- In der Start-Funktion muss immer der Kinomodus aktiviert werden,
    -- denn dieser ist nicht automatisch vorhanden
    SetInternalClippingLimitMax(35000)
    Display.SetFarClipPlaneMinAndMax(0, 35000)
    Interface_SetCinematicMode(1)
end
 
-- Finished Funktion
function Cutscene_introcutscene_Finished()
    Display.SetFarClipPlaneMinAndMax(0,0)
    -- Hier muss der Kinomodus wieder deaktiviert werden
    Interface_SetCinematicMode(0)
    -- Der Aufruf von CutsceneDone() ist ebenfalls zwingend erforderlich!
    CutsceneDone()
 
end
 
-- Cancel-Funktion
function Cutscene_introcutscene_Cancel()
 
    -- Hier reicht es oft aus, einfach die Finished-Funktion aufzurufen
    Cutscene_introcutscene_Finished()
 
end




-- Callback Funcs

--Flight 1

function Cutscene_introcutscene_SP1_Page1()
    PrintBriefingHeadline("1")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP1_Page2()
    PrintBriefingHeadline("2")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP1_Page3()
    PrintBriefingHeadline("3")
    PrintBriefingText("")
end

--Flight 2

function Cutscene_introcutscene_SP2_Page1()
    PrintBriefingHeadline("4")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP2_Page2()
    PrintBriefingHeadline("5")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP2_Page3()
    PrintBriefingHeadline("6")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP2_Page4()
    PrintBriefingHeadline("7")
    PrintBriefingText("")
end

function Cutscene_introcutscene_SP2_Page5()
    PrintBriefingHeadline("8")
    PrintBriefingText("")
end

--Flight 3

function Cutscene_introcutscene_OKC_Page1()
    PrintBriefingHeadline("9")
    PrintBriefingText("")
end

function Cutscene_introcutscene_OKC_Page2()
    PrintBriefingHeadline("10")
    PrintBriefingText("")
end

function Cutscene_introcutscene_OKC_Page3()
    PrintBriefingHeadline("11")
    PrintBriefingText("")
end

function Cutscene_introcutscene_OKC_Page4()
    PrintBriefingHeadline("12")
    PrintBriefingText("")
end

function Cutscene_introcutscene_OKC_Page5()
    PrintBriefingHeadline("13")
    PrintBriefingText("")
end

--Flight 4

function Cutscene_introcutscene_Folk_Page1()
    PrintBriefingHeadline("14")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Folk_Page2()
    PrintBriefingHeadline("15")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Folk_Page3()
    PrintBriefingHeadline("16")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Folk_Page4()
    PrintBriefingHeadline("17")
    PrintBriefingText("")
end

--Flight 5

function Cutscene_introcutscene_Barm_Page1()
    PrintBriefingHeadline("18")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Barm_Page2()
    PrintBriefingHeadline("19")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Barm_Page3()
    PrintBriefingHeadline("20")
    PrintBriefingText("")
end

function Cutscene_introcutscene_Barm_Page4()
    PrintBriefingHeadline("21")
    PrintBriefingText("")
end