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
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//Town infantry setup
if(CTI_MAIN_ADDON == -1 || CTI_MAIN_ADDON > 0 || CTI_ECONOMY_LEVEL_INFANTRY >= 4) then {
	INFANTRY = [];
	INFANTRY_MG = [];
	INFANTRY_AT = [];

	INFANTRY = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1]];
	INFANTRY_MG = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1],[format["%1CUP_B_USMC_Soldier_MG", _sid],1]];
	INFANTRY_AT = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT", _sid],1]];
	//if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		INFANTRY = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1]];
		INFANTRY_MG = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1],[format["%1CUP_B_USMC_Soldier_MG_des", _sid],1]];
		INFANTRY_AT = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT_des", _sid],1],[format["%1CUP_B_USMC_Soldier_HAT_des", _sid],1]];
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
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USMC", _sid],1],[format["%1CUP_B_HMMWV_M2_USMC", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_M1165_GMV_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USMC", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USA", _sid],1],[format["%1CUP_B_HMMWV_M2_USA", _sid],1]];
			WHEELED_HEAVY = [[format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USA", _sid],1]];
		};
	};
	case 2: {
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USMC", _sid],1],[format["%1CUP_B_HMMWV_M2_USMC", _sid],1],[format["%1CUP_B_M1165_GMV_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USMC", _sid],1],[format["%1CUP_B_M1151_Mk19_USMC", _sid],1],[format["%1CUP_B_M1151_M2_USMC", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_LAV25_USMC", _sid],1],[format["%1CUP_B_LAV25M240_USMC", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USA", _sid],1],[format["%1CUP_B_HMMWV_M2_USA", _sid],1],[format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USA", _sid],1],[format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid],1],[format["%1CUP_B_M1151_M2_DSRT_USMC", _sid],1]];
			WHEELED_HEAVY = [[format["%1CUP_B_LAV25_desert_USMC", _sid],1],[format["%1CUP_B_LAV25M240_desert_USMC", _sid],1]];
		};
	};
	case 3: {
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USMC", _sid],1],[format["%1CUP_B_HMMWV_M2_USMC", _sid],1],[format["%1CUP_B_M1165_GMV_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USMC", _sid],1],[format["%1CUP_B_M1151_Mk19_USMC", _sid],1],[format["%1CUP_B_M1151_M2_USMC", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_LAV25_USMC", _sid],1],[format["%1CUP_B_LAV25M240_USMC", _sid],1],[format["%1CUP_B_M1126_ICV_M2_Woodland", _sid],1],[format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_MK19_USA", _sid],1],[format["%1CUP_B_HMMWV_M2_USA", _sid],1],[format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USA", _sid],1],[format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid],1],[format["%1CUP_B_M1151_M2_DSRT_USMC", _sid],1]];
			WHEELED_HEAVY = [[format["%1CUP_B_LAV25_desert_USMC", _sid],1],[format["%1CUP_B_LAV25M240_desert_USMC", _sid],1],[format["%1CUP_B_M1126_ICV_M2_Desert", _sid],1],[format["%1CUP_B_M1126_ICV_MK19_Desert", _sid],1]];
		};
	};
	case 4: {
		WHEELED_LIGHT = [[format["%1CUP_B_M1165_GMV_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USMC", _sid],1],[format["%1CUP_B_M1151_Mk19_USMC", _sid],1],[format["%1CUP_B_M1151_M2_USMC", _sid],1],[format["%1CUP_B_RG31_Mk19_USA", _sid],1],[format["%1CUP_B_RG31_M2_USA", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_LAV25_USMC", _sid],1],[format["%1CUP_B_LAV25M240_USMC", _sid],1],[format["%1CUP_B_M1126_ICV_M2_Woodland", _sid],1],[format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid],1],[format["%1CUP_B_HMMWV_TOW_USA", _sid],1],[format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid],1],[format["%1CUP_B_M1151_M2_DSRT_USMC", _sid],1],[format["%1CUP_B_RG31_Mk19_OD_USA", _sid],1],[format["%1CUP_B_RG31_M2_OD_USA", _sid],1]];
			WHEELED_HEAVY = [[format["%1CUP_B_LAV25_desert_USMC", _sid],1],[format["%1CUP_B_LAV25M240_desert_USMC", _sid],1],[format["%1CUP_B_M1126_ICV_M2_Desert", _sid],1],[format["%1CUP_B_M1126_ICV_MK19_Desert", _sid],1]];
		};
	};
	default {
		WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_Unarmed_USMC", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_B_M1152_USMC", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1CUP_B_HMMWV_Unarmed_USA", _sid],1]];
			WHEELED_HEAVY = [[format["%1CUP_B_M1152_DSRT_USMC", _sid],1]];
		};
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


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M163_USA", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
			TRACKED_MEDIUM = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
		};
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M163_USA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
		};
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_W", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_Woodland_US_Army", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
			TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_D", _sid],1]];
			TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_DES_US_Army", _sid],1]];
		};
	};
	case 4: {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_W", _sid],1],[format["%1CUP_B_M2Bradley_USA_W", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_Woodland_US_Army", _sid],1],[format["%1CUP_B_M1A2_TUSK_MG_US_Army", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
			TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_D", _sid],1],[format["%1CUP_B_M2Bradley_USA_D", _sid],1]];
			TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_DES_US_Army", _sid],1],[format["%1CUP_B_M1A2_TUSK_MG_DES_US_Army", _sid],1]];
		};
	};
	case 5: {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_W", _sid],1],[format["%1CUP_B_M2Bradley_USA_W", _sid],1],[format["%1CUP_B_M2A3Bradley_USA_W", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_Woodland_US_Army", _sid],1],[format["%1CUP_B_M1A2_TUSK_MG_US_Army", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1],[format["%1CUP_B_M163_USA", _sid],1]];
			TRACKED_MEDIUM = [[format["%1CUP_B_M7Bradley_USA_D", _sid],1],[format["%1CUP_B_M2Bradley_USA_D", _sid],1],[format["%1CUP_B_M2A3Bradley_USA_D", _sid],1]];
			TRACKED_HEAVY = [[format["%1CUP_B_M60A3_USMC", _sid],1],[format["%1CUP_B_M1A1_DES_US_Army", _sid],1],[format["%1CUP_B_M1A2_TUSK_MG_DES_US_Army", _sid],1]];
		};
	};
	default {
		TRACKED_LIGHT = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_B_M113_USA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_B_M113_USA", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_LIGHT = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
			TRACKED_MEDIUM = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
			TRACKED_HEAVY = [[format["%1CUP_B_M113_desert_USA", _sid],1]];
		};
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

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1]];
	};
	case 2: {
		AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1],[format["%1CUP_B_AH1Z_Dynamic_USMC", _sid],1]];
		AIR_FIGHTER = [[format["%1CUP_B_AV8B_DYN_USMC", _sid],1]];
	};
	case 3: {
		AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1],[format["%1CUP_B_AH1Z_Dynamic_USMC", _sid],1]];
		AIR_FIGHTER = [[format["%1CUP_B_AV8B_DYN_USMC", _sid],1],[format["%1CUP_B_A10_DYN_USA", _sid],1]];
	};
	case 4: {
		AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1],[format["%1CUP_B_AH1Z_Dynamic_USMC", _sid],1],[format["%1CUP_B_AH64_DL_USA", _sid],1],[format["%1CUP_B_AH64D_DL_USA", _sid],1]];
		AIR_FIGHTER = [[format["%1CUP_B_AV8B_DYN_USMC", _sid],1],[format["%1CUP_B_A10_DYN_USA", _sid],1],[format["%1CUP_B_F35B_USMC", _sid],1]];
	};
	default {
		AIR_BOMBER = [[format["%1CUP_B_UH1Y_UNA_USMC", _sid],1],[format["%1CUP_MH60S_Unarmed_USN", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USMC", _sid],1]];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		ANTI_AIR = [[format["%1CUP_B_HMMWV_Avenger_USA", _sid],1]];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	ANTI_AIR pushback [format["%1CUP_B_M6LineBacker_USA_W", _sid],1];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		ANTI_AIR pushback [format["%1CUP_B_M6LineBacker_USA_D", _sid],1];
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