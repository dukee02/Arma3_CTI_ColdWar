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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Autorifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Marksman", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Machinegunner", _sid],1],[format["%1CUP_B_TDF_Soldier_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_ATSpecialist", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Autorifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Marksman", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Machinegunner", _sid],1],[format["%1CUP_B_AFU_Soldier_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_ATSpecialist", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Autorifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Sniper_AM", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_Grenadier", _sid],1],[format["%1CUP_B_TDF_Soldier_Machinegunner", _sid],1],[format["%1CUP_B_TDF_Soldier_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_TDF_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_TDF_Soldier_Medic", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman", _sid],1],[format["%1CUP_B_TDF_Soldier_ATSpecialist", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
		};
		default {//multi dark
			INFANTRY = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Autorifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Sniper_AM", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_Grenadier", _sid],1],[format["%1CUP_B_AFU_Soldier_Machinegunner", _sid],1],[format["%1CUP_B_AFU_Soldier_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_AFU_Soldier_SquadLeader", _sid],1],[format["%1CUP_B_AFU_Soldier_Medic", _sid],1],[format["%1CUP_B_AFU_Soldier_Rifleman", _sid],1],[format["%1CUP_B_AFU_Soldier_ATSpecialist", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1],[format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_B_UAZ_Open_AFU", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_B_UAZ_Unarmed_AFU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_B_UAZ_MG_AFU", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_B_UAZ_AGS30_AFU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["%1CUP_B_UAZ_AGS30_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_UAZ_SPG9_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_Ural_ZU23_AFU", _sid],1];
	WHEELED_HEAVY = [[format["%1CUP_B_BRDM2_AFU", _sid],1]];
	WHEELED_HEAVY pushBack [format["%1CUP_B_BTR60_AFU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT pushBack [format["%1CUP_B_UAZ_METIS_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_Tigr_233014_PK_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_Tigr_M_233114_KORD_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_nM1151_ogpk_m2_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_nM1151_ogpk_m240_AFU", _sid],1];
	WHEELED_LIGHT pushBack [format["%1CUP_B_nM1151_ogpk_mk19_AFU", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_B_BRDM2_ATGM_AFU", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1CUP_B_MTLB_pk_AFU", _sid],1]];
	TRACKED_MEDIUM = [[format["%1CUP_B_MTLB_pk_AFU", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_B_MTLB_pk_AFU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY = [[format["%1CUP_B_Leopard_1A3GRN_UA", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	TRACKED_MEDIUM = [[format["%1CUP_B_M6LineBacker_AFU", _sid],1]];
	TRACKED_HEAVY pushBack [format["%1CUP_B_M1A1_AFU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_MEDIUM = [[format["%1CUP_B_M2A3Bradley_AFU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY pushBack [format["%1CUP_B_Leopard2A6Green_UA", _sid],1];
	TRACKED_HEAVY pushBack [format["%1CUP_B_M1A1_TUSK_AFU", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_B_Mi17_AFU", _sid],1]];
	AIR_FIGHTER = [[format["%1CUP_B_Mi17_VIV_AFU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_B_Mi171Sh_AFU", _sid],1]];
	AIR_FIGHTER = [[format["%1CUP_B_Mi171Sh_AFU", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1CUP_B_Mi24_D_Dynamic_AFU", _sid],1]];
	AIR_FIGHTER pushBack [format["%1CUP_B_Mi24_D_MEV_Dynamic_AFU", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1CUP_B_UAZ_AA_AFU", _sid],1]];
	ANTI_AIR = [[format["%1CUP_B_nM1097_AVENGER_AFU", _sid],1]];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1CUP_B_M6LineBacker_AFU", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_UKR_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};