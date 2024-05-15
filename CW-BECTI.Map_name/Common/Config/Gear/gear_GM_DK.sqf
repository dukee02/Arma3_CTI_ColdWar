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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_DEN_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

//--- Items
_c pushBack "gm_ferod16_des";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ferod16_oli";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ferod16_win";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ge_army_conat2";
_u pushBack 0;
_p pushBack 1;

_c pushBack "gm_watch_kosei_80";
_u pushBack 0;
_p pushBack 1;

/*_c pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;*/

_c pushBack "gm_ge_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_ge_army_gauzeCompress";
_u pushBack 0;
_p pushBack 15;

//--------------------------------------------------------------------------------------------------------------------------//
//													MPs																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_mp5a2_blk";
_c pushBack "gm_mp5a3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_30Rnd_9x19mm_B_DM51_mp5_blk";
_c pushBack "gm_30Rnd_9x19mm_B_DM11_mp5_blk";
_c pushBack "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk";
_c pushBack "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk";
_c pushBack "gm_30Rnd_9x19mm_AP_DM91_mp5_blk";
_c pushBack "gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gvm95_blk";
´´_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_20Rnd_556x45mm_B_M855_stanag_gry";
_c pushBack "gm_20Rnd_556x45mm_B_T_M856_stanag_gry";
_c pushBack "gm_20Rnd_556x45mm_B_M193_stanag_gry";
_c pushBack "gm_30Rnd_556x45mm_B_M193_stanag_gry";
_c pushBack "gm_30Rnd_556x45mm_B_M855_stanag_gry";
_c pushBack "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_m72a3_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_66mm_heat_m72a3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_dk_army_uniform_soldier_84_m84";
_c pushBack "gm_dk_army_uniform_soldier_84_oli";
_c pushBack "gm_dk_army_uniform_soldier_84_win";
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
_c pushBack "gm_dk_army_vest_54_rifleman";
_c pushBack "gm_dk_army_vest_54_machinegunner";
_c pushBack "gm_dk_army_vest_54_crew";
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
_c pushBack "gm_dk_army_backpack_73_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_dk_headgear_hat_boonie_m84";
_c pushBack "gm_dk_headgear_m52_oli";
_c pushBack "gm_dk_headgear_m52_net_oli";
_c pushBack "gm_dk_headgear_m52_net_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													MPs																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_mp5sd2_blk";
_c pushBack "gm_mp5sd3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_gvm75_oli";
_c pushBack "gm_gvm75_blk";
_c pushBack "gm_gvm75_grn";
_c pushBack "gm_gvm75carb_oli";
_c pushBack "gm_gvm75carb_blk";
_c pushBack "gm_gvm75carb_grn";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_DM111_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_DM41_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_DM111_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_DM41_g3_des";
_c pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_des";
_c pushBack "gm_1rnd_67mm_heat_dm22a1_g3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_dk_army_vest_m00_m84";
_c pushBack "gm_dk_army_vest_m00_blu";
_c pushBack "gm_dk_army_vest_m00_win";
_c pushBack "gm_dk_army_vest_m00_wdl";
_c pushBack "gm_dk_army_vest_m00_m84_machinegunner";
_c pushBack "gm_dk_army_vest_m00_win_machinegunner";
_c pushBack "gm_dk_army_vest_m00_m84_rifleman";
_c pushBack "gm_dk_army_vest_m00_win_rifleman";
_c pushBack "gm_dk_army_vest_m00_wdl_rifleman";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_c79a1_blk";
_c pushBack "gm_c79a1_oli";
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
_c pushBack "gm_dk_headgear_m96_oli";
_c pushBack "gm_dk_headgear_m96_blu";
_c pushBack "gm_dk_headgear_m96_cover_m84";
_c pushBack "gm_dk_headgear_m96_cover_wht";
_c pushBack "gm_dk_headgear_m96_cover_wdl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_GM_DK.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_GM_DK.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
