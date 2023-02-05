function DeleteOldVillage()
    for i = 1, table.getn(barb_replaceOld), 1 do
        local _,oldID = Logic.GetEntitiesInArea(barb_replaceOld[i].Typ,barb_replaceOld[i].posX,barb_replaceOld[i].posY,1,1)
        if IsExisting(oldID) then
            DestroyEntity(oldID)
        end
    end
	PlaceConstruction()
end

con_table = {}
function PlaceConstruction()
    for i = 1, table.getn(barb_placeConstruction), 1 do
        local saveID = Logic.CreateEntity(barb_placeConstruction[i].Typ, barb_placeConstruction[i].posX, barb_placeConstruction[i].posY, barb_placeConstruction[i].rot, barb_placeConstruction[i].playerID)
		table.insert(con_table,i,saveID)
		SVLib.SetEntitySize(saveID,barb_placeConstruction[i].scale) 
    end
end

function RebuildVillage()
	for n=table.getn(con_table),1,-1 do
		DestroyEntity(con_table[n])
		table.remove(con_table,n)
	end
    for i = 1, table.getn(barb_placeNew), 1 do
        local saveID = Logic.CreateEntity(barb_placeNew[i].Typ, barb_placeNew[i].posX, barb_placeNew[i].posY, barb_placeNew[i].rot, barb_placeNew[i].playerID)
		SVLib.SetEntitySize(saveID,barb_placeNew[i].scale) 
    end
end


barb_placeConstruction = {
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 17383.787109375,
		posY = 39787.55078125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 18873.24609375,
		posY = 37728.93359375,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 20281.625,
		posY = 37098.8515625,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 21471.705078125,
		posY = 37187.3203125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 23448.5,
		posY = 37924.6171875,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 24545.8046875,
		posY = 40134.265625,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_SiteTower,
		posX = 11831.088867188,
		posY = 35222.17578125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_Construction_Site1,
		posX = 19630.943359375,
		posY = 37704.37109375,
		rot = 157.56338500977,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1,
		posX = 22133.76171875,
		posY = 37623.22265625,
		rot = 186.21127319336,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1,
		posX = 22661.4921875,
		posY = 37805.66015625,
		rot = 214.85916137695,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1,
		posX = 24053.365234375,
		posY = 38597.5546875,
		rot = 216.76054382324,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1,
		posX = 24256.4453125,
		posY = 38925.328125,
		rot = 259.73239135742,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1,
		posX = 24379.251953125,
		posY = 39717.3046875,
		rot = 261.63375854492,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 17325.36328125,
		posY = 40076.55078125,
		rot = 247.29472351074,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 17635.638671875,
		posY = 39510.109375,
		rot = 2.7041809558868,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 17475.546875,
		posY = 39593.37890625,
		rot = 311.3518371582,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 18053.080078125,
		posY = 38859.7421875,
		rot = 202.43659973145,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 17866.396484375,
		posY = 39079.9375,
		rot = 130.81687927246,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 18642.107421875,
		posY = 38197.97265625,
		rot = 130.81687927246,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 18643.6015625,
		posY = 38168.015625,
		rot = 231.08448791504,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 18909.38671875,
		posY = 37889.75390625,
		rot = 231.08448791504,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 18941.78125,
		posY = 37624.40625,
		rot = 331.35211181641,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 20075.001953125,
		posY = 37083.98828125,
		rot = 331.35211181641,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 21469.525390625,
		posY = 37029.61328125,
		rot = 42.971832275391,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 23476.044921875,
		posY = 37817.61328125,
		rot = 14.323944091797,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 23799.400390625,
		posY = 37942.53125,
		rot = 28.647888183594,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Construction_Site1_Small,
		posX = 24845.77734375,
		posY = 40270.6171875,
		rot = 85.943664550781,
		scale = 1,
		playerID = 0 
	},
}

