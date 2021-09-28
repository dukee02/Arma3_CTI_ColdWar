_side = _this;
_sid = "";
_tag = "";

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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//Town infantry setup
//if(CTI_MAIN_ADDON == -1 || CTI_MAIN_ADDON > 0) then {
	INFANTRY = [];
	INFANTRY_MG = [];
	INFANTRY_AT = [];
	switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
		case 1: {
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
				INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
			};
		};
		case 2: {
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1],[format["%1CUP_I_RACS_MMG_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1],[format["%1CUP_I_RACS_MMG", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
				INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1],[format["%1CUP_I_RACS_MMG_wdl", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
			};
		};
		default {
			INFANTRY = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Engineer_Urban", _sid],1],[format["%1CUP_I_RACS_Engineer_Urban", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_Urban", _sid],1],[format["%1CUP_I_RACS_GL_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				INFANTRY = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Engineer", _sid],1],[format["%1CUP_I_RACS_Engineer", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic", _sid],1],[format["%1CUP_I_RACS_Soldier", _sid],1],[format["%1CUP_I_RACS_GL", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
				INFANTRY = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1]];
				INFANTRY_MG = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Engineer_wdl", _sid],1],[format["%1CUP_I_RACS_Engineer_wdl", _sid],1]];
				INFANTRY_AT = [[format["%1CUP_I_RACS_Medic_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_wdl", _sid],1],[format["%1CUP_I_RACS_GL_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid],1],[format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid],1]];
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
//};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
	};
	case 2;
	case 3: {
		WHEELED_LIGHT = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_LAV25_RACS", _sid],1]];
	};
	case 4: {
		WHEELED_LIGHT = [[format["%1CUP_I_LR_MG_RACS", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_LAV25_RACS", _sid],1],[format["%1CUP_I_LAV25M240_RACS", _sid],1]];
	};
	default {
		WHEELED_LIGHT = [[format["%1CUP_I_LR_Transport_RACS", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_LR_Transport_RACS", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_M113_RACS_URB", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_M113_RACS_URB", _sid],1]];
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_M113_RACS_URB", _sid],1]];
		TRACKED_HEAVY = [[format["%CUP_I_M163_RACS", _sid],1]];
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_M113_RACS_URB", _sid],1],[format["%CUP_I_M163_RACS", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_M60A3_RACS", _sid],1]];
	};
	case 4;
	case 5: {
		TRACKED_LIGHT = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_M113_RACS_URB", _sid],1],[format["%CUP_I_M163_RACS", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_M60A3_RACS", _sid],1],[format["%1CUP_I_T72_RACS", _sid],1]];
	};
	default {
		TRACKED_LIGHT = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_AAV_RACS", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_AAV_RACS", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_RACS_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_BOMBER = [[format["%1CUP_I_AH6J_RACS", _sid],1]];
		AIR_FIGHTER = [[format["%1CUP_I_UH1H_RACS", _sid],1]];
	};
	case 2: {
		AIR_BOMBER = [[format["%1CUP_I_AH6J_RACS", _sid],1]];
		AIR_FIGHTER = [[format["%CUP_I_UH1H_Armed_RACS", _sid],1],[format["%CUP_I_UH1H_gunship_RACS", _sid],1]];
	};
	case 3;
	case 4: {
		AIR_BOMBER = [[format["%1CUP_I_AH6J_RACS", _sid],1],[format["%CUP_I_UH1H_Armed_RACS", _sid],1],[format["%CUP_I_UH1H_gunship_RACS", _sid],1]];
		AIR_FIGHTER = [[format["%CUP_I_JAS39_RACS", _sid],1]];
	};
	default {
		AIR_BOMBER = [[format["%1CUP_I_MH6J_RACS", _sid],1],[format["%1CUP_I_SA330_Puma_HC1_RACS", _sid],1]];
	};
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

//Town Anti-Air setup
ANTI_AIR = [];

ANTI_AIR = INFANTRY_MG;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
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