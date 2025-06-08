private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt"];

_side = _this;
_upgrade_levels = [];
_tech_level = 0;

switch (_side) do {
	case west: {_faction = "West"};
	case east: {_faction = "East"};
	default {_faction = ""};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
};

_c = [];
_u = [];
_p = [];

//--------------------------------------------------------------------------------------------------------------------------//
//													Basic Stuff																//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_full = [_side, CTI_UPGRADE_GEAR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

//--- Items
_c pushBack "gm_df7x40_grn";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_gc_compass_f73";
_u pushBack 0;
_p pushBack 1;

_c pushBack "gm_watch_kosei_80";
_u pushBack 0;
_p pushBack 1;

_c pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;

_c pushBack "gm_gc_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_gc_army_medkit";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_lpr1_oli";
_u pushBack 3;
_p pushBack 1000;

_c pushBack "gm_nsg66_oli";
_u pushBack 2;
_p pushBack 500;

//--------------------------------------------------------------------------------------------------------------------------//
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_handgrenade_frag_rgd5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_smokeshell_grn_gc";
_c pushBack "gm_smokeshell_blk_gc";
_c pushBack "gm_smokeshell_red_gc";
_c pushBack "gm_smokeshell_yel_gc";
_c pushBack "gm_smokeshell_blu_gc";
_c pushBack "gm_smokeshell_org_gc";
_c pushBack "gm_smokeshell_wht_gc";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_mine_at_tm46";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_explosive_petn_charge";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_explosive_plnp_charge";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "gm_pallad_d_brn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "1Rnd_HE_Grenade_shell";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "UGL_FlareWhite_F";
_c pushBack "UGL_FlareGreen_F";
_c pushBack "UGL_FlareRed_F";
_c pushBack "UGL_FlareYellow_F";
_c pushBack "UGL_FlareCIR_F";
_c pushBack "1Rnd_Smoke_Grenade_shell";
_c pushBack "1Rnd_SmokeRed_Grenade_shell";
_c pushBack "1Rnd_SmokeGreen_Grenade_shell";
_c pushBack "1Rnd_SmokeYellow_Grenade_shell";
_c pushBack "1Rnd_SmokePurple_Grenade_shell";
_c pushBack "1Rnd_SmokeBlue_Grenade_shell";
_c pushBack "1Rnd_SmokeOrange_Grenade_shell";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_pm_blk";
_c pushBack "gm_pim_blk";
_c pushBack "gm_pimb_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "gm_8rnd_9x18mm_b_pst_pm_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_p2a1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_265mm_flare_single_wht_gc";
_c pushBack "gm_1Rnd_265mm_flare_single_grn_gc";
_c pushBack "gm_1Rnd_265mm_flare_single_red_gc";
_c pushBack "gm_1Rnd_265mm_flare_multi_red_gc";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_1Rnd_265mm_smoke_single_yel_gc";
_c pushBack "gm_1Rnd_265mm_smoke_single_blu_gc";
_c pushBack "gm_1Rnd_265mm_smoke_single_blk_gc";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													SMG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_pm63_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_15Rnd_9x18mm_b_pst_pm63_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_25Rnd_9x18mm_b_pst_pm63_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_mpiak74n_brn";
_c pushBack "gm_mpiak74n_blk";
_c pushBack "gm_mpiak74n_prp";
_c pushBack "gm_mpiaks74n_brn";
_c pushBack "gm_mpiaks74n_blk";
_c pushBack "gm_mpiaks74n_prp";
_c pushBack "gm_mpiaks74nk_brn";
_c pushBack "gm_mpiaks74nk_blk";
_c pushBack "gm_mpiaks74nk_prp";
_c pushBack "gm_ak74n_wud";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_30Rnd_545x39mm_b_7N6_ak74_prp";
_c pushBack "gm_30Rnd_545x39mm_b_t_7T3_ak74_prp";
_c pushBack "gm_30Rnd_545x39mm_b_7N6_ak74_org";
_c pushBack "gm_30Rnd_545x39mm_b_t_7T3_ak74_org";
_c pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_prp";
_c pushBack "gm_45Rnd_545x39mm_b_t_7T3_ak74_prp";
_c pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_org";
_c pushBack "gm_45Rnd_545x39mm_b_t_7T3_ak74_org";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
//light
_c pushBack "gm_zvn64_ak";
_c pushBack "gm_zvn64_rear_ak";
_c pushBack "gm_zvn64_front";
_c pushBack "gm_flashlightp2_wht_ak74handguard_blu";
_c pushBack "gm_flashlightp2_brk_ak74handguard_dino";