barb_placeNew = {
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 18900,
		posY = 37800,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 17400,
		posY = 39800,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 20300,
		posY = 37100,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 21500,
		posY = 37200,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 23500,
		posY = 37900,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 24600,
		posY = 40100,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.PB_WatchTower_Barb,
		posX = 11900,
		posY = 35200,
		rot = 0,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_PalisadeGate2,
		posX = 18386.912109375,
		posY = 38800.375,
		rot = 42.971828460693,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_Palisade1,
		posX = 17166.857421875,
		posY = 39679.16015625,
		rot = 19.999979019165,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 17361.751953125,
		posY = 39425.921875,
		rot = 54.323902130127,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 17679.28125,
		posY = 39336.625,
		rot = 93.647827148438,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 17100.896484375,
		posY = 40018.75,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 17224.6484375,
		posY = 40328.4296875,
		rot = 317.02816772461,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 18783.546875,
		posY = 38085,
		rot = 317.02816772461,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 18689.560546875,
		posY = 37760.23828125,
		rot = 9.3233432769775,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 18883.0234375,
		posY = 37464.86328125,
		rot = 57.29577255249,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 19205.6875,
		posY = 37311.23828125,
		rot = 71.61971282959,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 20237.73046875,
		posY = 36725.6484375,
		rot = 62.971500396729,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24760.06640625,
		posY = 38418.64453125,
		rot = 331.35211181641,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24896.1484375,
		posY = 38764.65625,
		rot = 345.6760559082,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24938.498046875,
		posY = 39116.11328125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24950.115234375,
		posY = 39475.609375,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24959.650390625,
		posY = 39860.3046875,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 24971.1796875,
		posY = 40213.046875,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 21781.01953125,
		posY = 36966.58984375,
		rot = 274.05633544922,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade1,
		posX = 21482.2109375,
		posY = 36827.3046875,
		rot = 317.02816772461,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_Palisade2,
		posX = 19732.1875,
		posY = 37035.57421875,
		rot = 57.295776367188,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade2,
		posX = 22343.669921875,
		posY = 37028.71484375,
		rot = 100.26760101318,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade2,
		posX = 23057.8828125,
		posY = 37275.44921875,
		rot = 114.59154510498,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade2,
		posX = 23703.30078125,
		posY = 37641.21484375,
		rot = 302.70422363281,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Palisade2,
		posX = 24356.390625,
		posY = 38043.72265625,
		rot = 302.70422363281,
		scale = 1,
		playerID = 0 
	},

	{
		Typ = Entities.XD_Torch,
		posX = 17790,
		posY = 38890,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Torch,
		posX = 17610,
		posY = 38790,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Torch,
		posX = 17390,
		posY = 38690,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Torch,
		posX = 18306.998046875,
		posY = 38109.5078125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Torch,
		posX = 18110,
		posY = 37990,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
	{
		Typ = Entities.XD_Torch,
		posX = 17910,
		posY = 37903.3828125,
		rot = 0,
		scale = 1,
		playerID = 0 
	},
}




