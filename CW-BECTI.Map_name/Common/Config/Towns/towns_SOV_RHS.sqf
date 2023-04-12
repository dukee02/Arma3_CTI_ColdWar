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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_at", _sid],1],[format["%1rhs_vdv_des_at", _sid],1],[format["%1rhs_vdv_des_at", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_at", _sid],1],[format["%1rhs_vdv_at", _sid],1],[format["%1rhs_vdv_at", _sid],1]];
		};
		case 4: {//urban camo active
		INFANTRY = [[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_mflora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_mflora_grenadier_rpg", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_flora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_flora_grenadier_rpg", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhs_vdv_des_sergeant", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_des_sergeant", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1],[format["%1rhs_vdv_des_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_des_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_des_sergeant", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_LAT", _sid],1],[format["%1rhs_vdv_des_at", _sid],1],[format["%1rhs_vdv_des_at", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1rhs_vdv_sergeant", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_sergeant", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1],[format["%1rhs_vdv_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_sergeant", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_LAT", _sid],1],[format["%1rhs_vdv_at", _sid],1],[format["%1rhs_vdv_at", _sid],1]];
		};
		case 4: {//urban camo active
		INFANTRY = [[format["%1rhs_vdv_mflora_sergeant", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_mflora_sergeant", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_mflora_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_mflora_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_mflora_sergeant", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_LAT", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1rhs_vdv_flora_sergeant", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_flora_sergeant", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_flora_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_flora_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_flora_sergeant", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_LAT", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1rhs_vdv_des_officer", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman_lite", _sid],1],[format["%1rhs_vdv_des_marksman", _sid],1],[format["%1rhs_vdv_des_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_des_officer", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1],[format["%1rhs_vdv_des_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_des_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_des_officer", _sid],1],[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_LAT", _sid],1],[format["%1rhs_vdv_des_at", _sid],1],[format["%1rhs_vdv_des_at", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1rhs_vdv_officer", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman_lite", _sid],1],[format["%1rhs_vdv_marksman", _sid],1],[format["%1rhs_vdv_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_officer", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1],[format["%1rhs_vdv_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_officer", _sid],1],[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_LAT", _sid],1],[format["%1rhs_vdv_at", _sid],1],[format["%1rhs_vdv_at", _sid],1]];
		};
		case 4: {//urban camo active
		INFANTRY = [[format["%1rhs_vdv_mflora_officer", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_rifleman_lite", _sid],1],[format["%1rhs_vdv_mflora_marksman", _sid],1],[format["%1rhs_vdv_mflora_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_mflora_officer", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_mflora_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_mflora_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_mflora_officer", _sid],1],[format["%1rhs_vdv_mflora_medic", _sid],1],[format["%1rhs_vdv_mflora_rifleman", _sid],1],[format["%1rhs_vdv_mflora_LAT", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1],[format["%1rhs_vdv_mflora_at", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1rhs_vdv_flora_officer", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_rifleman_lite", _sid],1],[format["%1rhs_vdv_flora_marksman", _sid],1],[format["%1rhs_vdv_flora_marksman", _sid],1]];
			INFANTRY_MG = [[format["%1rhs_vdv_flora_officer", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_grenadier_rpg", _sid],1],[format["%1rhs_vdv_flora_machinegunner_assistant", _sid],1],[format["%1rhs_vdv_flora_machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1rhs_vdv_flora_officer", _sid],1],[format["%1rhs_vdv_flora_medic", _sid],1],[format["%1rhs_vdv_flora_rifleman", _sid],1],[format["%1rhs_vdv_flora_LAT", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1],[format["%1rhs_vdv_flora_at", _sid],1]];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_gaz66_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_gaz66_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_btr60_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_btr60_vdv", _sid],1],[format["%1rhs_btr60_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_btr60_vdv", _sid],1],[format["%1rhs_btr70_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_btr60_vdv", _sid],1],[format["%1rhs_btr70_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1]];
	WHEELED_HEAVY = [[format["%1rhs_btr70_vdv", _sid],1],[format["%1rhs_btr80_vdv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1rhs_tigr_sts_vdv", _sid],1],[format["%1rhs_tigr_m_vdv", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1rhs_btr80a_vdv", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT = [[format["%1rhs_brm1k_tv", _sid],1]];
	TRACKED_MEDIUM = [[format["%1rhs_bmd1k", _sid],1]];
	TRACKED_HEAVY = [[format["%1rhs_bmd1pk", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT pushBack [format["%1rhs_bmd1k", _sid],1];
	TRACKED_LIGHT pushBack [format["%1rhs_bmd1pk", _sid],1];
	TRACKED_MEDIUM = [[format["%1rhs_bmp1_tv", _sid],1]];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp1d_tv", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp1k_tv", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp1p_tv", _sid],1];
	TRACKED_HEAVY = [[format["%1rhs_bmp1p_tv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT pushBack [format["%1rhs_bmd2", _sid],1];
	TRACKED_LIGHT pushBack [format["%1rhs_bmd2k", _sid],1];
	TRACKED_LIGHT pushBack [format["%1rhs_bmd2m", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp2e_tv", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp2d_tv", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp2k_tv", _sid],1];
	TRACKED_HEAVY = [[format["%1rhs_t72ba_tv", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM pushBack [format["%1rhs_bmp2_tv", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1rhs_sprut_vdv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t72bb_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80b", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80bk", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT pushBack [format["%1rhs_bmd4_vdv", _sid],1];
	TRACKED_LIGHT pushBack [format["%1rhs_bmd4m_vdv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t72bc_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80a", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80bv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80bvk", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t90_tv", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT pushBack [format["%1rhs_bmd4ma_vdv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t90a_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t90saa_tv", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1rhs_t72bd_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t72be_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80u", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80u45m", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80ue1", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80uk", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t80um", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t90sab_tv", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1rhs_t90am_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t90sm_tv", _sid],1];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM pushBack [format["%1rhs_t15_tv", _sid],1];
	TRACKED_HEAVY pushBack [format["%1rhs_t14_tv", _sid],1];
};*/

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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1RHS_Mi8mt_vvs", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1RHS_Mi8MTV3_vvs", _sid],1]];
	AIR_FIGHTER = [[format["%1RHS_Mi24P_vvs", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1RHS_Mi24P_vvs", _sid],1];
	AIR_FIGHTER = [[format["%1rhs_mig29s_vvs", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1rhs_ka60_grey", _sid],1];
	AIR_BOMBER pushBack [format["%1rhs_mi28n_vvs", _sid],1];
	AIR_FIGHTER pushBack [format["%1RHS_Su25SM_vvs", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1RHS_Ka52_vvs", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["%1RHS_T50_vvs_generic", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1rhs_gaz66_zu23_vdv", _sid], 1, 20]];
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["%1RHS_Ural_Zu23_VDV_01", _sid], 1, 40];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["%1rhs_zsu234_aa", _sid], 1, 40];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