_c pushBack "gm_bayonet_6x3_wud";
_c pushBack "gm_bayonet_6x3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_lmgrpk74n_brn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_lmgrpk74n_prp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_45Rnd_545x39mm_b_7N6_ak74_org";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_rpg7_prp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_40mm_heat_pg7v_rpg7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_40mm_heat_pg7vl_rpg7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_civ_uniform_man_01_80_blk";
_c pushBack "gm_gc_civ_uniform_man_01_80_blu";
_c pushBack "gm_gc_civ_uniform_man_02_80_brn";
_c pushBack "gm_gc_army_uniform_dress_80_gry";
_c pushBack "gm_gc_pol_uniform_dress_80_blu";
_c pushBack "gm_gc_army_uniform_soldier_80_blk";
_c pushBack "gm_gc_army_uniform_soldier_80_str";
_c pushBack "gm_gc_army_uniform_soldier_80_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_army_vest_80_belt_str";
_c pushBack "gm_gc_army_vest_80_at_str";
_c pushBack "gm_gc_bgs_vest_80_border_str";
_c pushBack "gm_gc_army_vest_80_leader_str";
_c pushBack "gm_gc_army_vest_80_lmg_str";
_c pushBack "gm_gc_army_vest_80_rifleman_str";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_army_backpack_80_assaultpack_lmg_str";
_c pushBack "gm_gc_army_backpack_80_assaultpack_str";
_c pushBack "gm_gc_army_backpack_80_lmg_str";
_c pushBack "gm_gc_army_backpack_80_at_str";
_c pushBack "B_Parachute";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_fagot_launcher_weaponBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_army_headgear_crewhat_80_blk";
_c pushBack "gm_gc_army_headgear_cap_80_gry";
_c pushBack "gm_gc_pol_headgear_cap_80_blu";
_c pushBack "gm_gc_bgs_headgear_hat_80_gry";
_c pushBack "gm_gc_army_headgear_hat_80_grn";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_gc_army_headgear_m56";
_c pushBack "gm_gc_army_headgear_m56_cover_blu";
_c pushBack "gm_gc_army_headgear_m56_net";
_c pushBack "gm_gc_army_headgear_m56_cover_str";
_c pushBack "gm_gc_army_headgear_m56_cover_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Glasses																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_army_facewear_schm41m";
_c pushBack "gm_headgear_foliage_summer_forest_01";
_c pushBack "gm_headgear_foliage_summer_forest_02";
_c pushBack "gm_headgear_foliage_summer_forest_03";
_c pushBack "gm_headgear_foliage_summer_forest_04";
_c pushBack "gm_headgear_foliage_summer_grass_01";
_c pushBack "gm_headgear_foliage_summer_grass_02";
_c pushBack "gm_headgear_foliage_summer_grass_03";
_c pushBack "gm_headgear_foliage_summer_grass_04";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_akm_pallad_wud";
_c pushBack "gm_akml_wud";
_c pushBack "gm_akmn_wud";
_c pushBack "gm_akms_wud";
_c pushBack "gm_akmsl_wud";
_c pushBack "gm_akmsn_wud";
_c pushBack "gm_akm_wud";
_c pushBack "gm_mpikm72_brn";
_c pushBack "gm_mpikm72_blk";
_c pushBack "gm_mpikm72_prp";
_c pushBack "gm_mpikm_brn";
_c pushBack "gm_mpikms72_brn";
_c pushBack "gm_mpikms72_blk";
_c pushBack "gm_mpikms72_prp";
_c pushBack "gm_mpikms72k_brn";
_c pushBack "gm_mpikms72k_blk";
_c pushBack "gm_mpikms72k_prp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_30Rnd_762x39mm_b_M43_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_b_t_M43_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_B_57N231_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_AP_7N23_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_AP_7N23_akm_org";
_c pushBack "gm_30Rnd_762x39mm_B_57N231_mpikm_blk";
_c pushBack "gm_30Rnd_762x39mm_BSD_57N231U_ak47_blk";
_c pushBack "gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk";
_c pushBack "gm_30Rnd_762x39mm_B_T_57N231P_mpikm_blk";
_c pushBack "gm_30Rnd_762x39mm_AP_7N23_mpikm_blk";
_c pushBack "gm_30Rnd_762x39mm_B_57N231_akm_blk";
_c pushBack "gm_30Rnd_762x39mm_BSD_57N231U_akm_blk";
_c pushBack "gm_30Rnd_762x39mm_B_T_57N231P_akm_blk";
_c pushBack "gm_30Rnd_762x39mm_AP_7N23_akm_blk";
_c pushBack "gm_30Rnd_762x39mm_B_57N231_akm_org";
_c pushBack "gm_30Rnd_762x39mm_BSD_57N231U_akm_org";
_c pushBack "gm_30Rnd_762x39mm_B_T_57N231P_akm_org";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//_c pushBack "gm_1Rnd_fagot_heat_9m111";
//_u pushBack _tech_level;
//_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_lmgrpk_brn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_lmgrpk_prp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_lmgrpk74n_brn";
_c pushBack "gm_lmgrpk74n_blk";
_c pushBack "gm_lmgrpk74n_prp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_u pushBack _tech_level;


