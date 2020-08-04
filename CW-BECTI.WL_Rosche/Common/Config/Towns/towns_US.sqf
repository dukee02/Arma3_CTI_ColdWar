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
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";


//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

INFANTRY = [[format["%1LIB_US_captain", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_grenadier", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_rifleman", _sid],1]];
INFANTRY_MG = [[format["%1LIB_US_captain", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_rifleman", _sid],1],[format["%1LIB_US_smgunner", _sid],1],[format["%1LIB_US_smgunner", _sid],1],[format["%1LIB_US_mgunner", _sid],1]];
INFANTRY_AT = [[format["%1LIB_US_captain", _sid],1],[format["%1LIB_US_medic", _sid],1],[format["%1LIB_US_grenadier", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1],[format["%1LIB_US_AT_soldier", _sid],1]];

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	INFANTRY = [[format["%1LIB_US_Captain_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Grenadier_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_US_Captain_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Rifleman_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1],[format["%1LIB_US_Smgunner_w", _sid],1],[format["%1LIB_US_Mgunner_w", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_US_Captain_w", _sid],1],[format["%1LIB_US_Medic_w", _sid],1],[format["%1LIB_US_Grenadier_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1],[format["%1LIB_US_AT_soldier_w", _sid],1]];
};
if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	INFANTRY = [[format["%1LIB_US_NAC_captain", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_grenadier", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1]];
	INFANTRY_MG = [[format["%1LIB_US_NAC_captain", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_rifleman", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1],[format["%1LIB_US_NAC_smgunner", _sid],1],[format["%1LIB_US_NAC_mgunner", _sid],1]];
	INFANTRY_AT = [[format["%1LIB_US_NAC_captain", _sid],1],[format["%1LIB_US_NAC_medic", _sid],1],[format["%1LIB_US_NAC_grenadier", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1],[format["%1LIB_US_NAC_AT_soldier", _sid],1]];
};

missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 2: {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_Scout_M3", _sid],1],[format["%1LIB_US_Scout_M3", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_HEAVY = [[format["%1LIB_US_Scout_m3_w", _sid],1],[format["%1LIB_US_Scout_m3_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_Scout_M3", _sid],1],[format["%1LIB_US_NAC_Scout_M3", _sid],1]];
		};
	};
	case 3: {
		WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Scout_M3", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_M3_Halftrack", _sid],1],[format["%1LIB_US_M3_Halftrack", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Scout_m3_w", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_M3_Halftrack_w", _sid],1],[format["%1LIB_US_M3_Halftrack_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_NAC_Scout_M3", _sid],1]];
			WHEELED_HEAVY = [[format["%1LIB_US_NAC_M3_Halftrack", _sid],1],[format["%1LIB_US_NAC_M3_Halftrack", _sid],1]];
		};
	};
	case 4: {
		WHEELED_LIGHT = [[format["%1LIB_US_Scout_M3", _sid],1],[format["%1LIB_US_M3_Halftrack", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_M8_Greyhound", _sid],1],[format["%1LIB_M8_Greyhound", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_LIGHT = [[format["%1LIB_US_Scout_m3_w", _sid],1],[format["%1LIB_US_M3_Halftrack_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_LIGHT = [[format["%1LIB_US_NAC_Scout_M3", _sid],1],[format["%1LIB_US_NAC_M3_Halftrack", _sid],1]];
		};
	};
	default {
		WHEELED_LIGHT = [[format["%1R71USA", _sid],1],[format["%1R71USA", _sid],1]];
		WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			WHEELED_HEAVY = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
		};
	};
};

missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_M4A3_75", _sid],1],[format["%1LIB_M4A3_75", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_HEAVY = [[format["%1LIB_M4A3_75_w", _sid],1],[format["%1LIB_M4A3_75_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_HEAVY = [[format["%1LIB_US_NAC_M4A3_75", _sid],1],[format["%1LIB_US_NAC_M4A3_75", _sid],1]];
		};
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M4A3_75", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_M4A3_76", _sid],1],[format["%1LIB_M4A3_76", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_M4A3_75_w", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_MEDIUM = [[format["%1LIB_M5A1_Stuart", _sid],1],[format["%1LIB_US_NAC_M4A3_75", _sid],1]];
		};
	};
	case 4: {
		TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M5A1_Stuart", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_M4A3_75", _sid],1],[format["%1LIB_M4A3_76", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_M4A3_76_HVSS", _sid],1],[format["%1LIB_M4A3_76_HVSS", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			TRACKED_MEDIUM = [[format["%1LIB_M4A3_75_w", _sid],1],[format["%1LIB_M4A3_76", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			TRACKED_MEDIUM = [[format["%1LIB_US_NAC_M4A3_75", _sid],1],[format["%1LIB_M4A3_76", _sid],1]];
		};
	};
	default {
		TRACKED_LIGHT = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
		TRACKED_MEDIUM = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
		TRACKED_HEAVY = [[format["%1LIB_M3A3_Stuart", _sid],1],[format["%1LIB_M3A3_Stuart", _sid],1]];
	};
};

missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_texan", _sid],1]];
			AIR_BOMBER = [[format["%1sab_dauntless", _sid],1]];
		};
	};
	case 2: {
		AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_corsair", _sid],1]];
		};
		AIR_BOMBER = [[format["%1LIB_US_P39_2", _sid],1]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			AIR_BOMBER = [[format["%1LIB_US_NAC_P39", _sid],1]];
		};
	};
	case 3: {
		AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_mustang", _sid],1]];
		};
		AIR_BOMBER = [[format["%1LIB_P47", _sid],1]];
	};
	case 4: {
		AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_P47", _sid],1]];
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_mustang", _sid],1]];
			AIR_BOMBER = [[format["%1sab_b24", _sid],1]];
		};
	};
	case 5: {
		AIR_FIGHTER = [[format["%1LIB_US_P39", _sid],1]];
		AIR_BOMBER = [[format["%1LIB_P47", _sid],1]];
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_f6f", _sid],1]];
			AIR_BOMBER = [[format["%1sab_b17", _sid],1]];
		};
	};
	default {
		if(CTI_SAB_ADDON == 1) then {
			AIR_FIGHTER = [[format["%1sab_p26", _sid],1]];
			AIR_BOMBER = [[format["%1sab_ryanpt", _sid],1]];
		};
	};
};

missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = [[format["%1LIB_US_Willys_MB_M1919", _sid],1],[format["%1LIB_US_Willys_MB_M1919", _sid],1]];
};

missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_US.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], ANTI_AIR]] call CTI_CO_FNC_Log;
};