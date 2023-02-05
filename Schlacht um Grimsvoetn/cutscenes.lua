----------------------------------------------------------------------Cutscene VillageFlight-----------------------------------------------------------------------------



-- Start-Funktion für die Intro-Cutscene
function Cutscene_villageflight_Start()
 
    -- In der Start-Funktion muss immer der Kinomodus aktiviert werden,
    -- denn dieser ist nicht automatisch vorhanden
    Interface_SetCinematicMode(1)
 
end
 
-- Finished Funktion
function Cutscene_villageflight_Finished()
 
    -- Hier muss der Kinomodus wieder deaktiviert werden
    Interface_SetCinematicMode(0)
 
    -- Der Aufruf von CutsceneDone() ist ebenfalls zwingend erforderlich!
    CutsceneDone()
 
end
 
-- Cancel-Funktion
function Cutscene_villageflight_Cancel()
 
    -- Hier reicht es oft aus, einfach die Finished-Funktion aufzurufen
    Cutscene_villageflight_Finished()
 
end







-- Callback Funcs

function Cutscene_villageflight_Village_Page1()
    NormalSpeedInBriefing()
    PrintBriefingHeadline("")
    PrintBriefingText("Nach mehreren Stunden Arbeit war das Werk vollbracht.")
end

function Cutscene_villageflight_Village_Page2()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_villageflight_Village_Page3()
    PrintBriefingHeadline("")
    PrintBriefingText("Das Dorf erstrahlte im neuen Glanz.")
end

function Cutscene_villageflight_Village_Page4()
    PrintBriefingHeadline("")
    PrintBriefingText("Jetzt würde es keinem mehr so leicht gelingen Reynivellir nochmal zu zerstören.")
end

function Cutscene_villageflight_Village_Page5()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_villageflight_Village_Page6()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_villageflight_Village_Page7()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------




----------------------------------------------------------------------Cutscene Vulkan-----------------------------------------------------------------------------



-- Start-Funktion für die Intro-Cutscene
function Cutscene_vulkan_Start()
 
    -- In der Start-Funktion muss immer der Kinomodus aktiviert werden,
    -- denn dieser ist nicht automatisch vorhanden
    Interface_SetCinematicMode(1)
 
end
 
-- Finished Funktion
function Cutscene_vulkan_Finished()
 
    -- Hier muss der Kinomodus wieder deaktiviert werden
    Interface_SetCinematicMode(0)
 
    -- Der Aufruf von CutsceneDone() ist ebenfalls zwingend erforderlich!
    CutsceneDone()
 
end
 
-- Cancel-Funktion
function Cutscene_vulkan_Cancel()
 
    -- Hier reicht es oft aus, einfach die Finished-Funktion aufzurufen
    Cutscene_vulkan_Finished()
 
end







-- Callback Funcs

function Cutscene_vulkan_Vulkan_Page1()
    NormalSpeedInBriefing()
    PrintBriefingHeadline("")
    PrintBriefingText("Der mächtige Vulkan von Grimsvötn erhob sich über die karge Landschaft und bedeckt sein Umland mit Asche und Rauch.")
end

function Cutscene_vulkan_Vulkan_Page2()
    PrintBriefingHeadline("")
    PrintBriefingText("Die Hitze stieg in den Himmel und färbte ihn dunkel.")
end

function Cutscene_vulkan_Vulkan_Page3()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_vulkan_Vulkan_Page4()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_vulkan_Vulkan_Page5()
    PrintBriefingHeadline("")
    PrintBriefingText("Die glühende Lava machte das umliegende Land kaum bewohnbar.")
end

function Cutscene_vulkan_Vulkan_Page6()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Start-Funktion für die Intro-Cutscene
function Cutscene_vulcanenemie_Start()
 
    -- In der Start-Funktion muss immer der Kinomodus aktiviert werden,
    -- denn dieser ist nicht automatisch vorhanden
    Interface_SetCinematicMode(1)
 
end
 
-- Finished Funktion
function Cutscene_vulcanenemie_Finished()
 
    -- Hier muss der Kinomodus wieder deaktiviert werden
    Interface_SetCinematicMode(0)
 
    -- Der Aufruf von CutsceneDone() ist ebenfalls zwingend erforderlich!
    CutsceneDone()
 
end
 
-- Cancel-Funktion
function Cutscene_vulcanenemie_Cancel()
 
    -- Hier reicht es oft aus, einfach die Finished-Funktion aufzurufen
    Cutscene_vulcanenemie_Finished()
 
end







-- Callback Funcs

function Cutscene_vulcanenemie_Page1()
    NormalSpeedInBriefing()
    PrintBriefingHeadline("")
    PrintBriefingText("Im Rauch und der Asche tronte ein unbekannter Herrscher mit seinen Schattenkriegern.")
end

function Cutscene_vulcanenemie_Page2()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_vulcanenemie_Page3()
    PrintBriefingHeadline("")
    PrintBriefingText("Seine Mauern rakten über das kalte und vom Ruß bedeckte Gestein.")
end

function Cutscene_vulcanenemie_Page4()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_vulcanenemie_Page5()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_vulcanenemie_Page6()
    PrintBriefingHeadline("")
    PrintBriefingText("Das Qualmen der Öfen und klirren der Schwerter hallte bis nach Reynivellir.")
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Start-Funktion für die Intro-Cutscene
function Cutscene_schattenfeste_Start()
 
    -- In der Start-Funktion muss immer der Kinomodus aktiviert werden,
    -- denn dieser ist nicht automatisch vorhanden
    Interface_SetCinematicMode(1)
 
end
 
-- Finished Funktion
function Cutscene_schattenfeste_Finished()
 
    -- Hier muss der Kinomodus wieder deaktiviert werden
    Interface_SetCinematicMode(0)
 
    -- Der Aufruf von CutsceneDone() ist ebenfalls zwingend erforderlich!
    CutsceneDone()
 
end
 
-- Cancel-Funktion
function Cutscene_schattenfeste_Cancel()
 
    -- Hier reicht es oft aus, einfach die Finished-Funktion aufzurufen
    Cutscene_schattenfeste_Finished()
 
end







-- Callback Funcs

function Cutscene_schattenfeste_SchattenPage1()
    NormalSpeedInBriefing()
    PrintBriefingHeadline("")
    PrintBriefingText("Tief in den Bergen hinter dem großen Vulkan von Grimsvötn erhob sich die Schattenfeste")
end

function Cutscene_schattenfeste_SchattenPage2()
    PrintBriefingHeadline("")
    PrintBriefingText("An ihren robusten Mauern schlug sich schon so mancher Feind die Zähne aus")
end

function Cutscene_schattenfeste_SchattenPage3()
    PrintBriefingHeadline("")
    PrintBriefingText("Verteidigt wird Sie von den zähesten Kriegern von Grimsvötn")
end

function Cutscene_schattenfeste_SchattenPage4()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_schattenfeste_SchattenPage5()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_schattenfeste_SchattenPage6()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

function Cutscene_schattenfeste_SchattenPage7()
    PrintBriefingHeadline("")
    PrintBriefingText("Es ist an euch, diese Feste dem Erdboden gleich zu machen.")
end

function Cutscene_schattenfeste_SchattenPage8()
    PrintBriefingHeadline("")
    PrintBriefingText("")
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------