private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_US_ID || CTI_WEST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_US_ID || CTI_EAST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "";_tag = "GUER_";
	};
	default {_sid = "";};
};

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
//Check if the based units have to set.
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_US_ID,(_isThisMain select 1),CTI_RHS_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_RHS.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_riflemanat", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_gunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_grenadier_m32", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_grenadier", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_engineer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_crewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_driver", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_explosives", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_riflemanat", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_engineer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_crewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_driver", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_explosives", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_grenadier", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_grenadier_m32", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_gunner", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_rifleman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_riflemanl", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m16", _sid];
		_c pushBack format["%1rhsusf_army_ucp_riflemanat", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_101st", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_10th", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_1stcav", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_82nd", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_army_ucp_medic", _sid];
		_c pushBack format["%1rhsusf_army_ucp_crewman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_driver", _sid];
		_c pushBack format["%1rhsusf_army_ucp_driver_armored", _sid];
		_c pushBack format["%1rhsusf_army_ucp_engineer", _sid];
		_c pushBack format["%1rhsusf_army_ucp_explosives", _sid];
		_c pushBack format["%1rhsusf_army_ucp_grenadier", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_rifleman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_riflemanl", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_10th", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_1stcav", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m16", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_army_ocp_medic", _sid];
		_c pushBack format["%1rhsusf_army_ocp_crewman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_driver", _sid];
		_c pushBack format["%1rhsusf_army_ocp_driver_armored", _sid];
		_c pushBack format["%1rhsusf_army_ocp_engineer", _sid];
		_c pushBack format["%1rhsusf_army_ocp_explosives", _sid];
		_c pushBack format["%1rhsusf_army_ocp_grenadier", _sid];
		_c pushBack format["%1rhsusf_army_ocp_riflemanat", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_smaw", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman_m249", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman_m249_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_jfo", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_spotter", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_marksman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_helicrew", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_helipilot", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_fso", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_officer", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_smaw", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_jfo", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_fso", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_helicrew", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_helipilot", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman_m249", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman_m249_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_officer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_marksman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_spotter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_autorifleman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_autoriflemana", _sid];
		_c pushBack format["%1rhsusf_army_ucp_maaws", _sid];
		_c pushBack format["%1rhsusf_army_ucp_fso", _sid];
		_c pushBack format["%1rhsusf_army_ucp_helicrew", _sid];
		_c pushBack format["%1rhsusf_army_ucp_helipilot", _sid];
		_c pushBack format["%1rhsusf_army_ucp_ah64_pilot", _sid];
		_c pushBack format["%1rhsusf_army_ucp_jfo", _sid];
		_c pushBack format["%1rhsusf_army_ucp_marksman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_officer", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_autorifleman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_autoriflemana", _sid];
		_c pushBack format["%1rhsusf_army_ocp_maaws", _sid];
		_c pushBack format["%1rhsusf_army_ocp_jfo", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper", _sid];
		_c pushBack format["%1rhsusf_army_ocp_marksman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_ah64_pilot", _sid];
		_c pushBack format["%1rhsusf_army_ocp_helicrew", _sid];
		_c pushBack format["%1rhsusf_army_ocp_helipilot", _sid];
		_c pushBack format["%1rhsusf_army_ocp_fso", _sid];
		_c pushBack format["%1rhsusf_army_ocp_officer", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_machinegunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_machinegunner_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_javelin", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper_m110", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_squadleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_teamleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_stinger", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_machinegunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_machinegunner_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_javelin", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper_m110", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper_M107", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_squadleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_teamleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_stinger", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_machinegunner", _sid];
		_c pushBack format["%1rhsusf_army_ucp_machinegunnera", _sid];
		_c pushBack format["%1rhsusf_army_ucp_javelin", _sid];
		_c pushBack format["%1rhsusf_army_ucp_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper_m24sws", _sid];
		_c pushBack format["%1rhsusf_army_ucp_squadleader", _sid];
		_c pushBack format["%1rhsusf_army_ucp_teamleader", _sid];
		_c pushBack format["%1rhsusf_army_ucp_aa", _sid];
		_c pushBack format["%1rhsusf_army_ucp_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_machinegunner", _sid];
		_c pushBack format["%1rhsusf_army_ocp_machinegunnera", _sid];
		_c pushBack format["%1rhsusf_army_ocp_javelin", _sid];
		_c pushBack format["%1rhsusf_army_ocp_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper_m24sws", _sid];
		_c pushBack format["%1rhsusf_army_ocp_squadleader", _sid];
		_c pushBack format["%1rhsusf_army_ocp_teamleader", _sid];
		_c pushBack format["%1rhsusf_army_ocp_uav", _sid];
		_c pushBack format["%1rhsusf_army_ocp_aa", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m998_d_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_d_2dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_d_2dr_fulltop", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr_fulltop", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m998_w_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_w_2dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_w_2dr_fulltop", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr_fulltop", _sid];
	};
	_c pushBack format["%1rhsusf_m1025_d", _sid];
	_c pushBack format["%1rhsusf_m1043_d", _sid];
	_c pushBack format["%1rhsusf_mrzr4_d", _sid];
	if(CTI_ADDON_CHARLIECO > 0) then {
		_c pushBack format["%1chvsavar_ivecoar", _sid];				//medic
		_c pushBack format["%1chmaster2_ap", _sid];				//medic
	} else {
		_c pushBack format["%1rhsgref_cdf_b_gaz66_ap2", _sid];//Medic
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m966_d", _sid];
		_c pushBack format["%1rhsusf_m1025_d_m2", _sid];
		_c pushBack format["%1rhsusf_m1025_d_Mk19", _sid];
		_c pushBack format["%1rhsusf_m1043_d_m2", _sid];
		_c pushBack format["%1rhsusf_m1043_d_mk19", _sid];
		_c pushBack format["%1rhsusf_m1045_d", _sid];
		_c pushBack format["%1rhsusf_m1151_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_rsv_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_sicps_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1165_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m966_w", _sid];
		_c pushBack format["%1rhsusf_m1025_w_m2", _sid];
		_c pushBack format["%1rhsusf_m1025_w_mk19", _sid];
		_c pushBack format["%1rhsusf_m1025_w", _sid];
		_c pushBack format["%1rhsusf_m1043_w_m2", _sid];
		_c pushBack format["%1rhsusf_m1043_w_mk19", _sid];
		_c pushBack format["%1rhsusf_m1043_w", _sid];
		_c pushBack format["%1rhsusf_m1045_w", _sid];
		_c pushBack format["%1rhsusf_m1151_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_rsv_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_sicps_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1165_usarmy_wd", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1117_D", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_lras3_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v1_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1117_W", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_lras3_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v2_usarmy_wd", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M142_usarmy_D", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1R_SOV_M2_D_fmtv_socom", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_D_flatbed_fmtv_usarmy", _sid];
		//_c pushBack format["%1rhsusf_M1084A1P2_B_D_fmtv_usarmy", _sid];			//salvager
		_c pushBack format["%1rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1151_m2crows_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19crows_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1239_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_m134d_m240_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_m2_m240_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_mk19_m240_socom_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M142_usarmy_WD", _sid];
		_c pushBack format["%1rhsusf_M977A4_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M978A4_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy", _sid];
		//_c pushBack format["%1rhsusf_M1084A1P2_WD_fmtv_usarmy", _sid];			//salvager
		_c pushBack format["%1rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1151_m2crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_usarmy_wd", _sid];
	};
	_c pushBack format["%1rhsusf_stryker_m1126_mk19_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1132_m2_np_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1132_m2_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1126_m2_wd", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M977A4_BKIT_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1R_SOV_M2_D_fmtv_socom", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_M2_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_Mk19_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_M2_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_MK19_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_M2_Deploy_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_MK19_Deploy_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2crows_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19crows_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M977A4_BKIT_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19crows_usarmy_wd", _sid];
	};
	_c pushBack format["%1rhsusf_stryker_m1134_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1127_m2_wd", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1230_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1230_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1237_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1237_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1230a1_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1230_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1230_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1237_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1237_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1230a1_usarmy_wd", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy_unarmed", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy_unarmed", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy", _sid];
		_c pushBack format["%1rhsusf_m113d_usarmy_M240", _sid];
		_c pushBack format["%1rhsusf_m113d_usarmy_MK19", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_M2_90", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_M240", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_MK19", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_MK19_90", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy_medical", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy_medical", _sid];
	};                    
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m109d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m109_usarmy", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A2", _sid];
		_c pushBack format["%1RHS_M6", _sid];
		_c pushBack format["%1rhsusf_m1a1aimd_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A2_wd", _sid];
		_c pushBack format["%1RHS_M6_wd", _sid];
		_c pushBack format["%1rhsusf_m1a1aimwd_usarmy", _sid];
	};
};


