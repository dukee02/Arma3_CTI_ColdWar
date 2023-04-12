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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_BW_BWA3.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		INFANTRY = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG3_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG3_Tropen", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG3_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG3_Fleck", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_Multi", _sid],1],[format["%1BWA3_Rifleman_lite_Multi", _sid],1],[format["%1BWA3_Rifleman_lite_Multi", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG3_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG3_Multi", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_RiflemanAT_CG_Multi", _sid],1],[format["%1BWA3_RiflemanAT_CG_Multi", _sid],1],[format["%1BWA3_RiflemanAT_CG_Multi", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		INFANTRY = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_Marksman_Tropen", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG3_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG4_Tropen", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_Marksman_Fleck", _sid],1],[format["%1BWA3_Rifleman_lite_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG3_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG4_Fleck", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_Multi", _sid],1],[format["%1BWA3_Marksman_Multi", _sid],1],[format["%1BWA3_Rifleman_lite_Multi", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG3_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG4_Multi", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_RiflemanAT_CG_Multi", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Multi", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Multi", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		INFANTRY = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_Marksman_Tropen", _sid],1],[format["%1BWA3_Rifleman_G27_Tropen", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_G27_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG5_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG4_Tropen", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Tropen", _sid],1],[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_Marksman_Fleck", _sid],1],[format["%1BWA3_Rifleman_G27_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_G27_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG5_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG4_Fleck", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Fleck", _sid],1],[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_PzF3_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_Multi", _sid],1],[format["%1BWA3_Marksman_Multi", _sid],1],[format["%1BWA3_Rifleman_G27_Multi", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_Grenadier_G27_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG5_Multi", _sid],1],[format["%1BWA3_MachineGunner_MG4_Multi", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_SL_Multi", _sid],1],[format["%1BWA3_Medic_Multi", _sid],1],[format["%1BWA3_Rifleman_Multi", _sid],1],[format["%1BWA3_RiflemanAT_PzF3_Multi", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Multi", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Multi", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1BWA3_Dingo2_FLW100_MG3_Tropen", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW200_M2_Tropen", _sid],1];
		WHEELED_HEAVY = [[format["%1BWA3_Dingo2_FLW200_GMW_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT = [[format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid],1];
		WHEELED_HEAVY = [[format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid],1];
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid],1];
		WHEELED_HEAVY pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW100_MG3_CG13_Tropen", _sid],1];
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Tropen", _sid],1];
		WHEELED_HEAVY pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Tropen", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid],1];
		WHEELED_LIGHT pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid],1];
		WHEELED_HEAVY pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid],1];
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Puma_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Puma_Fleck", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		//TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		//TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Panzerhaubitze2000_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		//TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		//TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Panzerhaubitze2000_Fleck", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		//TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		//TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		//TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		//TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1]];
		TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Fleck", _sid],1]];
	};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//AIR_BOMBER = [[format["%1BWA3_Tiger_Gunpod_FZ", _sid],1]];
	AIR_BOMBER = [[format["%1BWA3_Tiger_Gunpod_Heavy", _sid],1]];
	//AIR_FIGHTER pushBack [format["%1BWA3_Tiger_Gunpod_PARS", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//AIR_BOMBER = [[format["%1BWA3_Tiger_RMK_Heavy", _sid],1]];
	AIR_BOMBER = [[format["%1BWA3_Tiger_RMK_PARS", _sid],1]];
	//AIR_FIGHTER pushBack [format["%1BWA3_Tiger_RMK_Universal", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1BWA3_Puma_Tropen", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		ANTI_AIR = [[format["%1BWA3_Puma_Fleck", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
