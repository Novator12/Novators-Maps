Merchant = {}
Merchant.Funcs = {}
Merchant.Jobs = {}
Merchant.MerchParameters = {
	state = 1,		--Zustand in dem sich der Händler befindet
	type = Entities.PU_Travelling_Salesman,		--Type den der Händler hat (keine Gebäude, nur Einheiten)
	spawnPos = "spawn_merchant",	--Position des Händlers, wo er zu Beginn spawnt
	sellPos = "merchant_sellpos", --Position des Händlers, wo er seine Ware verkauft
	angle = 0,	--Rotation des Händlers beim Spawn
	pID = 6,	--PlayerID des Händlers
	merchID = nil,	--ID des Händlers
	merchSpawnTroops = "troops_merchant",  --Position, wo gekaufte Truppen spawnen
	waitOnSellPoint = 60*2, -- maximale Handelszeit (Zeit die der Händler zum Kaufen da ist (in Sek))
	currentWaitTime = 0,		-- ZählerHilfe
	waitToRespawn = 60*10,		-- Zeit die der Händler zum Respawnen braucht (in Sek)
	tradeLevel = 1,
}


Merchant.MerchParameters.TroopsToSell = {
	[1] = {Entities.PU_LeaderBow1, {Gold = 200,Wood = 100},4,nil},
	[2] = {Entities.PU_LeaderSword1, {Gold = 200,Iron = 150},4,nil},
	[3] = {Entities.PV_Cannon1, {Gold = 200, Iron = 100, Sulfur = 100},4,nil},	
}

function InitTrader()
	Merchant.Funcs.MerchantCreate()
	if not Merchant.Jobs[1] then
		Merchant.Jobs[1] = Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,nil,"MerchantHandler",1)
	end
end

function Merchant.Funcs.MerchantCreate()
	local pos = GetPosition(Merchant.MerchParameters.spawnPos)
	Merchant.MerchParameters.merchID = Logic.CreateEntity(Merchant.MerchParameters.type,pos.X,pos.Y,Merchant.MerchParameters.angle,Merchant.MerchParameters.pID)
	SetEntityName(Merchant.MerchParameters.merchID,"MerchantName")
	Merchant.MerchParameters.name =  GetEntityName(Merchant.MerchParameters.merchID)
	NonPlayerMerchant.Internal:CreateNpc({
		ScriptName = Merchant.MerchParameters.name,
		Spawnpoint = Merchant.MerchParameters.merchSpawnTroops
	});
	Merchant.Funcs.MerchantMoveToSell()
	GUI.ScriptSignal(pos.X,pos.Y,1)
	Message("@color:0,0,255 Info: @color:255,255,255 Ein Händler erscheint!")
	Sound.Play2DSound(1109,0,100)
end

function Merchant.Funcs.MerchantMoveToSell()
	Move(Merchant.MerchParameters.merchID,Merchant.MerchParameters.sellPos)
end

function Merchant.Funcs.MerchantMoveToDestroy()
	Move(Merchant.MerchParameters.merchID,Merchant.MerchParameters.spawnPos)
	Message("@color:0,0,255 Info: @color:255,255,255 Der Händler zieht weiter!")
end

