private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt", "_cntstart", "_cntend"];

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
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_full = [_side, CTI_UPGRADE_GEAR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "vn_molotov_grenade_mag";
_c pushBack "vn_chicom_grenade_mag";
_c pushBack "vn_f1_grenade_mag";
_c pushBack "vn_m14_grenade_mag";
_c pushBack "vn_m14_early_grenade_mag";
_c pushBack "vn_m34_grenade_mag";
_c pushBack "vn_m61_grenade_mag";
_c pushBack "vn_m67_grenade_mag";
_c pushBack "vn_m7_grenade_mag";
_c pushBack "vn_rdg2_mag";
_c pushBack "vn_rg42_grenade_mag";
_c pushBack "vn_rgd33_grenade_mag";
_c pushBack "vn_rgd5_grenade_mag";
_c pushBack "vn_rkg3_grenade_mag";
_c pushBack "vn_t67_grenade_mag";
_c pushBack "vn_v40_grenade_mag";
_c pushBack "vn_40mm_m381_he_mag";
_c pushBack "vn_40mm_m406_he_mag";
_c pushBack "vn_40mm_m397_ab_mag";
_c pushBack "vn_40mm_m433_hedp_mag";
_c pushBack "vn_40mm_m576_buck_mag";
_c pushBack "vn_mine_m18_mag";
_c pushBack "vn_m14_grenade_mag";
_c pushBack "vn_m7_grenade_mag";
_c pushBack "vn_22mm_m1a2_frag_mag";
_c pushBack "vn_22mm_m9_heat_mag";
_c pushBack "vn_22mm_cs_mag";
_c pushBack "vn_satchelcharge_02_throw_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_m18_green_mag";
_c pushBack "vn_m18_purple_mag";
_c pushBack "vn_m18_red_mag";
_c pushBack "vn_m18_white_mag";
_c pushBack "vn_m18_yellow_mag";
_c pushBack "vn_40mm_m583_flare_w_mag";
_c pushBack "vn_40mm_m680_smoke_w_mag";
_c pushBack "vn_22mm_lume_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------------------------------------------------------------------------------------//
//															Weapons															//
//--------------------------------------------------------------------------------------------------------------------------//

//--------------------------------Sidearms-----------------------------------
_c pushBack "vn_m1911";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_mx991_m1911";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1911_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1942 - 1950
_c pushBack "vn_m3a1";
_c pushBack "vn_s_m3a1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m3a1_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m3a1_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_m1897";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1897_fl_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,6] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1897_buck_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,6] call CTI_CO_FNC_GetCalculatedItemPrize);

//1960
_c pushBack "vn_m16_usaf";
_c pushBack "vn_m16";
_c pushBack "vn_m16_camo";
_c pushBack "vn_m16_m203_camo";
_c pushBack "vn_m16_m203";
_c pushBack "vn_m16_xm148";
_c pushBack "vn_xm16e1";
_c pushBack "vn_xm16e1_xm148";
_c pushBack "vn_xm177e1";
_c pushBack "vn_xm177e1_camo";
_c pushBack "vn_xm177";
_c pushBack "vn_xm177_camo";
_c pushBack "vn_xm177_fg";
_c pushBack "vn_xm177_m203";
_c pushBack "vn_xm177_m203_camo";
_c pushBack "vn_xm177_short";
_c pushBack "vn_xm177_stock";
_c pushBack "vn_xm177_stock_camo";
_c pushBack "vn_xm177_xm148";
_c pushBack "vn_xm177_xm148_camo";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_m16_20_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m16_20_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m16_30_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m16_30_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m16_40_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m16_40_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_m79";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_40mm_m576_buck_mag";

_c pushBack "vn_m1carbine";
_c pushBack "vn_m1carbine_gl";
_c pushBack "vn_m1_garand";
_c pushBack "vn_m1_garand_gl";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_carbine_15_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_15_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_30_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_30_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_22mm_m1a2_frag_mag";
_c pushBack "vn_22mm_m17_frag_mag";
_c pushBack "vn_22mm_m9_heat_mag";
_c pushBack "vn_22mm_m19_wp_mag";
_c pushBack "vn_22mm_cs_mag";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_22mm_lume_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_22mm_m22_smoke_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5,1] call CTI_CO_FNC_GetCalculatedItemPrize);

