---GFX-Sets für dem Tag Nacht Zyklus Sommertag changed by Novator12, created by Ghoul
function InitDaylyCycleGFXRain()
	--normaler Regen
	Display.GfxSetSetSkyBox(19, 0.0, 1.0, "YSkyBox04")
	Display.GfxSetSetRainEffectStatus(19, 0.0, 1.0, 1)
	Display.GfxSetSetSnowStatus(19, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(19, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(19, 0.0, 1.0, 1, 72,102,112, 0,29500)
	Display.GfxSetSetLightParams(19,  0.0, 1.0, 40, -15, -50,  70,80,70,  205,204,180)
	--Nacht mit Regen
	Display.GfxSetSetSkyBox(13, 0.0, 1.0, "YSkyBox09")
	Display.GfxSetSetRainEffectStatus(13, 0.0, 1.0, 1)
	Display.GfxSetSetSnowStatus(13, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(9, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(13, 0.0, 1.0, 1, 52,82,92, 3500,32000)
	Display.GfxSetSetLightParams(13,  0.0, 1.0, 40, -15, -50,  80,90,80,  1,1,1)
	--Sonnenauf-/-untergang mit Regen
	Display.GfxSetSetSkyBox(14, 0.0, 1.0, "YSkyBox08")   
	Display.GfxSetSetRainEffectStatus(14, 0.0, 1.0, 1)   
	Display.GfxSetSetSnowStatus(14, 0, 1.0, 0)   
	Display.GfxSetSetSnowEffectStatus(14, 0.0, 0.8, 0)	
	Display.GfxSetSetFogParams(14, 0.0, 1.0, 1, 215,70,0, 3500,29000)	
	Display.GfxSetSetLightParams(14,  0.0, 1.0, 40, 165, -50,  80,90,80,  175,70,0)	
	 --Sonnenauf-/-untergangs-Übergang mit Regen
	Display.GfxSetSetSkyBox(15, 0.0, 1.0, "YSkyBox07")   
	Display.GfxSetSetRainEffectStatus(15, 0.0, 1.0, 1)   
	Display.GfxSetSetSnowStatus(15, 0, 1.0, 0)   
	Display.GfxSetSetSnowEffectStatus(15, 0.0, 0.8, 0)	
	Display.GfxSetSetFogParams(15, 0.0, 1.0, 1, 165,70,70, 3500,29000)	
	Display.GfxSetSetLightParams(15,  0.0, 1.0, 40, 115, -50,  80,90,80,  135,70,60)	
end

AddPeriodicNormalRain = function(dauer)
	Logic.AddWeatherElement(2, dauer, 1, 19, 5, 15)
end

AddPeriodicNightRain = function(dauer)
	Logic.AddWeatherElement(2, dauer, 1, 13, 5, 15)
end

AddPeriodicSunriseRain = function(dauer)		
	Logic.AddWeatherElement(2, dauer, 1, 14, 5, 15)		
end

AddPeriodicTransitionSunriseRain = function(dauer)		
	Logic.AddWeatherElement(2, dauer, 1, 15, 5, 15)		
end
