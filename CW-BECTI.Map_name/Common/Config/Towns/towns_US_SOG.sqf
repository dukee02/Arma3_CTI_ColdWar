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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		INFANTRY = [[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_06", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_14", _sid],1],[format["%1vn_b_men_cidg_14", _sid],1],[format["%1vn_b_men_cidg_19", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_06", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_03", _sid],1],[format["%1vn_b_men_cidg_03", _sid],1],[format["%1vn_b_men_cidg_08", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_06", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_17", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		INFANTRY = [[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_16", _sid],1],[format["%1vn_b_men_army_18", _sid],1],[format["%1vn_b_men_army_19", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_20", _sid],1],[format["%1vn_b_men_army_20", _sid],1],[format["%1vn_b_men_army_21", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_17", _sid],1],[format["%1vn_b_men_army_17", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		INFANTRY = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_14", _sid],1],[format["%1vn_b_men_cidg_14", _sid],1],[format["%1vn_b_men_cidg_12", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_05", _sid],1],[format["%1vn_b_men_cidg_15", _sid],1],[format["%1vn_b_men_cidg_16", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_17", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		INFANTRY = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_16", _sid],1],[format["%1vn_b_men_army_18", _sid],1],[format["%1vn_b_men_army_10", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_20", _sid],1],[format["%1vn_b_men_army_06", _sid],1],[format["%1vn_b_men_army_27", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_12", _sid],1],[format["%1vn_b_men_army_12", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		INFANTRY = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_04", _sid],1],[format["%1vn_b_men_cidg_21", _sid],1],[format["%1vn_b_men_cidg_12", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_05", _sid],1],[format["%1vn_b_men_cidg_15", _sid],1],[format["%1vn_b_men_cidg_16", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_cidg_01", _sid],1],[format["%1vn_b_men_cidg_02", _sid],1],[format["%1vn_b_men_cidg_07", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_11", _sid],1],[format["%1vn_b_men_cidg_17", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		INFANTRY = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_09", _sid],1],[format["%1vn_b_men_army_11", _sid],1],[format["%1vn_b_men_army_10", _sid],1]];
		INFANTRY_MG = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_20", _sid],1],[format["%1vn_b_men_army_06", _sid],1],[format["%1vn_b_men_army_27", _sid],1]];
		INFANTRY_AT = [[format["%1vn_b_men_army_02", _sid],1],[format["%1vn_b_men_army_03", _sid],1],[format["%1vn_b_men_army_15", _sid],1],[format["%1vn_b_men_army_07", _sid],1],[format["%1vn_b_men_army_12", _sid],1],[format["%1vn_b_men_army_12", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = INFANTRY;
	WHEELED_HEAVY = [[format["%1vn_b_wheeled_m274_mg_03_01", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m274_mg_02_01", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m274_mg_01_01", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m151_mg_02", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m151_mg_06", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m151_mg_03", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m151_mg_04", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m54_mg_01", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m54_mg_03", _sid],1];
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m54_mg_02", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1vn_b_wheeled_m151_mg_05", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = INFANTRY_MG;
	TRACKED_MEDIUM = [[format["%1vn_b_armor_m113_acav_01", _sid],1]];
	TRACKED_MEDIUM pushBack [format["%1vn_b_armor_m113_acav_02", _sid],1];
	TRACKED_HEAVY = [[format["%1vn_b_armor_m113_acav_03", _sid],1]];
	TRACKED_HEAVY pushBack [format["%1vn_b_armor_m113_acav_05", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_MEDIUM pushBack [format["%1vn_b_armor_m113_acav_04", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1vn_b_armor_m113_acav_06", _sid],1];
	TRACKED_HEAVY pushBack [format["%1vn_b_armor_m125_01", _sid],1];
	TRACKED_HEAVY pushBack [format["%1vn_b_armor_m132_01", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	TRACKED_MEDIUM append TRACKED_HEAVY;
	TRACKED_HEAVY = [[format["%1vn_b_armor_m67_01_01", _sid],1]];
	TRACKED_HEAVY pushBack [format["%1vn_b_armor_m41_01_01", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1vn_b_armor_m48_01_01", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = INFANTRY;
	AIR_FIGHTER = [[format["%1vn_b_air_ch34_03_01", _sid],1]];
	//AIR_BOMBER pushBack [format["%1vn_b_air_ch34_01_01", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1vn_b_air_ch34_04_01", _sid],1]];
	//AIR_BOMBER pushBack [format["%1vn_b_air_oh6a_06", _sid],1];
	AIR_BOMBER pushBack [format["%1vn_b_air_oh6a_03", _sid],1];
	//AIR_BOMBER pushBack [format["%1vn_b_air_oh6a_02", _sid],1];
	AIR_BOMBER pushBack [format["%1vn_b_air_uh1e_02_04", _sid],1];
	//AIR_BOMBER pushBack [format["%1vn_b_air_uh1e_03_04", _sid],1];
	AIR_FIGHTER pushBack [format["%1vn_b_air_f100d_cap", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//AIR_BOMBER pushBack [format["%1vn_b_air_uh1c_05_01", _sid],1];
	//AIR_BOMBER pushBack [format["%1vn_b_air_uh1b_01_04", _sid],1];
	AIR_BOMBER pushBack [format["%1vn_b_air_uh1d_02_04", _sid],1];
	AIR_BOMBER pushBack [format["%1vn_b_air_ch47_01_01", _sid],1];
	//AIR_BOMBER pushBack [format["%1vn_b_air_ch47_02_01", _sid],1];
	AIR_FIGHTER pushBack [format["%1vn_b_air_ah1g_02", _sid],1];
	AIR_FIGHTER pushBack [format["%1vn_b_air_f4c_bmb", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1vn_b_air_ach47_05_01", _sid],1];
	//AIR_BOMBER pushBack [format["%1vn_b_air_ch47_03_01", _sid],1];
};

if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1vn_b_wheeled_m151_mg_03", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_SOG.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};