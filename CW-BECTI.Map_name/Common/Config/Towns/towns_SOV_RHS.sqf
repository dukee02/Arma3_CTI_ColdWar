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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//Town infantry setup
if(CTI_MAIN_ADDON > 0 || CTI_ECONOMY_LEVEL_INFANTRY >= 4) then {
	INFANTRY = [];
	INFANTRY_MG = [];
	INFANTRY_AT = [];

	INFANTRY = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_at", _sid],1]];
	INFANTRY_MG = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_at", _sid],1],[format["%1rhs_vdv_machinegunner", _sid],1],[format["%1rhs_vdv_machinegunner", _sid],1]];
	INFANTRY_AT = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_LAT", _sid],1],[format["%1rhs_vdv_grenadier_rpg", _sid],1],[format["%1rhs_vdv_des_RShG2", _sid],1]];

	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		INFANTRY = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_at", _sid],1]];
		INFANTRY_MG = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_at", _sid],1],[format["%1rhs_vdv_des_machinegunner", _sid],1],[format["%1rhs_vdv_des_machinegunner", _sid],1]];
		INFANTRY_AT = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_LAT", _sid],1],[format["%1rhs_vdv_des_grenadier_rpg", _sid],1],[format["%1rhs_vdv_RShG2", _sid],1]];

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
		["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
	};
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1rhs_uaz_vdv", _sid],1],[format["%1rhs_uaz_open_vdv", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhs_gaz66_vdv", _sid],1],[format["%1rhs_gaz66o_vdv", _sid],1]];
	};
	case 2: {
		WHEELED_LIGHT = [[format["%1rhs_uaz_vdv", _sid],1],[format["%1RHS_Ural_VDV_01", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhs_btr60_vdv", _sid],1],[format["%1rhs_btr60_vdv", _sid],1]];
	};
	case 3: {
		WHEELED_LIGHT = [[format["%1rhs_uaz_vdv", _sid],1],[format["%1rhs_btr60_vdv", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhs_btr70_vdv", _sid],1],[format["%1rhs_btr70_vdv", _sid],1]];
	};
	case 4;
	case 5: {
		WHEELED_LIGHT = [[format["%1rhs_btr60_vdv", _sid],1],[format["%1rhs_btr70_vdv", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhs_btr80_vdv", _sid],1],[format["%1rhs_btr80a_vdv", _sid],1]];
	};
	default {
		WHEELED_LIGHT = [[format["%1rhs_uaz_vdv", _sid],1]];
		WHEELED_HEAVY = [[format["%1rhs_uaz_open_vdv", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1rhs_prp3_vdv", _sid],1],[format["%1rhs_prp3_vdv", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmp2_vdv", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_bmp2k_vdv", _sid],1],[format["%1rhs_bmp2k_vdv", _sid],1]];
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1rhs_brm1k_vdv", _sid],1],[format["%1rhs_prp3_vdv", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmp1p_vdv", _sid],1],[format["%1rhs_bmp1p_vdv", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_sprut_vdv", _sid],1],[format["%1rhs_sprut_vdv", _sid],1]];
	};
	case 3: {
		TRACKED_LIGHT = [[format["%1rhs_prp3_vdv", _sid],1],[format["%1rhs_brm1k_vdv", _sid],1],[format["%1rhs_prp3_vdv", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmd1", _sid],1],[format["%1rhs_sprut_vdv", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_t72ba_tv", _sid],1],[format["%1rhs_t72bb_tv", _sid],1]];
	};
	case 4: {
		TRACKED_LIGHT = [[format["%1rhs_prp3_vdv", _sid],1],[format["%1rhs_bmd1p", _sid],1],[format["%1rhs_bmd2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmd1p", _sid],1],[format["%1rhs_bmd2", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_t72ba_tv", _sid],1],[format["%1rhs_t80", _sid],1],[format["%1rhs_t80b", _sid],1]];
	};
	case 5: {
		TRACKED_LIGHT = [[format["%1rhs_prp3_vdv", _sid],1],[format["%1rhs_bmd1p", _sid],1],[format["%1rhs_bmd2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmd4_vdv", _sid],1],[format["%1rhs_sprut_vdv", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_t72ba_tv", _sid],1],[format["%1rhs_t80", _sid],1],[format["%1rhs_t90_tv", _sid],1],[format["%1rhs_t90a_tv", _sid],1]];
	};
	default {
		TRACKED_LIGHT = [[format["%1rhs_prp3_vdv", _sid],1],[format["%1rhs_prp3_vdv", _sid],1]];
		TRACKED_MEDIUM = [[format["%1rhs_bmp2_vdv", _sid],1],[format["%1rhs_bmp2_vdv", _sid],1]];
		TRACKED_HEAVY = [[format["%1rhs_bmp2k_vdv", _sid],1],[format["%1rhs_bmp2k_vdv", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		AIR_BOMBER = [[format["%1RHS_Mi8MTV3_vdv", _sid],1],[format["%1RHS_Mi8MTV3_heavy_vdv", _sid],1]];
	};
	case 2: {
		AIR_BOMBER = [[format["%1RHS_Mi24P_vdv", _sid],1],[format["%1RHS_Mi24V_vdv", _sid],1],[format["%1rhs_mi28n_vvsc", _sid],1],[format["%1rhs_mi28n_vvs", _sid],1],[format["%1RHS_Mi8MTV3_heavy_vdv", _sid],1]];
		AIR_FIGHTER = [[format["%1RHS_Su25SM_vvsc", _sid],1]];
	};
	case 3: {
		AIR_BOMBER = [[format["%1RHS_Mi24P_vdv", _sid],1],[format["%1RHS_Mi24V_vdv", _sid],1],[format["%1rhs_mi28n_vvsc", _sid],1],[format["%1rhs_mi28n_vvs", _sid],1],[format["%1RHS_Mi8MTV3_heavy_vdv", _sid],1]];
		AIR_FIGHTER = [[format["%1RHS_Su25SM_vvsc", _sid],1]];
	};
	case 4: {
		AIR_BOMBER = [[format["%1RHS_Ka52_vvsc", _sid],1],[format["%1RHS_Mi24V_vdv", _sid],1],[format["%1rhs_mi28n_vvsc", _sid],1],[format["%1rhs_mi28n_vvs", _sid],1],[format["%1RHS_Mi8MTV3_heavy_vdv", _sid],1]];
		AIR_FIGHTER = [[format["%1RHS_Su25SM_vvsc", _sid],1],[format["%1rhs_mig29s_vvsc", _sid],1]];
	};
	default {};
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
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = [[format["%1rhs_gaz66_zu23_vdv", _sid],1]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = +[[format["%1RHS_Ural_Zu23_VDV_01", _sid],1]];
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	ANTI_AIR = +[[format["%1rhs_zsu234_aa", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_RHS.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};