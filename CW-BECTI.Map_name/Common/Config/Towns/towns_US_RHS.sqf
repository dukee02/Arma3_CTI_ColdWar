_side = _this;
_sid = "";
_tag = "";
_level = 0;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_tag = "WEST_";};
	case east: {/*_sid = "VIOC_O_";*/_tag = "EAST_";};
	case resistance: {/*_sid = "VIOC_I_";*/_tag = "GUER_";};
	default {};
};
//if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_US_RHS.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_grenadier", _sid],1],[format["%1rhsusf_usmc_marpat_d_grenadier", _sid],1],[format["%1rhsusf_usmc_marpat_d_grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1]];
		};
		case 3: {//Jungle
			INFANTRY = [[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_grenadier", _sid],1],[format["%1rhsusf_usmc_marpat_wd_grenadier", _sid],1],[format["%1rhsusf_usmc_marpat_wd_grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanl", _sid],1],[format["%1rhsusf_army_ucp_riflemanl", _sid],1],[format["%1rhsusf_army_ucp_riflemanl", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_grenadier", _sid],1],[format["%1rhsusf_army_ucp_grenadier", _sid],1],[format["%1rhsusf_army_ucp_grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanl", _sid],1],[format["%1rhsusf_army_ocp_riflemanl", _sid],1],[format["%1rhsusf_army_ocp_riflemanl", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_grenadier", _sid],1],[format["%1rhsusf_army_ocp_grenadier", _sid],1],[format["%1rhsusf_army_ocp_grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_spotter", _sid],1],[format["%1rhsusf_usmc_marpat_d_sniper", _sid],1],[format["%1rhsusf_usmc_marpat_d_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_autorifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_autorifleman_m249", _sid],1],[format["%1rhsusf_usmc_marpat_d_autorifleman_m249_ass", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_d_smaw", _sid],1]];
		};
		case 3: {//Jungle
			INFANTRY = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_spotter", _sid],1],[format["%1rhsusf_usmc_marpat_wd_sniper", _sid],1],[format["%1rhsusf_usmc_marpat_wd_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_autorifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_autorifleman_m249", _sid],1],[format["%1rhsusf_usmc_marpat_wd_autorifleman_m249_ass", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_wd_smaw", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanl", _sid],1],[format["%1rhsusf_army_ucp_sniper", _sid],1],[format["%1rhsusf_army_ucp_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_autoriflemana", _sid],1],[format["%1rhsusf_army_ucp_autorifleman", _sid],1],[format["%1rhsusf_army_ucp_autorifleman", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1],[format["%1rhsusf_army_ucp_maaws", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanl", _sid],1],[format["%1rhsusf_army_ocp_sniper", _sid],1],[format["%1rhsusf_army_ocp_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_autoriflemana", _sid],1],[format["%1rhsusf_army_ocp_autorifleman", _sid],1],[format["%1rhsusf_army_ocp_autorifleman", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1],[format["%1rhsusf_army_ocp_maaws", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_spotter", _sid],1],[format["%1rhsusf_usmc_marpat_d_sniper", _sid],1],[format["%1rhsusf_usmc_marpat_d_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_machinegunner", _sid],1],[format["%1rhsusf_usmc_marpat_d_autorifleman_m249", _sid],1],[format["%1rhsusf_usmc_marpat_d_autorifleman_m249_ass", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_d_officer", _sid],1],[format["%1rhsusf_usmc_marpat_d_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_d_javelin", _sid],1],[format["%1rhsusf_usmc_marpat_d_smaw", _sid],1]];
		};
		case 3: {//Jungle
			INFANTRY = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_spotter", _sid],1],[format["%1rhsusf_usmc_marpat_wd_sniper", _sid],1],[format["%1rhsusf_usmc_marpat_wd_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_machinegunner", _sid],1],[format["%1rhsusf_usmc_marpat_wd_autorifleman_m249", _sid],1],[format["%1rhsusf_usmc_marpat_wd_autorifleman_m249_ass", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_usmc_marpat_wd_officer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_engineer", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid],1],[format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid],1],[format["%1rhsusf_usmc_marpat_wd_javelin", _sid],1],[format["%1rhsusf_usmc_marpat_wd_smaw", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanl", _sid],1],[format["%1rhsusf_army_ucp_sniper", _sid],1],[format["%1rhsusf_army_ucp_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_autoriflemana", _sid],1],[format["%1rhsusf_army_ucp_machinegunner", _sid],1],[format["%1rhsusf_army_ucp_autorifleman", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ucp_officer", _sid],1],[format["%1rhsusf_army_ucp_medic", _sid],1],[format["%1rhsusf_army_ucp_rifleman", _sid],1],[format["%1rhsusf_army_ucp_riflemanat", _sid],1],[format["%1rhsusf_army_ucp_javelin", _sid],1],[format["%1rhsusf_army_ucp_maaws", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanl", _sid],1],[format["%1rhsusf_army_ocp_sniper", _sid],1],[format["%1rhsusf_army_ocp_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_autoriflemana", _sid],1],[format["%1rhsusf_army_ocp_machinegunner", _sid],1],[format["%1rhsusf_army_ocp_autorifleman", _sid],1]];
			INFANTRY_AT = [[format["%1rhsusf_army_ocp_officer", _sid],1],[format["%1rhsusf_army_ocp_medic", _sid],1],[format["%1rhsusf_army_ocp_rifleman", _sid],1],[format["%1rhsusf_army_ocp_riflemanat", _sid],1],[format["%1rhsusf_army_ocp_javelin", _sid],1],[format["%1rhsusf_army_ocp_maaws", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1rhsusf_m998_d_2dr", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhsusf_m998_d_4dr", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT = [[format["%1rhsusf_m998_w_2dr", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhsusf_m998_w_4dr", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1rhsusf_m1025_d_m2", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhsusf_m1025_d_Mk19", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT = [[format["%1rhsusf_m1025_w_m2", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhsusf_m1025_w_mk19", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_m1151_m2crows_usarmy_d", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_m1151_mk19crows_usarmy_d", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_m1151_m2crows_usarmy_wd", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_m1151_mk19crows_usarmy_wd", _sid],1];
	};
	WHEELED_HEAVY = [[format["%1rhsusf_stryker_m1126_m2_wd", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1rhsusf_stryker_m1132_m2_wd", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1220_M153_M2_usarmy_d", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1220_M153_MK19_usarmy_d", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1220_M153_M2_usarmy_wd", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1220_M153_MK19_usarmy_wd", _sid],1];
	};
	WHEELED_HEAVY = [[format["%1rhsusf_stryker_m1134_wd", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1rhsusf_stryker_m1127_m2_wd", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1230_M2_usarmy_d", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1230_MK19_usarmy_d", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1230_M2_usarmy_wd", _sid],1];
		WHEELED_LIGHT pushBack [format["%1rhsusf_M1230_MK19_usarmy_wd", _sid],1];
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113d_usarmy_unarmed", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhsusf_m113d_usarmy_unarmed", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m113d_usarmy_unarmed", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113_usarmy_unarmed", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhsusf_m113_usarmy_unarmed", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m113_usarmy_unarmed", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113d_usarmy_MK19", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhsusf_m113d_usarmy_M240", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m113d_usarmy_MK19", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113_usarmy_MK19", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhsusf_m113_usarmy_M240", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m113_usarmy_MK19", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113d_usarmy_MK19", _sid],1],[format["%1rhsusf_m113d_usarmy_M240", _sid],1]];
		TRACKED_MEDIUM = [[format["%1RHS_M2A2", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m1a1aimd_usarmy", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT = [[format["%1rhsusf_m113_usarmy_MK19", _sid],1],[format["%1rhsusf_m113_usarmy_M240", _sid],1]];
		TRACKED_MEDIUM = [[format["%1RHS_M2A2_wd", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhsusf_m1a1aimwd_usarmy", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A2_BUSKI", _sid],1];
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a1aim_tuski_d", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1d_usarmy", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A2_BUSKI_WD", _sid],1];
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3_wd", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a1aim_tuski_wd", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1wd_usarmy", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3_BUSKI", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1tuskid_usarmy", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep2d_usarmy", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3_BUSKI_wd", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1tuskiwd_usarmy", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep2wd_usarmy", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3_BUSKIII", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1tuskiid_usarmy", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_MEDIUM pushBack [format["%1RHS_M2A3_BUSKIII_wd", _sid],1];
		TRACKED_HEAVY pushBack [format["%1rhsusf_m1a2sep1tuskiiwd_usarmy", _sid],1];
	};
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1RHS_MELB_MH6M", _sid],1]];
	AIR_FIGHTER = [[format["%1RHS_MELB_H6M", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1RHS_MELB_AH6M", _sid],1]];
	AIR_FIGHTER = [[format["%1RHS_MELB_AH6M", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1RHS_UH1Y_FFAR", _sid],1];
	AIR_BOMBER pushBack [format["%1RHS_UH60M_ESSS_d", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1RHS_AH1Z", _sid],1];
	AIR_FIGHTER = [[format["%1RHS_A10", _sid],1]];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1rhsusf_CH53e_USMC_cargo", _sid];
	_c pushBack format["%1rhsusf_CH53E_USMC_GAU21", _sid];
};*/
_matrix_cnt = _matrix_cnt + 1;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1RHS_AH64D", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["%1rhsusf_f22", _sid],1];
};

if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
/*_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USA", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USMC", _sid],1]];
	};
};*/

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1RHS_M6", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		ANTI_AIR = [[format["%1RHS_M6_wd", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};