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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";


//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1]];
INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_str", _sid],1]];
INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_str", _sid],1]];

if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1]];
	INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_win", _sid],1]];
	INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid],1]];
};
//if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
//};

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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		WHEELED_LIGHT = [[format["%1gm_gc_army_p601", _sid],1],[format["%1gm_gc_army_p601", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_brdm2", _sid],1],[format["%1gm_gc_army_brdm2", _sid],1]];
	};
	case 2;
	case 3;
	case 4;
	case 5: {
		WHEELED_LIGHT = [[format["%1gm_gc_army_brdm2", _sid],1],[format["%1gm_gc_army_brdm2", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_btr60pb", _sid],1],[format["%1gm_gc_army_btr60pb", _sid],1]];
	};
	default {
		WHEELED_LIGHT = [[format["%1gm_gc_army_p601", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_p601", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b", _sid],1],[format["%1gm_gc_army_pt76b", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55", _sid],1],[format["%1gm_gc_army_t55", _sid],1]];
	};
	case 2: {
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b", _sid],1],[format["%1gm_gc_army_pt76b", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55a", _sid],1],[format["%1gm_gc_army_t55ak", _sid],1]];
	};
	case 3;
	case 4;
	case 5: {
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b", _sid],1],[format["%1gm_gc_army_pt76b", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55am2", _sid],1],[format["%1gm_gc_army_t55am2b", _sid],1]];
	};
	default {
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_bmp1sp2", _sid],1],[format["%1gm_gc_army_bmp1sp2", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];

switch (CTI_ECONOMY_LEVEL_AIR) do {
	case 1: {
		if(CTI_LEN_ADDON > 0) then {
			AIR_FIGHTER = [[format["%1len_l39_nva", _sid],1],[format["%1len_l39_nva", _sid],1]];
		};
	};
	case 2;
	case 3: {
		AIR_BOMBER = [[format["%1gm_gc_airforce_mi2urn", _sid],1],[format["%1gm_gc_airforce_mi2us", _sid],1]];
		if(CTI_LEN_ADDON > 0) then {
			AIR_BOMBER = [[format["%1gm_gc_airforce_mi2urn", _sid],1],[format["%1gm_gc_airforce_mi2us", _sid],1],[format["%1len_mi24d_AT_nva", _sid],1],[format["%1len_mi24p_AT_nva", _sid],1]];
			AIR_FIGHTER = [[format["%1len_l39_nva", _sid],1]];
		};
	};
	case 4;
	case 5: {
		AIR_BOMBER = [[format["%1gm_gc_airforce_mi2urn", _sid],1],[format["%1gm_gc_airforce_mi2us", _sid],1]];
		if(CTI_LEN_ADDON > 0) then {
			AIR_BOMBER = [[format["%1gm_gc_airforce_mi2urn", _sid],1],[format["%1gm_gc_airforce_mi2us", _sid],1],[format["%1len_mi24d_AT_nva", _sid],1],[format["%1len_mi24p_AT_nva", _sid],1]];
			AIR_FIGHTER = [[format["%1len_l39_nva", _sid],1],[format["%1len_mig29a_01_nva", _sid],1]];
		};
	};
	default {};
};

if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = +AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	ANTI_AIR = [[format["%1gm_gc_army_zsu234v1", _sid],1],[format["%1gm_gc_army_zsu234v1", _sid],1]];
	//if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	//	ANTI_AIR = [[format["%1LIB_Crusader_Mk1AA_desert", _sid],1],[format["%1LIB_Crusader_Mk1AA_desert", _sid],1]];
	//};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_NVA.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], ANTI_AIR]] call CTI_CO_FNC_Log;
};