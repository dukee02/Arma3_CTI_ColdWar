_side = _this;
_sid = "";
_tag = "";

if(_side == west) then {
	_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";


//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

INFANTRY = [[format["%1LIB_SOV_scout_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_AT_grenadier", _sid],1],[format["%1LIB_SOV_rifleman", _sid],1],[format["%1LIB_SOV_rifleman", _sid],1],[format["%1LIB_SOV_rifleman", _sid],1]];
INFANTRY_MG = [[format["%1LIB_SOV_scout_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_rifleman", _sid],1],[format["%1LIB_SOV_scout_smgunner", _sid],1],[format["%1LIB_SOV_scout_smgunner", _sid],1],[format["%1LIB_SOV_scout_mgunner", _sid],1]];
INFANTRY_AT = [[format["%1LIB_SOV_scout_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_AT_grenadier", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier", _sid],1],[format["%1LIB_SOV_AT_soldier", _sid],1]];

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	INFANTRY = [[format["%1LIB_SOV_Lieutenant_w", _sid],1],[format["%1LIB_SOV_Medic_w", _sid],1],[format["%1LIB_SOV_AT_grenadier_w", _sid],1],[format["%1LIB_SOV_Rifleman_w", _sid],1],[format["%1LIB_SOV_Rifleman_w", _sid],1],[format["%1LIB_SOV_Rifleman_w", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_SOV_Lieutenant_w", _sid],1],[format["%1LIB_SOV_Medic_w", _sid],1],[format["%1LIB_SOV_Rifleman_w", _sid],1],[format["%1LIB_SOV_Smgunner_w", _sid],1],[format["%1LIB_SOV_Smgunner_w", _sid],1],[format["%1LIB_SOV_Mgunner_w", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_SOV_Lieutenant_w", _sid],1],[format["%1LIB_SOV_Medic_w", _sid],1],[format["%1LIB_SOV_AT_grenadier_w", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier_w", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier_w", _sid],1],[format["%1LIB_SOV_AT_soldier_w", _sid],1]];
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	INFANTRY = [[format["%1LIB_SOV_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_AT_grenadier", _sid],1],[format["%1LIB_SOV_LC_rifleman", _sid],1],[format["%1LIB_SOV_LC_rifleman", _sid],1],[format["%1LIB_SOV_LC_rifleman", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_SOV_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_LC_rifleman", _sid],1],[format["%1LIB_SOV_smgunner", _sid],1],[format["%1LIB_SOV_smgunner", _sid],1],[format["%1LIB_SOV_mgunner", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_SOV_lieutenant", _sid],1],[format["%1LIB_SOV_medic", _sid],1],[format["%1LIB_SOV_AT_grenadier", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier", _sid],1],[format["%1LIB_SOV_AT_M1A1_soldier", _sid],1],[format["%1LIB_SOV_AT_soldier", _sid],1]];
};

missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {		
		WHEELED_LIGHT = [[format["%1ifa3_gazaa_dshk", _sid],1],[format["%1ifa3_gazaa_IZ_max", _sid],1]];
		WHEELED_HEAVY = [[format["%1ifa3_ba64B", _sid],1],[format["%1ifa3_ba64B", _sid],1]];
	};
	case 2: {
		WHEELED_LIGHT = [[format["%1ifa3_ba64B", _sid],1],[format["%1ifa3_ba64B", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_Scout_M3", _sid],1],[format["%1LIB_SOV_M3_Halftrack", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_HEAVY = [[format["%1LIB_Scout_m3_w", _sid],1],[format["%1LIB_SOV_M3_Halftrack_w", _sid],1]];
		};
	};
	case 3;
	case 4: {
		WHEELED_LIGHT = [[format["%1LIB_Scout_M3", _sid],1],[format["%1LIB_SOV_M3_Halftrack", _sid],1]];
		WHEELED_HEAVY = [[format["%1ifa3_Ba10", _sid],1],[format["%1ifa3_Ba10", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_Scout_m3_w", _sid],1],[format["%1LIB_SOV_M3_Halftrack_w", _sid],1]];
		};
	};
	default {
		WHEELED_LIGHT = [[format["%1R71RusGreen", _sid],1],[format["%1R71RusGreen", _sid],1]];
		WHEELED_HEAVY = [[format["%1R71RusDark", _sid],1],[format["%1R71RusDark", _sid],1]];
	};
};

missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1ifa3_t60", _sid],1],[format["%1ifa3_t70m", _sid],1]];
		TRACKED_MEDIUM = [[format["%1ifa3_t26", _sid],1],[format["%1ifa3_t26", _sid],1]];
		TRACKED_HEAVY = [[format["%1ifa3_M4A2_SOV", _sid],1],[format["%1ifa3_M4A2_SOV", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_HEAVY = [[format["%1LIB_M4A2_SOV_w", _sid],1],[format["%1LIB_M4A2_SOV_w", _sid],1]];
		};
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1ifa3_t70m", _sid],1],[format["%1ifa3_t70m", _sid],1]];
		TRACKED_MEDIUM = [[format["%1ifa3_t34_7", _sid],1],[format["%1ifa3_t34_7", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_SU85", _sid],1],[format["%1LIB_SU85", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_MEDIUM = [[format["%1LIB_T34_76_w", _sid],1],[format["%1LIB_T34_76_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_SU85_w", _sid],1],[format["%1LIB_SU85_w", _sid],1]];
		};
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1ifa3_t70m", _sid],1],[format["%1ifa3_t70m", _sid],1]];
		TRACKED_MEDIUM = [[format["%1ifa3_t34_7", _sid],1],[format["%1LIB_T34_85", _sid],1]];
		TRACKED_HEAVY = [[format["%1ifa3_kv1a", _sid],1],[format["%1ifa3_kv1a", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_MEDIUM = [[format["%1LIB_T34_76_w", _sid],1],[format["%1LIB_T34_85_w", _sid],1]];
		};
	};
	case 4: {
		TRACKED_LIGHT = [[format["%1ifa3_t70m", _sid],1],[format["%1ifa3_t70m", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_T34_85", _sid],1],[format["%1LIB_T34_85", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_JS2_43", _sid],1],[format["%1LIB_JS2_43", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_MEDIUM = [[format["%1LIB_T34_85_w", _sid],1],[format["%1LIB_T34_85_w", _sid],1]];
			TRACKED_HEAVY = [[format["%1LIB_JS2_43_w", _sid],1],[format["%1LIB_JS2_43_w", _sid],1]];
		};
	};
	default {
		TRACKED_LIGHT = [[format["%1ifa3_t60", _sid],1],[format["%1ifa3_t60", _sid],1]];
		TRACKED_MEDIUM = [[format["%1ifa3_t70m", _sid],1],[format["%1ifa3_t70m", _sid],1]];
		TRACKED_HEAVY = [[format["%1ifa3_t26", _sid],1],[format["%1ifa3_t26", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_HEAVY = [[format["%1ifa3_t26_w", _sid],1],[format["%1ifa3_t26_w", _sid],1]];
		};
	};
};

missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_la5", _sid],1]];
			AIR_BOMBER = [[format["%1sab_i16", _sid],1]];
		};
	};
	case 2: {
		//AIR_FIGHTER = [[format["%1ifa3_La7_2x50", _sid],1]];
		//AIR_BOMBER = [[format["%1ifa3_La7_2x50", _sid],1]];
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_la5", _sid],1]];
			AIR_BOMBER = [[format["%1sab_la5", _sid],1]];
		};
	};
	case 3: {
		AIR_FIGHTER = [[format["%LIB_RA_P39_2", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_P39", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_BOMBER = [[format["%1LIB_P39_w", _sid],1]];
		};
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_la5", _sid],1]];
		};
	};
	case 4: {
		AIR_FIGHTER = [[format["%LIB_RA_P39_2", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Pe2", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_BOMBER = [[format["%1LIB_Pe2_w", _sid],1]];
		};
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_la5", _sid],1]];
		};
	};
	case 5: {
		AIR_FIGHTER = [[format["%LIB_RA_P39_2", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_Pe2", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			AIR_BOMBER = [[format["%1LIB_Pe2_w", _sid],1]];
		};
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_la5", _sid],1]];
			AIR_BOMBER = [[format["%1sab_il2", _sid],1]];
		};
	};
	default {
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_i16", _sid],1]];
			AIR_BOMBER = [[format["%1sab_i16", _sid],1]];
		};
	};
};

missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = [[format["%1LIB_Zis5v_61K", _sid],1],[format["%1LIB_Zis5v_61K", _sid],1]];
};

missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], ANTI_AIR]] call CTI_CO_FNC_Log;
};