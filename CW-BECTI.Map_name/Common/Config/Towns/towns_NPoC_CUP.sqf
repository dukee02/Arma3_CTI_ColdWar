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
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//Town infantry setup
if(CTI_MAIN_ADDON == -1 || CTI_MAIN_ADDON > 0) then {
	INFANTRY = [];
	INFANTRY_MG = [];
	INFANTRY_AT = [];

	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
		case 1: {
			INFANTRY = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Forester", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1]];
		};
		case 2: {
			INFANTRY = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Forester", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1],[format["%1CUP_I_GUE_Soldier_MG", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Sniper", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1],[format["%1CUP_I_GUE_Soldier_AT", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Forester", _sid],1],[format["%1CUP_I_GUE_Farmer", _sid],1],[format["%1CUP_I_GUE_Local", _sid],1],[format["%1CUP_I_GUE_Woodman", _sid],1],[format["%1CUP_I_GUE_Villager", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_AKS74", _sid],1],[format["%1CUP_I_GUE_Soldier_AKSU", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_I_GUE_Medic", _sid],1],[format["%1CUP_I_GUE_Soldier_AKM", _sid],1],[format["%1CUP_I_GUE_Soldier_GL", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1],[format["%1CUP_I_GUE_Soldier_LAT", _sid],1]];
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
		["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
	};
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1CUP_I_Datsun_PK", _sid],1],[format["%1CUP_I_Datsun_PK_Random", _sid],1],[format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1],[format["%1CUP_I_Hilux_podnos_NAPA", _sid],1],[format["%1CUP_I_Hilux_UB32_NAPA", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_Hilux_SPG9_NAPA", _sid],1],[format["%1CUP_I_Hilux_metis_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_AGS30_NAPA", _sid],1]];
	};
	case 2: {
		WHEELED_LIGHT = [[format["%1CUP_I_Datsun_PK", _sid],1],[format["%1CUP_I_Datsun_PK_Random", _sid],1],[format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1],[format["%1CUP_I_Hilux_podnos_NAPA", _sid],1],[format["%1CUP_I_Hilux_UB32_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_AGS30_NAPA", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_Hilux_SPG9_NAPA", _sid],1],[format["%1CUP_I_Hilux_metis_NAPA", _sid],1],[format["%1CUP_I_Hilux_btr60_NAPA", _sid],1],[format["%1CUP_I_Hilux_BMP1_NAPA", _sid],1],[format["%1CUP_I_Hilux_MLRS_NAPA", _sid],1]];
	};
	case 3;
	case 4: {
		WHEELED_LIGHT = [[format["%1CUP_I_Datsun_PK", _sid],1],[format["%1CUP_I_Hilux_btr60_NAPA", _sid],1],[format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1],[format["%1CUP_I_Hilux_BMP1_NAPA", _sid],1],[format["%1CUP_I_Hilux_UB32_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_AGS30_NAPA", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_BRDM2_NAPA", _sid],1],[format["%1CUP_I_Hilux_metis_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_BTR60_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_BMP1_NAPA", _sid],1],[format["%1CUP_I_BRDM2_ATGM_NAPA", _sid],1]];
	};
	default {
		WHEELED_LIGHT = [[format["%1CUP_I_Datsun_PK", _sid],1],[format["%1CUP_I_Datsun_PK_Random", _sid],1]];
		WHEELED_HEAVY = [[format["%1CUP_I_Hilux_DSHKM_NAPA", _sid],1],[format["%1CUP_I_Hilux_AGS30_NAPA", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_T34_NAPA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_T34_NAPA", _sid],1]];
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_T34_NAPA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_T55_NAPA", _sid],1]];
	};
	case 4;
	case 5: {
		TRACKED_LIGHT = [[format["%1CUP_I_BMP2_NAPA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_T55_NAPA", _sid],1],[format["%1CUP_I_T34_NAPA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_T72_NAPA", _sid],1]];
	};
	default {
		TRACKED_LIGHT = [[format["%1CUP_I_MTLB_pk_NAPA", _sid],1]];
		TRACKED_MEDIUM = [[format["%1CUP_I_MTLB_pk_NAPA", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_I_MTLB_pk_NAPA", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

/*switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_BOMBER = [[format["%1CUP_B_AH6J_USA", _sid],1],[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid],1]];
	};
	default {
		AIR_BOMBER = [[format["%1CUP_B_UH1Y_UNA_USMC", _sid],1],[format["%1CUP_MH60S_Unarmed_USN", _sid],1]];
	};
};*/
AIR_BOMBER = INFANTRY;
AIR_FIGHTER = INFANTRY_AT;

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	//don't add infantry if we've got some air units ^^
	//missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	//missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		ANTI_AIR = [[format["%1CUP_I_Ural_ZU23_NAPA", _sid],1],[format["%1CUP_I_Hilux_zu23_NAPA", _sid],1]];
	};
	case 2: {
		ANTI_AIR = [[format["%1CUP_I_Ural_ZU23_NAPA", _sid],1],[format["%1CUP_I_Hilux_zu23_NAPA", _sid],1],[format["%1CUP_I_Datsun_AA", _sid],1],[format["%1CUP_I_Datsun_AA_Random", _sid],1],[format["%1CUP_I_Hilux_armored_zu23_NAPA", _sid],1]];
	};
	case 3: {
		ANTI_AIR = [[format["%1CUP_I_Ural_ZU23_NAPA", _sid],1],[format["%1CUP_I_Hilux_zu23_NAPA", _sid],1],[format["%1CUP_I_Datsun_AA_Random", _sid],1],[format["%1CUP_I_Hilux_armored_zu23_NAPA", _sid],1],[format["%1CUP_I_Hilux_igla_NAPA", _sid],1]];
	};
	case 4;
	case 5: {
		ANTI_AIR = [[format["%1CUP_I_Ural_ZU23_NAPA", _sid],1],[format["%1CUP_I_Datsun_AA_Random", _sid],1],[format["%1CUP_I_Hilux_armored_zu23_NAPA", _sid],1],[format["%1CUP_I_Hilux_igla_NAPA", _sid],1],[format["%1CUP_I_Hilux_armored_igla_NAPA", _sid],1]];
	};
	default {
		ANTI_AIR = INFANTRY;
	};
};


if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NPoC_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};