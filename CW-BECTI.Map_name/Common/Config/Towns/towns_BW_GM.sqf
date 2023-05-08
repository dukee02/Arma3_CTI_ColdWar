_side = _this;
_sid = "";
_tag = "";
_level = 0;
_sideID = (_side) call CTI_CO_FNC_GetSideID;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_tag = "WEST_";};
	case east: {/*_sid = "VIOC_O_";*/_tag = "EAST_";};
	case resistance: {/*_sid = "VIOC_I_";*/_tag = "GUER_";};
	default {};
};
//if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_BW_GM.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_parka_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_ols", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_win", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_win", _sid],1],[format["%1gm_ge_army_marksman_g3a3_parka_80_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_win", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_win", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	INFANTRY = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_80_ols", _sid],1],[format["%1gm_ge_army_marksman_g3a3_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_marksman_g3a3_parka_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_ols", _sid],1]];
	};
};

//TODO make it switch by research
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_demolition_g36a1_90_win", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_90_win", _sid],1],[format["%1gm_ge_army_marksman_g3a3_90_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_demolition_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_marksman_g3a3_parka_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_milan_90_flk", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		INFANTRY = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_demolition_g36a1_90_win", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_90_win", _sid],1],[format["%1gm_ge_army_marksman_g3a3_90_win", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_90_win", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_win", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
	INFANTRY = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_demolition_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid],1],[format["%1gm_ge_army_marksman_g3a3_parka_80_ols", _sid],1]];
		INFANTRY_MG = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid],1]];
		INFANTRY_AT = [[format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid],1],[format["%1gm_ge_army_medic_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid],1],[format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid],1]];
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

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo_win", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_ge_army_u1300l_container_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo_des", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_ge_army_u1300l_container_des", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo_trp", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_ge_army_u1300l_container_trp", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo_wdl", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_ge_army_u1300l_container_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo", _sid],1]];
		WHEELED_HEAVY = [[format["%1gm_ge_army_u1300l_container", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_mg3_win", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1gm_ge_army_iltis_milan_win", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command_win", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_fuchsa0_engineer_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_mg3_des", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1gm_ge_army_iltis_milan_des", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command_des", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_fuchsa0_engineer_des", _sid],1];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_mg3_trp", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1gm_ge_army_iltis_milan_trp", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command_trp", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_fuchsa0_engineer_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_mg3_wdl", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1gm_ge_army_iltis_milan_wdl", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command_wdl", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_fuchsa0_engineer_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_mg3", _sid],1]];
		WHEELED_LIGHT pushBack [format["%1gm_ge_army_iltis_milan", _sid],1];
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command", _sid],1]];
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_fuchsa0_engineer", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_reconnaissance_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_reconnaissance_des", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_reconnaissance_trp", _sid],1]];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_reconnaissance_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_reconnaissance", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa1", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa2_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa2_des", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa2_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa2_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		WHEELED_HEAVY pushBack [format["%1gm_ge_army_luchsa2", _sid],1];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_win", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_win", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_command_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_des", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_des", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_command_des", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_trp", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_trp", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_command_trp", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_wdl", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_wdl", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_command_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
		TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
		TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_command", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_milan_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_milan_des", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_milan_trp", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_milan_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1]];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_MEDIUM = [[format["%1gm_ge_army_marder1a1a_win", _sid],1]];
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a1plus_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM = [[format["%1gm_ge_army_marder1a1a_des", _sid],1]];
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a1plus_des", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_MEDIUM = [[format["%1gm_ge_army_marder1a1a_trp", _sid],1]];
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a1plus_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_MEDIUM = [[format["%1gm_ge_army_marder1a1a_wdl", _sid],1]];
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a1plus_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_MEDIUM = [[format["%1gm_ge_army_marder1a1a", _sid],1]];
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a1plus", _sid],1];
	};
	TRACKED_HEAVY = [[format["%1gm_ge_army_Leopard1a1", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a1_win", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a2_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a1_des", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a2_des", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a1_trp", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a2_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a1_wdl", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a2_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a1", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a1a2", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a2_win", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3_win", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3a1_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a2_des", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3_des", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3a1_des", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a2_trp", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3_trp", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3a1_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a2_wdl", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3_wdl", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3a1_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_MEDIUM pushBack [format["%1gm_ge_army_marder1a2", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3", _sid],1];
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a3a1", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a5_win", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a5_des", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a5_trp", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a5_wdl", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		TRACKED_HEAVY pushBack [format["%1gm_ge_army_Leopard1a5", _sid],1];
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
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

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

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1_win", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1_des", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1_trp", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1_wdl", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1", _sid],1]];
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