//1949–1973
_c pushBack "vn_mat49";
_c pushBack "vn_mat49_f";
_c pushBack "vn_mat49_vc";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_mat49_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_mat49_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1945 - 1964
_c pushBack "vn_m45";
_c pushBack "vn_m45_camo";
_c pushBack "vn_m45_fold";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_m45_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,36,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m45_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,36,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1942 - 1960
_c pushBack "vn_m2carbine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m2carbine_gl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_30_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_30_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_15_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_carbine_15_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(762*33)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "vn_rpg2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_rpg2_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
//m1897
_c pushBack "vn_b_m1897";
//m1_garand
_c pushBack "vn_b_m1_garand";
//m2carbine
_c pushBack "vn_b_carbine";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//m1911
_c pushBack "vn_s_m1911";
//m16
_c pushBack "vn_o_1x_sp_m16";
//mat49
_c pushBack "vn_s_mat49";
//m45
_c pushBack "vn_s_m45_camo";
_c pushBack "vn_s_m45";
//m1_garand
_c pushBack "vn_o_3x_m84";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "vn_b_uniform_macv_06_08";
_c pushBack "vn_b_uniform_macv_03_08";
_c pushBack "vn_b_uniform_macv_02_08";
_c pushBack "vn_b_uniform_macv_04_08";
_c pushBack "vn_b_uniform_macv_05_08";
_c pushBack "vn_b_uniform_macv_01_08";

_c pushBack "vn_b_uniform_macv_02_02";
_c pushBack "vn_b_uniform_macv_05_01";
_c pushBack "vn_b_uniform_macv_01_01";
_c pushBack "vn_b_uniform_heli_01_01";
_c pushBack "vn_b_uniform_macv_03_01";
_c pushBack "vn_b_uniform_macv_04_01";
_c pushBack "vn_b_uniform_k2b_02_01";
_c pushBack "vn_b_uniform_macv_02_01";
_c pushBack "vn_b_uniform_macv_06_01";

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

_c pushBack "vn_b_vest_usarmy_01";
_c pushBack "vn_b_vest_usarmy_03";
_c pushBack "vn_b_vest_usarmy_02";
_c pushBack "vn_b_vest_aircrew_03";
_c pushBack "vn_b_vest_aircrew_05";
_c pushBack "vn_b_vest_usarmy_12";
_c pushBack "vn_b_vest_usarmy_11";
_c pushBack "vn_b_vest_aircrew_01";
_c pushBack "vn_b_vest_usarmy_14";
_c pushBack "vn_b_vest_usarmy_13";
_c pushBack "vn_b_vest_usarmy_05";
_c pushBack "vn_b_vest_usarmy_06";
_c pushBack "vn_b_vest_usarmy_08";
_c pushBack "vn_b_vest_usarmy_07";
_c pushBack "vn_b_vest_usarmy_09";
_c pushBack "vn_b_vest_usarmy_04";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};


//--------------------------------------------------------------------------------------------------------------------------//
//													Headgear																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "vn_b_beret_01_01";
_c pushBack "vn_b_beret_01_02";
_c pushBack "vn_b_scarf_01_03";
_c pushBack "vn_b_scarf_01_01";
_c pushBack "vn_b_boonie_05_07";
_c pushBack "vn_b_boonie_03_07";
_c pushBack "vn_b_boonie_02_07";
_c pushBack "vn_b_boonie_04_07";
_c pushBack "vn_b_boonie_01_07";
_c pushBack "vn_b_bandana_01";
_c pushBack "vn_b_bandana_07";
_c pushBack "vn_b_headband_01";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_b_helmet_svh4_01_04";
_c pushBack "vn_b_helmet_svh4_02_04";
_c pushBack "vn_b_helmet_svh4_01_01";
_c pushBack "vn_b_helmet_m1_08_02";
_c pushBack "vn_b_helmet_m1_09_02";
_c pushBack "vn_b_helmet_t56_01_02";
_c pushBack "vn_b_helmet_t56_02_03";
_c pushBack "vn_b_helmet_t56_02_01";
_c pushBack "vn_b_helmet_m1_06_01";
_c pushBack "vn_b_helmet_m1_05_01";
_c pushBack "vn_b_helmet_svh4_02_01";
_c pushBack "vn_b_helmet_m1_04_01";
_c pushBack "vn_b_helmet_m1_01_01";
_c pushBack "vn_b_helmet_m1_08_01";
_c pushBack "vn_b_helmet_m1_01_02";
_c pushBack "vn_b_helmet_m1_02_01";
_c pushBack "vn_b_helmet_m1_07_01";
_c pushBack "vn_b_helmet_m1_09_01";
_c pushBack "vn_b_helmet_m1_03_01";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_b_pack_05_02_eng_m16_pl";
_c pushBack "vn_b_pack_05_02_eng_m1_pl";
_c pushBack "vn_b_pack_04_02_m2_pl";
_c pushBack "vn_b_pack_01_02_m79_pl";
_c pushBack "vn_b_pack_02_02_m2_pl";
_c pushBack "vn_b_pack_02_02_m60_pl";
_c pushBack "vn_b_pack_02_02_m1918_pl";
_c pushBack "vn_b_pack_04_02_m1_pl";
_c pushBack "vn_b_pack_lw_07_medic_m16_pl";
_c pushBack "vn_b_pack_m5_medic_m1_pl";
_c pushBack "vn_b_pack_m5_medic_mat49_pl";
_c pushBack "vn_b_pack_01_02_m16_pl";
_c pushBack "vn_b_pack_02_02_m1_pl",
_c pushBack "vn_b_pack_05_02_m1897_pl";
_c pushBack "vn_b_pack_04_02_m45_pl";
_c pushBack "vn_b_pack_01_02_type56_pl";
_c pushBack "vn_b_pack_03_02_xm177_pl";
_c pushBack "vn_b_pack_trp_03_02_m16_pl";
_c pushBack "vn_b_pack_trp_03_02_eng_m16_pl";
_c pushBack "vn_b_pack_lw_04_eng_m1897_pl";
_c pushBack "vn_b_pack_lw_01_m79_pl";
_c pushBack "vn_b_pack_lw_03_m79_pl";
_c pushBack "vn_b_pack_lw_02_m60_pl";
_c pushBack "vn_b_pack_trp_01_02_m60_pl";
_c pushBack "vn_b_pack_lw_01_m21_pl";
_c pushBack "vn_b_pack_m5_01_medic_m16_pl";
_c pushBack "vn_b_pack_trp_02_02_m16_pl";
_c pushBack "vn_b_pack_lw_01_m16_pl";
_c pushBack "vn_b_pack_trp_04_02_m16_pl";
_c pushBack "vn_b_pack_lw_03_m1897_pl";
_c pushBack "vn_b_pack_trp_02_02_m40a1_pl";
_c pushBack "vn_b_pack_lw_06_m16_pl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_b_pack_static_m1919a4_low_01";
_c pushBack "vn_b_pack_static_base_01";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//										Other Items																			//
//--------------------------------------------------------------------------------------------------------------------------//
_tech_level = 0;