barb_replaceOld = {
	{
		Typ = Entities.XD_RuinTower2,
		posX = 17695.23046875,
		posY = 39290
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 18790,
		posY = 37910
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 21390,
		posY = 35104.87890625
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 20490,
		posY = 35110
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 20490,
		posY = 36610
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 21310,
		posY = 36610
	},
	{
		Typ = Entities.XD_RuinTower2,
		posX = 23690,
		posY = 37010
	},

	{
		Typ = Entities.XD_RuinFragment2,
		posX = 23410,
		posY = 38590
	},
	{
		Typ = Entities.XD_RuinFragment2,
		posX = 20194.26953125,
		posY = 40590
	},
	{
		Typ = Entities.XD_RuinFragment2,
		posX = 17890,
		posY = 39090
	},

	{
		Typ = Entities.XD_RuinHouse2,
		posX = 19966.41015625,
		posY = 40471.69921875
	},
	{
		Typ = Entities.XD_RuinHouse2,
		posX = 26520.330078125,
		posY = 40207.6484375
	},
	{
		Typ = Entities.XD_RuinHouse2,
		posX = 26527.080078125,
		posY = 40229.0703125
	},

	{
		Typ = Entities.XD_RuinFragment4,
		posX = 20144.26953125,
		posY = 40340
	},
	{
		Typ = Entities.XD_RuinFragment4,
		posX = 18160,
		posY = 39240
	},
	{
		Typ = Entities.XD_RuinFragment4,
		posX = 18740,
		posY = 38240
	},
	{
		Typ = Entities.XD_RuinFragment4,
		posX = 18760,
		posY = 37740
	},
	{
		Typ = Entities.XD_RuinFragment4,
		posX = 18940,
		posY = 37740
	},
	{
		Typ = Entities.XD_RuinFragment4,
		posX = 18140,
		posY = 39060
	},

	{
		Typ = Entities.XD_Fir1_small,
		posX = 16860.7109375,
		posY = 40149.890625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 16921.560546875,
		posY = 40055.5
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 16736.69921875,
		posY = 40320
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 17520,
		posY = 39655.359375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 17620,
		posY = 39964.3984375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 23429.900390625,
		posY = 40520
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 24521.279296875,
		posY = 40433.55859375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 18470.419921875,
		posY = 40646.98828125
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 18380,
		posY = 40520
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 20279.08984375,
		posY = 40637.359375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 20635.419921875,
		posY = 41240.390625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 23980,
		posY = 41180
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 24866.3203125,
		posY = 40556.87890625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 24480,
		posY = 40530.83984375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 25380,
		posY = 40067.140625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 23375.740234375,
		posY = 37680
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 23037.25,
		posY = 37135.171875
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 22020,
		posY = 37080
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 22280,
		posY = 37053.12890625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 22965.099609375,
		posY = 36720
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 22820,
		posY = 37338.640625
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 22939,
		posY = 37875.30859375
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 25151.1796875,
		posY = 40380
	},
	{
		Typ = Entities.XD_Fir1_small,
		posX = 19420,
		posY = 36948.5
	},

	{
		Typ = Entities.XD_RuinFragment6,
		posX = 23940,
		posY = 37940
	},
	{
		Typ = Entities.XD_RuinFragment6,
		posX = 19644.26953125,
		posY = 40440
	},
	{
		Typ = Entities.XD_RuinFragment6,
		posX = 17460,
		posY = 39160
	},
	{
		Typ = Entities.XD_RuinFragment6,
		posX = 18558.2890625,
		posY = 38240.1796875
	},
	{
		Typ = Entities.XD_RuinFragment6,
		posX = 18840,
		posY = 38240.73046875
	},

	{
		Typ = Entities.XD_Fir2_small,
		posX = 18380,
		posY = 36667.390625
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 18040.720703125,
		posY = 37428.5703125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 17180,
		posY = 39158.80078125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 17180,
		posY = 39564.671875
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23520,
		posY = 40422.23828125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23620,
		posY = 40522.23828125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23661.150390625,
		posY = 40474.578125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24123.7890625,
		posY = 40237.0703125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23920,
		posY = 37929.1796875
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24080,
		posY = 37951.19921875
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24080,
		posY = 38020
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 19745.060546875,
		posY = 40555.83984375
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 21680,
		posY = 40620
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 21880,
		posY = 40620
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22833.8203125,
		posY = 40620
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23334.939453125,
		posY = 40480
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 20544.76953125,
		posY = 41154.91015625
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24177.099609375,
		posY = 41331.71875
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 25520,
		posY = 41272.98828125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 25357.490234375,
		posY = 40780
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24820,
		posY = 39478.01953125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24757.609375,
		posY = 39234.51171875
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 24266.599609375,
		posY = 37980
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23180,
		posY = 37620.3203125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22477.5703125,
		posY = 36921.359375
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 21778.740234375,
		posY = 37259.3984375
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22523.58984375,
		posY = 37380
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22040.2109375,
		posY = 37456.1015625
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22037.98046875,
		posY = 36925.33984375
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23541.990234375,
		posY = 37880
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23920,
		posY = 37720
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23528.919921875,
		posY = 37380
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 22980,
		posY = 37920
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 23180,
		posY = 37980
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 25138.150390625,
		posY = 40326.62890625
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 19380,
		posY = 37320
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 19479.80078125,
		posY = 37180
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 20220,
		posY = 39620
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 20080,
		posY = 39765.3203125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 20180,
		posY = 39725.4609375
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 20359.220703125,
		posY = 39880
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 19421.609375,
		posY = 36829.73828125
	},
	{
		Typ = Entities.XD_Fir2_small,
		posX = 19480,
		posY = 37073.12109375
	},

	{
		Typ = Entities.XD_RuinSmallTower2,
		posX = 16460,
		posY = 39240
	},
	{
		Typ = Entities.XD_RuinSmallTower2,
		posX = 20260,
		posY = 35940
	},
	{
		Typ = Entities.XD_RuinSmallTower2,
		posX = 21660,
		posY = 36040
	},
	{
		Typ = Entities.XD_RuinSmallTower2,
		posX = 26260,
		posY = 38960
	},

	{
		Typ = Entities.XD_SingnalFireOn,
		posX = 17695.970703125,
		posY = 39290
	},
	{
		Typ = Entities.XD_SingnalFireOn,
		posX = 18710,
		posY = 37890
	},

	{
		Typ = Entities.XD_Fir1,
		posX = 18136.33984375,
		posY = 37375.5390625
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 17151.279296875,
		posY = 40120
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 17480,
		posY = 39937
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 17380,
		posY = 40020
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 24320,
		posY = 40473.55859375
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 22078.5,
		posY = 40556.7890625
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 21922.5703125,
		posY = 41320
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 24980,
		posY = 40369.4296875
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 23147.9609375,
		posY = 37559.44921875
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 19054.609375,
		posY = 39169.76953125
	},
	{
		Typ = Entities.XD_Fir1,
		posX = 24859.140625,
		posY = 38623.73046875
	},

	{
		Typ = Entities.XD_DeadBush1,
		posX = 17133.9609375,
		posY = 39900.7109375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 16746.4609375,
		posY = 39971.76953125
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17963.890625,
		posY = 36773.1015625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17705.0390625,
		posY = 36919.26171875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 18030.119140625,
		posY = 37427.26171875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17213.279296875,
		posY = 39077.5
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17208.240234375,
		posY = 39445
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17186.0390625,
		posY = 39992.6015625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17226.19921875,
		posY = 40147.98046875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17626.5,
		posY = 39911.75
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 17491.5703125,
		posY = 39722.73828125
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 18371.630859375,
		posY = 40600.91015625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20105.30078125,
		posY = 40474.41015625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 23286.919921875,
		posY = 40538
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20697.7890625,
		posY = 41171.4296875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 24866.029296875,
		posY = 41363.921875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 25093.369140625,
		posY = 41416.6796875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 25571.83984375,
		posY = 41145.421875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 25388.08984375,
		posY = 40889.62890625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 25095.2109375,
		posY = 40578.3515625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 24981.369140625,
		posY = 40686.08984375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 23519.720703125,
		posY = 37835.921875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 22917.5390625,
		posY = 37586.21875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 22950.359375,
		posY = 37597.609375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 22728.2109375,
		posY = 37411.421875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 22524.150390625,
		posY = 36990.62109375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 22851.140625,
		posY = 37307.4296875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 25075.5390625,
		posY = 40641.9296875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 18570.349609375,
		posY = 39138.4296875
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 19281.919921875,
		posY = 37428.08984375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20333.990234375,
		posY = 39585.390625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20528.400390625,
		posY = 39568.1484375
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20577.369140625,
		posY = 39553.8515625
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20214.80078125,
		posY = 39860.48828125
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 20671.66015625,
		posY = 39612.01953125
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 19889.4609375,
		posY = 36581.8203125
	},
	{
		Typ = Entities.XD_DeadBush1,
		posX = 19429.240234375,
		posY = 36896.21875
	},

	{
		Typ = Entities.XD_DeadBush2,
		posX = 18134.669921875,
		posY = 36859.80078125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 18191.900390625,
		posY = 36531.140625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 18234.099609375,
		posY = 37361.48828125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 18304.380859375,
		posY = 37347.9296875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 17130.44921875,
		posY = 40070.87890625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 17165.240234375,
		posY = 39588.23828125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 17476.849609375,
		posY = 39980.078125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 17519.2109375,
		posY = 39970.37109375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23226.470703125,
		posY = 41388.48046875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23116.310546875,
		posY = 41251.9296875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22717.55078125,
		posY = 41454.0390625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22555.75,
		posY = 41363.171875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22026.830078125,
		posY = 41269.83984375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 21926.4609375,
		posY = 41534.69140625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 24512.08984375,
		posY = 41471.0703125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 25508.359375,
		posY = 41287.21875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 25193.7890625,
		posY = 40720.0390625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 25094.48046875,
		posY = 40562.6484375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 24458.91015625,
		posY = 40503.26953125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 25002.73046875,
		posY = 40158.73828125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 25083.650390625,
		posY = 40014.71875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23296.830078125,
		posY = 37627.51171875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23262.779296875,
		posY = 37570.05859375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23003.400390625,
		posY = 37699.44921875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22747.75,
		posY = 37455.2890625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22684.509765625,
		posY = 37362.73046875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23032.919921875,
		posY = 37767.25
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 23487.419921875,
		posY = 37975.5703125
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 22949.890625,
		posY = 37904.58984375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 24930.26953125,
		posY = 39843.171875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20710,
		posY = 39513.6015625
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20641.359375,
		posY = 39604.9609375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20195.310546875,
		posY = 39969.33984375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20646.7109375,
		posY = 39441.48046875
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20699.83984375,
		posY = 39759.87109375
	},
	{
		Typ = Entities.XD_DeadBush2,
		posX = 20058.91015625,
		posY = 36757.5
	},

	{
		Typ = Entities.XD_Fir2,
		posX = 17220,
		posY = 39268.4296875
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 17220,
		posY = 39828.4296875
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 17120,
		posY = 39940.58984375
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 17431.08984375,
		posY = 39565.1015625
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 24646.55078125,
		posY = 40120
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 23880,
		posY = 37880
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 23780,
		posY = 37920
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 23550.130859375,
		posY = 37751.01953125
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 18553.109375,
		posY = 40728.41015625
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 20034.55078125,
		posY = 40552.5390625
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 20258.369140625,
		posY = 40580
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 22027.359375,
		posY = 36980
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 23538.359375,
		posY = 37980
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 24977.4296875,
		posY = 40026.7109375
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 20428.41015625,
		posY = 39579.21875
	},
	{
		Typ = Entities.XD_Fir2,
		posX = 20467.23046875,
		posY = 39868.91015625
	},

	{
		Typ = Entities.XD_DeadBush3,
		posX = 17257.94921875,
		posY = 39923.94140625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 16824.44921875,
		posY = 39999.91015625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 17881.7109375,
		posY = 37501.26953125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 17198.76953125,
		posY = 39577.66015625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 17168.599609375,
		posY = 39698.26953125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 17154.66015625,
		posY = 40005.421875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 17145.439453125,
		posY = 39628.5703125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 21843.859375,
		posY = 41386.53125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 18466.2890625,
		posY = 40532
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 20108.720703125,
		posY = 40665.83984375
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 21841.9609375,
		posY = 40651.859375
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 22936.419921875,
		posY = 40643.890625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 23232.970703125,
		posY = 40460.05078125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 23356.150390625,
		posY = 40589.51953125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 21871.669921875,
		posY = 41285.87890625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 24691.33984375,
		posY = 41431.76171875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 25291.830078125,
		posY = 40779.05078125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 24997.58984375,
		posY = 40677.33984375
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 23613.810546875,
		posY = 37918.37890625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 22621.76953125,
		posY = 36953.91015625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 23488,
		posY = 37941.640625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 23623.19921875,
		posY = 37933.9609375
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 22894.900390625,
		posY = 37955.69921875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 22938.9609375,
		posY = 37842.41015625
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 25011.189453125,
		posY = 40157.23046875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 19338.759765625,
		posY = 37397.73828125
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 20457.94921875,
		posY = 40060.6796875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 20712.419921875,
		posY = 39732.44921875
	},
	{
		Typ = Entities.XD_DeadBush3,
		posX = 20070.169921875,
		posY = 36640.1015625
	},

	{
		Typ = Entities.XD_DeadBush4,
		posX = 16873.7890625,
		posY = 40306.66015625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 16747.0390625,
		posY = 39886.76953125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17891.91015625,
		posY = 36895.2109375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17162.189453125,
		posY = 40005.421875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17242.0390625,
		posY = 39536.26953125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17273.7109375,
		posY = 39564.44140625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17602.109375,
		posY = 39791.30859375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17470.330078125,
		posY = 40112.76953125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17545.7109375,
		posY = 39844.1796875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 17334.720703125,
		posY = 39477.26953125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 21886.009765625,
		posY = 41355.44921875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 23531.279296875,
		posY = 40455.921875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22832.8203125,
		posY = 41421.171875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 20578.4296875,
		posY = 41209.2890625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 24274.66015625,
		posY = 41311.80859375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 25310.0390625,
		posY = 40891.1796875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 25022.220703125,
		posY = 40249.5390625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 23285.439453125,
		posY = 37615.0390625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22949.470703125,
		posY = 37149.08984375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22783.91015625,
		posY = 37453.30078125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22012.890625,
		posY = 36963.01171875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22671.5703125,
		posY = 37338.2109375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22940.26953125,
		posY = 37831.08984375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 23134.189453125,
		posY = 37873.66015625
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 22873.880859375,
		posY = 37860.19921875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 24953.470703125,
		posY = 39833.328125
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 19945.19921875,
		posY = 36785.58984375
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 20638.859375,
		posY = 39497.73046875
	},
	{
		Typ = Entities.XD_DeadBush4,
		posX = 20710.08984375,
		posY = 39670.25
	},

	{
		Typ = Entities.XD_DeadBush5,
		posX = 16737.369140625,
		posY = 39915.5
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 16684.19921875,
		posY = 40068.48046875
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 18085.939453125,
		posY = 36522.58984375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 17705.33984375,
		posY = 37473.69921875
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 18006.970703125,
		posY = 37455.62890625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 18159.720703125,
		posY = 37373.3203125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 17158.51953125,
		posY = 39422.30078125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 17174.150390625,
		posY = 40044.1015625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 18541.990234375,
		posY = 40629.33984375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 21806.23046875,
		posY = 40539.5
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 22879.720703125,
		posY = 40635.4296875
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 24007.0703125,
		posY = 41321.80078125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 25608.7109375,
		posY = 41220.2109375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 25290.880859375,
		posY = 40881.359375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 25031.490234375,
		posY = 40381.91015625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 24999.33984375,
		posY = 40066.1484375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 23644.720703125,
		posY = 37975.51953125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 23484.80078125,
		posY = 37785.3515625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 23539.759765625,
		posY = 37678.69140625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 22887.330078125,
		posY = 37560.58984375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 22358.91015625,
		posY = 36849.75
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 21893.630859375,
		posY = 37357.69921875
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 22656.140625,
		posY = 37422.359375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 23623.7109375,
		posY = 37851.16015625
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 23049.080078125,
		posY = 37888.3203125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 18965.609375,
		posY = 38975.55859375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 20068.400390625,
		posY = 36861.48828125
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 20331.76953125,
		posY = 39943.109375
	},
	{
		Typ = Entities.XD_DeadBush5,
		posX = 19379.630859375,
		posY = 36817.6015625
	},

	{
		Typ = Entities.XD_RuinSmallTower4,
		posX = 17840,
		posY = 36760
	},

	{
		Typ = Entities.XD_DeadBush6,
		posX = 16601.130859375,
		posY = 40420.80078125
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 17836.580078125,
		posY = 36895.21875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 17809.310546875,
		posY = 37462.3203125
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 17450.939453125,
		posY = 39992.62109375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 18563.150390625,
		posY = 40698.140625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 20206.2109375,
		posY = 40563.8203125
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 21691.80078125,
		posY = 40679.37890625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22087.640625,
		posY = 40663.890625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22706.619140625,
		posY = 40635.46875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22783.51953125,
		posY = 40615.44921875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 23179.580078125,
		posY = 41345.08984375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22635.69921875,
		posY = 41324.109375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24101.51953125,
		posY = 41313.16015625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24791.6796875,
		posY = 41392.7109375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 25407.630859375,
		posY = 40906.01171875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24866.3203125,
		posY = 40636.76171875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24353.75,
		posY = 40498.2890625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24975.83984375,
		posY = 40221.1796875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24943.330078125,
		posY = 40025.640625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22366.640625,
		posY = 36929.5390625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22166.880859375,
		posY = 37060.05078125
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 21990.640625,
		posY = 36986.91015625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22527.609375,
		posY = 37037.890625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 22457.83984375,
		posY = 36998.48046875
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 24938.98046875,
		posY = 39675.87109375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 25003.80078125,
		posY = 39811.91015625
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 18710.2109375,
		posY = 39000.73828125
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 19430.7890625,
		posY = 37328.7109375
	},
	{
		Typ = Entities.XD_DeadBush6,
		posX = 19671.349609375,
		posY = 36940.80078125
	},

	{
		Typ = Entities.XD_RuinResidence2,
		posX = 25288.310546875,
		posY = 38267.12109375
	},

	{
		Typ = Entities.XD_RuinWall6,
		posX = 17967.69921875,
		posY = 39310.71875
	},
	{
		Typ = Entities.XD_RuinWall6,
		posX = 18762.830078125,
		posY = 37953.71875
	},
	{
		Typ = Entities.XD_RuinWall6,
		posX = 18767.919921875,
		posY = 37948.859375
	},
	{
		Typ = Entities.XD_RuinWall6,
		posX = 18759.880859375,
		posY = 37936.87109375
	},
	{
		Typ = Entities.XD_RuinWall6,
		posX = 18763.349609375,
		posY = 37949.828125
	},
	{
		Typ = Entities.XD_RuinWall6,
		posX = 25397.140625,
		posY = 39494.0390625
	},

	{
		Typ = Entities.XD_RuinWall2,
		posX = 17377.66015625,
		posY = 39332.9609375
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 16831.44921875,
		posY = 38253.1796875
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 20275.650390625,
		posY = 35666.25
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 21565.25,
		posY = 35332.640625
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 21656.310546875,
		posY = 35659.05078125
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 21681.0390625,
		posY = 35854
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 21624.0390625,
		posY = 36314.69140625
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 20263.619140625,
		posY = 36228.5390625
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 20388.23046875,
		posY = 36536.41015625
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 20414.5703125,
		posY = 35309.3203125
	},
	{
		Typ = Entities.XD_RuinWall2,
		posX = 21533.2109375,
		posY = 36659.12890625
	},
    
}

