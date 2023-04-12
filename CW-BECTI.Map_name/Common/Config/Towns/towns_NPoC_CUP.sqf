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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	INFANTRY = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Forester", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
	INFANTRY_MG = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_AKS74", _sid],1],[format["%1CUP_I_GUE_Soldier_AKSU", _sid],1]];
	INFANTRY_AT = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	INFANTRY = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Forester", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
	INFANTRY_MG = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1]];
	INFANTRY_AT = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	INFANTRY = [[format["%1CUP_I_GUE_Commander", _sid],1],[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
	INFANTRY_MG = [[format["%1CUP_I_GUE_Commander", _sid],1],[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1]];
	INFANTRY_AT = [[format["%1CUP_I_GUE_Commander", _sid],1],[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Sniper", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_I_Datsun_PK", _sid],1],[format["%1CUP_I_Datsun_PK_Random", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {	
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_podnos_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_SPG9_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_UB32_NAPA", _sid],1];
	WHEELED_HEAVY = [[format["%1CUP_I_Hilux_armored_DSHKM_NAPA", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_AGS30_NAPA", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_metis_NAPA", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_I_Hilux_MLRS_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_btr60_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_BMP1_NAPA", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_MLRS_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_podnos_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_SPG9_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_UB32_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_BRDM2_NAPA", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_metis_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_BMP1_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_Hilux_armored_BTR60_NAPA", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_I_BRDM2_ATGM_NAPA", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT = [[format["%1CUP_I_MTLB_pk_NAPA", _sid],1]];
	TRACKED_MEDIUM = [[format["%1CUP_I_BMP_HQ_NAPA", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_I_T34_NAPA", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1CUP_I_T55_NAPA", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1CUP_I_T72_NAPA", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1CUP_I_Ural_ZU23_NAPA", _sid],1],[format["%1CUP_I_Hilux_zu23_NAPA", _sid],1]];
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR pushBack [format["%1CUP_I_Datsun_AA", _sid],1];
	ANTI_AIR pushBack [format["%1CUP_I_Datsun_AA_Random", _sid],1];
	ANTI_AIR pushBack [format["%1CUP_I_Hilux_igla_NAPA", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR pushBack [format["%1CUP_I_BRDM2_ATGM_NAPA", _sid],1];
	ANTI_AIR pushBack [format["%1CUP_I_Hilux_armored_igla_NAPA", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};