_c pushBack "vn_mx991";
_c pushBack "vn_mx991_red";

_c pushBack "vn_mk21_binocs";
_c pushBack "vn_b_aviator";
_c pushBack "vn_b_acc_goggles_01";
_c pushBack "vn_b_acc_m17_01";

_c pushBack "vn_m19_binocs_grn";
_c pushBack "vn_m19_binocs_grey";
_c pushBack "vn_b_item_map";
_c pushBack "vn_b_item_compass";
_c pushBack "vn_b_item_watch";
_c pushBack "vn_b_item_radio_urc10";
_c pushBack "vn_b_item_firstaidkit";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.2] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "vn_p38s";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m10_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_type56";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_type56_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_type56_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//	1959 - 1964
_c pushBack "vn_m14";
_c pushBack "vn_m14_camo";
_c pushBack "vn_m14a1";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_m14_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m14_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m14_10_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m14_10_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_m1928_tommy";
_c pushBack "vn_m1928a1_tommy";
_c pushBack "vn_m1a1_tommy";
_c pushBack "vn_m1a1_tommy_so";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_m1928_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1928_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1a1_20_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1a1_20_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1a1_30_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1a1_30_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(1143*23)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_m1918";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1918_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m1918_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*63)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_m72";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m72_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//

//type56
_c pushBack "vn_b_type56";
//M14
_c pushBack "vn_b_m14";
_c pushBack "vn_b_camo_m14";
_c pushBack "vn_bipod_m14";
//m1918
_c pushBack "vn_bipod_m1918";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//M14
_c pushBack "vn_s_m14";
//m16
_c pushBack "vn_o_4x_m16";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "vn_m10";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m10_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6,(900*29)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1952–1957
_c pushBack "vn_m60";
_c pushBack "vn_m60_shorty";
_c pushBack "vn_m60_shorty_camo";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_m60_100_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1966
_c pushBack "vn_m40a1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m40a1_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m40a1_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m40a1_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "vn_m3carbine";		//NVG
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);



//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//

//M40
_c pushBack "vn_b_camo_m40a1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//M10
_c pushBack "vn_s_mk22";
//M14
_c pushBack "vn_o_9x_m14";
_c pushBack "vn_o_anpvs2_m14";
//m16
_c pushBack "vn_o_9x_m16";
_c pushBack "vn_o_anpvs2_m16";
//M40
_c pushBack "vn_s_m14";
_c pushBack "vn_o_9x_m40a1";
_c pushBack "vn_o_anpvs2_m40a1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_US_SOG.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_US_SOG.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
