_side = _this;
_sid = "";
_tag = "";
_level = -1;

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
//if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles if nation on IND side
if(_tag == "GUER_") then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_I_RACS_Soldier", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_I_RACS_Soldier_Light", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1CUP_I_RACS_Pilot", _sid]];
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_I_RACS_Soldier_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1CUP_I_RACS_Pilot", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_I_RACS_Soldier_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_I_RACS_Soldier_Light_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1CUP_I_RACS_Pilot", _sid]];
		};	
	};
};
//needed for Tonw units if the camo differs
if !(CTI_TOWN_CAMO == CTI_CAMO_ACTIVATION) then {
	missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_I_RACS_GL_Urban", _sid]];
	missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_I_RACS_Soldier_Urban", _sid]];
	missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Engineer", _sid],1],[format["%1CUP_I_RACS_Engineer", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT", _sid],1]];
		};
		case 4: {//urban camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Engineer_Urban", _sid],1],[format["%1CUP_I_RACS_Engineer_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Engineer_wdl", _sid],1],[format["%1CUP_I_RACS_Engineer_wdl", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
		};
		case 4: {//urban camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
		};
		case 4: {//urban camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY = [[format["%1CUP_I_LR_Ambulance_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY = [[format["%1CUP_I_LAV25_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_I_LAV25M240_RACS", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT = [[format["%1CUP_I_AAV_Unarmed_RACS", _sid],1]];
	TRACKED_MEDIUM = [[format["%1CUP_I_AAV_Unarmed_RACS", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_I_AAV_Unarmed_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		TRACKED_LIGHT = [[format["%1CUP_I_M113_RACS_URB", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 4 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		TRACKED_LIGHT = [[format["%1CUP_I_M113_RACS", _sid],1]];
	};
	TRACKED_MEDIUM = [[format["%1CUP_I_AAV_RACS", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_I_AAV_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM pushBack [format["%1CUP_I_M163_RACS", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY = [[format["%1CUP_I_M60A3_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM pushBack [format["%1CUP_I_T72_RACS", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_I_MH6J_RACS", _sid],1]];
	AIR_FIGHTER = [[format["%1CUP_I_SA330_Puma_HC1_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_I_AH6J_RACS", _sid],1]];
	AIR_FIGHTER = [[format["%1CUP_I_UH1H_RACS", _sid],1],[format["%1CUP_I_UH1H_Slick_RACS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%CUP_I_UH1H_Armed_RACS", _sid],1];
	AIR_BOMBER pushBack [format["%CUP_I_UH1H_gunship_RACS", _sid],1];
	AIR_FIGHTER pushBack [format["%CUP_I_UH60L_RACS", _sid],1];
	AIR_FIGHTER pushBack [format["%CUP_I_UH60L_FFV_RACS", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER append AIR_FIGHTER;
	AIR_FIGHTER = [[format["%CUP_I_JAS39_RACS", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	ANTI_AIR = [[format["%1CUP_I_LR_AA_RACS", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};