function MerchantHandler()
	if IsNear(Merchant.MerchParameters.merchID, Merchant.MerchParameters.sellPos, 400) and Merchant.MerchParameters.state == 1 then
		for i = 1, table.getn(Merchant.MerchParameters.TroopsToSell) do 
			NonPlayerMerchant.AddTroopOffer(Merchant.MerchParameters.name, Merchant.MerchParameters.TroopsToSell[i][1],
			Merchant.MerchParameters.TroopsToSell[i][2], Merchant.MerchParameters.TroopsToSell[i][3],
			Merchant.MerchParameters.TroopsToSell[i][4])
		end
		NonPlayerMerchant.Activate(Merchant.MerchParameters.name)
		Merchant.MerchParameters.state = Merchant.MerchParameters.state +1
	end

	if Merchant.MerchParameters.currentWaitTime < Merchant.MerchParameters.waitOnSellPoint and Merchant.MerchParameters.state == 2 then
		Merchant.MerchParameters.currentWaitTime = Merchant.MerchParameters.currentWaitTime + 1
	elseif Merchant.MerchParameters.currentWaitTime >= Merchant.MerchParameters.waitOnSellPoint and Merchant.MerchParameters.state == 2 then
		Merchant.MerchParameters.currentWaitTime = 0
		NonPlayerMerchant.Deactivate(Merchant.MerchParameters.name)
		Merchant.Funcs.MerchantMoveToDestroy()
		Merchant.MerchParameters.state = Merchant.MerchParameters.state + 1
	end

	if IsNear(Merchant.MerchParameters.merchID, Merchant.MerchParameters.spawnPos, 400) and  Merchant.MerchParameters.state == 3 then
		DestroyEntity(Merchant.MerchParameters.merchID)
		Merchant.MerchParameters.state = Merchant.MerchParameters.state + 1
	end

	if Merchant.MerchParameters.currentWaitTime < Merchant.MerchParameters.waitToRespawn and Merchant.MerchParameters.state == 4 then
		Merchant.MerchParameters.currentWaitTime = Merchant.MerchParameters.currentWaitTime + 1
	elseif Merchant.MerchParameters.currentWaitTime >= Merchant.MerchParameters.waitToRespawn and Merchant.MerchParameters.state == 4 then
		Merchant.MerchParameters.currentWaitTime = 0
		Merchant.MerchParameters.tradeLevel = Merchant.MerchParameters.tradeLevel + 1
		if Merchant.MerchParameters.tradeLevel == 3 then --ab dem 3. mal
			Merchant.MerchParameters.TroopsToSell = {
				[1] = {Entities.PU_LeaderBow2, {Gold = 300,Wood = 200},4,nil},
				[2] = {Entities.PU_LeaderSword2, {Gold = 300,Iron = 250},4,nil},
				[3] = {Entities.PV_Cannon2, {Gold = 300, Iron = 200, Sulfur = 200},4,nil},	
			}
		end
		if Merchant.MerchParameters.tradeLevel == 5 then --ab dem 5. mal
			Merchant.MerchParameters.TroopsToSell = {
				[1] = {Entities.PU_LeaderBow3, {Gold = 400,Wood = 300},4,nil},
				[2] = {Entities.PU_LeaderSword3, {Gold = 400,Iron = 350},4,nil},
				[3] = {Entities.PV_Cannon3, {Gold = 400, Iron = 300, Sulfur = 300},4,nil},	
			}
		end
		if Merchant.MerchParameters.tradeLevel == 7 then --ab dem 7. mal
			Merchant.MerchParameters.TroopsToSell = {
				[1] = {Entities.PU_LeaderBow4, {Gold = 500,Wood = 400},4,nil},
				[2] = {Entities.PU_LeaderSword4, {Gold = 500,Iron = 450},4,nil},
				[3] = {Entities.PV_Cannon4, {Gold = 500, Iron = 400, Sulfur = 400},4,nil},	
			}
		end
		Merchant.Funcs.MerchantCreate()
		Merchant.MerchParameters.state = 1
	end
end



function ActivateLeoTrader()
	NonPlayerMerchant.Internal:CreateNpc({
			ScriptName = "leo",
			Spawnpoint = "leo_canon"
		});

	NonPlayerMerchant.AddTroopOffer("leo",Entities.PV_Cannon3,{Gold = 750, Sulfur = 500},6,nil)
	NonPlayerMerchant.AddTroopOffer("leo",Entities.PV_Cannon4,{Gold = 1000, Sulfur = 750},6,nil)

	NonPlayerMerchant.Activate("leo")
end