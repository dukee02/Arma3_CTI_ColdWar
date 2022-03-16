_side = _this;
_sid = "";
_tag = "";
_level = 0;

if(_side == west) then {
	//_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		//_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles if nation on IND side
if(_tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1Soldier", _side], format["%1CUP_B_USMC_Soldier_des", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _side], format["%1CUP_B_USMC_Crew_des", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _side], format["%1CUP_B_USMC_Pilot_des", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Soldier", _side], format["%1CUP_B_USMC_Soldier", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _side], format["%1CUP_B_USMC_Crew", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _side], format["%1CUP_B_US_Pilot", _sid]];
		};	
	};
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Engineer_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_Light_des", _sid],1],[format["%1CUP_B_USMC_Soldier_Light_des", _sid],1],[format["%1CUP_B_USMC_Soldier_Light_des", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Engineer", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_Light", _sid],1],[format["%1CUP_B_USMC_Soldier_Light", _sid],1],[format["%1CUP_B_USMC_Soldier_Light", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Engineer_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_AR_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_AT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Engineer", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_AR", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1],[format["%1CUP_B_USMC_Soldier_AT", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Engineer_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_Marksman_des", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_AR_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Soldier_SL_des", _sid],1],[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_AT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Engineer", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_Marksman", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_AR", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_B_USMC_Soldier_SL", _sid],1],[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT", _sid],1],[format["%1CUP_B_USMC_Soldier_AT", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1]];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_Unarmed_USA", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_HMMWV_Unarmed_USA", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_Unarmed_USMC", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_HMMWV_Unarmed_USMC", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1152_DSRT_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_DSRT_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_Transport_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_Terminal_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_SOV_M2_USA", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_MTVR_USA", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1152_USMC", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_MTVR_USMC", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USA", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_Crows_M2_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_Crows_MK19_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_Crows_MK19_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid],1];
		WHEELED_HEAVY = [[format["%1CUP_B_LAV25_HQ_desert_USMC", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_M1114_USMC", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_MK19_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_M2_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1165_GMV_USMC", _sid],1];
		WHEELED_HEAVY = [[format["%1CUP_B_LAV25_HQ_USMC", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1CUP_B_LAV25_HQ_green", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_TOW_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_M2_GPK_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_M2_DSRT_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_Deploy_DSRT_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1167_DSRT_USMC", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_LAV25_desert_USMC", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_LAV25M240_desert_USMC", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_HMMWV_TOW_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_M2_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_Deploy_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1151_Mk19_USMC", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_M1167_USMC", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_LAV25_USMC", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_LAV25M240_USMC", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1130_CV_M2_Desert", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1126_ICV_M2_Desert", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1126_ICV_MK19_Desert", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1135_ATGMV_Desert", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1130_CV_M2_Woodland", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1126_ICV_M2_Woodland", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1135_ATGMV_Woodland", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_Mk19_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31E_M2_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_M2_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_M2_GC_USA", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1129_MC_MK19_Desert", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1128_MGS_Desert", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_Mk19_OD_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31E_M2_OD_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_M2_OD_USA", _sid],1];
		WHEELED_LIGHT pushBack [format["%1CUP_B_RG31_M2_OD_GC_USA", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1129_MC_MK19_Woodland", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_B_M1128_MGS_Woodland", _sid],1];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1CUP_B_AAV_Unarmed_USMC", _sid],1]];
	TRACKED_MEDIUM = [[format["%1CUP_B_AAV_Unarmed_USMC", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_B_AAV_Unarmed_USMC", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M113_USA", _sid],1]];
	};
	TRACKED_HEAVY = [[format["%1CUP_B_AAV_USMC", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	TRACKED_LIGHT pushBack [format["%1CUP_B_AAV_USMC", _sid],1];
	TRACKED_MEDIUM pushBack [format["%1CUP_B_M163_USA", _sid],1];
	TRACKED_HEAVY = [[format["%1CUP_B_M163_USA", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M7Bradley_USA_D", _sid],1];
		TRACKED_MEDIUM pushBack [format["%1CUP_B_M270_HE_USA", _sid],1];
		TRACKED_HEAVY pushBack [format["%1CUP_B_M1A1_DES_US_Army", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M7Bradley_USA_W", _sid],1];
		TRACKED_MEDIUM pushBack [format["%1CUP_B_M270_HE_USMC", _sid],1];
		TRACKED_HEAVY pushBack [format["%1CUP_B_M1A1_Woodland_US_Army", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M2Bradley_USA_D", _sid],1];
		TRACKED_HEAVY pushBack [format["%1CUP_B_M1A2_TUSK_MG_DES_US_Army", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M2Bradley_USA_W", _sid],1];
		TRACKED_HEAVY pushBack [format["%1CUP_B_M1A2_TUSK_MG_US_Army", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M2A3Bradley_USA_D", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		TRACKED_LIGHT pushBack [format["%1CUP_B_M2A3Bradley_USA_W", _sid],1];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_B_MH6J_USA", _sid],1],[format["%1CUP_B_MH6M_USA", _sid],1]];
	AIR_FIGHTER = [[format["%1CUP_B_AC47_Spooky_USA", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_AH6M_USA", _sid],1],[format["%1CUP_B_UH1Y_UNA_USMC", _sid],1]];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_B_AH1Z_Dynamic_USMC", _sid],1];
	AIR_BOMBER pushBack [format["%1CUP_B_MH60L_DAP_2x_US", _sid],1];
	AIR_BOMBER pushBack [format["%1CUP_B_MH60L_DAP_4x_US", _sid],1];
	AIR_FIGHTER = [[format["%1CUP_B_AV8B_DYN_USMC", _sid],1],[format["%1CUP_B_A10_DYN_USA", _sid],1]];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_CH53E_USMC", _sid];
	_c pushBack format["%1CUP_B_CH53E_VIV_USMC", _sid];
};*/
_matrix_cnt = _matrix_cnt + 1;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_B_AH64_DL_USA", _sid],1];
	AIR_BOMBER pushBack [format["%1CUP_B_AH64D_DL_USA", _sid],1];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["%1CUP_B_F35B_USMC", _sid],1];
	AIR_FIGHTER pushBack [format["%1CUP_B_F35B_Stealth_USMC", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USA", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USMC", _sid],1]];
	};
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1CUP_B_M6LineBacker_USA_D", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		ANTI_AIR = [[format["%1CUP_B_M6LineBacker_USA_W", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};