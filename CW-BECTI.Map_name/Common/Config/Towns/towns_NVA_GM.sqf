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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
	INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
	INFANTRY = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_str", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_gc_army_squadleader_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_marksman_svd_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_squadleader_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_squadleader_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
	INFANTRY = [[format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_marksman_svd_80_str", _sid],1]];
		INFANTRY_MG = [[format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid],1],[format["%1gm_gc_army_machinegunner_pk_80_str", _sid],1]];
		INFANTRY_AT = [[format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_str", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};


//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1gm_gc_army_p601", _sid],1]];
	WHEELED_HEAVY = [[format["%1gm_gc_army_p601", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT = [[format["%1gm_gc_army_uaz469_dshkm_win", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_uaz469_spg9_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT = [[format["%1gm_gc_army_uaz469_dshkm_wdl", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_uaz469_spg9_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT = [[format["%1gm_gc_army_uaz469_dshkm", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_gc_army_uaz469_spg9", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT pushBack [format["%1gm_gc_army_uaz469_spg9_win", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_gc_army_brdm2_win", _sid],1]];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT pushBack [format["%1gm_gc_army_uaz469_spg9_wdl", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_gc_army_brdm2_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_LIGHT pushBack [format["%1gm_gc_army_uaz469_dshkm", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_gc_army_brdm2", _sid],1]];
	};		
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_HEAVY pushBack [format["%1gm_gc_army_btr60pb_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_HEAVY pushBack [format["%1gm_gc_army_btr60pb_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_HEAVY pushBack [format["%1gm_gc_army_btr60pb", _sid],1];	
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;


_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2_win", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_bmp1sp2_win", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_bmp1sp2_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2_wdl", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_bmp1sp2_wdl", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_bmp1sp2_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_LIGHT = [[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_gc_army_bmp1sp2", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_bmp1sp2", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b_win", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b_wdl", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active	
		TRACKED_MEDIUM = [[format["%1gm_gc_army_pt76b", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_gc_army_t55", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55a_win", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55ak_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55a_wdl", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55ak_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55a", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55ak", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2_win", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2b_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2_wdl", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2b_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_gc_army_t55am2b", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1gm_gc_airforce_mi2p", _sid],1]];
	AIR_BOMBER = [[format["%1gm_gc_airforce_mi2sr", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1gm_gc_airforce_l410t", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1gm_gc_airforce_mi2urn", _sid],1]];
	AIR_BOMBER = [[format["%1gm_gc_airforce_mi2us", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		ANTI_AIR = [[format["%1gm_gc_army_zsu234v1_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		ANTI_AIR = [[format["%1gm_gc_army_zsu234v1_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		ANTI_AIR = [[format["%1gm_gc_army_zsu234v1", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_NVA_GM.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
