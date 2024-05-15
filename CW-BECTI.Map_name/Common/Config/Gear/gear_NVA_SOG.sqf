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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "vn_rdg2_mag";
_c pushBack "vn_t67_grenade_mag";
_c pushBack "vn_rg42_grenade_mag";
_c pushBack "vn_20mm_f1n60_frag_mag";
_c pushBack "vn_20mm_kgn_frag_mag";
_c pushBack "vn_20mm_pgn60_heat_mag";
_c pushBack "vn_20mm_dgn_wp_mag";
_c pushBack "vn_22mm_cs_mag";
_c pushBack "vn_22mm_m19_wp_mag";
_c pushBack "vn_22mm_m22_smoke_mag";
_c pushBack "vn_22mm_m60_heat_mag";
_c pushBack "vn_22mm_m60_frag_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

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

_c pushBack "vn_sks";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_sks_gl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_sks_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_sks_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_rpg7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_rpg7_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_pm";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_fkb1_pm";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_pm_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_tt33";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_tt33_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_vz54";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m38_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_m38_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
//SKS
_c pushBack "vn_b_sks";
//vz54
_c pushBack "vn_b_camo_vz54";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//SKS
_c pushBack "vn_o_3x_m9130";
//PM
_c pushBack "vn_s_pm";
//vz54
_c pushBack "vn_o_3x_vz54";
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

_c pushBack "vn_o_uniform_nva_army_02_01";
_c pushBack "vn_o_uniform_nva_army_04_01";
_c pushBack "vn_o_uniform_nva_army_01_01";
_c pushBack "vn_o_uniform_nva_army_09_01";
_c pushBack "vn_o_uniform_nva_army_12_01";
_c pushBack "vn_o_uniform_nva_army_03_01";

_c pushBack "vn_o_uniform_nva_army_05_03";
_c pushBack "vn_o_uniform_nva_army_06_03";
_c pushBack "vn_o_uniform_nva_army_02_03";
_c pushBack "vn_o_uniform_nva_army_04_03";
_c pushBack "vn_o_uniform_nva_army_07_03";
_c pushBack "vn_o_uniform_nva_army_11_03";
_c pushBack "vn_o_uniform_nva_army_10_03";
_c pushBack "vn_o_uniform_nva_army_08_03";
_c pushBack "vn_o_uniform_nva_army_01_03";
_c pushBack "vn_o_uniform_nva_army_03_03";
_c pushBack "vn_o_uniform_nva_army_09_03";
_c pushBack "vn_o_uniform_nva_army_12_03";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Headgear																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "vn_o_cap_01";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_o_helmet_nva_08";
_c pushBack "vn_o_helmet_tsh3_02";
_c pushBack "vn_o_helmet_tsh3_01";
_c pushBack "vn_o_helmet_nva_06";
_c pushBack "vn_o_helmet_nva_03";
_c pushBack "vn_o_helmet_nva_04";
_c pushBack "vn_o_helmet_nva_09";
_c pushBack "vn_o_helmet_nva_02";
_c pushBack "vn_o_helmet_nva_07";
_c pushBack "vn_o_helmet_nva_10";
_c pushBack "vn_o_helmet_nva_05";
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

_c pushBack "vn_o_vest_02";
_c pushBack "vn_o_vest_07";
_c pushBack "vn_o_vest_06";
_c pushBack "vn_o_vest_03";
_c pushBack "vn_o_vest_vc_01";
_c pushBack "vn_o_vest_01";
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

_c pushBack "vn_o_pack_03_rpg7_sks_pl";
_c pushBack "vn_o_pack_04_sks_pl";
_c pushBack "vn_o_pack_04_rpd_pl";
_c pushBack "vn_o_pack_06_sks_pl";
_c pushBack "vn_o_pack_02_medic_ppsh_pl";
_c pushBack "vn_o_pack_08";
_c pushBack "vn_o_pack_02_ppsh_pl";
_c pushBack "vn_o_pack_02_sks_pl";
_c pushBack "vn_o_pack_05_type56_pl";
_c pushBack "vn_o_pack_t884_ppsh_01_pl";
_c pushBack "vn_o_pack_02_eng_ppsh_pl";
_c pushBack "vn_o_pack_03_sa7_sks_pl";
_c pushBack "vn_o_pack_static_at3_01";
_c pushBack "vn_o_pack_04_kbkg_pl";
_c pushBack "vn_o_pack_06_m38_pl";
_c pushBack "vn_o_pack_02_medic_pps_pl";
_c pushBack "vn_o_pack_01_ppsh_pl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "vn_o_pack_static_type63_01";
_c pushBack "vn_o_pack_static_base_01";
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

_c pushBack "vn_fkb1";
_c pushBack "vn_fkb1_red";

_c pushBack "vn_o_acc_goggles_01";
_c pushBack "vn_m19_binocs_grn";

_c pushBack "vn_o_item_map";
_c pushBack "vn_b_item_compass";
_c pushBack "vn_b_item_watch";
_c pushBack "vn_o_item_radio_m252";
_c pushBack "vn_o_item_firstaidkit";

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

_c pushBack "vn_pps43";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_pps52";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_pps_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,35,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_pps_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,35,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_rpd";
_c pushBack "vn_rpd_shorty_01";
_c pushBack "vn_rpd_shorty";
//set all other vars in a slope
_price = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _price;
};
_c pushBack "vn_rpd_100_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_rpd_125_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,125,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "vn_type56";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_type56_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_type56_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "vn_b_type56";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);


//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "vn_sa7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_sa7_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "vn_sa7b";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_sa7b_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "vn_ppsh41";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_ppsh41_35_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,35,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_ppsh41_35_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,35,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_ppsh41_71_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,71,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_ppsh41_71_t_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,71,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);

//1960
_c pushBack "vn_kbkg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_kbkg_gl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "vn_kbkg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_NVA_SOG.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_NVA_SOG.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
