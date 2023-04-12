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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CWR3.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2;
		case 4: {//desert/urban camo active
			INFANTRY = [[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier82_sapper", _sid],1],[format["%1cwr3_o_soldier82_engineer", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier82", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier82_sapper", _sid],1],[format["%1cwr3_o_soldier82_hg", _sid],1],[format["%1cwr3_o_soldier82_hg", _sid],1],[format["%1cwr3_o_soldier82_hg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier82_sapper", _sid],1],[format["%1cwr3_o_soldier82_aat_rpg7", _sid],1],[format["%1cwr3_o_soldier82_at_rpg7", _sid],1],[format["%1cwr3_o_soldier82_at_rpg7", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier_sapper", _sid],1],[format["%1cwr3_o_soldier_engineer", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier_sapper", _sid],1],[format["%1cwr3_o_soldier_hg", _sid],1],[format["%1cwr3_o_soldier_hg", _sid],1],[format["%1cwr3_o_soldier_hg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier_sapper", _sid],1],[format["%1cwr3_o_soldier_aat_rpg7", _sid],1],[format["%1cwr3_o_soldier_at_rpg7", _sid],1],[format["%1cwr3_o_soldier_at_rpg7", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2;
		case 4: {//desert/urban camo active
			INFANTRY = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_engineer", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier82_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_ar", _sid],1],[format["%1cwr3_o_soldier82_mg", _sid],1],[format["%1cwr3_o_soldier82_mg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_at_rpg18", _sid],1],[format["%1cwr3_o_soldier82_at_rpg7", _sid],1],[format["%1cwr3_o_soldier82_at_rpg7", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_engineer", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_ar", _sid],1],[format["%1cwr3_o_soldier_mg", _sid],1],[format["%1cwr3_o_soldier_mg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_at_rpg18", _sid],1],[format["%1cwr3_o_soldier_at_rpg7", _sid],1],[format["%1cwr3_o_soldier_at_rpg7", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2;
		case 4: {//desert/urban camo active
			INFANTRY = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_engineer", _sid],1],[format["%1cwr3_o_soldier82", _sid],1],[format["%1cwr3_o_soldier_sniper", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_ar", _sid],1],[format["%1cwr3_o_soldier82_mg", _sid],1],[format["%1cwr3_o_soldier82_mg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier82_sl", _sid],1],[format["%1cwr3_o_soldier82_medic", _sid],1],[format["%1cwr3_o_soldier82_gl", _sid],1],[format["%1cwr3_o_soldier82_at_rpg18", _sid],1],[format["%1cwr3_o_soldier82_at_rpg7", _sid],1],[format["%1cwr3_o_soldier82_at_at4", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_engineer", _sid],1],[format["%1cwr3_o_soldier", _sid],1],[format["%1cwr3_o_soldier_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_ar", _sid],1],[format["%1cwr3_o_soldier_mg", _sid],1],[format["%1cwr3_o_soldier_mg", _sid],1]];
			INFANTRY_AT = [[format["%1cwr3_o_soldier_sl", _sid],1],[format["%1cwr3_o_soldier_medic", _sid],1],[format["%1cwr3_o_soldier_gl", _sid],1],[format["%1cwr3_o_soldier_at_rpg18", _sid],1],[format["%1cwr3_o_soldier_at_rpg7", _sid],1],[format["%1cwr3_o_soldier_at_at4", _sid],1]];
		};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1cwr3_o_uaz_dshkm", _sid],1],[format["%1cwr3_o_uaz_ags30", _sid],1]];
	WHEELED_HEAVY = [[format["%1cwr3_o_uaz_spg9", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1cwr3_o_ural_zu23", _sid],1];		
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["%1cwr3_o_uaz_spg9", _sid],1];		
	WHEELED_HEAVY = [[format["%1cwr3_o_brdm2", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1cwr3_o_brdm2um", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1cwr3_o_brdm2_atgm", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1cwr3_o_btr60", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1cwr3_o_btr80", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1cwr3_o_mtlb_pk", _sid],1]];
	TRACKED_MEDIUM = [[format["%1cwr3_o_mtlb_pk", _sid],1]];
	TRACKED_HEAVY = [[format["%1cwr3_o_mtlb_pk", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1cwr3_o_bmp1", _sid],1]];
	TRACKED_LIGHT pushBack [format["%1cwr3_o_bmp1p", _sid],1];
	TRACKED_MEDIUM = [[format["%1cwr3_o_pt76b", _sid],1]];
	TRACKED_HEAVY = [[format["%1cwr3_o_t55", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	TRACKED_LIGHT pushBack [format["%1cwr3_o_bmp2", _sid],1];
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t55a", _sid],1];
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t64b", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t72a", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t55amv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t64bv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1cwr3_o_t72b1", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1cwr3_o_mi8_amt", _sid],1]];
	AIR_FIGHTER = [[format["%1cwr3_o_camel", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1cwr3_o_mi8_mtv3", _sid],1]];
	AIR_BOMBER pushBack [format["%1cwr3_o_mi24p", _sid],1];
	AIR_FIGHTER = [[format["%1cwr3_o_su17m4", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1cwr3_o_mi24d", _sid],1];
	AIR_BOMBER pushBack [format["%1cwr3_o_mi24v", _sid],1];
	AIR_FIGHTER pushBack [format["%1cwr3_o_mig23", _sid],1];
	AIR_FIGHTER pushBack [format["%1cwr3_o_mig27", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["%1cwr3_o_su25", _sid],1];
	AIR_BOMBER pushBack [format["%1cwr3_o_v80", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1cwr3_o_ural_zu23", _sid], 1, 40]];
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1cwr3_o_uaz_aa", _sid], 1, 40]];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["%1cwr3_o_zsu", _sid], 1, 20];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["%1cwr3_o_mtlb_sa13", _sid], 1, 20];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};