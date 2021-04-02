private "_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level";

_side = _this;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(CTI_NO_UPGRADE_MODE == 1) then {	
	_tech_level_no_upgrade_inv = 0;
};

_i = [];
_u = [];
_p = [];

//(CTI_ECONOMY_PRIZE_WEAPONS*_level_start)
//100*1 -> $100 weapon
//((rnds*caliber)/1000)*((CTI_ECONOMY_PRIZE_WEAPONS*_level_start)/100)
//((30*545)/1000)*(100*1/100) = $16,35 -> ammo
/*
_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((rnds*caliber)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
*/

//---Weapons and Ammo---------------
_i pushBack "gm_pm_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_8rnd_9x18mm_b_pst_pm_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((8*900*18)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_p2a1_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_1Rnd_265mm_flare_single_wht_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_grn_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_single_red_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_flare_multi_red_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_yel_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 20*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_blu_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 20*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_1Rnd_265mm_smoke_single_blk_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 20*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


_i pushBack "gm_pm63_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_15Rnd_9x18mm_b_pst_pm63_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((15*900*18)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_25Rnd_9x18mm_b_pst_pm63_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((25*900*18)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//---------MG------------------
_i pushBack "gm_lmgrpk74n_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_lmgrpk74n_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_org";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((45*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_tech_level = 1;
_i pushBack "gm_lmgrpk_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_lmgrpk_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_75Rnd_762x39mm_b_M43_ak47_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((75*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_tech_level = 2;
_i pushBack "gm_hmgpkm_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_100Rnd_762x54mm_b_t_t46_pk_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((100*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_100Rnd_762x54mm_api_b32_pk_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((100*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//--------------Assault---------------
_tech_level = 0;
_i pushBack "gm_mpiak74n_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpiak74n_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpiaks74n_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpiaks74n_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpiaks74nk_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpiaks74nk_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_30Rnd_545x39mm_b_7N6_ak74_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_545x39mm_b_t_7T3_ak74_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_545x39mm_b_7N6_ak74_org";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_545x39mm_b_t_7T3_ak74_org";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_45Rnd_545x39mm_b_t_7T3_ak74_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_org";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_45Rnd_545x39mm_b_t_7T3_ak74_org";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*545*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 1
_tech_level = _tech_level + 1;

_i pushBack "gm_mpikm72_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpikm72_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpikms72_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_mpikms72_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_30Rnd_762x39mm_b_M43_ak47_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_30Rnd_762x39mm_b_t_M43_ak47_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_75Rnd_762x39mm_b_M43_ak47_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_75Rnd_762x39mm_b_t_M43_ak47_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((30*762*39)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//_i pushBack "gm_1Rnd_fagot_heat_9m111";
//_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
//_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

//Level 2
_tech_level = _tech_level + 1;

_i pushBack "gm_svd_wud";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_10Rnd_762x54mmR_ap_7n1_svd_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_10Rnd_762x54mmR_api_7bz3_svd_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_10Rnd_762x54mmR_b_t_7t2_svd_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((10*762*54)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//---------AT-Guns------------
_tech_level = 0;
_i pushBack "gm_rpg7_prp";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_40mm_heat_pg7v_rpg7";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_tech_level = 2;
_i pushBack "gm_9k32m_oli";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2);

_i pushBack "gm_1Rnd_72mm_he_9m32m";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);


//Throwables
_tech_level = 0;
_i pushBack "gm_handgrenade_frag_rgd5";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 50*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_grn_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_blk_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_red_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_yel_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_blu_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_org_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_smokeshell_wht_gc";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 10*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);



_i pushBack "gm_mine_at_tm46";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_explosive_petn_charge";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_i pushBack "gm_explosive_plnp_charge";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round 200*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);



//--- Uniforms
_i pushBack "gm_gc_civ_uniform_man_01_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_civ_uniform_man_01_80_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_civ_uniform_man_02_80_brn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_uniform_dress_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_pol_uniform_dress_80_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_uniform_soldier_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_uniform_soldier_80_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_uniform_soldier_80_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//--- Vests
_i pushBack "gm_gc_army_vest_80_belt_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_gc_army_vest_80_at_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_gc_bgs_vest_80_border_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_gc_army_vest_80_leader_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_gc_army_vest_80_lmg_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);

_i pushBack "gm_gc_army_vest_80_rifleman_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*3);


//--- Backpacks
_i pushBack "gm_gc_army_backpack_80_assaultpack_lmg_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_gc_army_backpack_80_assaultpack_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_gc_army_backpack_80_lmg_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_gc_army_backpack_80_at_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)*2);

_i pushBack "gm_fagot_launcher_weaponBag";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*2)+((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))*4);


//--- Glasses
_i pushBack "gm_gc_army_facewear_schm41m";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_forest_04";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_01";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_02";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_03";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

_i pushBack "gm_headgear_foliage_summer_grass_04";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)/2);

//---Attachments
_tech_level = 0;
_i pushBack "gm_zvn64_rear_ak";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_zvn64_front";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_bayonet_6x3_wud";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_bayonet_6x3_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_pgo7v_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_tech_level = 2;

_i pushBack "gm_zfk4x25_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));

_i pushBack "gm_pso1_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_WEAPONS*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100)));



//--- Helms
_tech_level = 0;
_i pushBack "gm_gc_army_headgear_crewhat_80_blk";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_gc_army_headgear_cap_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_gc_pol_headgear_cap_80_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_gc_bgs_headgear_hat_80_gry";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_gc_army_headgear_hat_80_grn";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round ((CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2);

_i pushBack "gm_gc_army_headgear_m56";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_headgear_m56_cover_blu";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_headgear_m56_net";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_headgear_m56_cover_str";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));

_i pushBack "gm_gc_army_headgear_m56_cover_win";
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_p pushBack round (CTI_ECONOMY_PRIZE_EQUIPMENT*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));


//--- Items
_i pushBack "gm_df7x40_grn";
_u pushBack 0;
_p pushBack 5;

_i pushBack "gm_gc_compass_f73";
_u pushBack 0;
_p pushBack 1;

_i pushBack "gm_watch_kosei_80";
_u pushBack 0;
_p pushBack 1;

_i pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;

_i pushBack "gm_gc_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_i pushBack "Toolkit";
_u pushBack 0;
_p pushBack 750;

_i pushBack "gm_gc_army_medkit";
_u pushBack 0;
_p pushBack 15;

[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf"; 
