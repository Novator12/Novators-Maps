function DebugStartCamps()
	DestroyEntity("sp2_bandit1_tower1")
	DestroyEntity("sp2_bandit1_tent2")
	DestroyEntity("sp2_bandit1_tent1")
	DestroyEntity("sp2_bandit1_tent3")
	DestroyEntity("sp1_bandit1_tent1")
	DestroyEntity("sp1_bandit1_tent2")
	DestroyEntity("sp1_bandit1_tower1")
	DestroyEntity("sp1_bandit1_tower2")
	DestroyEntity("sp1_bandit1_tower3")
	DestroyEntity("sp1_bandit1_tower4")
end

function DebugNorfolkIron()
	DestroyEntity("iron_def_tower1")
	DestroyEntity("iron_def_tower2")
end

function DebugNorfolkAttack()
	DestroyEntity("id5_barb1")
	DestroyEntity("id5_barb2")
	DestroyEntity("id5_kaserne1")
	DestroyEntity("id5_bogen1")
end

function DebugBarbIronAttack()
	DestroyEntity("B_Attack1")
	DestroyEntity("B_Attack2")
	DestroyEntity("B_Attack3")
	DestroyEntity("biron_tower1")
	DestroyEntity("biron_tower2")
end


function SpawnDebugTroups()
	for i =1,5,1 do
		CreateMilitaryGroup(1,Entities.PU_LeaderBow4,8,GetPosition("debug"..i),"debugt"..i,nil)
	end
end