_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A2_BUSKI", _sid];
		_c pushBack format["%1RHS_M2A3", _sid];
		_c pushBack format["%1rhsusf_m1a1aim_tuski_d", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A2_BUSKI_WD", _sid];
		_c pushBack format["%1RHS_M2A3_wd", _sid];
		_c pushBack format["%1rhsusf_m1a1aim_tuski_wd", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1wd_usarmy", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A3_BUSKI", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1tuskid_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1a2sep2d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A3_BUSKI_wd", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1tuskiwd_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1a2sep2wd_usarmy", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A3_BUSKIII", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1tuskiid_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A3_BUSKIII_wd", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1tuskiiwd_usarmy", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_MELB_MH6M", _sid];
	_c pushBack format["%1RHS_MELB_H6M", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_MELB_AH6M", _sid];
	_c pushBack format["%1RHS_UH1Y_UNARMED", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_CH_47F_10", _sid];
	_c pushBack format["%1RHS_CH_47F_10_cargo", _sid];
	_c pushBack format["%1RHS_UH1Y_FFAR", _sid];
	_c pushBack format["%1RHS_UH1Y", _sid];
	_c pushBack format["%1RHS_UH60M_ESSS_d", _sid];
	_c pushBack format["%1RHS_UH60M2_d", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_C130J", _sid];
	_c pushBack format["%1RHS_C130J_Cargo", _sid];
	_c pushBack format["%1RHS_UH60M_d", _sid];
	_c pushBack format["%1RHS_UH60M_MEV2_d", _sid];
	_c pushBack format["%1RHS_UH60M_MEV_d", _sid];
	_c pushBack format["%1RHS_AH1Z", _sid];
	_c pushBack format["%1RHS_A10", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1rhsusf_CH53e_USMC_cargo", _sid];
	_c pushBack format["%1rhsusf_CH53E_USMC_GAU21", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_AH64D", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1rhsusf_f22", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	//_c pushBack format["%1rhsusf_M977A4_usarmy_d", _sid];
	//_c pushBack format["%1rhsusf_M977A4_usarmy_wd", _sid];
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_d", _sid];			//Repairtruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_wd", _sid];				//Repairtruck
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d", _sid];			//Repairtruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", _sid];				//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_d", _sid];			//Ammotruck
	_c pushBack format["%1rhsusf_M978A4_usarmy_d", _sid];		//Fueltruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_wd", _sid];					//Ammotruck
	_c pushBack format["%1rhsusf_M978A4_usarmy_wd", _sid];				//Fueltruck
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d", _sid];			//Ammotruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", _sid];					//Ammotruck
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_m113d_usarmy_supply", _sid];//Ammotruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 2: {//desert camo active
				_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman", _sid];
				_c pushBack format["%1rhsusf_usmc_marpat_d_crewman", _sid];
			};
			case 3: {//jungle camo active
				_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman", _sid];
				_c pushBack format["%1rhsusf_usmc_marpat_wd_crewman", _sid];
			};
			case 4: {//urban camo active
				_c pushBack format["%1rhsusf_army_ucp_rifleman", _sid];
				_c pushBack format["%1rhsusf_army_ucp_crewman", _sid];
			};
			default {//main camo active
				_c pushBack format["%1rhsusf_army_ocp_rifleman", _sid];
				_c pushBack format["%1rhsusf_army_ocp_crewman", _sid];
			};	
		};
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m998_d_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m998_w_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_d", _sid];			//Repairtruck
			_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_d", _sid];				//Ammotruck
			_c pushBack format["%1rhsusf_M978A4_usarmy_d", _sid];					//Fueltruck
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
			_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_wd", _sid];			//Repairtruck
			_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_wd", _sid];				//Ammotruck
			_c pushBack format["%1rhsusf_M978A4_usarmy_wd", _sid];					//Fueltruck
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_u pushBack format["%1O_Boat_Transport_01_F", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_RHS.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