_c pushBack "gm_lmgk500_brn";
_c pushBack "gm_lmgk500_blk";
_c pushBack "gm_lmgk500_prp";
_c pushBack "gm_lmgk500s_brn";
_c pushBack "gm_lmgk500s_blk";
_c pushBack "gm_lmgk500s_prp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_75Rnd_762x39mm_b_M43_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_b_t_M43_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_B_57N231_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_BSD_57N231U_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_B_T_57N231P_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_AP_7N23_ak47_blk";
_c pushBack "gm_75Rnd_762x39mm_B_57N231_mpikm_blk";
_c pushBack "gm_75Rnd_762x39mm_BSD_57N231U_mpikm_blk";
_c pushBack "gm_75Rnd_762x39mm_B_T_57N231P_mpikm_blk";
_c pushBack "gm_75Rnd_762x39mm_AP_7N23_mpikm_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,75,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_rpg18_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//_c pushBack "gm_1Rnd_64mm_heat_pg18";
//_u pushBack _tech_level;
//_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_9k32m_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_72mm_he_9m32m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_pso1_gry";
_c pushBack "gm_zfk4x25_blk";

//laser
_c pushBack "gm_zln1k_grn_dovetail_blk";
_c pushBack "gm_zln1k_grn_dovetail_gry";
_c pushBack "gm_zln1k_ir_dovetail_blk";
_c pushBack "gm_zln1k_ir_dovetail_gry";

_c pushBack "gm_suppressor_pbs4_545mm_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_svd_wud";
_c pushBack "gm_mpikms72ksd_brn";
_c pushBack "gm_mpikms72ksd_blk";
_c pushBack "gm_mpikms72ksd_prp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_10Rnd_762x54mmR_ap_7n1_svd_blk";
_c pushBack "gm_10Rnd_762x54mmR_api_7bz3_svd_blk";
_c pushBack "gm_10Rnd_762x54mmR_b_t_7t2_svd_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "gm_40Rnd_762x39mm_B_T_57N231P_ak47_blk";
_c pushBack "gm_40Rnd_762x39mm_AP_7N23_ak47_blk";
_c pushBack "gm_40Rnd_762x39mm_B_57N231_mpikm_blk";
_c pushBack "gm_40Rnd_762x39mm_BSD_57N231U_mpikm_blk";
_c pushBack "gm_40Rnd_762x39mm_B_T_57N231P_mpikm_blk";
_c pushBack "gm_40Rnd_762x39mm_AP_7N23_mpikm_blk";
_c pushBack "gm_40Rnd_762x39mm_B_57N231_akm_blk";
_c pushBack "gm_40Rnd_762x39mm_BSD_57N231U_akm_blk";
_c pushBack "gm_40Rnd_762x39mm_B_T_57N231P_akm_blk";
_c pushBack "gm_40Rnd_762x39mm_AP_7N23_akm_blk";
_c pushBack "gm_40Rnd_762x39mm_B_57N231_akm_org";
_c pushBack "gm_40Rnd_762x39mm_BSD_57N231U_akm_org";
_c pushBack "gm_40Rnd_762x39mm_B_T_57N231P_akm_org";
_c pushBack "gm_40Rnd_762x39mm_AP_7N23_akm_org";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_hmgpkm_prp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_100Rnd_762x54mm_b_t_t46_pk_grn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,75,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_100Rnd_762x54mm_api_b32_pk_grn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,75,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Optics																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_pka_dovetail_blk";
_c pushBack "gm_pka_dovetail_gry";

