function InitExpellAllGUI()

	assert(XGUIEng.GetWidgetID("Command_ExpelAll")==0, "Command_ExpelAll already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_generic", "Command_ExpelAll", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Command_ExpelAll", 369, 76, 32, 32)
	XGUIEng.ShowWidget("Command_ExpelAll", 1)
	CppLogic.UI.WidgetSetBaseData("Command_ExpelAll", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Command_ExpelAll", "Command_group")
	XGUIEng.DisableButton("Command_ExpelAll", 0)
	XGUIEng.HighLightButton("Command_ExpelAll", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Command_ExpelAll", function() GUIAction_ExpelAllSettler() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAll", 0, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAll", 0, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAll", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAll", 1, 0.25, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAll", 1, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAll", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAll", 2, 0.5, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAll", 2, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAll", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAll", 3, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAll", 3, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAll", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAll", 4, 0.75, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAll", 4, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAll", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Command_ExpelAll", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Command_ExpelAll", function() GUITooltip_ExpelAllButton() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Command_ExpelAll", true)

	assert(XGUIEng.GetWidgetID("Command_ExpelAllSerf")==0, "Command_ExpelAllSerf already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SerfConstructionMenu", "Command_ExpelAllSerf", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Command_ExpelAllSerf", 326, 76, 32, 32)
	XGUIEng.ShowWidget("Command_ExpelAllSerf", 1)
	CppLogic.UI.WidgetSetBaseData("Command_ExpelAllSerf", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Command_ExpelAllSerf", "Command_group")
	XGUIEng.DisableButton("Command_ExpelAllSerf", 0)
	XGUIEng.HighLightButton("Command_ExpelAllSerf", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Command_ExpelAllSerf", function() GUIAction_ExpelAllSettler() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAllSerf", 0, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAllSerf", 0, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAllSerf", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAllSerf", 1, 0.25, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAllSerf", 1, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAllSerf", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAllSerf", 2, 0.5, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAllSerf", 2, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAllSerf", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAllSerf", 3, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAllSerf", 3, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAllSerf", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Command_ExpelAllSerf", 4, 0.75, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Command_ExpelAllSerf", 4, "graphics\\textures\\gui\\b_civil_tavern.png")
	XGUIEng.SetMaterialColor("Command_ExpelAllSerf", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Command_ExpelAllSerf", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Command_ExpelAllSerf", function() GUITooltip_ExpelAllSerfButton() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Command_ExpelAllSerf", true)
	
end

function GUITooltip_ExpelAllButton()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Massenentlassung @cr @color:255,255,255 Entlässt alle selektierten Einheiten.")
	XGUIEng.SetText("TooltipBottomCosts", "")
end


function GUIAction_ExpelAllSettler()
	local EntityTable = {}
	EntityTable = { GUI.GetSelectedEntities() }
	for i = table.getn(EntityTable), 1, -1 do
		if Logic.IsHero(EntityTable[i]) == 1 then
			--Sound.PlayFeedbackSound( Sounds.Leader_LEADER_NO_rnd_01, 0 )
		elseif Logic.IsLeader(EntityTable[i]) == 1 then
			local EntitySoldierTable = {}
			EntitySoldierTable       = { Logic.GetSoldiersAttachedToLeader(EntityTable[i]) }
			table.remove(EntitySoldierTable, 1)
			for n = table.getn(EntitySoldierTable), 1, -1 do
				GUI.ExpelSettler(EntitySoldierTable[n])
			end
			GUI.ExpelSettler(EntityTable[i])
		else
			GUI.ExpelSettler(EntityTable[i])
		end
	end
	EntityTable = nil
end



function GUITooltip_ExpelAllSerfButton()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Massenentlassung @cr @color:255,255,255 Entlässt alle selektierten Einheiten.")
	XGUIEng.SetText("TooltipBottomCosts", "")
end

function InitBridgesCooldownGUI()
	assert(XGUIEng.GetWidgetID("BridgeCooldown")==0, "BridgeCooldown already exists")
	assert(XGUIEng.GetWidgetID("TooltipBrigeLava")==0, "TooltipBrigeLava already exists")
	assert(XGUIEng.GetWidgetID("TooltipBridgeNorth")==0, "TooltipBridgeNorth already exists")
	assert(XGUIEng.GetWidgetID("TooltipGateSouth")==0, "TooltipGateSouth already exists")
	assert(XGUIEng.GetWidgetID("CountdownBridgeLava")==0, "CountdownBridgeLava already exists")
	assert(XGUIEng.GetWidgetID("CountdownBridgeNorth")==0, "CountdownBridgeNorth already exists")
	assert(XGUIEng.GetWidgetID("CountdownGateSouth")==0, "CountdownGateSouth already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Normal", "BridgeCooldown", "GCWindow")
	CppLogic.UI.WidgetSetPositionAndSize("BridgeCooldown", 4, 139, 378, 133)
	XGUIEng.ShowWidget("BridgeCooldown", 0)
	CppLogic.UI.WidgetSetBaseData("BridgeCooldown", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("BridgeCooldown", "TooltipBrigeLava", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipBrigeLava", 0, 5, 32, 32)
	XGUIEng.ShowWidget("TooltipBrigeLava", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipBrigeLava", 0, false, false)
	XGUIEng.DisableButton("TooltipBrigeLava", 1)
	XGUIEng.HighLightButton("TooltipBrigeLava", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBrigeLava", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBrigeLava", 0, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBrigeLava", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBrigeLava", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBrigeLava", 1, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBrigeLava", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBrigeLava", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBrigeLava", 2, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBrigeLava", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBrigeLava", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBrigeLava", 3, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBrigeLava", 3, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBrigeLava", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBrigeLava", 4, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBrigeLava", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("TooltipBrigeLava", "TooltipCooldown", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("TooltipBrigeLava", function() GUI_SetTooltipCooldown1Text() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("TooltipBrigeLava", false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("BridgeCooldown", "TooltipBridgeNorth", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipBridgeNorth", 0, 41, 32, 32)
	XGUIEng.ShowWidget("TooltipBridgeNorth", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipBridgeNorth", 0, false, false)
	XGUIEng.DisableButton("TooltipBridgeNorth", 1)
	XGUIEng.HighLightButton("TooltipBridgeNorth", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBridgeNorth", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBridgeNorth", 0, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBridgeNorth", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBridgeNorth", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBridgeNorth", 1, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBridgeNorth", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBridgeNorth", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBridgeNorth", 2, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBridgeNorth", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBridgeNorth", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBridgeNorth", 3, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBridgeNorth", 3, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipBridgeNorth", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipBridgeNorth", 4, "graphics\\textures\\gui\\questinformation\\bridge.png")
	XGUIEng.SetMaterialColor("TooltipBridgeNorth", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("TooltipBridgeNorth", "TooltipCooldown", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("TooltipBridgeNorth", function() GUI_SetTooltipCooldown2Text() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("TooltipBridgeNorth", false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("BridgeCooldown", "TooltipGateSouth", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipGateSouth", 0, 77, 32, 32)
	XGUIEng.ShowWidget("TooltipGateSouth", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipGateSouth", 0, false, false)
	XGUIEng.DisableButton("TooltipGateSouth", 1)
	XGUIEng.HighLightButton("TooltipGateSouth", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipGateSouth", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipGateSouth", 0, "graphics\\textures\\gui\\questinformation\\tower.png")
	XGUIEng.SetMaterialColor("TooltipGateSouth", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipGateSouth", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipGateSouth", 1, "graphics\\textures\\gui\\questinformation\\tower.png")
	XGUIEng.SetMaterialColor("TooltipGateSouth", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipGateSouth", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipGateSouth", 2, "graphics\\textures\\gui\\questinformation\\tower.png")
	XGUIEng.SetMaterialColor("TooltipGateSouth", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipGateSouth", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipGateSouth", 3, "graphics\\textures\\gui\\questinformation\\tower.png")
	XGUIEng.SetMaterialColor("TooltipGateSouth", 3, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipGateSouth", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipGateSouth", 4, "graphics\\textures\\gui\\questinformation\\tower.png")
	XGUIEng.SetMaterialColor("TooltipGateSouth", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("TooltipGateSouth", "TooltipCooldown", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("TooltipGateSouth", function() GUI_SetTooltipCooldown3Text() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("TooltipGateSouth", false)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("BridgeCooldown", "CountdownBridgeLava", nil)
	CppLogic.UI.WidgetSetPositionAndSize("CountdownBridgeLava", 34, 5, 82, 31)
	XGUIEng.ShowWidget("CountdownBridgeLava", 1)
	CppLogic.UI.WidgetSetBaseData("CountdownBridgeLava", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("CountdownBridgeLava", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("CountdownBridgeLava", 0, 0, 0, 0, 100)
	CppLogic.UI.WidgetSetFont("CountdownBridgeLava", "data\\menu\\fonts\\large14bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("CountdownBridgeLava", 0)
	XGUIEng.SetText("CountdownBridgeLava", "@center @color:255,0,0  "..CountBridgeLava, 1)
	XGUIEng.SetTextColor("CountdownBridgeLava", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("CountdownBridgeLava", true)
	XGUIEng.SetLinesToPrint("CountdownBridgeLava", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("CountdownBridgeLava", 0)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("BridgeCooldown", "CountdownBridgeNorth", nil)
	CppLogic.UI.WidgetSetPositionAndSize("CountdownBridgeNorth", 34, 41, 82, 31)
	XGUIEng.ShowWidget("CountdownBridgeNorth", 1)
	CppLogic.UI.WidgetSetBaseData("CountdownBridgeNorth", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("CountdownBridgeNorth", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("CountdownBridgeNorth", 0, 0, 0, 0, 100)
	CppLogic.UI.WidgetSetFont("CountdownBridgeNorth", "data\\menu\\fonts\\large14bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("CountdownBridgeNorth", 0)
	XGUIEng.SetText("CountdownBridgeNorth", "@center @color:255,0,0  "..CountBridgeNorth, 1)
	XGUIEng.SetTextColor("CountdownBridgeNorth", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("CountdownBridgeNorth", true)
	XGUIEng.SetLinesToPrint("CountdownBridgeNorth", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("CountdownBridgeNorth", 0)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("BridgeCooldown", "CountdownGateSouth", nil)
	CppLogic.UI.WidgetSetPositionAndSize("CountdownGateSouth", 34, 77, 82, 31)
	XGUIEng.ShowWidget("CountdownGateSouth", 1)
	CppLogic.UI.WidgetSetBaseData("CountdownGateSouth", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("CountdownGateSouth", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("CountdownGateSouth", 0, 0, 0, 0, 100)
	CppLogic.UI.WidgetSetFont("CountdownGateSouth", "data\\menu\\fonts\\large14bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("CountdownGateSouth", 0)
	XGUIEng.SetText("CountdownGateSouth",  "@center @color:255,0,0  "..CountGateSouth, 1)
	XGUIEng.SetTextColor("CountdownGateSouth", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("CountdownGateSouth", true)
	XGUIEng.SetLinesToPrint("CountdownGateSouth", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("CountdownGateSouth", 0)
	
end

CountBridgeLava = ""
CountBridgeNorth = ""
CountGateSouth = ""

function GUI_SetTooltipCooldown1Text()
	XGUIEng.SetText("TooltipCooldownText", "@color:255,255,0 Brücke: Lava @cr @color:255,255,255 Zeigt den Cooldown der Brücke im Lavagebiet an.")
end

function GUI_SetTooltipCooldown2Text()
	XGUIEng.SetText("TooltipCooldownText", "@color:255,255,0 Brücke: Norden @cr @color:255,255,255 Zeigt den Cooldown der Brücke im Norden an.")
end

function GUI_SetTooltipCooldown3Text()
	XGUIEng.SetText("TooltipCooldownText", "@color:255,255,0 Tor: Süd-Osten @cr @color:255,255,255 Zeigt den Cooldown des Tores im Süd-Osten an.")
end




function InitTooltipCooldownGUI()
	assert(XGUIEng.GetWidgetID("TooltipCooldown")==0, "TooltipCooldown already exists")
	assert(XGUIEng.GetWidgetID("TooltipCooldownText")==0, "TooltipCooldownText already exists")
	assert(XGUIEng.GetWidgetID("TooltipCooldownBackground")==0, "TooltipCooldownBackground already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Normal", "TooltipCooldown", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipCooldown", 126, 146, 172, 104)
	XGUIEng.ShowWidget("TooltipCooldown", 0)
	CppLogic.UI.WidgetSetBaseData("TooltipCooldown", 0, false, true)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("TooltipCooldown", "TooltipCooldownText", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipCooldownText", 3, 5, 161, 91)
	XGUIEng.ShowWidget("TooltipCooldownText", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipCooldownText", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipCooldownText", 0, 0, 0, 0.25, 0.25)
	XGUIEng.SetMaterialColor("TooltipCooldownText", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("TooltipCooldownText", "data\\menu\\fonts\\standard10.met")
	CppLogic.UI.WidgetSetStringFrameDistance("TooltipCooldownText", 0)
	XGUIEng.SetText("TooltipCooldownText", "", 1)
	XGUIEng.SetTextColor("TooltipCooldownText", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("TooltipCooldownText", true)
	XGUIEng.SetLinesToPrint("TooltipCooldownText", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("TooltipCooldownText", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("TooltipCooldown", "TooltipCooldownBackground", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipCooldownBackground", 0, 0, 167, 99)
	XGUIEng.ShowWidget("TooltipCooldownBackground", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipCooldownBackground", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipCooldownBackground", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipCooldownBackground", 0, "data\\graphics\\textures\\gui\\bg_tooltip_top.png")
	XGUIEng.SetMaterialColor("TooltipCooldownBackground", 0, 255, 255, 255, 255)
	
end



function InitThiefCollectables()
	assert(XGUIEng.GetWidgetID("ThiefCollectables")==0, "ThiefCollectables already exists")
	assert(XGUIEng.GetWidgetID("DrawBridgeCollectable")==0, "DrawBridgeCollectable already exists")
	assert(XGUIEng.GetWidgetID("TextDrawBridge")==0, "TextDrawBridge already exists")
	assert(XGUIEng.GetWidgetID("KurbelBDone")==0, "KurbelBDone already exists")
	assert(XGUIEng.GetWidgetID("KurbelADone")==0, "KurbelADone already exists")
	assert(XGUIEng.GetWidgetID("KurbelA")==0, "KurbelA already exists")
	assert(XGUIEng.GetWidgetID("KurbelB")==0, "KurbelB already exists")
	assert(XGUIEng.GetWidgetID("DrawBridgeBG")==0, "DrawBridgeBG already exists")
	assert(XGUIEng.GetWidgetID("SteamMCollectable")==0, "SteamMCollectable already exists")
	assert(XGUIEng.GetWidgetID("TextSteamM")==0, "TextSteamM already exists")
	assert(XGUIEng.GetWidgetID("Collectable4Done")==0, "Collectable4Done already exists")
	assert(XGUIEng.GetWidgetID("Collectable3Done")==0, "Collectable3Done already exists")
	assert(XGUIEng.GetWidgetID("Collectable2Done")==0, "Collectable2Done already exists")
	assert(XGUIEng.GetWidgetID("Collectable1Done")==0, "Collectable1Done already exists")
	assert(XGUIEng.GetWidgetID("Collectable4")==0, "Collectable4 already exists")
	assert(XGUIEng.GetWidgetID("Collectable3")==0, "Collectable3 already exists")
	assert(XGUIEng.GetWidgetID("Collectable2")==0, "Collectable2 already exists")
	assert(XGUIEng.GetWidgetID("Collectable1")==0, "Collectable1 already exists")
	assert(XGUIEng.GetWidgetID("SteamMBG1")==0, "SteamMBG1 already exists")
	assert(XGUIEng.GetWidgetID("SteamMBG2")==0, "SteamMBG2 already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Normal", "ThiefCollectables", "VideoPreview")
	CppLogic.UI.WidgetSetPositionAndSize("ThiefCollectables", 245, 78, 592, 120)
	XGUIEng.ShowWidget("ThiefCollectables", 0)
	CppLogic.UI.WidgetSetBaseData("ThiefCollectables", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ThiefCollectables", "DrawBridgeCollectable", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DrawBridgeCollectable", 0, 0, 184, 82)
	XGUIEng.ShowWidget("DrawBridgeCollectable", 1)
	CppLogic.UI.WidgetSetBaseData("DrawBridgeCollectable", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("DrawBridgeCollectable", "TextDrawBridge", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TextDrawBridge", 85, 43, 95, 20)
	XGUIEng.ShowWidget("TextDrawBridge", 1)
	CppLogic.UI.WidgetSetBaseData("TextDrawBridge", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TextDrawBridge", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("TextDrawBridge", 0, 155, 155, 155, 100)
	CppLogic.UI.WidgetSetFont("TextDrawBridge", "data\\menu\\fonts\\standard12.met")
	CppLogic.UI.WidgetSetStringFrameDistance("TextDrawBridge", 0)
	XGUIEng.SetText("TextDrawBridge", "@center Zugkurbeln", 1)
	XGUIEng.SetTextColor("TextDrawBridge", 255, 150, 0, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("TextDrawBridge", true)
	XGUIEng.SetLinesToPrint("TextDrawBridge", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("TextDrawBridge", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DrawBridgeCollectable", "KurbelBDone", nil)
	CppLogic.UI.WidgetSetPositionAndSize("KurbelBDone", 136, 2, 43, 36)
	XGUIEng.ShowWidget("KurbelBDone", 0)
	CppLogic.UI.WidgetSetBaseData("KurbelBDone", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("KurbelBDone", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("KurbelBDone", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("KurbelBDone", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DrawBridgeCollectable", "KurbelADone", nil)
	CppLogic.UI.WidgetSetPositionAndSize("KurbelADone", 85, 2, 43, 36)
	XGUIEng.ShowWidget("KurbelADone", 0)
	CppLogic.UI.WidgetSetBaseData("KurbelADone", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("KurbelADone", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("KurbelADone", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("KurbelADone", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DrawBridgeCollectable", "KurbelA", nil)
	CppLogic.UI.WidgetSetPositionAndSize("KurbelA", 85, 2, 43, 35)
	XGUIEng.ShowWidget("KurbelA", 1)
	CppLogic.UI.WidgetSetBaseData("KurbelA", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("KurbelA", 0, 0, 0.3125, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("KurbelA", 0, "graphics\\textures\\gui\\b_civil_university.png")
	XGUIEng.SetMaterialColor("KurbelA", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DrawBridgeCollectable", "KurbelB", nil)
	CppLogic.UI.WidgetSetPositionAndSize("KurbelB", 136, 2, 43, 35)
	XGUIEng.ShowWidget("KurbelB", 1)
	CppLogic.UI.WidgetSetBaseData("KurbelB", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("KurbelB", 0, 0, 0.3125, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("KurbelB", 0, "graphics\\textures\\gui\\b_civil_university.png")
	XGUIEng.SetMaterialColor("KurbelB", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DrawBridgeCollectable", "DrawBridgeBG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DrawBridgeBG", 82, 0, 102, 65)
	XGUIEng.ShowWidget("DrawBridgeBG", 1)
	CppLogic.UI.WidgetSetBaseData("DrawBridgeBG", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DrawBridgeBG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("DrawBridgeBG", 0, "graphics\\textures\\gui\\trade_box.png")
	XGUIEng.SetMaterialColor("DrawBridgeBG", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ThiefCollectables", "SteamMCollectable", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SteamMCollectable", 184, 0, 217, 79)
	XGUIEng.ShowWidget("SteamMCollectable", 1)
	CppLogic.UI.WidgetSetBaseData("SteamMCollectable", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("SteamMCollectable", "TextSteamM", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TextSteamM", 10, 42, 99, 21)
	XGUIEng.ShowWidget("TextSteamM", 1)
	CppLogic.UI.WidgetSetBaseData("TextSteamM", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TextSteamM", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("TextSteamM", 0, 155, 155, 155, 100)
	CppLogic.UI.WidgetSetFont("TextSteamM", "data\\menu\\fonts\\standard12.met")
	CppLogic.UI.WidgetSetStringFrameDistance("TextSteamM", 0)
	XGUIEng.SetText("TextSteamM", "@center Bauteile", 1)
	XGUIEng.SetTextColor("TextSteamM", 255, 150, 0, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("TextSteamM", true)
	XGUIEng.SetLinesToPrint("TextSteamM", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("TextSteamM", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable4Done", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable4Done", 164, 3, 43, 35)
	XGUIEng.ShowWidget("Collectable4Done", 0)
	CppLogic.UI.WidgetSetBaseData("Collectable4Done", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable4Done", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Collectable4Done", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("Collectable4Done", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable3Done", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable3Done", 113, 2, 43, 35)
	XGUIEng.ShowWidget("Collectable3Done", 0)
	CppLogic.UI.WidgetSetBaseData("Collectable3Done", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable3Done", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Collectable3Done", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("Collectable3Done", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable2Done", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable2Done", 64, 3, 43, 35)
	XGUIEng.ShowWidget("Collectable2Done", 0)
	CppLogic.UI.WidgetSetBaseData("Collectable2Done", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable2Done", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Collectable2Done", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("Collectable2Done", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable1Done", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable1Done", 12, 2, 43, 35)
	XGUIEng.ShowWidget("Collectable1Done", 0)
	CppLogic.UI.WidgetSetBaseData("Collectable1Done", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable1Done", 0, 0.75, 0.875, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Collectable1Done", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
	XGUIEng.SetMaterialColor("Collectable1Done", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable4", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable4", 164, 3, 42, 34)
	XGUIEng.ShowWidget("Collectable4", 1)
	CppLogic.UI.WidgetSetBaseData("Collectable4", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable4", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Collectable4", 0, "graphics\\textures\\gui\\questinformation\\caravan.png")
	XGUIEng.SetMaterialColor("Collectable4", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable3", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable3", 113, 3, 42, 34)
	XGUIEng.ShowWidget("Collectable3", 1)
	CppLogic.UI.WidgetSetBaseData("Collectable3", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable3", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Collectable3", 0, "graphics\\textures\\gui\\questinformation\\sheep.png")
	XGUIEng.SetMaterialColor("Collectable3", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable2", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable2", 64, 3, 42, 34)
	XGUIEng.ShowWidget("Collectable2", 1)
	CppLogic.UI.WidgetSetBaseData("Collectable2", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable2", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Collectable2", 0, "graphics\\textures\\gui\\questinformation\\fire.png")
	XGUIEng.SetMaterialColor("Collectable2", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "Collectable1", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Collectable1", 13, 3, 42, 34)
	XGUIEng.ShowWidget("Collectable1", 1)
	CppLogic.UI.WidgetSetBaseData("Collectable1", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Collectable1", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Collectable1", 0, "graphics\\textures\\gui\\questinformation\\well.png")
	XGUIEng.SetMaterialColor("Collectable1", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "SteamMBG1", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SteamMBG1", 9, 0, 102, 65)
	XGUIEng.ShowWidget("SteamMBG1", 1)
	CppLogic.UI.WidgetSetBaseData("SteamMBG1", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SteamMBG1", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SteamMBG1", 0, "graphics\\textures\\gui\\trade_box.png")
	XGUIEng.SetMaterialColor("SteamMBG1", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("SteamMCollectable", "SteamMBG2", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SteamMBG2", 110, 0, 104, 41)
	XGUIEng.ShowWidget("SteamMBG2", 1)
	CppLogic.UI.WidgetSetBaseData("SteamMBG2", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SteamMBG2", 0, 0, 0, 1.034483, 0.6304348)
	XGUIEng.SetMaterialTexture("SteamMBG2", 0, "graphics\\textures\\gui\\trade_box.png")
	XGUIEng.SetMaterialColor("SteamMBG2", 0, 255, 255, 255, 255)
end






function InitAttackProgressBar()
	assert(XGUIEng.GetWidgetID("DefendProgressContainer")==0, "DefendProgressContainer already exists")
	assert(XGUIEng.GetWidgetID("DefendProgressBarText")==0, "DefendProgressBarText already exists")
	assert(XGUIEng.GetWidgetID("DefendProgressBarImage")==0, "DefendProgressBarImage already exists")
	assert(XGUIEng.GetWidgetID("DefendProgressBarEnd")==0, "DefendProgressBarEnd already exists")
	assert(XGUIEng.GetWidgetID("DefendProgressBar")==0, "DefendProgressBar already exists")
	assert(XGUIEng.GetWidgetID("DefendProgressBarBG")==0, "DefendProgressBarBG already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Normal", "DefendProgressContainer", "VideoPreview")
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressContainer", 256, 66, 466, 97)
	XGUIEng.ShowWidget("DefendProgressContainer", 0)
	CppLogic.UI.WidgetSetBaseData("DefendProgressContainer", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("DefendProgressContainer", "DefendProgressBarText", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressBarText", 339, 5, 98, 17)
	XGUIEng.ShowWidget("DefendProgressBarText", 1)
	CppLogic.UI.WidgetSetBaseData("DefendProgressBarText", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DefendProgressBarText", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("DefendProgressBarText", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("DefendProgressBarText", "data\\menu\\fonts\\standard10bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("DefendProgressBarText", 0)
	XGUIEng.SetText("DefendProgressBarText", "@center Forschung", 1)
	XGUIEng.SetTextColor("DefendProgressBarText", 255, 138, 0, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("DefendProgressBarText", true)
	XGUIEng.SetLinesToPrint("DefendProgressBarText", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("DefendProgressBarText", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DefendProgressContainer", "DefendProgressBarImage", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressBarImage", 394, 33, 45, 33)
	XGUIEng.ShowWidget("DefendProgressBarImage", 1)
	CppLogic.UI.WidgetSetBaseData("DefendProgressBarImage", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DefendProgressBarImage", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("DefendProgressBarImage", 0, "graphics\\textures\\gui\\questinformation\\fire.png")
	XGUIEng.SetMaterialColor("DefendProgressBarImage", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DefendProgressContainer", "DefendProgressBarEnd", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressBarEnd", 336, 2, 108, 69)
	XGUIEng.ShowWidget("DefendProgressBarEnd", 1)
	CppLogic.UI.WidgetSetBaseData("DefendProgressBarEnd", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DefendProgressBarEnd", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("DefendProgressBarEnd", 0, "graphics\\textures\\gui\\trade_box_down.png")
	XGUIEng.SetMaterialColor("DefendProgressBarEnd", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateProgressBarWidgetChild("DefendProgressContainer", "DefendProgressBar", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressBar", 86, 42, 305, 14)
	XGUIEng.ShowWidget("DefendProgressBar", 1)
	CppLogic.UI.WidgetSetBaseData("DefendProgressBar", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DefendProgressBar", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("DefendProgressBar", 0, "data\\graphics\\textures\\gui\\progress_bar.png")
	XGUIEng.SetMaterialColor("DefendProgressBar", 0, 255, 102, 0, 255)
	XGUIEng.SetProgressBarValues("DefendProgressBar", -4.316021E+08, -4.316021E+08)
	CppLogic.UI.WidgetSetUpdateManualFlag("DefendProgressBar", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("DefendProgressBar", function() GUIUpdate_ResearchDefendProgress() end)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("DefendProgressContainer", "DefendProgressBarBG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("DefendProgressBarBG", 82, 37, 315, 23)
	XGUIEng.ShowWidget("DefendProgressBarBG", 1)
	CppLogic.UI.WidgetSetBaseData("DefendProgressBarBG", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("DefendProgressBarBG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("DefendProgressBarBG", 0, "graphics\\textures\\gui\\window_bg258x32.png")
	XGUIEng.SetMaterialColor("DefendProgressBarBG", 0, 255, 255, 255, 255)



end


DefendCounter = 0
maxDefendBar = 600

function GUIUpdate_ResearchDefendProgress()
	local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	local value = DefendCounter
	XGUIEng.SetProgressBarValues(CurrentWidgetID,value, maxDefendBar)
end

--StartSimpleJob("StartDefendCounter") aufrufen, sobald die Anzeige laden soll

function StartDefendCounter()
	if DefendCounter < maxDefendBar then
		DefendCounter = DefendCounter +1
		return false
	else 
		return true
	end 
end



function veteranBombAbility()
	assert(XGUIEng.GetWidgetID("Selection_HeroVet")==0, "Selection_HeroVet already exists")
	assert(XGUIEng.GetWidgetID("Commands_BarbVet")==0, "Commands_BarbVet already exists")
	assert(XGUIEng.GetWidgetID("BarbVet_RechargePlaceBomb")==0, "BarbVet_RechargePlaceBomb already exists")
	assert(XGUIEng.GetWidgetID("BarbVet_PlaceBomb")==0, "BarbVet_PlaceBomb already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Hero", "Selection_HeroVet", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Selection_HeroVet", 0, 0, 712, 200)
	XGUIEng.ShowWidget("Selection_HeroVet", 0)
	CppLogic.UI.WidgetSetBaseData("Selection_HeroVet", 10, false, false)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_HeroVet", "Commands_BarbVet", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Commands_BarbVet", 0, 88, 440, 112)
	XGUIEng.ShowWidget("Commands_BarbVet", 1)
	CppLogic.UI.WidgetSetBaseData("Commands_BarbVet", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateProgressBarWidgetChild("Commands_BarbVet", "BarbVet_RechargePlaceBomb", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BarbVet_RechargePlaceBomb", 255, 38, 32, 32)
	XGUIEng.ShowWidget("BarbVet_RechargePlaceBomb", 1)
	CppLogic.UI.WidgetSetBaseData("BarbVet_RechargePlaceBomb", 50, false, true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_RechargePlaceBomb", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("BarbVet_RechargePlaceBomb", 0, 214, 44, 24, 189)
	XGUIEng.SetProgressBarValues("BarbVet_RechargePlaceBomb", 5, 10)
	CppLogic.UI.WidgetSetUpdateManualFlag("BarbVet_RechargePlaceBomb", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("BarbVet_RechargePlaceBomb", function() GUIUpdate_HeroAbility(Abilities.AbilityPlaceBomb,XGUIEng.GetWidgetID("BarbVet_PlaceBomb")) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbVet", "BarbVet_PlaceBomb", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BarbVet_PlaceBomb", 255, 38, 32, 32)
	XGUIEng.ShowWidget("BarbVet_PlaceBomb", 1)
	CppLogic.UI.WidgetSetBaseData("BarbVet_PlaceBomb", 0, false, false)
	CppLogic.UI.WidgetSetGroup("BarbVet_PlaceBomb", "Command_group")
	XGUIEng.DisableButton("BarbVet_PlaceBomb", 0)
	XGUIEng.HighLightButton("BarbVet_PlaceBomb", 0)
	CppLogic.UI.ButtonOverrideActionFunc("BarbVet_PlaceBomb", function() GUIAction_Hero2PlaceBomb() end)
	CppLogic.UI.ButtonSetShortcutString("BarbVet_PlaceBomb", "KeyBindings/HeroAbility1", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_PlaceBomb", 0, 0, 0.125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("BarbVet_PlaceBomb", 0, "data\\graphics\\textures\\gui\\b_units_heroes.png")
	XGUIEng.SetMaterialColor("BarbVet_PlaceBomb", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_PlaceBomb", 1, 0.25, 0.125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("BarbVet_PlaceBomb", 1, "data\\graphics\\textures\\gui\\b_units_heroes.png")
	XGUIEng.SetMaterialColor("BarbVet_PlaceBomb", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_PlaceBomb", 2, 0.5, 0.125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("BarbVet_PlaceBomb", 2, "data\\graphics\\textures\\gui\\b_units_heroes.png")
	XGUIEng.SetMaterialColor("BarbVet_PlaceBomb", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_PlaceBomb", 3, 0, 0.125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("BarbVet_PlaceBomb", 3, "data\\graphics\\textures\\gui\\b_units_heroes.png")
	XGUIEng.SetMaterialColor("BarbVet_PlaceBomb", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BarbVet_PlaceBomb", 4, 0.75, 0.125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("BarbVet_PlaceBomb", 4, "data\\graphics\\textures\\gui\\b_units_heroes.png")
	XGUIEng.SetMaterialColor("BarbVet_PlaceBomb", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("BarbVet_PlaceBomb", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("BarbVet_PlaceBomb", function() GUITooltip_PlaceVetBomb() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("BarbVet_PlaceBomb", true)

	
end

function GUITooltip_PlaceVetBomb()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Bombe @cr @color:255,255,255 Platziert mit Helgar an der Position der Maus eine Bombe.")
	XGUIEng.SetText("TooltipBottomCosts", "")
end

function GameSpeedButton()

	assert(XGUIEng.GetWidgetID("SpeedButton")==0, "SpeedButton already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("MinimapButtons", "SpeedButton", "OnlineHelpButton")
	CppLogic.UI.WidgetSetPositionAndSize("SpeedButton", 133, 2, 35, 36)
	XGUIEng.ShowWidget("SpeedButton", 1)
	CppLogic.UI.WidgetSetBaseData("SpeedButton", 100, false, false)
	XGUIEng.DisableButton("SpeedButton", 0)
	XGUIEng.HighLightButton("SpeedButton", 0)
	CppLogic.UI.ButtonOverrideActionFunc("SpeedButton", function() GUIAction_SetGameSpeed() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SpeedButton", 0, 0, 0.96875, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("SpeedButton", 0, "graphics\\textures\\gui\\b_statistics.png")
	XGUIEng.SetMaterialColor("SpeedButton", 0, 200, 200, 200, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SpeedButton", 1, 0, 0.96875, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("SpeedButton", 1, "graphics\\textures\\gui\\b_statistics.png")
	XGUIEng.SetMaterialColor("SpeedButton", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SpeedButton", 2, 0, 0.96875, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("SpeedButton", 2, "graphics\\textures\\gui\\b_statistics.png")
	XGUIEng.SetMaterialColor("SpeedButton", 2, 255, 177, 0, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SpeedButton", 3, 0, 0.96875, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("SpeedButton", 3, "graphics\\textures\\gui\\b_statistics.png")
	XGUIEng.SetMaterialColor("SpeedButton", 3, 100, 100, 100, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SpeedButton", 4, 0, 0.96875, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("SpeedButton", 4, "graphics\\textures\\gui\\b_statistics.png")
	XGUIEng.SetMaterialColor("SpeedButton", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("SpeedButton", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("SpeedButton", function() GUITooltip_GenericSpeedButton() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("SpeedButton", false)


end

speedMode = 2
currentMode = 1

function GUIAction_SetGameSpeed()

	if speedMode == 1 then
		Game.GameTimeSetFactor(1)
		speedMode = speedMode+1
		currentMode = 1
	elseif speedMode == 2 then
		Game.GameTimeSetFactor(2)
		speedMode = speedMode+1
		currentMode = currentMode+1
	elseif speedMode == 3 then
		Game.GameTimeSetFactor(3)
		speedMode = 1
		currentMode = currentMode+1
	end
end

function GUITooltip_GenericSpeedButton()
		XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Spielgeschwindigkeit @cr @color:255,255,255 Die Spielgeschwindigkeit beträgt Stufe "..currentMode.." von 3.")
		XGUIEng.SetText("TooltipBottomCosts", "")
end

------Normalisiert die Spielgeschwindigkeit am Anfang eines Briefings und updatet die GUI-Anzeige (Einfügen über StartBriefing-Funktion)

function NormalSpeedInBriefing()
    Game.GameTimeSetFactor(1)
    speedMode = 2
	currentMode = 1
    GUITooltip_GenericSpeedButton()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function InitCameraZoomButton()
	assert(XGUIEng.GetWidgetID("ZoomButton")==0, "ZoomButton already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("MinimapButtons", "ZoomButton", "OnlineHelpButton")
	CppLogic.UI.WidgetSetPositionAndSize("ZoomButton", 110, 20, 20, 20)
	XGUIEng.ShowWidget("ZoomButton", 1)
	CppLogic.UI.WidgetSetBaseData("ZoomButton", 100, false, false)
	XGUIEng.DisableButton("ZoomButton", 0)
	XGUIEng.HighLightButton("ZoomButton", 0)
	CppLogic.UI.ButtonOverrideActionFunc("ZoomButton", function() GUIAction_SetCameraZoom() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ZoomButton", 0, 0, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("ZoomButton", 0, "data\\graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("ZoomButton", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ZoomButton", 1, 0.25, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("ZoomButton", 1, "data\\graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("ZoomButton", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ZoomButton", 2, 0.5, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("ZoomButton", 2, "data\\graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("ZoomButton", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ZoomButton", 3, 0, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("ZoomButton", 3, "data\\graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("ZoomButton", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ZoomButton", 4, 0.75, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("ZoomButton", 4, "data\\graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("ZoomButton", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("ZoomButton", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("ZoomButton", function() GUITooltip_ZoomButton() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("ZoomButton", false)
	
end

cameraZoom = 2
currentZoom = 1

function GUIAction_SetCameraZoom()
	if cameraZoom == 1 then
		Camera.ZoomSetFactorMax(1)
		cameraZoom = cameraZoom+1
		currentZoom = 1
	elseif cameraZoom == 2 then
		Camera.ZoomSetFactorMax(1.5)
		cameraZoom = cameraZoom+1
		currentZoom = currentZoom+0.5
	elseif cameraZoom == 3 then
		Camera.ZoomSetFactorMax(2)
		cameraZoom = 1
		currentZoom = currentZoom+0.5
	end
end


function GUITooltip_ZoomButton()
	XGUIEng.SetText("TooltipBottomText", "@color:255,255,0 Kameraentfernung @cr @color:255,255,255 Die Zoomstufe der Kamera beträgt "..currentZoom.." von 2.")
	XGUIEng.SetText("TooltipBottomCosts", "")
end


function selection_barbArena()

	assert(XGUIEng.GetWidgetID("BarbArena")==0, "BarbArena already exists")
	assert(XGUIEng.GetWidgetID("Commands_BarbArena")==0, "Commands_BarbArena already exists")
	assert(XGUIEng.GetWidgetID("Buy_LeaderBanditSword")==0, "Buy_LeaderBanditSword already exists")
	assert(XGUIEng.GetWidgetID("Buy_LeaderBanditBow")==0, "Buy_LeaderBanditBow already exists")
	assert(XGUIEng.GetWidgetID("Research_UpgradeBanditSword")==0, "Research_UpgradeBanditSword already exists")
	assert(XGUIEng.GetWidgetID("Research_UpgradeBanditBow")==0, "Research_UpgradeBanditBow already exists")
	assert(XGUIEng.GetWidgetID("Research_BetterBanditsArmor")==0, "Research_BetterBanditsArmor already exists")
	assert(XGUIEng.GetWidgetID("Research_BetterBanditsDamage")==0, "Research_BetterBanditsDamage already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Building", "BarbArena", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BarbArena", 0, 0, 712, 200)
	XGUIEng.ShowWidget("BarbArena", 0)
	CppLogic.UI.WidgetSetBaseData("BarbArena", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("BarbArena", "Commands_BarbArena", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Commands_BarbArena", 0, 88, 440, 112)
	XGUIEng.ShowWidget("Commands_BarbArena", 1)
	CppLogic.UI.WidgetSetBaseData("Commands_BarbArena", 0, true, false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Buy_LeaderBanditSword", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Buy_LeaderBanditSword", 4, 4, 32, 32)
	XGUIEng.ShowWidget("Buy_LeaderBanditSword", 1)
	CppLogic.UI.WidgetSetBaseData("Buy_LeaderBanditSword", 0, false, false)
	XGUIEng.DisableButton("Buy_LeaderBanditSword", 0)
	XGUIEng.HighLightButton("Buy_LeaderBanditSword", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Buy_LeaderBanditSword", function() GUIAction_BuyMilitaryUnit(UpgradeCategories.LeaderBandit) end)
	CppLogic.UI.ButtonSetShortcutString("Buy_LeaderBanditSword", "KeyBindings/BuyUnits1", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditSword", 0, 0, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditSword", 0, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditSword", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditSword", 1, 0.25, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditSword", 1, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditSword", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditSword", 2, 0.5, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditSword", 2, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditSword", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditSword", 3, 0, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditSword", 3, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditSword", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditSword", 4, 0.75, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditSword", 4, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditSword", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Buy_LeaderBanditSword", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Buy_LeaderBanditSword", function() GUITooltip_BuyMilitaryUnitBanditSword() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Buy_LeaderBanditSword", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Buy_LeaderBanditSword", function() GUIUpdate_BuyMilitaryUnitButtons("Buy_LeaderBanditSword", Technologies.MU_LeaderBanditSword, UpgradeCategories.LeaderBandit) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Buy_LeaderBanditBow", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Buy_LeaderBanditBow", 40, 5, 32, 32)
	XGUIEng.ShowWidget("Buy_LeaderBanditBow", 1)
	CppLogic.UI.WidgetSetBaseData("Buy_LeaderBanditBow", 0, false, false)
	XGUIEng.DisableButton("Buy_LeaderBanditBow", 0)
	XGUIEng.HighLightButton("Buy_LeaderBanditBow", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Buy_LeaderBanditBow", function() GUIAction_BuyMilitaryUnit(UpgradeCategories.LeaderBanditBow) end)
	CppLogic.UI.ButtonSetShortcutString("Buy_LeaderBanditBow", "KeyBindings/BuyUnits2", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditBow", 0, 0, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditBow", 0, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditBow", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditBow", 1, 0.25, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditBow", 1, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditBow", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditBow", 2, 0.5, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditBow", 2, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditBow", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditBow", 3, 0, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditBow", 3, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditBow", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_LeaderBanditBow", 4, 0.75, 0, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_LeaderBanditBow", 4, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Buy_LeaderBanditBow", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Buy_LeaderBanditBow", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Buy_LeaderBanditBow", function() GUITooltip_BuyMilitaryUnitBanditBow() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Buy_LeaderBanditBow", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Buy_LeaderBanditBow", function() GUIUpdate_BuyMilitaryUnitButtons("Buy_LeaderBanditBow", Technologies.MU_LeaderBanditBow, UpgradeCategories.LeaderBanditBow) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Research_UpgradeBanditSword", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Research_UpgradeBanditSword", 4, 40, 32, 32)
	XGUIEng.ShowWidget("Research_UpgradeBanditSword", 1)
	CppLogic.UI.WidgetSetBaseData("Research_UpgradeBanditSword", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Research_UpgradeBanditSword", "BuildingGroup")
	XGUIEng.DisableButton("Research_UpgradeBanditSword", 0)
	XGUIEng.HighLightButton("Research_UpgradeBanditSword", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Research_UpgradeBanditSword", function() GUIAction_ReserachTechnology(Technologies.T_UpgradeBanditSword1) end)
	CppLogic.UI.ButtonSetShortcutString("Research_UpgradeBanditSword", "KeyBindings/UpgradeUnit1", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditSword", 0, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditSword", 0, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditSword", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditSword", 1, 0.25, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditSword", 1, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditSword", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditSword", 2, 0.5, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditSword", 2, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditSword", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditSword", 3, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditSword", 3, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditSword", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditSword", 4, 0.75, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditSword", 4, "data\\graphics\\textures\\gui\\b_military_barracks.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditSword", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Research_UpgradeBanditSword", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Research_UpgradeBanditSword", function() GUITooltip_ResearchTechnologiesUpBanditSword() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Research_UpgradeBanditSword", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Research_UpgradeBanditSword", function() GUIUpdate_SettlersUpgradeButtons("Research_UpgradeBanditSword", Technologies.T_UpgradeBanditSword1) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Research_UpgradeBanditBow", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Research_UpgradeBanditBow", 40, 40, 32, 32)
	XGUIEng.ShowWidget("Research_UpgradeBanditBow", 1)
	CppLogic.UI.WidgetSetBaseData("Research_UpgradeBanditBow", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Research_UpgradeBanditBow", "BuildingGroup")
	XGUIEng.DisableButton("Research_UpgradeBanditBow", 0)
	XGUIEng.HighLightButton("Research_UpgradeBanditBow", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Research_UpgradeBanditBow", function() GUIAction_ReserachTechnology(Technologies.T_UpgradeBanditBow1) end)
	CppLogic.UI.ButtonSetShortcutString("Research_UpgradeBanditBow", "KeyBindings/UpgradeUnit2", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditBow", 0, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditBow", 0, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditBow", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditBow", 1, 0.25, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditBow", 1, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditBow", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditBow", 2, 0.5, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditBow", 2, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditBow", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditBow", 3, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditBow", 3, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditBow", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_UpgradeBanditBow", 4, 0.75, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_UpgradeBanditBow", 4, "graphics\\textures\\gui\\b_military_archery.png")
	XGUIEng.SetMaterialColor("Research_UpgradeBanditBow", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Research_UpgradeBanditBow", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Research_UpgradeBanditBow", function() GUITooltip_ResearchTechnologiesUpBanditBow() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Research_UpgradeBanditBow", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Research_UpgradeBanditBow", function() GUIUpdate_SettlersUpgradeButtons("Research_UpgradeBanditBow", Technologies.T_UpgradeBanditBow1) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Research_BetterBanditsArmor", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Research_BetterBanditsArmor", 110, 5, 32, 32)
	XGUIEng.ShowWidget("Research_BetterBanditsArmor", 1)
	CppLogic.UI.WidgetSetBaseData("Research_BetterBanditsArmor", 0, false, false)
	XGUIEng.DisableButton("Research_BetterBanditsArmor", 0)
	XGUIEng.HighLightButton("Research_BetterBanditsArmor", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Research_BetterBanditsArmor", function() GUIAction_ReserachTechnology(Technologies.T_BetterBanditArmor) end)
	CppLogic.UI.ButtonSetShortcutString("Research_BetterBanditsArmor", "KeyBindings/ReserachTechnologies1", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsArmor", 0, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsArmor", 0, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsArmor", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsArmor", 1, 0.25, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsArmor", 1, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsArmor", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsArmor", 2, 0.5, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsArmor", 2, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsArmor", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsArmor", 3, 0, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsArmor", 3, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsArmor", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsArmor", 4, 0.75, 0.25, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsArmor", 4, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsArmor", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Research_BetterBanditsArmor", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Research_BetterBanditsArmor", function() GUITooltip_ResearchTechnologiesBetterBanditsArmor() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Research_BetterBanditsArmor", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Research_BetterBanditsArmor", function() GUIUpdate_TechnologyButtons("Research_BetterBanditsArmor", Technologies.T_BetterBanditArmor, Entities.CB_Barbarian_Arena) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbArena", "Research_BetterBanditsDamage", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Research_BetterBanditsDamage", 110, 39, 32, 32)
	XGUIEng.ShowWidget("Research_BetterBanditsDamage", 1)
	CppLogic.UI.WidgetSetBaseData("Research_BetterBanditsDamage", 0, false, false)
	XGUIEng.DisableButton("Research_BetterBanditsDamage", 0)
	XGUIEng.HighLightButton("Research_BetterBanditsDamage", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Research_BetterBanditsDamage", function() GUIAction_ReserachTechnology(Technologies.T_BetterBanditDamage) end)
	CppLogic.UI.ButtonSetShortcutString("Research_BetterBanditsDamage", "KeyBindings/ReserachTechnologies3", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsDamage", 0, 0, 0.125, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsDamage", 0, "graphics\\textures\\gui\\b_generic_settler.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsDamage", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsDamage", 1, 0.25, 0.125, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsDamage", 1, "graphics\\textures\\gui\\b_generic_settler.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsDamage", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsDamage", 2, 0.5, 0.125, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsDamage", 2, "graphics\\textures\\gui\\b_generic_settler.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsDamage", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsDamage", 3, 0, 0.125, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsDamage", 3, "graphics\\textures\\gui\\b_generic_settler.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsDamage", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_BetterBanditsDamage", 4, 0.75, 0.125, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("Research_BetterBanditsDamage", 4, "graphics\\textures\\gui\\b_generic_settler.png")
	XGUIEng.SetMaterialColor("Research_BetterBanditsDamage", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Research_BetterBanditsDamage", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Research_BetterBanditsDamage", function() GUITooltip_ResearchTechnologiesBetterBanditsDamage() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Research_BetterBanditsDamage", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Research_BetterBanditsDamage", function() GUIUpdate_TechnologyButtons("Research_BetterBanditsDamage", Technologies.T_BetterBanditDamage, Entities.CB_Barbarian_Arena) end)

		

end

BarbarianLeaderSword1 = {
    [ResourceType.Gold] = 300,
    [ResourceType.Wood] = 50,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 60,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_BuyMilitaryUnitBanditSword()
	if Logic.GetTechnologyState(1,Technologies.MU_LeaderBanditSword) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Einheit ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Buy_LeaderBanditSword") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Banditen @cr @color:255,165,0 benötigt: @color:255,255,255  Nichts @cr @color:255,165,0 ermöglicht: @color:255,255,255  Rekrutiert ein Trupp Banditen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianLeaderSword1))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Banditen @cr @color:255,255,255 Rekrutiert ein Trupp Banditen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianLeaderSword1))
	end
end

BarbarianLeaderBow1 = {
    [ResourceType.Gold] = 250,
    [ResourceType.Wood] = 80,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 10,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_BuyMilitaryUnitBanditBow()
	if Logic.GetTechnologyState(1,Technologies.MU_LeaderBanditBow) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Einheit ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Buy_LeaderBanditBow") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Bogenschützen der Banditen @cr @color:255,165,0 benötigt: @color:255,255,255  Nichts @cr @color:255,165,0 ermöglicht: @color:255,255,255  Rekrutiert ein Trupp Bogenschützen der Banditen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianLeaderBow1))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Bogenschützen der Banditen @cr @color:255,255,255 Rekrutiert ein Trupp Bogenschützen der Banditen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianLeaderBow1))
	end
end

TechBarbLeaderSword2 = {
    [ResourceType.Gold] = 600,
    [ResourceType.Wood] = 400,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 400,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ResearchTechnologiesUpBanditSword()
	if Logic.GetTechnologyState(1,Technologies.T_UpgradeBanditSword1) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Verbesserung ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_UpgradeBanditSword") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Upgrade: Banditen @cr @color:255,165,0 benötigt: @color:255,255,255  Zitadelle der Barbaren und eine Feinschmiede @cr @color:255,165,0 ermöglicht: @color:255,255,255  Verbessert die Banditen auf Stufe 2.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbLeaderSword2))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Upgrade: Banditen @cr @color:255,255,255 Verbessert die Banditen auf Stufe 2.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbLeaderSword2))
	end
end

TechBarbLeaderBow2 = {
    [ResourceType.Gold] = 600,
    [ResourceType.Wood] = 400,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 200,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ResearchTechnologiesUpBanditBow()
	if Logic.GetTechnologyState(1,Technologies.T_UpgradeBanditBow1) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Verbesserung ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_UpgradeBanditBow") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Upgrade: Bogenschützen der Banditen @cr @color:255,165,0 benötigt: @color:255,255,255  Zitadelle der Barbaren und ein Sägewerk @cr @color:255,165,0 ermöglicht: @color:255,255,255  Verbessert die Bogenschützen der Banditen auf Stufe 2.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbLeaderBow2))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Upgrade: Bogenschützen der Banditen @cr @color:255,255,255 Verbessert die Bogenschützen der Banditen auf Stufe 2.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbLeaderBow2))
	end
end

TechBarbBetterArmor = {
    [ResourceType.Gold] = 500,
    [ResourceType.Wood] = 0,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 500,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ResearchTechnologiesBetterBanditsArmor()
	if Logic.GetTechnologyState(1,Technologies.T_BetterBanditArmor) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Technologie ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_BetterBanditsArmor") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Metallplattenpanzer @cr @color:255,165,0 benötigt: @color:255,255,255  Zitadelle der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Verbessert die Rüstung aller Banditen (Sowohl Nahkämpfer als auch Fernkämpfer).")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbBetterArmor))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Metallplattenpanzer @cr @color:255,255,255 Verbessert die Rüstung aller Banditen (Sowohl Nahkämpfer als auch Fernkämpfer).")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbBetterArmor))
	end
end

TechBarbBetterDamage = {
    [ResourceType.Gold] = 500,
    [ResourceType.Wood] = 200,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 500,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ResearchTechnologiesBetterBanditsDamage()
	if Logic.GetTechnologyState(1,Technologies.T_BetterBanditDamage) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Technologie ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_BetterBanditsDamage") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Gewetze Waffen @cr @color:255,165,0 benötigt: @color:255,255,255  Zitadelle der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Verbessert die Waffen aller Banditen (Sowohl Nahkämpfer als auch Fernkämpfer).")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbBetterDamage))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Gewetze Waffen @cr @color:255,255,255 Verbessert die Waffen aller Banditen (Sowohl Nahkämpfer als auch Fernkämpfer).")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(TechBarbBetterDamage))
	end
end


function selection_newBarbMenu()
	assert(XGUIEng.GetWidgetID("SerfBarbTabs")==0, "SerfBarbTabs already exists")
	assert(XGUIEng.GetWidgetID("SerfToBarbarianMenu")==0, "SerfToBarbarianMenu already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Serf", "SerfBarbTabs", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SerfBarbTabs", 86, 33, 48, 48)
	XGUIEng.ShowWidget("SerfBarbTabs", 1)
	CppLogic.UI.WidgetSetBaseData("SerfBarbTabs", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SerfBarbTabs", "SerfToBarbarianMenu", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SerfToBarbarianMenu", 0, 0, 50, 48)
	XGUIEng.ShowWidget("SerfToBarbarianMenu", 1)
	CppLogic.UI.WidgetSetBaseData("SerfToBarbarianMenu", 0, false, false)
	CppLogic.UI.WidgetSetGroup("SerfToBarbarianMenu", "BuildingMenuGroup")
	XGUIEng.DisableButton("SerfToBarbarianMenu", 0)
	XGUIEng.HighLightButton("SerfToBarbarianMenu", 1)
	CppLogic.UI.ButtonOverrideActionFunc("SerfToBarbarianMenu", function() GUIAction_ToggleSerfMenu(XGUIEng.GetWidgetID("SerfBarbarianMenu"),1) end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SerfToBarbarianMenu", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SerfToBarbarianMenu", 0, "graphics\\textures\\gui\\tab_workers_off.png")
	XGUIEng.SetMaterialColor("SerfToBarbarianMenu", 0, 200, 200, 200, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SerfToBarbarianMenu", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SerfToBarbarianMenu", 1, "graphics\\textures\\gui\\tab_workers_off.png")
	XGUIEng.SetMaterialColor("SerfToBarbarianMenu", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SerfToBarbarianMenu", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SerfToBarbarianMenu", 2, "graphics\\textures\\gui\\tab_workers_on.png")
	XGUIEng.SetMaterialColor("SerfToBarbarianMenu", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SerfToBarbarianMenu", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SerfToBarbarianMenu", 3, "graphics\\textures\\gui\\tab_workers_off.png")
	XGUIEng.SetMaterialColor("SerfToBarbarianMenu", 3, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("SerfToBarbarianMenu", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("SerfToBarbarianMenu", 4, "graphics\\textures\\gui\\tab_workers_on.png")
	XGUIEng.SetMaterialColor("SerfToBarbarianMenu", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("SerfToBarbarianMenu", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("SerfToBarbarianMenu", function() GUITooltip_GenericBarbMenu() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("SerfToBarbarianMenu", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("SerfToBarbarianMenu", function() GUIUpdate_BuildingButtons("SerfToBarbarianMenu", Technologies.GT_BarbarianBuildings) end)


	
end


----Neues Barb-Menü implementieren-----------------------------------------------------------------------------------------------------
function initGUIAction_ToggleSerfMenu()
	function GUIAction_ToggleSerfMenu( _Menu,_status)
		
		local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
		
		XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.SerfMenus,0)
		
		XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")
		
		
		if _Menu == gvGUI_WidgetID.SerfConstructionMenu then
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToSerfBeatificationMenu,1)	
			XGUIEng.HighLightButton(XGUIEng.GetWidgetID("SerfToBarbarianMenu"),1)
		elseif _Menu == gvGUI_WidgetID.SerfBeautificationMenu then
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToSerfConstructionMenu,1)
			XGUIEng.HighLightButton(XGUIEng.GetWidgetID("SerfToBarbarianMenu"),1)	
		else
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToSerfBeatificationMenu,1)
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToSerfConstructionMenu,1)
		end
		
		
		
		XGUIEng.ShowWidget(_Menu,_status)
		
		--Update all buttons in the visible container
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
		
	end
end

function GUITooltip_GenericBarbMenu()
	XGUIEng.SetText("TooltipBottomText", "Barbarenmenü @cr In diesem Menü könnt Ihr die Gebäude der Barbaren auswählen.")
	XGUIEng.SetText("TooltipBottomCosts", "")
end



function modifygui_serfbarbmenu()

	assert(XGUIEng.GetWidgetID("SerfBarbarianMenu")==0, "SerfBarbarianMenu already exists")
	assert(XGUIEng.GetWidgetID("Build_BarbTower")==0, "Build_BarbTower already exists")
	assert(XGUIEng.GetWidgetID("Build_VillageBarb")==0, "Build_VillageBarb already exists")
	assert(XGUIEng.GetWidgetID("Build_BarbArena")==0, "Build_BarbArena already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Commands_Serf", "SerfBarbarianMenu", nil)
	CppLogic.UI.WidgetSetPositionAndSize("SerfBarbarianMenu", 0, 0, 440, 112)
	XGUIEng.ShowWidget("SerfBarbarianMenu", 0)
	CppLogic.UI.WidgetSetBaseData("SerfBarbarianMenu", 1, false, false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SerfBarbarianMenu", "Build_BarbTower", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Build_BarbTower", 43, 4, 32, 32)
	XGUIEng.ShowWidget("Build_BarbTower", 1)
	CppLogic.UI.WidgetSetBaseData("Build_BarbTower", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Build_BarbTower", "BuildingGroup")
	XGUIEng.DisableButton("Build_BarbTower", 0)
	XGUIEng.HighLightButton("Build_BarbTower", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Build_BarbTower", function() GUIAction_PlaceBuilding( UpgradeCategories.BarbarianTower) end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbTower", 0, 0, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_BarbTower", 0, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_BarbTower", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbTower", 1, 0.25, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_BarbTower", 1, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_BarbTower", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbTower", 2, 0.5, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_BarbTower", 2, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_BarbTower", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbTower", 3, 0.5, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_BarbTower", 3, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_BarbTower", 3, 100, 100, 100, 150)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbTower", 4, 0.75, 0.625, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_BarbTower", 4, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_BarbTower", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Build_BarbTower", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Build_BarbTower", function() GUITooltip_ConstructBuildingBarbTower() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Build_BarbTower", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Build_BarbTower", function() GUIUpdate_BuildingButtons("Build_BarbTower", Technologies.B_BarbTower) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SerfBarbarianMenu", "Build_VillageBarb", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Build_VillageBarb", 7, 4, 32, 32)
	XGUIEng.ShowWidget("Build_VillageBarb", 1)
	CppLogic.UI.WidgetSetBaseData("Build_VillageBarb", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Build_VillageBarb", "BuildingGroup")
	XGUIEng.DisableButton("Build_VillageBarb", 0)
	XGUIEng.HighLightButton("Build_VillageBarb", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Build_VillageBarb", function() GUIAction_PlaceBuilding( UpgradeCategories.VillageCenterBarbarian) end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_VillageBarb", 0, 0, 0.75, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_VillageBarb", 0, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_VillageBarb", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_VillageBarb", 1, 0.25, 0.75, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_VillageBarb", 1, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_VillageBarb", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_VillageBarb", 2, 0.5, 0.75, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_VillageBarb", 2, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_VillageBarb", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_VillageBarb", 3, 0.5, 0.75, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_VillageBarb", 3, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_VillageBarb", 3, 100, 100, 100, 150)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_VillageBarb", 4, 0.75, 0.75, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Build_VillageBarb", 4, "graphics\\textures\\gui\\b_units_military.png")
	XGUIEng.SetMaterialColor("Build_VillageBarb", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Build_VillageBarb", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Build_VillageBarb", function() GUITooltip_ConstructBuildingVillageBarb() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Build_VillageBarb", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Build_VillageBarb", function() GUIUpdate_BuildingButtons("Build_VillageBarb", Technologies.B_BarbVillage) end)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SerfBarbarianMenu", "Build_BarbArena", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Build_BarbArena", 79, 4, 32, 32)
	XGUIEng.ShowWidget("Build_BarbArena", 1)
	CppLogic.UI.WidgetSetBaseData("Build_BarbArena", 0, false, false)
	CppLogic.UI.WidgetSetGroup("Build_BarbArena", "BuildingGroup")
	XGUIEng.DisableButton("Build_BarbArena", 0)
	XGUIEng.HighLightButton("Build_BarbArena", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Build_BarbArena", function() GUIAction_PlaceBuilding( UpgradeCategories.Arena) end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbArena", 0, 0, 0.375, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("Build_BarbArena", 0, "data\\graphics\\textures\\gui\\b_units_serf.png")
	XGUIEng.SetMaterialColor("Build_BarbArena", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbArena", 1, 0.25, 0.375, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("Build_BarbArena", 1, "data\\graphics\\textures\\gui\\b_units_serf.png")
	XGUIEng.SetMaterialColor("Build_BarbArena", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbArena", 2, 0.5, 0.375, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("Build_BarbArena", 2, "data\\graphics\\textures\\gui\\b_units_serf.png")
	XGUIEng.SetMaterialColor("Build_BarbArena", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbArena", 3, 0.5, 0.375, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("Build_BarbArena", 3, "data\\graphics\\textures\\gui\\b_units_serf.png")
	XGUIEng.SetMaterialColor("Build_BarbArena", 3, 100, 100, 100, 150)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Build_BarbArena", 4, 0.75, 0.375, 0.25, 0.03125)
	XGUIEng.SetMaterialTexture("Build_BarbArena", 4, "data\\graphics\\textures\\gui\\b_units_serf.png")
	XGUIEng.SetMaterialColor("Build_BarbArena", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Build_BarbArena", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Build_BarbArena", function() GUITooltip_ConstructBuildingBarbArena() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Build_BarbArena", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Build_BarbArena", function() GUIUpdate_BuildingButtons("Build_BarbArena", Technologies.B_BarbArena) end)

	

end


BarbarianTower = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 350,
    [ResourceType.Clay] = 150,
    [ResourceType.Stone] = 500,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ConstructBuildingBarbTower()
	if Logic.GetTechnologyState(1,Technologies.B_BarbTower) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Build_BarbTower") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Wachturm @cr @color:255,165,0 benötigt: @color:255,255,255  Gebäude der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Der Wachturm bietet ein großes Sichtfeld in unentdeckten Gebieten.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianTower))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Wachturm @cr @color:255,255,255 Der Wachturm bietet ein großes Sichtfeld in unentdeckten Gebieten.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianTower))
	end
end



BarbarianVillage = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 600,
    [ResourceType.Clay] = 300,
    [ResourceType.Stone] = 500,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ConstructBuildingVillageBarb()
	if Logic.GetTechnologyState(1,Technologies.B_BarbVillage) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Build_VillageBarb") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Dorfzentrum der Barbaren @cr @color:255,255,255 Das Dorfzentrum der Barbaren bietet eine große Menge an Bevölkerungsplatz, kann jedoch nicht ausgebaut werden. Im Dorfzentrum der Barbaren ist es jedoch möglich den Aussichtstrum der Barbaren zu erforschen.")
		XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianVillage))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Dorfzentrum der Barbaren @cr @color:255,255,255 Das Dorfzentrum der Barbaren bietet eine große Menge an Bevölkerungsplatz, kann jedoch nicht ausgebaut werden. Im Dorfzentrum der Barbaren ist es jedoch möglich den Aussichtstrum der Barbaren zu erforschen.")
		XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianVillage))
	end
end


BarbarianArena = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 500,
    [ResourceType.Clay] = 250,
    [ResourceType.Stone] = 550,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_ConstructBuildingBarbArena()
	if Logic.GetTechnologyState(1,Technologies.B_BarbArena) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Build_BarbArena") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Barbarenarena @cr @color:255,165,0 benötigt: @color:255,255,255  Heimwerker @cr @color:255,165,0 ermöglicht: @color:255,255,255  In dieser Arena könnt Ihr Truppen der Banditen anheuern und sie verbessern.")
		XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianArena))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Barbarenarena @cr @color:255,255,255 In dieser Arena könnt Ihr Truppen der Banditen anheuern und sie verbessern.")
		XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianArena))
	end
end


function modifygui_woodmine()

	assert(XGUIEng.GetWidgetID("Woodmine")==0, "Woodmine already exists")
assert(XGUIEng.GetWidgetID("Commands_Woodmine")==0, "Commands_Woodmine already exists")
assert(XGUIEng.GetWidgetID("Upgrade_Woodmine1")==0, "Upgrade_Woodmine1 already exists")
assert(XGUIEng.GetWidgetID("Upgrade_Woodmine2")==0, "Upgrade_Woodmine2 already exists")
assert(XGUIEng.GetWidgetID("WoodMineAmount")==0, "WoodMineAmount already exists")
CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Building", "Woodmine", "BarbArena")
CppLogic.UI.WidgetSetPositionAndSize("Woodmine", 0, 0, 712, 200)
XGUIEng.ShowWidget("Woodmine", 0)
CppLogic.UI.WidgetSetBaseData("Woodmine", 0, false, false)
CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Woodmine", "Commands_Woodmine", nil)
CppLogic.UI.WidgetSetPositionAndSize("Commands_Woodmine", 0, 88, 440, 112)
XGUIEng.ShowWidget("Commands_Woodmine", 1)
CppLogic.UI.WidgetSetBaseData("Commands_Woodmine", 0, true, false)
CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_Woodmine", "Upgrade_Woodmine1", nil)
CppLogic.UI.WidgetSetPositionAndSize("Upgrade_Woodmine1", 398, 4, 32, 32)
XGUIEng.ShowWidget("Upgrade_Woodmine1", 1)
CppLogic.UI.WidgetSetBaseData("Upgrade_Woodmine1", 0, false, false)
XGUIEng.DisableButton("Upgrade_Woodmine1", 0)
XGUIEng.HighLightButton("Upgrade_Woodmine1", 0)
CppLogic.UI.ButtonOverrideActionFunc("Upgrade_Woodmine1", function() GUIAction_UpgradeSelectedBuilding() end)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine1", 0, 0, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine1", 0, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine1", 0, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine1", 1, 0.25, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine1", 1, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine1", 1, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine1", 2, 0.5, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine1", 2, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine1", 2, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine1", 3, 0, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine1", 3, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine1", 3, 128, 128, 128, 128)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine1", 4, 0.75, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine1", 4, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine1", 4, 255, 255, 255, 255)
CppLogic.UI.WidgetSetTooltipData("Upgrade_Woodmine1", "TooltipBottom", true, true)
CppLogic.UI.WidgetOverrideTooltipFunc("Upgrade_Woodmine1", function() GUITooltip_UpgradeBuildingWoodmine1() end)
CppLogic.UI.WidgetSetUpdateManualFlag("Upgrade_Woodmine1", true)
CppLogic.UI.WidgetOverrideUpdateFunc("Upgrade_Woodmine1", function() GUIUpdate_UpgradeButtons("Upgrade_Woodmine1", Technologies.UP1_Woodmine) end)
CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_Woodmine", "Upgrade_Woodmine2", nil)
CppLogic.UI.WidgetSetPositionAndSize("Upgrade_Woodmine2", 398, 4, 32, 32)
XGUIEng.ShowWidget("Upgrade_Woodmine2", 0)
CppLogic.UI.WidgetSetBaseData("Upgrade_Woodmine2", 0, false, false)
XGUIEng.DisableButton("Upgrade_Woodmine2", 0)
XGUIEng.HighLightButton("Upgrade_Woodmine2", 0)
CppLogic.UI.ButtonOverrideActionFunc("Upgrade_Woodmine2", function() GUIAction_UpgradeSelectedBuilding() end)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine2", 0, 0, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine2", 0, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine2", 0, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine2", 1, 0.25, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine2", 1, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine2", 1, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine2", 2, 0.5, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine2", 2, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine2", 2, 255, 255, 255, 255)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine2", 3, 0, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine2", 3, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine2", 3, 128, 128, 128, 128)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_Woodmine2", 4, 0.75, 0, 0.25, 1)
XGUIEng.SetMaterialTexture("Upgrade_Woodmine2", 4, "data\\graphics\\textures\\gui\\b_upgrade.png")
XGUIEng.SetMaterialColor("Upgrade_Woodmine2", 4, 255, 255, 255, 255)
CppLogic.UI.WidgetSetTooltipData("Upgrade_Woodmine2", "TooltipBottom", true, true)
CppLogic.UI.WidgetOverrideTooltipFunc("Upgrade_Woodmine2", function() GUITooltip_UpgradeBuildingWoodmine2() end)
CppLogic.UI.WidgetSetUpdateManualFlag("Upgrade_Woodmine2", true)
CppLogic.UI.WidgetOverrideUpdateFunc("Upgrade_Woodmine2", function() GUIUpdate_UpgradeButtons("Upgrade_Woodmine2", Technologies.UP2_Woodmine) end)
CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("Commands_Woodmine", "WoodMineAmount", nil)
CppLogic.UI.WidgetSetPositionAndSize("WoodMineAmount", 112, 41, 187, 29)
XGUIEng.ShowWidget("WoodMineAmount", 1)
CppLogic.UI.WidgetSetBaseData("WoodMineAmount", 0, false, false)
CppLogic.UI.WidgetMaterialSetTextureCoordinates("WoodMineAmount", 0, 0, 0, 1, 1)
XGUIEng.SetMaterialColor("WoodMineAmount", 0, 255, 255, 255, 0)
CppLogic.UI.WidgetSetFont("WoodMineAmount", "data\\menu\\fonts\\standard12.met")
CppLogic.UI.WidgetSetStringFrameDistance("WoodMineAmount", 0)
XGUIEng.SetText("WoodMineAmount", "@center @color:143,91,64 Holzmenge: @color:255,255,255  "..woodmineAmount, 1)
XGUIEng.SetTextColor("WoodMineAmount", 255, 255, 255, 255)
CppLogic.UI.WidgetSetUpdateManualFlag("WoodMineAmount", true)
XGUIEng.SetLinesToPrint("WoodMineAmount", 0, 0)
CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("WoodMineAmount", 0)

end

woodmineAmount = 1


Woodmine1 = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 350,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 300,
    [ResourceType.Iron] = 200,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUITooltip_UpgradeBuildingWoodmine1()
	if Logic.GetTechnologyState(1,Technologies.UP1_Woodmine) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Upgrade_Woodmine1") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Holzwerkstatt @cr @color:255,165,0 benötigt: @color:255,255,255  Gebäude der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Ausbau des Holzwerks zur Holzwerkstatt.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(Woodmine1))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Holzwerkstatt @cr @color:255,255,255  Ausbau des Holzwerks zur Holzwerkstatt.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(Woodmine1))
	end
end

Woodmine2 = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 500,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 500,
    [ResourceType.Iron] = 400,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}



function GUITooltip_UpgradeBuildingWoodmine2()
	if Logic.GetTechnologyState(1,Technologies.UP2_Woodmine) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Upgrade_Woodmine2") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Holzmanufaktur @cr @color:255,165,0 benötigt: @color:255,255,255  Heimwerker @cr @color:255,165,0 ermöglicht: @color:255,255,255  Ausbau der des Holzwerkstatt zur Holzmanufaktur.")
    XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(Woodmine2))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Holzmanufaktur @cr @color:255,255,255  Ausbau der des Holzwerkstatt zur Holzmanufaktur.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(Woodmine2))
	end
end






function modifygui_selectionBarbTower()
	assert(XGUIEng.GetWidgetID("BarbTower")==0, "BarbTower already exists")
	assert(XGUIEng.GetWidgetID("Commands_BarbTower")==0, "Commands_BarbTower already exists")
	assert(XGUIEng.GetWidgetID("Upgrade_BarbTower1")==0, "Upgrade_BarbTower1 already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Building", "BarbTower", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BarbTower", 0, 0, 712, 200)
	XGUIEng.ShowWidget("BarbTower", 0)
	CppLogic.UI.WidgetSetBaseData("BarbTower", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("BarbTower", "Commands_BarbTower", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Commands_BarbTower", 0, 88, 440, 112)
	XGUIEng.ShowWidget("Commands_BarbTower", 1)
	CppLogic.UI.WidgetSetBaseData("Commands_BarbTower", 0, true, false)
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbTower", "Upgrade_BarbTower1", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Upgrade_BarbTower1", 398, 4, 32, 32)
	XGUIEng.ShowWidget("Upgrade_BarbTower1", 1)
	CppLogic.UI.WidgetSetBaseData("Upgrade_BarbTower1", 0, false, false)
	XGUIEng.DisableButton("Upgrade_BarbTower1", 0)
	XGUIEng.HighLightButton("Upgrade_BarbTower1", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Upgrade_BarbTower1", function() GUIAction_UpgradeSelectedBuildingBarb() end)
	CppLogic.UI.ButtonSetShortcutString("Upgrade_BarbTower1", "KeyBindings/UpgradeBuilding", true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbTower1", 0, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbTower1", 0, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbTower1", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbTower1", 1, 0.25, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbTower1", 1, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbTower1", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbTower1", 2, 0.5, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbTower1", 2, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbTower1", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbTower1", 3, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbTower1", 3, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbTower1", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbTower1", 4, 0.75, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbTower1", 4, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbTower1", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Upgrade_BarbTower1", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Upgrade_BarbTower1", function() GUITooltip_UpgradeBuildingBarbTower() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Upgrade_BarbTower1", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("Upgrade_BarbTower1", function() GUIUpdate_UpgradeButtons("Upgrade_BarbTower1", Technologies.UP1_BarbTower) end)


end

function GUITooltip_UpgradeBuildingBarbTower2() --für PB_Watchtower_Barb3
	--ggf upgrade 2 in planung
end

BarbarianTowerUpgrade = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 500,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 750,
    [ResourceType.Iron] = 500,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUITooltip_UpgradeBuildingBarbTower()
	if Logic.GetTechnologyState(1,Technologies.UP1_BarbTower) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Upgrade_BarbTower1") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Ausbau zum Grenzturm @cr @color:255,165,0 benötigt: @color:255,255,255  Heimwerker @cr @color:255,165,0 ermöglicht: @color:255,255,255  Baue diesen Wachturm zu einem Grenzturm aus.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianTowerUpgrade))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Ausbau zum Grenzturm @cr @color:255,255,255 Baue diesen Wachturm zu einem Grenzturm aus.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianTowerUpgrade))
	end
end


function GUIAction_UpgradeSelectedBuildingBarb()
	local SelectedEntityID = GUI.GetSelectedEntity()
	local SelectedBuildingType = Logic.GetEntityType( SelectedEntityID )	
	Logic.FillBuildingUpgradeCostsTable( SelectedBuildingType, BarbarianTowerUpgrade )
	
	if InterfaceTool_IsBuildingDoingSomething( SelectedEntityID ) == true then		
		return
	end
	
	if Logic.IsAlarmModeActive(SelectedEntityID) == true then
		GUI.AddNote(XGUIEng.GetStringTableText("InGameMessages/Note_StoptAlarmFirst"))				
		return
	end
	
	
	local EntityType = Logic.GetEntityType( SelectedEntityID )
	local UpgradeCategory = Logic.GetUpgradeCategoryByBuildingType(EntityType)
	
	if UpgradeCategory == UpgradeCategories.Barracks
	or UpgradeCategory == UpgradeCategories.Archery
	or UpgradeCategory == UpgradeCategories.Stable then
		local LeadersTrainingAtMilitaryBuilding = Logic.GetLeaderTrainingAtBuilding(SelectedEntityID)
		if LeadersTrainingAtMilitaryBuilding ~= 0 then
			GUI.AddNote(XGUIEng.GetStringTableText("InGameMessages/GUI_UpgradeNotPossibleBecauseOfTraining"))			
			return
		end
	end
	
	
	gvGUI_UpdateButtonIDArray[ SelectedEntityID ] = XGUIEng.GetCurrentWidgetID()
	
	if InterfaceTool_HasPlayerEnoughResources_Feedback( BarbarianTowerUpgrade ) == 1 then
		GUI.UpgradeSingleBuilding( SelectedEntityID )		
		--Sound.PlayGUISound( Sounds.klick_rnd_1, 0 )	
		
		XGUIEng.ShowWidget(gvGUI_WidgetID.UpgradeInProgress,1)
	end
	--Update all buttons in the visible container
	XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
end


function modifygui_barbvillagecenter()
		assert(XGUIEng.GetWidgetID("VillageBarbarian")==0, "VillageBarbarian already exists")
		assert(XGUIEng.GetWidgetID("Commands_BarbVillage")==0, "Commands_BarbVillage already exists")
		assert(XGUIEng.GetWidgetID("Research_DefendTower")==0, "Research_DefendTower already exists")
		assert(XGUIEng.GetWidgetID("Research_DefendTowerUpgrade")==0, "Research_DefendTowerUpgrade already exists")
		CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Building", "VillageBarbarian", "BarbTower")
		CppLogic.UI.WidgetSetPositionAndSize("VillageBarbarian", 0, 0, 712, 200)
		XGUIEng.ShowWidget("VillageBarbarian", 0)
		CppLogic.UI.WidgetSetBaseData("VillageBarbarian", 0, false, false)
		CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("VillageBarbarian", "Commands_BarbVillage", nil)
		CppLogic.UI.WidgetSetPositionAndSize("Commands_BarbVillage", 0, 88, 440, 112)
		XGUIEng.ShowWidget("Commands_BarbVillage", 1)
		CppLogic.UI.WidgetSetBaseData("Commands_BarbVillage", 0, true, false)
		CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbVillage", "Research_DefendTower", nil)
		CppLogic.UI.WidgetSetPositionAndSize("Research_DefendTower", 19, 6, 32, 32)
		XGUIEng.ShowWidget("Research_DefendTower", 1)
		CppLogic.UI.WidgetSetBaseData("Research_DefendTower", 0, false, false)
		XGUIEng.DisableButton("Research_DefendTower", 0)
		XGUIEng.HighLightButton("Research_DefendTower", 0)
		CppLogic.UI.ButtonOverrideActionFunc("Research_DefendTower", function() GUIAction_ReserachBarbTower(Technologies.GT_BarbarianBuildings1) end)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTower", 0, 0, 0.5625, 0.25, 0.03125)
		XGUIEng.SetMaterialTexture("Research_DefendTower", 0, "graphics\\textures\\gui\\b_units_serf.png")
		XGUIEng.SetMaterialColor("Research_DefendTower", 0, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTower", 1, 0.25, 0.5625, 0.25, 0.03125)
		XGUIEng.SetMaterialTexture("Research_DefendTower", 1, "graphics\\textures\\gui\\b_units_serf.png")
		XGUIEng.SetMaterialColor("Research_DefendTower", 1, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTower", 2, 0.5, 0.5625, 0.25, 0.03125)
		XGUIEng.SetMaterialTexture("Research_DefendTower", 2, "graphics\\textures\\gui\\b_units_serf.png")
		XGUIEng.SetMaterialColor("Research_DefendTower", 2, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTower", 3, 0, 0.5625, 0.25, 0.03125)
		XGUIEng.SetMaterialTexture("Research_DefendTower", 3, "graphics\\textures\\gui\\b_units_serf.png")
		XGUIEng.SetMaterialColor("Research_DefendTower", 3, 128, 128, 128, 128)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTower", 4, 0.75, 0.5625, 0.25, 0.03125)
		XGUIEng.SetMaterialTexture("Research_DefendTower", 4, "graphics\\textures\\gui\\b_units_serf.png")
		XGUIEng.SetMaterialColor("Research_DefendTower", 4, 255, 255, 255, 255)
		CppLogic.UI.WidgetSetTooltipData("Research_DefendTower", "TooltipBottom", true, true)
		CppLogic.UI.WidgetOverrideTooltipFunc("Research_DefendTower", function() GUITooltip_ResearchTechnologiesBarbTower() end)
		CppLogic.UI.WidgetSetUpdateManualFlag("Research_DefendTower", true)
		CppLogic.UI.WidgetOverrideUpdateFunc("Research_DefendTower", function() GUIUpdate_GlobalTechnologiesButtons("Research_DefendTower", Technologies.GT_BarbarianBuildings1, Entities.PB_VillageCenterBarbarian) end)
		CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_BarbVillage", "Research_DefendTowerUpgrade", nil)
		CppLogic.UI.WidgetSetPositionAndSize("Research_DefendTowerUpgrade", 55, 7, 32, 32)
		XGUIEng.ShowWidget("Research_DefendTowerUpgrade", 1)
		CppLogic.UI.WidgetSetBaseData("Research_DefendTowerUpgrade", 0, false, false)
		XGUIEng.DisableButton("Research_DefendTowerUpgrade", 0)
		XGUIEng.HighLightButton("Research_DefendTowerUpgrade", 0)
		CppLogic.UI.ButtonOverrideActionFunc("Research_DefendTowerUpgrade", function() GUIAction_ResearchUpgradeBarbTower(Technologies.GT_BarbarianBuildings2) end)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTowerUpgrade", 0, 0, 0.125, 0.25, 0.125)
		XGUIEng.SetMaterialTexture("Research_DefendTowerUpgrade", 0, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
		XGUIEng.SetMaterialColor("Research_DefendTowerUpgrade", 0, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTowerUpgrade", 1, 0.25, 0.125, 0.25, 0.125)
		XGUIEng.SetMaterialTexture("Research_DefendTowerUpgrade", 1, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
		XGUIEng.SetMaterialColor("Research_DefendTowerUpgrade", 1, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTowerUpgrade", 2, 0.5, 0.125, 0.25, 0.125)
		XGUIEng.SetMaterialTexture("Research_DefendTowerUpgrade", 2, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
		XGUIEng.SetMaterialColor("Research_DefendTowerUpgrade", 2, 255, 255, 255, 255)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTowerUpgrade", 3, 0, 0.125, 0.25, 0.125)
		XGUIEng.SetMaterialTexture("Research_DefendTowerUpgrade", 3, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
		XGUIEng.SetMaterialColor("Research_DefendTowerUpgrade", 3, 128, 128, 128, 128)
		CppLogic.UI.WidgetMaterialSetTextureCoordinates("Research_DefendTowerUpgrade", 4, 0.75, 0.125, 0.25, 0.125)
		XGUIEng.SetMaterialTexture("Research_DefendTowerUpgrade", 4, "graphics\\textures\\gui\\b_units_heroes_extra1.png")
		XGUIEng.SetMaterialColor("Research_DefendTowerUpgrade", 4, 255, 255, 255, 255)
		CppLogic.UI.WidgetSetTooltipData("Research_DefendTowerUpgrade", "TooltipBottom", true, true)
		CppLogic.UI.WidgetOverrideTooltipFunc("Research_DefendTowerUpgrade", function() GUITooltip_ResearchUpgradeBarbTower() end)
		CppLogic.UI.WidgetSetUpdateManualFlag("Research_DefendTowerUpgrade", true)
		CppLogic.UI.WidgetOverrideUpdateFunc("Research_DefendTowerUpgrade", function() GUIUpdate_GlobalTechnologiesButtons("Research_DefendTowerUpgrade", Technologies.GT_BarbarianBuildings2, Entities.PB_VillageCenterBarbarian) end)
	


	
end

BarbTech1 = {
	[ResourceType.Gold] = 0,
	[ResourceType.Wood] = 300,
	[ResourceType.Clay] = 300,
	[ResourceType.Stone] = 300,
	[ResourceType.Iron] = 0,
	[ResourceType.Sulfur] = 0,
	[ResourceType.Silver] = 0,
}

BarbTech2 = {
	[ResourceType.Gold] = 1000,
	[ResourceType.Wood] = 500,
	[ResourceType.Clay] = 0,
	[ResourceType.Stone] = 1000,
	[ResourceType.Iron] = 0,
	[ResourceType.Sulfur] = 0,
	[ResourceType.Silver] = 0,
}

function GUIAction_ReserachBarbTower(_TechnologyType)
		-- Save button ID for technology
		gvGUI_TechnologyButtonIDArray[ _TechnologyType ] = XGUIEng.GetCurrentWidgetID()

	
		-- Get parameter
		local PlayerID = GUI.GetPlayerID()
		Logic.FillTechnologyCostsTable(_TechnologyType, InterfaceGlobals.CostTable)
		local EntityID = GUI.GetSelectedEntity()
		local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)
		
			
		--technology is researched or technology is currently in research!
		if TechState == 4 or TechState == 3 then
			return
		end
		
		if InterfaceTool_IsBuildingDoingSomething( EntityID ) == true then		
			return
		end
		
		
		-- Enough resources?
		if InterfaceTool_HasPlayerEnoughResources_Feedback( InterfaceGlobals.CostTable ) == 1 then		
			-- YES!		
			GUI.StartResearch(EntityID,_TechnologyType)
			--Sound.PlayGUISound( Sounds.klick_rnd_1, 0 )		
			--Display Research
			XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,1)
			--Update all buttons in the visible container
			XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)	
		end
end


function GUITooltip_ResearchTechnologiesBarbTower()
	if Logic.GetTechnologyState(1,Technologies.GT_BarbarianBuildings1) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Technologie ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_DefendTower") == 1 then  --keine Bedingungen 
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Gebäude der Barbaren @cr @color:255,255,255 Mit dieser Technologie ist es euch möglich, Gebäude der Barbaren zu bauen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbTech1))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Gebäude der Barbaren @cr @color:255,255,255 Mit dieser Technologie ist es euch möglich, Gebäude der Barbaren zu bauen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbTech1))
	end
end


function GUIAction_ResearchUpgradeBarbTower(_TechnologyType)
		-- Save button ID for technology
		gvGUI_TechnologyButtonIDArray[ _TechnologyType ] = XGUIEng.GetCurrentWidgetID()

	
		-- Get parameter
		local PlayerID = GUI.GetPlayerID()
		Logic.FillTechnologyCostsTable(_TechnologyType, BarbTech2)
		local EntityID = GUI.GetSelectedEntity()
		local TechState = Logic.GetTechnologyState(PlayerID, _TechnologyType)
		
			
		--technology is researched or technology is currently in research!
		if TechState == 4 or TechState == 3 then
			return
		end
		
		if InterfaceTool_IsBuildingDoingSomething( EntityID ) == true then		
			return
		end
		
		
		-- Enough resources?
		if InterfaceTool_HasPlayerEnoughResources_Feedback( BarbTech2 ) == 1 then		
			-- YES!		
			GUI.StartResearch(EntityID,_TechnologyType)
			--Sound.PlayGUISound( Sounds.klick_rnd_1, 0 )		
			--Display Research
			XGUIEng.ShowWidget(gvGUI_WidgetID.ResearchInProgress,1)
			--Update all buttons in the visible container
			XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)	
		end
end


function GUITooltip_ResearchUpgradeBarbTower()
	if Logic.GetTechnologyState(1,Technologies.GT_BarbarianBuildings2) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Technologie ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Research_DefendTowerUpgrade") == 1 then  
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Heimwerker @cr @color:255,165,0 benötigt: @color:255,255,255  Gebäude der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Mit dieser Technologie könnt ihr die Gebäude der Barbaren ausbauen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbTech2))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Heimwerker @cr @color:255,255,255 Mit dieser Technologie könnt ihr die Gebäude der Barbaren ausbauen.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbTech2))
	end
end


------TopLeft GUI (Chapter Info)

function modifygui_InfoChapter()


	assert(XGUIEng.GetWidgetID("TooltipChapter")==0, "TooltipChapter already exists")
	assert(XGUIEng.GetWidgetID("TooltipChapterText")==0, "TooltipChapterText already exists")
	assert(XGUIEng.GetWidgetID("TooltipChapterBackground")==0, "TooltipChapterBackground already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Normal", "TooltipChapter", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipChapter", 58, 32, 172, 104)
	XGUIEng.ShowWidget("TooltipChapter", 0)
	CppLogic.UI.WidgetSetBaseData("TooltipChapter", 0, false, true)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("TooltipChapter", "TooltipChapterText", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipChapterText", 7, 8, 165, 96)
	XGUIEng.ShowWidget("TooltipChapterText", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipChapterText", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipChapterText", 0, 0, 0, 0.25, 0.25)
	XGUIEng.SetMaterialColor("TooltipChapterText", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("TooltipChapterText", "data\\menu\\fonts\\standard10.met")
	CppLogic.UI.WidgetSetStringFrameDistance("TooltipChapterText", 0)
	XGUIEng.SetText("TooltipChapterText", "", 1)
	XGUIEng.SetTextColor("TooltipChapterText", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("TooltipChapterText", true)
	XGUIEng.SetLinesToPrint("TooltipChapterText", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("TooltipChapterText", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("TooltipChapter", "TooltipChapterBackground", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TooltipChapterBackground", 0, 0, 167, 99)
	XGUIEng.ShowWidget("TooltipChapterBackground", 1)
	CppLogic.UI.WidgetSetBaseData("TooltipChapterBackground", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TooltipChapterBackground", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("TooltipChapterBackground", 0, "data\\graphics\\textures\\gui\\bg_tooltip_top.png")
	XGUIEng.SetMaterialColor("TooltipChapterBackground", 0, 255, 255, 255, 255)


	assert(XGUIEng.GetWidgetID("ChapterInfo")==0, "ChapterInfo already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Top", "ChapterInfo", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ChapterInfo", 12, 52, 40, 40)
	XGUIEng.ShowWidget("ChapterInfo", 0)
	CppLogic.UI.WidgetSetBaseData("ChapterInfo", 0, false, false)
	XGUIEng.DisableButton("ChapterInfo", 1)
	XGUIEng.HighLightButton("ChapterInfo", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ChapterInfo", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ChapterInfo", 0, "graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ChapterInfo", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ChapterInfo", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ChapterInfo", 1, "graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ChapterInfo", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ChapterInfo", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ChapterInfo", 2, "graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ChapterInfo", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ChapterInfo", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ChapterInfo", 3, "graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ChapterInfo", 3, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ChapterInfo", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ChapterInfo", 4, "graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ChapterInfo", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("ChapterInfo", "TooltipChapter", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("ChapterInfo", function() GUI_SetTooltipText() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("ChapterInfo", false)




end


function GUI_SetTooltipText()
	XGUIEng.SetText("TooltipChapterText", "@color:255,0,0 Kapitel @color:255,255,255 "..chapterID.." @color:255,0,0 von @color:255,255,255 4 @cr @color:255,136,0 "..chapterText.." @cr @cr @color:255,255,0 Spielzeit =  @color:255,255,255 "..systemtime)
end





function modifygui_modeselection()
----Schwierigkeitsauswahl
	assert(XGUIEng.GetWidgetID("Modus")==0, "Modus already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection")==0, "ModeSelection already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_MapChoose")==0, "ModeSelection_MapChoose already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Flags")==0, "ModeSelection_Flags already exists")
	assert(XGUIEng.GetWidgetID("Flag_Easy")==0, "Flag_Easy already exists")
	assert(XGUIEng.GetWidgetID("Flag_Medium")==0, "Flag_Medium already exists")
	assert(XGUIEng.GetWidgetID("Flag_Hard")==0, "Flag_Hard already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Maps")==0, "ModeSelection_Maps already exists")
	assert(XGUIEng.GetWidgetID("EasyMode")==0, "EasyMode already exists")
	assert(XGUIEng.GetWidgetID("EasyMode_SelectionButton")==0, "EasyMode_SelectionButton already exists")
	assert(XGUIEng.GetWidgetID("EasyMode_BG")==0, "EasyMode_BG already exists")
	assert(XGUIEng.GetWidgetID("MediumMode")==0, "MediumMode already exists")
	assert(XGUIEng.GetWidgetID("MediumMode_SelectionButton")==0, "MediumMode_SelectionButton already exists")
	assert(XGUIEng.GetWidgetID("MediumMode_BG")==0, "MediumMode_BG already exists")
	assert(XGUIEng.GetWidgetID("HardMode")==0, "HardMode already exists")
	assert(XGUIEng.GetWidgetID("HardMode_SelectionButton")==0, "HardMode_SelectionButton already exists")
	assert(XGUIEng.GetWidgetID("HardMode_BG")==0, "HardMode_BG already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_BG")==0, "ModeSelection_BG already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_ContainerTop")==0, "ModeSelection_ContainerTop already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Headline")==0, "ModeSelection_Headline already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_TopRight")==0, "ModeSelection_TopRight already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_TopLeft")==0, "ModeSelection_TopLeft already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_ContainerRight")==0, "ModeSelection_ContainerRight already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_RightText")==0, "ModeSelection_RightText already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_StartGame")==0, "ModeSelection_StartGame already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_RightBlock")==0, "ModeSelection_RightBlock already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Right")==0, "ModeSelection_Right already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_ContainerBottom")==0, "ModeSelection_ContainerBottom already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Bottom_Info")==0, "ModeSelection_Bottom_Info already exists")
	assert(XGUIEng.GetWidgetID("ModeSelection_Bottom_BG")==0, "ModeSelection_Bottom_BG already exists")

	modifygui_modeselection1()
	modifygui_modeselection2()
	modifygui_modeselection3()
	modifygui_modeselection4()
end
function modifygui_modeselection1()
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Root", "Modus", "Cinematic")
	CppLogic.UI.WidgetSetPositionAndSize("Modus", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("Modus", 0)
	CppLogic.UI.WidgetSetBaseData("Modus", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Modus", "ModeSelection", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("ModeSelection", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection", "ModeSelection_MapChoose", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_MapChoose", 30, 101, 739, 562)
	XGUIEng.ShowWidget("ModeSelection_MapChoose", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_MapChoose", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection_MapChoose", "ModeSelection_Flags", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Flags", 0, 9, 621, 415)
	XGUIEng.ShowWidget("ModeSelection_Flags", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Flags", 50, false, false)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_Flags", "Flag_Easy", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Flag_Easy", 200, 311, 64, 64)
	XGUIEng.ShowWidget("Flag_Easy", 0)
	CppLogic.UI.WidgetSetBaseData("Flag_Easy", 20, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Flag_Easy", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Flag_Easy", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignselect.png")
	XGUIEng.SetMaterialColor("Flag_Easy", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_Flags", "Flag_Medium", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Flag_Medium", 452, 325, 64, 64)
	XGUIEng.ShowWidget("Flag_Medium", 0)
	CppLogic.UI.WidgetSetBaseData("Flag_Medium", 20, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Flag_Medium", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Flag_Medium", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignselect.png")
	XGUIEng.SetMaterialColor("Flag_Medium", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_Flags", "Flag_Hard", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Flag_Hard", 496, 113, 64, 64)
	XGUIEng.ShowWidget("Flag_Hard", 0)
	CppLogic.UI.WidgetSetBaseData("Flag_Hard", 20, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Flag_Hard", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("Flag_Hard", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignselect.png")
	XGUIEng.SetMaterialColor("Flag_Hard", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection_MapChoose", "ModeSelection_Maps", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Maps", 1, 8, 686, 486)
	XGUIEng.ShowWidget("ModeSelection_Maps", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Maps", 10, false, false)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection_Maps", "EasyMode", nil)
	CppLogic.UI.WidgetSetPositionAndSize("EasyMode", 137, 342, 126, 78)
	XGUIEng.ShowWidget("EasyMode", 1)
	CppLogic.UI.WidgetSetBaseData("EasyMode", 11, false, false)
end
function modifygui_modeselection2()
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("EasyMode", "EasyMode_SelectionButton", nil)
	CppLogic.UI.WidgetSetPositionAndSize("EasyMode_SelectionButton", 50, 4, 44, 44)
	XGUIEng.ShowWidget("EasyMode_SelectionButton", 1)
	CppLogic.UI.WidgetSetBaseData("EasyMode_SelectionButton", 10, false, false)
	XGUIEng.DisableButton("EasyMode_SelectionButton", 0)
	XGUIEng.HighLightButton("EasyMode_SelectionButton", 0)
	CppLogic.UI.ButtonOverrideActionFunc("EasyMode_SelectionButton", function() GUIActionButton_EasyMode() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_SelectionButton", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_SelectionButton", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("EasyMode_SelectionButton", 0, 220, 220, 220, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_SelectionButton", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_SelectionButton", 1, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("EasyMode_SelectionButton", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_SelectionButton", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_SelectionButton", 2, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("EasyMode_SelectionButton", 2, 255, 226, 163, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_SelectionButton", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_SelectionButton", 3, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("EasyMode_SelectionButton", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_SelectionButton", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_SelectionButton", 4, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("EasyMode_SelectionButton", 4, 255, 245, 225, 255)
	CppLogic.UI.WidgetSetTooltipData("EasyMode_SelectionButton", nil, false, false)


	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("EasyMode", "EasyMode_BG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("EasyMode_BG", 9, 0, 117, 78)
	XGUIEng.ShowWidget("EasyMode_BG", 1)
	CppLogic.UI.WidgetSetBaseData("EasyMode_BG", -100, false, true)
	XGUIEng.DisableButton("EasyMode_BG", 0)
	XGUIEng.HighLightButton("EasyMode_BG", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_BG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_BG", 0, "data\\graphics\\textures\\gui\\mainmenu\\01.png")
	XGUIEng.SetMaterialColor("EasyMode_BG", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_BG", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_BG", 1, "data\\graphics\\textures\\gui\\mainmenu\\01.png")
	XGUIEng.SetMaterialColor("EasyMode_BG", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_BG", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_BG", 2, "data\\graphics\\textures\\gui\\mainmenu\\01.png")
	XGUIEng.SetMaterialColor("EasyMode_BG", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_BG", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_BG", 3, "data\\graphics\\textures\\gui\\mainmenu\\01.png")
	XGUIEng.SetMaterialColor("EasyMode_BG", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("EasyMode_BG", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("EasyMode_BG", 4, "data\\graphics\\textures\\gui\\mainmenu\\01.png")
	XGUIEng.SetMaterialColor("EasyMode_BG", 4, 255, 223, 143, 255)
	CppLogic.UI.WidgetSetTooltipData("EasyMode_BG", nil, false, false)
end
function modifygui_modeselection3()
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection_Maps", "MediumMode", nil)
	CppLogic.UI.WidgetSetPositionAndSize("MediumMode", 393, 305, 166, 119)
	XGUIEng.ShowWidget("MediumMode", 1)
	CppLogic.UI.WidgetSetBaseData("MediumMode", 10, false, false)


	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("MediumMode", "MediumMode_SelectionButton", nil)
	CppLogic.UI.WidgetSetPositionAndSize("MediumMode_SelectionButton", 46, 55, 44, 44)
	XGUIEng.ShowWidget("MediumMode_SelectionButton", 1)
	CppLogic.UI.WidgetSetBaseData("MediumMode_SelectionButton", 500, false, false)
	XGUIEng.DisableButton("MediumMode_SelectionButton", 0)
	XGUIEng.HighLightButton("MediumMode_SelectionButton", 0)
	CppLogic.UI.ButtonOverrideActionFunc("MediumMode_SelectionButton", function() GUIActionButton_MediumMode() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_SelectionButton", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_SelectionButton", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("MediumMode_SelectionButton", 0, 220, 220, 220, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_SelectionButton", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_SelectionButton", 1, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("MediumMode_SelectionButton", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_SelectionButton", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_SelectionButton", 2, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("MediumMode_SelectionButton", 2, 255, 226, 163, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_SelectionButton", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_SelectionButton", 3, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("MediumMode_SelectionButton", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_SelectionButton", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_SelectionButton", 4, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("MediumMode_SelectionButton", 4, 255, 245, 225, 255)
	CppLogic.UI.WidgetSetTooltipData("MediumMode_SelectionButton", nil, false, false)


	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("MediumMode", "MediumMode_BG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("MediumMode_BG", 0, 5, 166, 114)
	XGUIEng.ShowWidget("MediumMode_BG", 1)
	CppLogic.UI.WidgetSetBaseData("MediumMode_BG", 0, false, true)
	XGUIEng.DisableButton("MediumMode_BG", 0)
	XGUIEng.HighLightButton("MediumMode_BG", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_BG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_BG", 0, "data\\graphics\\textures\\gui\\mainmenu\\12.png")
	XGUIEng.SetMaterialColor("MediumMode_BG", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_BG", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_BG", 1, "data\\graphics\\textures\\gui\\mainmenu\\12.png")
	XGUIEng.SetMaterialColor("MediumMode_BG", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_BG", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_BG", 2, "data\\graphics\\textures\\gui\\mainmenu\\12.png")
	XGUIEng.SetMaterialColor("MediumMode_BG", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_BG", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_BG", 3, "data\\graphics\\textures\\gui\\mainmenu\\12.png")
	XGUIEng.SetMaterialColor("MediumMode_BG", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("MediumMode_BG", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("MediumMode_BG", 4, "data\\graphics\\textures\\gui\\mainmenu\\12.png")
	XGUIEng.SetMaterialColor("MediumMode_BG", 4, 255, 223, 143, 255)
	CppLogic.UI.WidgetSetTooltipData("MediumMode_BG", nil, false, false)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection_Maps", "HardMode", nil)
	CppLogic.UI.WidgetSetPositionAndSize("HardMode", 451, 88, 136, 128)
	XGUIEng.ShowWidget("HardMode", 1)
	CppLogic.UI.WidgetSetBaseData("HardMode", 10, false, false)


	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("HardMode", "HardMode_SelectionButton", nil)
	CppLogic.UI.WidgetSetPositionAndSize("HardMode_SelectionButton", 32, 60, 44, 44)
	XGUIEng.ShowWidget("HardMode_SelectionButton", 1)
	CppLogic.UI.WidgetSetBaseData("HardMode_SelectionButton", 500, false, false)
	XGUIEng.DisableButton("HardMode_SelectionButton", 0)
	XGUIEng.HighLightButton("HardMode_SelectionButton", 0)
	CppLogic.UI.ButtonOverrideActionFunc("HardMode_SelectionButton", function() GUIActionButton_HardMode() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_SelectionButton", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_SelectionButton", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("HardMode_SelectionButton", 0, 220, 220, 220, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_SelectionButton", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_SelectionButton", 1, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("HardMode_SelectionButton", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_SelectionButton", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_SelectionButton", 2, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("HardMode_SelectionButton", 2, 255, 226, 163, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_SelectionButton", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_SelectionButton", 3, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("HardMode_SelectionButton", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_SelectionButton", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_SelectionButton", 4, "data\\graphics\\textures\\gui\\mainmenu\\campaignSelectTgt.png")
	XGUIEng.SetMaterialColor("HardMode_SelectionButton", 4, 255, 245, 225, 255)
	CppLogic.UI.WidgetSetTooltipData("HardMode_SelectionButton", nil, false, false)


	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("HardMode", "HardMode_BG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("HardMode_BG", 0, 0, 136, 128)
	XGUIEng.ShowWidget("HardMode_BG", 1)
	CppLogic.UI.WidgetSetBaseData("HardMode_BG", 0, false, true)
	XGUIEng.DisableButton("HardMode_BG", 0)
	XGUIEng.HighLightButton("HardMode_BG", 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_BG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_BG", 0, "data\\graphics\\textures\\gui\\mainmenu\\20.png")
	XGUIEng.SetMaterialColor("HardMode_BG", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_BG", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_BG", 1, "data\\graphics\\textures\\gui\\mainmenu\\20.png")
	XGUIEng.SetMaterialColor("HardMode_BG", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_BG", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_BG", 2, "data\\graphics\\textures\\gui\\mainmenu\\20.png")
	XGUIEng.SetMaterialColor("HardMode_BG", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_BG", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_BG", 3, "data\\graphics\\textures\\gui\\mainmenu\\19.png")
	XGUIEng.SetMaterialColor("HardMode_BG", 3, 255, 255, 255, 0)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("HardMode_BG", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("HardMode_BG", 4, "data\\graphics\\textures\\gui\\mainmenu\\20.png")
	XGUIEng.SetMaterialColor("HardMode_BG", 4, 255, 223, 143, 255)
	CppLogic.UI.WidgetSetTooltipData("HardMode_BG", nil, false, false)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_MapChoose", "ModeSelection_BG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_BG", 4, 7, 689, 481)
	XGUIEng.ShowWidget("ModeSelection_BG", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_BG", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_BG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_BG", 0, "data\\graphics\\textures\\gui\\mainmenu\\campaignmap.png")
	XGUIEng.SetMaterialColor("ModeSelection_BG", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection", "ModeSelection_ContainerTop", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_ContainerTop", 0, 0, 1024, 114)
	XGUIEng.ShowWidget("ModeSelection_ContainerTop", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_ContainerTop", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("ModeSelection_ContainerTop", "ModeSelection_Headline", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Headline", 465, 41, 332, 38)
	XGUIEng.ShowWidget("ModeSelection_Headline", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Headline", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_Headline", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("ModeSelection_Headline", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("ModeSelection_Headline", "data\\menu\\fonts\\large14bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("ModeSelection_Headline", 0)
	XGUIEng.SetText("ModeSelection_Headline", "@center Schwierigkeitsauswahl", 1)
	XGUIEng.SetTextColor("ModeSelection_Headline", 197, 22, 22, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("ModeSelection_Headline", false)
	XGUIEng.SetLinesToPrint("ModeSelection_Headline", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("ModeSelection_Headline", 0)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_ContainerTop", "ModeSelection_TopRight", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_TopRight", 418, 0, 606, 104)
	XGUIEng.ShowWidget("ModeSelection_TopRight", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_TopRight", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_TopRight", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_TopRight", 0, "graphics\\textures\\gui\\mainmenu\\ladder_banner.png")
	XGUIEng.SetMaterialColor("ModeSelection_TopRight", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_ContainerTop", "ModeSelection_TopLeft", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_TopLeft", 0, 0, 332, 105)
	XGUIEng.ShowWidget("ModeSelection_TopLeft", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_TopLeft", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_TopLeft", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_TopLeft", 0, "graphics\\textures\\gui\\mainmenu\\title.png")
	XGUIEng.SetMaterialColor("ModeSelection_TopLeft", 0, 255, 255, 255, 255)
end
function modifygui_modeselection4()
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection", "ModeSelection_ContainerRight", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_ContainerRight", 653, 0, 371, 768)
	XGUIEng.ShowWidget("ModeSelection_ContainerRight", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_ContainerRight", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("ModeSelection_ContainerRight", "ModeSelection_RightText", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_RightText", 134, 159, 176, 355)
	XGUIEng.ShowWidget("ModeSelection_RightText", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_RightText", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_RightText", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("ModeSelection_RightText", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("ModeSelection_RightText", "data\\menu\\fonts\\standard12.met")
	CppLogic.UI.WidgetSetStringFrameDistance("ModeSelection_RightText", 0)
	XGUIEng.SetText("ModeSelection_RightText", "", 1)
	XGUIEng.SetTextColor("ModeSelection_RightText", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("ModeSelection_RightText", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("ModeSelection_RightText", function() GUITextUpdate_RightText() end)
	XGUIEng.SetLinesToPrint("ModeSelection_RightText", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("ModeSelection_RightText", 0)


	CppLogic.UI.ContainerWidgetCreateTextButtonWidgetChild("ModeSelection_ContainerRight", "ModeSelection_StartGame", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_StartGame", 117, 529, 225, 50)
	XGUIEng.ShowWidget("ModeSelection_StartGame", 0)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_StartGame", 5, false, false)
	XGUIEng.DisableButton("ModeSelection_StartGame", 0)
	XGUIEng.HighLightButton("ModeSelection_StartGame", 0)
	CppLogic.UI.ButtonOverrideActionFunc("ModeSelection_StartGame", function() GUIButtonAction_StartGame() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_StartGame", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_StartGame", 0, "data\\graphics\\textures\\gui\\mainmenu\\right_button.png")
	XGUIEng.SetMaterialColor("ModeSelection_StartGame", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_StartGame", 1, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_StartGame", 1, "data\\graphics\\textures\\gui\\mainmenu\\right_button_hi.png")
	XGUIEng.SetMaterialColor("ModeSelection_StartGame", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_StartGame", 2, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_StartGame", 2, "data\\graphics\\textures\\gui\\mainmenu\\right_button_sel.png")
	XGUIEng.SetMaterialColor("ModeSelection_StartGame", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_StartGame", 3, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_StartGame", 3, "data\\graphics\\textures\\gui\\mainmenu\\right_button_in.png")
	XGUIEng.SetMaterialColor("ModeSelection_StartGame", 3, 254, 254, 254, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_StartGame", 4, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_StartGame", 4, "data\\graphics\\textures\\gui\\mainmenu\\right_button_akt.png")
	XGUIEng.SetMaterialColor("ModeSelection_StartGame", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("ModeSelection_StartGame", nil, false, false)
	CppLogic.UI.WidgetSetFont("ModeSelection_StartGame", "data\\menu\\fonts\\mainmenularge.met")
	CppLogic.UI.WidgetSetStringFrameDistance("ModeSelection_StartGame", 3)
	XGUIEng.SetText("ModeSelection_StartGame", "@center Starten", 1)
	XGUIEng.SetTextColor("ModeSelection_StartGame", 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_ContainerRight", "ModeSelection_RightBlock", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_RightBlock", 116, 150, 216, 376)
	XGUIEng.ShowWidget("ModeSelection_RightBlock", 0)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_RightBlock", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_RightBlock", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_RightBlock", 0, "graphics\\textures\\gui\\bg_credits.png")
	XGUIEng.SetMaterialColor("ModeSelection_RightBlock", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_ContainerRight", "ModeSelection_Right", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Right", 66, 84, 305, 684)
	XGUIEng.ShowWidget("ModeSelection_Right", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Right", 1, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_Right", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_Right", 0, "data\\graphics\\textures\\gui\\mainmenu\\right_bg.png")
	XGUIEng.SetMaterialColor("ModeSelection_Right", 0, 255, 255, 255, 255)


	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("ModeSelection", "ModeSelection_ContainerBottom", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_ContainerBottom", 0, 592, 1024, 176)
	XGUIEng.ShowWidget("ModeSelection_ContainerBottom", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_ContainerBottom", 0, false, false)


	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("ModeSelection_ContainerBottom", "ModeSelection_Bottom_Info", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Bottom_Info", 122, 15, 550, 128)
	XGUIEng.ShowWidget("ModeSelection_Bottom_Info", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Bottom_Info", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_Bottom_Info", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("ModeSelection_Bottom_Info", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("ModeSelection_Bottom_Info", "data\\menu\\fonts\\standard12.met")
	CppLogic.UI.WidgetSetStringFrameDistance("ModeSelection_Bottom_Info", 0)
	XGUIEng.SetText("ModeSelection_Bottom_Info", "", 1)
	XGUIEng.SetTextColor("ModeSelection_Bottom_Info", 255, 255, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("ModeSelection_Bottom_Info", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("ModeSelection_Bottom_Info", function() GUITextUpdate_BottomText() end)
	XGUIEng.SetLinesToPrint("ModeSelection_Bottom_Info", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("ModeSelection_Bottom_Info", 0)


	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("ModeSelection_ContainerBottom", "ModeSelection_Bottom_BG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("ModeSelection_Bottom_BG", 118, 11, 583, 152)
	XGUIEng.ShowWidget("ModeSelection_Bottom_BG", 1)
	CppLogic.UI.WidgetSetBaseData("ModeSelection_Bottom_BG", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("ModeSelection_Bottom_BG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("ModeSelection_Bottom_BG", 0, "graphics\\textures\\gui\\mainmenu\\center_bg.png")
	XGUIEng.SetMaterialColor("ModeSelection_Bottom_BG", 0, 255, 255, 255, 255)
end


function modifygui_blende()
	-----import für Blende
	assert(XGUIEng.GetWidgetID("Blende")==0, "Blende already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindow")==0, "BlendeWindow already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindowText")==0, "BlendeWindowText already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindowTextTitle")==0, "BlendeWindowTextTitle already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindowLogo")==0, "BlendeWindowLogo already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindowBG")==0, "BlendeWindowBG already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindow_BG_Video")==0, "BlendeWindow_BG_Video already exists")
	assert(XGUIEng.GetWidgetID("BlendeWindowBG2")==0, "BlendeWindowBG2 already exists")
	assert(XGUIEng.GetWidgetID("TimerWidget1")==0, "TimerWidget1 already exists")
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Movie", "Blende", nil)
	CppLogic.UI.WidgetSetPositionAndSize("Blende", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("Blende", 1)
	CppLogic.UI.WidgetSetBaseData("Blende", 100, false, false)
	CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Blende", "BlendeWindow", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindow", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("BlendeWindow", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindow", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("BlendeWindow", "BlendeWindowText", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindowText", 395, 317, 274, 280)
	XGUIEng.ShowWidget("BlendeWindowText", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindowText", 1, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BlendeWindowText", 0, 0, 0, 0.25, 0.25)
	XGUIEng.SetMaterialColor("BlendeWindowText", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("BlendeWindowText", "data\\menu\\fonts\\medium11bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("BlendeWindowText", 0)
	XGUIEng.SetText("BlendeWindowText", "", 1)
	XGUIEng.SetTextColor("BlendeWindowText", 0, 252, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("BlendeWindowText", true)
	XGUIEng.SetLinesToPrint("BlendeWindowText", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("BlendeWindowText", 0)
	CppLogic.UI.ContainerWidgetCreateStaticTextWidgetChild("BlendeWindow", "BlendeWindowTextTitle", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindowTextTitle", 457, 283, 150, 30)
	XGUIEng.ShowWidget("BlendeWindowTextTitle", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindowTextTitle", 1, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BlendeWindowTextTitle", 0, 0, 0, 0.25, 0.25)
	XGUIEng.SetMaterialColor("BlendeWindowTextTitle", 0, 255, 255, 255, 0)
	CppLogic.UI.WidgetSetFont("BlendeWindowTextTitle", "data\\menu\\fonts\\medium11bold.met")
	CppLogic.UI.WidgetSetStringFrameDistance("BlendeWindowTextTitle", 0)
	XGUIEng.SetText("BlendeWindowTextTitle", "", 1)
	XGUIEng.SetTextColor("BlendeWindowTextTitle", 0, 29, 255, 255)
	CppLogic.UI.WidgetSetUpdateManualFlag("BlendeWindowTextTitle", true)
	XGUIEng.SetLinesToPrint("BlendeWindowTextTitle", 0, 0)
	CppLogic.UI.StaticTextWidgetSetLineDistanceFactor("BlendeWindowTextTitle", 0)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("BlendeWindow", "BlendeWindowLogo", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindowLogo", 362, 141, 352, 120)
	XGUIEng.ShowWidget("BlendeWindowLogo", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindowLogo", 1, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BlendeWindowLogo", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("BlendeWindowLogo", 0, "graphics\\textures\\gui\\mainmenu\\right_logo.png")
	XGUIEng.SetMaterialColor("BlendeWindowLogo", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("BlendeWindow", "BlendeWindowBG", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindowBG", 361, 252, 350, 370)
	XGUIEng.ShowWidget("BlendeWindowBG", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindowBG", 1, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BlendeWindowBG", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("BlendeWindowBG", 0, "data\\graphics\\textures\\gui\\bg_credits.png")
	XGUIEng.SetMaterialColor("BlendeWindowBG", 0, 254, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateCustomWidgetChild("BlendeWindow", "BlendeWindow_BG_Video", "EGUIX::CVideoPlaybackCustomWidget", nil, 0, 0, 0, 0, 0, 0, "", "")
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindow_BG_Video", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("BlendeWindow_BG_Video", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindow_BG_Video", 0, false, false)
	CppLogic.UI.ContainerWidgetCreateStaticWidgetChild("BlendeWindow", "BlendeWindowBG2", nil)
	CppLogic.UI.WidgetSetPositionAndSize("BlendeWindowBG2", 0, 0, 1024, 768)
	XGUIEng.ShowWidget("BlendeWindowBG2", 1)
	CppLogic.UI.WidgetSetBaseData("BlendeWindowBG2", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("BlendeWindowBG2", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialTexture("BlendeWindowBG2", 0, "graphics\\textures\\gui\\mainmenu\\temp.png")
	XGUIEng.SetMaterialColor("BlendeWindowBG2", 0, 255, 255, 255, 255)
	CppLogic.UI.ContainerWidgetCreateProgressBarWidgetChild("Blende", "TimerWidget1", nil)
	CppLogic.UI.WidgetSetPositionAndSize("TimerWidget1", 0, 0, 0, 0)
	XGUIEng.ShowWidget("TimerWidget1", 1)
	CppLogic.UI.WidgetSetBaseData("TimerWidget1", 0, false, false)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("TimerWidget1", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("TimerWidget1", 0, 255, 255, 255, 255)
	XGUIEng.SetProgressBarValues("TimerWidget1", 0, 100)
	CppLogic.UI.WidgetSetUpdateManualFlag("TimerWidget1", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("TimerWidget1", function() GUI_CountSystemTime() end)
end




function Update_HQ_GUI()

	

    assert(XGUIEng.GetWidgetID("Buy_Barbarian")==0, "Buy_Barbarian already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_Headquarter", "Buy_Barbarian", "Buy_Hero")
	CppLogic.UI.WidgetSetPositionAndSize("Buy_Barbarian", 39, 4, 32, 32)
	XGUIEng.ShowWidget("Buy_Barbarian", 1)
	CppLogic.UI.WidgetSetBaseData("Buy_Barbarian", 0, false, false)
	XGUIEng.DisableButton("Buy_Barbarian", 1)
	XGUIEng.HighLightButton("Buy_Barbarian", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Buy_Barbarian", function() GUI_Action_BuyBarbarian() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian", 0, 0, 0.8125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_Barbarian", 0, "graphics\\textures\\gui\\b_multiselection_icon.png")
	XGUIEng.SetMaterialColor("Buy_Barbarian", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian", 1, 0.25, 0.8125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_Barbarian", 1, "graphics\\textures\\gui\\b_multiselection_icon.png")
	XGUIEng.SetMaterialColor("Buy_Barbarian", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian", 2, 0.5, 0.8125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_Barbarian", 2, "graphics\\textures\\gui\\b_multiselection_icon.png")
	XGUIEng.SetMaterialColor("Buy_Barbarian", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian", 3, 0, 0.8125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_Barbarian", 3, "graphics\\textures\\gui\\b_multiselection_icon.png")
	XGUIEng.SetMaterialColor("Buy_Barbarian", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian", 4, 0.75, 0.8125, 0.25, 0.0625)
	XGUIEng.SetMaterialTexture("Buy_Barbarian", 4, "graphics\\textures\\gui\\b_multiselection_icon.png")
	XGUIEng.SetMaterialColor("Buy_Barbarian", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Buy_Barbarian", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Buy_Barbarian", function() GUITooltip_BuyBarbarian() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Buy_Barbarian", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("Buy_Barbarian", function() GUIUpdate_BuyMilitaryUnitButtons("Buy_Barbarian", Technologies.GT_BuyBarbarian, UpgradeCategories.LeaderBarbarian) end)
    
    assert(XGUIEng.GetWidgetID("Buy_Barbarian_RechargeCamouflage")==0, "Buy_Barbarian_RechargeCamouflage already exists")
	CppLogic.UI.ContainerWidgetCreateProgressBarWidgetChild("Commands_Headquarter", "Buy_Barbarian_RechargeCamouflage", "Buy_Barbarian")
	CppLogic.UI.WidgetSetPositionAndSize("Buy_Barbarian_RechargeCamouflage", 39, 4, 32, 32)
	XGUIEng.ShowWidget("Buy_Barbarian_RechargeCamouflage", 1)
	CppLogic.UI.WidgetSetBaseData("Buy_Barbarian_RechargeCamouflage", 50, false, true)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Buy_Barbarian_RechargeCamouflage", 0, 0, 0, 1, 1)
	XGUIEng.SetMaterialColor("Buy_Barbarian_RechargeCamouflage", 0, 214, 44, 24, 189)
	XGUIEng.SetProgressBarValues("Buy_Barbarian_RechargeCamouflage", -4.316021E+08, -4.316021E+08)
	CppLogic.UI.WidgetSetUpdateManualFlag("Buy_Barbarian_RechargeCamouflage", false)
	CppLogic.UI.WidgetOverrideUpdateFunc("Buy_Barbarian_RechargeCamouflage", function() GUIUpdate_BuyBarbarianCount() end)




end


function modifygui_upgradeBarbHQ()

	assert(XGUIEng.GetWidgetID("Upgrade_BarbHeadquarter2")==0, "Upgrade_BarbHeadquarter2 already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_Headquarter", "Upgrade_BarbHeadquarter2", "Research_Tracking")
	CppLogic.UI.WidgetSetPositionAndSize("Upgrade_BarbHeadquarter2", 398, 4, 32, 32)
	XGUIEng.ShowWidget("Upgrade_BarbHeadquarter2", 0)
	CppLogic.UI.WidgetSetBaseData("Upgrade_BarbHeadquarter2", 0, false, false)
	XGUIEng.DisableButton("Upgrade_BarbHeadquarter2", 0)
	XGUIEng.HighLightButton("Upgrade_BarbHeadquarter2", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Upgrade_BarbHeadquarter2", function() GUIAction_UpgradeSelectedBuilding() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter2", 0, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter2", 0, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter2", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter2", 1, 0.25, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter2", 1, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter2", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter2", 2, 0.5, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter2", 2, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter2", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter2", 3, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter2", 3, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter2", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter2", 4, 0.75, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter2", 4, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter2", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Upgrade_BarbHeadquarter2", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Upgrade_BarbHeadquarter2", function() GUITooltip_UpgradeBuildingBarbHQ2() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Upgrade_BarbHeadquarter2", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("Upgrade_BarbHeadquarter2", function() GUIUpdate_UpgradeButtons("Upgrade_BarbHeadquarter2", Technologies.UP2_BarbarianHeadquarter) end)


	assert(XGUIEng.GetWidgetID("Upgrade_BarbHeadquarter1")==0, "Upgrade_BarbHeadquarter1 already exists")
	CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("Commands_Headquarter", "Upgrade_BarbHeadquarter1", "Upgrade_BarbHeadquarter2")
	CppLogic.UI.WidgetSetPositionAndSize("Upgrade_BarbHeadquarter1", 398, 4, 32, 32)
	XGUIEng.ShowWidget("Upgrade_BarbHeadquarter1", 1)
	CppLogic.UI.WidgetSetBaseData("Upgrade_BarbHeadquarter1", 0, false, false)
	XGUIEng.DisableButton("Upgrade_BarbHeadquarter1", 0)
	XGUIEng.HighLightButton("Upgrade_BarbHeadquarter1", 0)
	CppLogic.UI.ButtonOverrideActionFunc("Upgrade_BarbHeadquarter1", function() GUIAction_UpgradeSelectedBuilding() end)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter1", 0, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter1", 0, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter1", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter1", 1, 0.25, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter1", 1, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter1", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter1", 2, 0.5, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter1", 2, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter1", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter1", 3, 0, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter1", 3, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter1", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("Upgrade_BarbHeadquarter1", 4, 0.75, 0, 0.25, 1)
	XGUIEng.SetMaterialTexture("Upgrade_BarbHeadquarter1", 4, "data\\graphics\\textures\\gui\\b_upgrade.png")
	XGUIEng.SetMaterialColor("Upgrade_BarbHeadquarter1", 4, 255, 255, 255, 255)
	CppLogic.UI.WidgetSetTooltipData("Upgrade_BarbHeadquarter1", "TooltipBottom", true, true)
	CppLogic.UI.WidgetOverrideTooltipFunc("Upgrade_BarbHeadquarter1", function() GUITooltip_UpgradeBuildingBarbHQ1() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Upgrade_BarbHeadquarter1", true)
	CppLogic.UI.WidgetOverrideUpdateFunc("Upgrade_BarbHeadquarter1", function() GUIUpdate_UpgradeButtons("Upgrade_BarbHeadquarter1", Technologies.UP1_BarbarianHeadquarter) end)



end

UpBarbHQ1 = {
    [ResourceType.Gold] = 300,
    [ResourceType.Wood] = 0,
    [ResourceType.Clay] = 250,
    [ResourceType.Stone] = 500,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUITooltip_UpgradeBuildingBarbHQ1()
	if Logic.GetTechnologyState(1,Technologies.UP1_BarbarianHeadquarter) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Upgrade_BarbHeadquarter1") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Festung @cr @color:255,165,0 benötigt: @color:255,255,255  Gebäude der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Ausbau der Burg zur Festung.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(UpBarbHQ1))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Festung @cr @color:255,255,255 Ausbau der Burg zur Festung.")
		XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(UpBarbHQ1))
	end
end

UpBarbHQ2 = {
    [ResourceType.Gold] = 500,
    [ResourceType.Wood] = 0,
    [ResourceType.Clay] = 400,
    [ResourceType.Stone] = 700,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUITooltip_UpgradeBuildingBarbHQ2()
	if Logic.GetTechnologyState(1,Technologies.UP2_BarbarianHeadquarter) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Dieses Gebäude ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Upgrade_BarbHeadquarter2") == 1 then
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Zitadelle @cr @color:255,165,0 benötigt: @color:255,255,255  Heimwerker und Flaschenzug @cr @color:255,165,0 ermöglicht: @color:255,255,255  Ausbau der Festung zur Zitadelle.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(UpBarbHQ2))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Zitadelle @cr @color:255,255,255 Ausbau der Festung zur Zitadelle.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(UpBarbHQ2))
	end
end




BarbarianCosts = {
    [ResourceType.Gold] = 1000,
    [ResourceType.Wood] = 500,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 500,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}


function GUI_Action_BuyBarbarian()
    local barb_table = {}
    barb_table.X , barb_table.Y = Logic.EntityGetPos(GUI.GetSelectedEntity())
    local _posX = 0
    local _posY = 0
    barb_table.X = barb_table.X -954
    barb_table.Y = barb_table.Y -321
    if InterfaceTool_HasPlayerEnoughResources_Feedback(BarbarianCosts) == 1 and Logic.GetPlayerAttractionLimit(1)>Logic.GetPlayerAttractionUsage(1) then
        barb_counter = 0;
        CreateMilitaryGroup(1,Entities.CU_Barbarian_LeaderClub1,8,barb_table)
        XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
        for rt,c in pairs(BarbarianCosts) do
            Logic.SubFromPlayersGlobalResource(1, rt, c)
        end
    end

end


function GUITooltip_BuyBarbarian()
	if Logic.GetTechnologyState(1,Technologies.GT_BuyBarbarian) == 0 then
		XGUIEng.SetText("TooltipBottomText", "@color:180,180,180,255 Nicht verfügbar @cr @color:255,255,255 Diese Technologie ist in dieser Mission noch nicht verfügbar!")
		XGUIEng.SetText("TooltipBottomCosts", "")
	elseif XGUIEng.IsButtonDisabled("Buy_Barbarian") == 1 and Logic.GetTechnologyState(1,Technologies.GT_BarbarianBuildings1) < 4 then  
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Elitebarbaren @cr @color:255,165,0 benötigt: @color:255,255,255  Gebäude der Barbaren @cr @color:255,165,0 ermöglicht: @color:255,255,255  Kaufe ein Trupp von Vargs tödlichen Elitebarbaren.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianCosts))
	else
		XGUIEng.SetText("TooltipBottomText", "@color:205,0,0 Elitebarbaren @color:255,255,255 @cr Kaufe ein Trupp von Vargs tödlichen Elitebarbaren.")
    	XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(BarbarianCosts))
	end
end

function GUIUpdate_BuyBarbarianCount()

    local CurrentWidgetID = XGUIEng.GetCurrentWidgetID()
	
	local BarbarianID = GUI.GetSelectedEntity()	
	
	
	if barb_counter < cooldown_barb then
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,214,44,24,189)						
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_Barbarian"),1)
	end
	if barb_counter >= cooldown_barb then		
			XGUIEng.SetMaterialColor(CurrentWidgetID,1,0,0,0,0)
			XGUIEng.DisableButton(XGUIEng.GetWidgetID("Buy_Barbarian"),0)
	end
	
	XGUIEng.SetProgressBarValues(CurrentWidgetID,barb_counter, cooldown_barb)

end


cooldown_barb = 120
barb_counter = 0; -- wenn barb_counter = cooldown_barb zum mapstart direkt aktiv, bei barb_counter = 0 zum mapstart erst laden

function BarbCounter()
	local state = Logic.GetTechnologyState(1,Technologies.GT_BarbarianBuildings1)
	if barb_counter < cooldown_barb and state >3 then
        barb_counter = barb_counter +1;
        return false;
    end
end


function Update_SF_GUI()

    assert(XGUIEng.GetWidgetID("SignalFire")==0, "SignalFire already exists")
    assert(XGUIEng.GetWidgetID("SignalFire_Pay")==0, "SignalFire_Pay already exists")
    CppLogic.UI.ContainerWidgetCreateContainerWidgetChild("Selection_Building", "SignalFire", nil)
    CppLogic.UI.WidgetSetPositionAndSize("SignalFire", 0, 0, 712, 200)
    XGUIEng.ShowWidget("SignalFire", 0)
    CppLogic.UI.WidgetSetBaseData("SignalFire", 0, false, false)
    CppLogic.UI.ContainerWidgetCreateGFXButtonWidgetChild("SignalFire", "SignalFire_Pay", nil)
    CppLogic.UI.WidgetSetPositionAndSize("SignalFire_Pay", 187, 121, 32, 32)
    XGUIEng.ShowWidget("SignalFire_Pay", 0)
    CppLogic.UI.WidgetSetBaseData("SignalFire_Pay", 0, false, false)
    XGUIEng.DisableButton("SignalFire_Pay", 0)
    XGUIEng.HighLightButton("SignalFire_Pay", 0)
    CppLogic.UI.ButtonOverrideActionFunc("SignalFire_Pay", function() GUIAction_IgniteFire() end)
    CppLogic.UI.WidgetMaterialSetTextureCoordinates("SignalFire_Pay", 0, 0, 0.40625, 0.25, 0.03125)
    XGUIEng.SetMaterialTexture("SignalFire_Pay", 0, "graphics\\textures\\gui\\b_statistics.png")
    XGUIEng.SetMaterialColor("SignalFire_Pay", 0, 255, 255, 255, 255)
    CppLogic.UI.WidgetMaterialSetTextureCoordinates("SignalFire_Pay", 1, 0.25, 0.40625, 0.25, 0.03125)
    XGUIEng.SetMaterialTexture("SignalFire_Pay", 1, "graphics\\textures\\gui\\b_statistics.png")
    XGUIEng.SetMaterialColor("SignalFire_Pay", 1, 255, 255, 255, 255)
    CppLogic.UI.WidgetMaterialSetTextureCoordinates("SignalFire_Pay", 2, 0.5, 0.40625, 0.25, 0.03125)
    XGUIEng.SetMaterialTexture("SignalFire_Pay", 2, "graphics\\textures\\gui\\b_statistics.png")
    XGUIEng.SetMaterialColor("SignalFire_Pay", 2, 255, 255, 255, 255)
    CppLogic.UI.WidgetMaterialSetTextureCoordinates("SignalFire_Pay", 3, 0, 0.40625, 0.25, 0.03125)
    XGUIEng.SetMaterialTexture("SignalFire_Pay", 3, "graphics\\textures\\gui\\b_statistics.png")
    XGUIEng.SetMaterialColor("SignalFire_Pay", 3, 128, 128, 128, 128)
    CppLogic.UI.WidgetMaterialSetTextureCoordinates("SignalFire_Pay", 4, 0.75, 0.40625, 0.25, 0.03125)
    XGUIEng.SetMaterialTexture("SignalFire_Pay", 4, "graphics\\textures\\gui\\b_statistics.png")
    XGUIEng.SetMaterialColor("SignalFire_Pay", 4, 255, 255, 255, 255)
    CppLogic.UI.WidgetSetTooltipData("SignalFire_Pay", "TooltipBottom", true, true)
    CppLogic.UI.WidgetOverrideTooltipFunc("SignalFire_Pay", function() GUITooltip_IgniteFire() end)

    

end

SignalFireCosts = {
    [ResourceType.Gold] = 0,
    [ResourceType.Wood] = 10000,
    [ResourceType.Clay] = 0,
    [ResourceType.Stone] = 0,
    [ResourceType.Iron] = 0,
    [ResourceType.Sulfur] = 0,
    [ResourceType.Silver] = 0,
}

function GUITooltip_IgniteFire()
    XGUIEng.SetText("TooltipBottomText", "@color:255,165,0 Signalfeuer @color:255,255,255 @cr Entzündet für @color:91,58,41 " ..SignalFireCosts[ResourceType.Wood].. " Holz @color:255,255,255 das Leuchtfeuer.")
    XGUIEng.SetText("TooltipBottomCosts", InterfaceTool_CreateCostString(SignalFireCosts))
end

function GUIAction_IgniteFire()
    local signalfire_building = GetID(GUI.GetSelectedEntity())
    if InterfaceTool_HasPlayerEnoughResources_Feedback(SignalFireCosts) == 1 then
        ReplaceEntity(signalfire_building, Entities.CB_Signalfire_Fire);
        XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
        for rt,c in pairs(SignalFireCosts) do
            Logic.SubFromPlayersGlobalResource(1, rt, c)
        end
    end
end



function GUI_Initialize()
	InitTooltipCooldownGUI()
    modifygui_modeselection()
    modifygui_blende()
	InitBridgesCooldownGUI()
	modifygui_InfoChapter()
	InitAttackProgressBar()
	InitThiefCollectables()
    Update_HQ_GUI()
    Update_SF_GUI()
	modifygui_selectionBarbTower()
	selection_newBarbMenu()
	modifygui_barbvillagecenter()
	modifygui_serfbarbmenu()
	selection_barbArena()
	modifygui_woodmine()
	modifygui_upgradeBarbHQ()
	initGUIAction_ToggleSerfMenu()
	GameSpeedButton()
	veteranBombAbility()
	InitCameraZoomButton()
	InitExpellAllGUI()
end