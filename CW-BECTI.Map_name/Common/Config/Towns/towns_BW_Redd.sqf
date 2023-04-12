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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_BW_Redd.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
/*INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1]];
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
*/
//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_LIGHT = [[format["%1rnt_lkw_5t_mil_gl_kat_i_transport_winter", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1rnt_lkw_7t_mil_gl_kat_i_transport_winter", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1rnt_lkw_5t_mil_gl_kat_i_transport_trope", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1rnt_lkw_7t_mil_gl_kat_i_transport_trope", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_LIGHT = [[format["%1rnt_lkw_5t_mil_gl_kat_i_transport_fleck", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1rnt_lkw_7t_mil_gl_kat_i_transport_fleck", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_LIGHT = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid],1];
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid],1];
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_LIGHT = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid],1];
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_HEAVY = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_HEAVY pushBack [format["%1rnt_sppz_2a2_luchs_wintertarn", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_HEAVY pushBack [format["%1rnt_sppz_2a2_luchs_tropentarn", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_HEAVY pushBack [format["%1rnt_sppz_2a2_luchs_flecktarn", _sid],1];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_LIGHT = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_LIGHT = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_LIGHT pushBack [format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT pushBack [format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_LIGHT pushBack [format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_MEDIUM = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_MEDIUM = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
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
/*AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1gm_ge_army_bo105m_vbh", _sid],1]];
	AIR_FIGHTER = [[format["%1gm_ge_army_bo105p1m_vbh_swooper", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1gm_ge_army_bo105p_pah1", _sid],1]];
	AIR_FIGHTER = [[format["%1gm_ge_army_bo105p_pah1a1", _sid],1]];
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
*/
//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid],1]];
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