_c pushBack "gm_nspu_dovetail_blk";
_c pushBack "gm_nspu_dovetail_gry";

_c pushBack "gm_suppressor_pbs1_762mm_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "gm_gc_army_headgear_hat_90_bg";
_c pushBack "gm_gc_army_headgear_hat_90_sgr";
_c pushBack "gm_gc_army_headgear_hat_90_str";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_gc_army_headgear_m86";
_c pushBack "gm_gc_army_headgear_m86_cover_blu";
_c pushBack "gm_gc_army_headgear_m86_net";
_c pushBack "gm_gc_army_headgear_m86_cover_str";
_c pushBack "gm_gc_army_headgear_m86_cover_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gc_army_uniform_soldier_90_str";
_c pushBack "gm_gc_army_uniform_soldier_90_sgr";
_c pushBack "gm_gc_army_uniform_soldier_rolled_90_str";
_c pushBack "gm_gc_army_uniform_soldier_rolled_90_sgr";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "gm_gc_army_vest_90_belt_str";
_c pushBack "gm_gc_army_vest_90_leader_str";
_c pushBack "gm_gc_army_vest_90_lmg_str";
_c pushBack "gm_gc_army_vest_90_officer_str";
_c pushBack "gm_gc_army_vest_90_rifleman_str";
_c pushBack "gm_gc_army_vest_90_at_str";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_gc_army_vest_bespa_80_none_str";
_c pushBack "gm_gc_army_vest_bespa_80_belt_str";
_c pushBack "gm_gc_army_vest_bespa_80_leader_str";
_c pushBack "gm_gc_army_vest_bespa_80_lmg_str";
_c pushBack "gm_gc_army_vest_bespa_80_rifleman_str";
_c pushBack "gm_gc_army_vest_bespa_80_at_str";
_c pushBack "gm_gc_army_vest_bespa_90_belt_str";
_c pushBack "gm_gc_army_vest_bespa_90_leader_str";
_c pushBack "gm_gc_army_vest_bespa_90_lmg_str";
_c pushBack "gm_gc_army_vest_bespa_90_officer_str";
_c pushBack "gm_gc_army_vest_bespa_90_rifleman_str";
_c pushBack "gm_gc_army_vest_bespa_90_at_str";

_c pushBack "gm_gc_army_vest_bespa_80_none_win";
_c pushBack "gm_gc_army_vest_bespa_80_belt_win";
_c pushBack "gm_gc_army_vest_bespa_80_leader_win";
_c pushBack "gm_gc_army_vest_bespa_80_lmg_win";
_c pushBack "gm_gc_army_vest_bespa_80_rifleman_win";
_c pushBack "gm_gc_army_vest_bespa_80_at_win";
_c pushBack "gm_gc_army_vest_bespa_90_belt_win";
_c pushBack "gm_gc_army_vest_bespa_90_leader_win";
_c pushBack "gm_gc_army_vest_bespa_90_lmg_win";
_c pushBack "gm_gc_army_vest_bespa_90_officer_win";
_c pushBack "gm_gc_army_vest_bespa_90_rifleman_win";
_c pushBack "gm_gc_army_vest_bespa_90_at_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_GM_NVA.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_GM_NVA.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
