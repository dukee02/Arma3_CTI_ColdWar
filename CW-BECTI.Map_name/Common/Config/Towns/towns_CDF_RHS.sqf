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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_CDF_RHS.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 3: {//Jungle
			INFANTRY = [[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier", _sid],1],[format["rhsgref_cdf%1_para_grenadier", _sid],1],[format["rhsgref_cdf%1_para_grenadier", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1]];
		};
		default {
			INFANTRY = [[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier", _sid],1],[format["rhsgref_cdf%1_reg_grenadier", _sid],1],[format["rhsgref_cdf%1_reg_grenadier", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 3: {//Jungle
			INFANTRY = [[format["rhsgref_cdf%1_ngd_squadleader", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_ngd_squadleader", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier", _sid],1],[format["rhsgref_cdf%1_ngd_machinegunner", _sid],1],[format["rhsgref_cdf%1_ngd_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_ngd_squadleader", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["rhsgref_cdf%1_para_squadleader", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_para_squadleader", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier", _sid],1],[format["rhsgref_cdf%1_para_machinegunner", _sid],1],[format["rhsgref_cdf%1_para_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_para_squadleader", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1]];
		};
		default {
			INFANTRY = [[format["rhsgref_cdf%1_reg_squadleader", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_reg_squadleader", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier", _sid],1],[format["rhsgref_cdf%1_reg_machinegunner", _sid],1],[format["rhsgref_cdf%1_reg_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_reg_squadleader", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 3: {//Jungle
			INFANTRY = [[format["rhsgref_cdf%1_ngd_officer", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_ngd_officer", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier", _sid],1],[format["rhsgref_cdf%1_ngd_machinegunner", _sid],1],[format["rhsgref_cdf%1_ngd_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_ngd_officer", _sid],1],[format["rhsgref_cdf%1_ngd_medic", _sid],1],[format["rhsgref_cdf%1_ngd_rifleman", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid],1]];
		};
		case 4: {//Urban US
			INFANTRY = [[format["rhsgref_cdf%1_para_officer", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_para_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_para_officer", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier", _sid],1],[format["rhsgref_cdf%1_para_machinegunner", _sid],1],[format["rhsgref_cdf%1_para_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_para_officer", _sid],1],[format["rhsgref_cdf%1_para_medic", _sid],1],[format["rhsgref_cdf%1_para_rifleman", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_para_grenadier_rpg", _sid],1]];
		};
		default {
			INFANTRY = [[format["rhsgref_cdf%1_reg_officer", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1],[format["rhsgref_cdf%1_reg_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["rhsgref_cdf%1_reg_officer", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier", _sid],1],[format["rhsgref_cdf%1_reg_machinegunner", _sid],1],[format["rhsgref_cdf%1_reg_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["rhsgref_cdf%1_reg_officer", _sid],1],[format["rhsgref_cdf%1_reg_medic", _sid],1],[format["rhsgref_cdf%1_reg_rifleman", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1],[format["rhsgref_cdf%1_reg_grenadier_rpg", _sid],1]];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["rhsgref_cdf%1_gaz66", _sid],1]];
	WHEELED_HEAVY = [[format["rhsgref_cdf%1_gaz66", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["rhsgref_cdf%1_reg_uaz_ags", _sid],1],[format["rhsgref_cdf%1_reg_uaz_dshkm", _sid],1]];
	WHEELED_HEAVY = [[format["rhsgref_cdf%1_reg_uaz_spg9", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["rhsgref_cdf%1_reg_uaz_spg9", _sid],1];
	WHEELED_HEAVY = [[format["rhsgref_BRDM2%1", _sid],1]];
	WHEELED_HEAVY pushBack [format["rhsgref_BRDM2UM%1", _sid],1];
	WHEELED_HEAVY pushBack [format["rhsgref_cdf%1_btr60", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["rhsgref_cdf%1_reg_BM21", _sid],1];
	WHEELED_HEAVY pushBack [format["rhsgref_BRDM2_ATGM%1", _sid],1];
	WHEELED_HEAVY pushBack [format["rhsgref_cdf%1_btr70", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY = [[format["rhsgref_cdf%1_btr80", _sid],1]];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["rhsgref_cdf%1_bmd1", _sid],1]];
	TRACKED_MEDIUM = [[format["rhsgref_cdf%1_bmd1k", _sid],1]];
	TRACKED_HEAVY = [[format["rhsgref_cdf%1_bmd1pk", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT pushBack [format["rhsgref_cdf%1_bmd1p", _sid],1];
	TRACKED_MEDIUM = [[format["rhsgref_cdf%1_bmp1", _sid],1]];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp1d", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp1k", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp1p", _sid],1];
	TRACKED_HEAVY = TRACKED_MEDIUM;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT pushBack [format["rhsgref_cdf%1_bmd2", _sid],1];
	TRACKED_LIGHT pushBack [format["rhsgref_cdf%1_bmd2k", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp2e", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp2", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp2d", _sid],1];
	TRACKED_MEDIUM pushBack [format["rhsgref_cdf%1_bmp2k", _sid],1];
	TRACKED_HEAVY = [[format["rhsgref_cdf%1_t72ba_tv", _sid],1]];
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_2s1_at", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_t72bb_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_t80b_tv", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_t80bv_tv", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_t80u_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["rhsgref_cdf%1_t80uk_tv", _sid],1];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["RHS_AN2_B", _sid],1]];
	AIR_FIGHTER = [[format["RHS_AN2_B", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["rhsgref_cdf%1_reg_Mi8amt", _sid],1]];
	AIR_FIGHTER = [[format["RHS_AN2_B", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["rhsgref_cdf%1_reg_Mi17Sh", _sid],1]];
	if(_side == west) then {
		AIR_FIGHTER = [[format["rhs_l159_cdf%1_CDF", _sid],1]];
		AIR_FIGHTER pushBack [format["rhs_l39_cdf%1_cdf", _sid],1];
	} else {
		AIR_FIGHTER = [[format["rhs_l159_cdf%1", _sid],1]];
		AIR_FIGHTER pushBack [format["rhs_l39_cdf%1", _sid],1];
	};
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["rhsgref_cdf%1_Mi24D", _sid],1];
	AIR_BOMBER pushBack [format["rhsgref_cdf%1_Mi24D_Early", _sid],1];
	AIR_BOMBER pushBack [format["rhsgref_cdf%1_Mi35", _sid],1];
	AIR_FIGHTER pushBack [format["rhsgref_cdf%1_mig29s", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["rhsgref_cdf%1_su25", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["rhsgref_b_mi24g_CAS", _sid],1];
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["rhsgref_cdf%1_gaz66_zu23", _sid], 1, 20]];
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["rhsgref_cdf%1_ural_Zu23", _sid], 1, 40];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["rhsgref_cdf%1_zsu234", _sid], 1, 40];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};