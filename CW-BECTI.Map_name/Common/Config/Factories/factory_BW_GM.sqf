private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_BW_ID || CTI_WEST_TOWNS == CTI_BW_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_BW_ID || CTI_EAST_TOWNS == CTI_BW_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "";_tag = "GUER_";
	};
	default {_sid = "";};
};

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
//Check if the based units have to set.
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_GM_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_BW_ID,(_isThisMain select 1),CTI_GM_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_GM.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g3a4_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_radioman_g3a3_parka_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g3a4_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g3a4_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_medic_g3a3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_radioman_g3a3_80_ols", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_g3a3_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g3a4_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_medic_g3a3_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_radioman_g3a3_parka_80_ols", _sid];
	};
	_c pushBack format["%1gm_ge_army_crew_mp2a1_80_oli", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_hk69a1_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_paratrooper_g3a4_parka_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_hk69a1_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_paratrooper_g3a4_80_oli", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_paratrooper_g3a4_parka_80_oli", _sid];
	};
	_c pushBack format["%1gm_ge_army_pilot_p1_80_oli", _sid];
	_c pushBack format["%1gm_ge_army_pilot_80_rolled_sar", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_milan_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_antiair_g3a3_fim43_parka_80_win", _sid];
		_c pushBack format["%1gm_ge_army_marksman_g3a3_parka_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_80_oli", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_milan_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antiair_g3a3_fim43_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_marksman_g3a3_80_ols", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_squadleader_g3a3_p2a1_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_milan_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antiair_g3a3_fim43_parka_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_marksman_g3a3_parka_80_ols", _sid];
	};
	_c pushBack format["%1gm_ge_army_pilot_p1_80_oli", _sid];
	_c pushBack format["%1gm_ge_army_pilot_80_rolled_sar", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_antiair_g36a1_fim43_90_win", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g36a1_milan_90_win", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_hk69a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_90_win", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win", _sid];
		_c pushBack format["%1gm_ge_army_marksman_g3a3_90_win", _sid];
		_c pushBack format["%1gm_ge_army_medic_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_paratrooper_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_radioman_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_rifleman_g36a1_90_win", _sid];
		_c pushBack format["%1gm_ge_army_squadleader_g36a1_p2a1_90_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_antiair_g36a1_fim43_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g36a1_milan_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_crew_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_hk69a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_marksman_g3a3_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_medic_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_paratrooper_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_radioman_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid];
		_c pushBack format["%1gm_ge_army_squadleader_g36a1_p2a1_90_flk", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1gm_ge_army_bicycle_01_oli", _sid];
	_c pushBack format["%1gm_ge_army_k125", _sid];
	_c pushBack format["%1gm_ge_army_typ1200_cargo", _sid];
	_c pushBack format["%1gm_ge_army_typ247_firefighter", _sid];
	_c pushBack format["%1gm_ge_army_typ247_cargo", _sid];
	_c pushBack format["%1gm_ge_army_typ253_cargo", _sid];
	_c pushBack format["%1gm_ge_army_typ253_mp", _sid];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_iltis_cargo_win", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_container_win", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_cargo_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_iltis_cargo_des", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_container_des", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_cargo_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_iltis_cargo_trp", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_container_trp", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_cargo_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_iltis_cargo_wdl", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_container_wdl", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_cargo_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_iltis_cargo", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_container", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_cargo", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1gm_ge_army_w123_cargo", _sid];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_win", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan_win", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_medic_win_rc", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container_win", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo_win", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_win", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_command_win", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_win", _sid];	
		_c pushBack format["%1gm_ge_army_fuchsa1_jammer_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_des", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan_des", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_medic_des_rc", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container_des", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo_des", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_des", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_command_des", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_des", _sid];	
		_c pushBack format["%1gm_ge_army_fuchsa1_jammer_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_trp", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan_trp", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_medic_trp_rc", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container_trp", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo_trp", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_trp", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_command_trp", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_trp", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa1_jammer_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_wdl", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan_wdl", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_medic_wdl_rc", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container_wdl", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo_wdl", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_wdl", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_command_wdl", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_fuchsa1_jammer_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan", _sid];
		_c pushBack format["%1gm_ge_army_u1300l_medic", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_command", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer", _sid];	
		_c pushBack format["%1gm_ge_army_fuchsa1_jammer", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_win", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_medic_win", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_des", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_medic_des", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active	
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_trp", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_medic_trp", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_wdl", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_medic_wdl", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_medic", _sid];			//medic
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1gm_ge_army_luchsa1", _sid];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_kat1_463_mlrs_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_kat1_463_mlrs_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_kat1_463_mlrs_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_kat1_463_mlrs_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_kat1_463_mlrs", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_luchsa2_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_luchsa2_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_luchsa2_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_luchsa2_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_luchsa2", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_win", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_des", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_trp", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_wdl", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1gm_ge_army_m113a1g_medic", _sid];				//medic
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_m113a1g_mortar_win", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_m113a1g_mortar_des", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_m113a1g_mortar_trp", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_m113a1g_mortar_wdl", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_m113a1g_mortar", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_win", _sid];	
		_c pushBack format["%1gm_ge_army_marder1a1plus_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_des", _sid];	
		_c pushBack format["%1gm_ge_army_marder1a1plus_des", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_trp", _sid];	
		_c pushBack format["%1gm_ge_army_marder1a1plus_trp", _sid];		
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_marder1a1plus_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_marder1a1a", _sid];	
		_c pushBack format["%1gm_ge_army_marder1a1plus", _sid];	
	};
	_c pushBack format["%1gm_ge_army_Leopard1a1", _sid];	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_Leopard1a1a1_win", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2_win", _sid];
		_c pushBack format["%1gm_ge_army_m109g_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_Leopard1a1a1_des", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2_des", _sid];
		_c pushBack format["%1gm_ge_army_m109g_des", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_Leopard1a1a1_trp", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2_trp", _sid];
		_c pushBack format["%1gm_ge_army_m109g_trp", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_Leopard1a1a1_wdl", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2_wdl", _sid];
		_c pushBack format["%1gm_ge_army_m109g_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_Leopard1a1a1", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2", _sid];
		_c pushBack format["%1gm_ge_army_m109g", _sid];	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_marder1a2_win", _sid];	
		_c pushBack format["%1gm_ge_army_rakjpz2_win", _sid];	
		_c pushBack format["%1gm_ge_army_gepard1a1_win", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_win", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_marder1a2_des", _sid];	
		_c pushBack format["%1gm_ge_army_rakjpz2_des", _sid];	
		_c pushBack format["%1gm_ge_army_gepard1a1_des", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_des", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_marder1a2_trp", _sid];	
		_c pushBack format["%1gm_ge_army_rakjpz2_trp", _sid];	
		_c pushBack format["%1gm_ge_army_gepard1a1_trp", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_trp", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_marder1a2_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_rakjpz2_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_gepard1a1_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_wdl", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_marder1a2", _sid];	
		_c pushBack format["%1gm_ge_army_rakjpz2", _sid];	
		_c pushBack format["%1gm_ge_army_gepard1a1", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_Leopard1a4_win", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a5_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_Leopard1a4_des", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a5_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_Leopard1a4_trp", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a5_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_Leopard1a4_wdl", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a5_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_Leopard1a4", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a5", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_ge_army_bo105m_vbh", _sid];
	_c pushBack format["%1gm_ge_army_bo105p1m_vbh", _sid];
	_c pushBack format["%1gm_ge_army_bo105p1m_vbh_swooper", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_ge_airforce_do28d2", _sid];
	_c pushBack format["%1gm_ge_airforce_do28d2_medevac", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_ge_army_ch53g", _sid];
	_c pushBack format["%1gm_ge_army_ch53gs", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_ge_army_bo105p_pah1", _sid];
	_c pushBack format["%1gm_ge_army_bo105p_pah1a1", _sid];
};
	
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_win", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_des", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_trp", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_wdl", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair", _sid];			//repair
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_win", _sid];					//repair
		_c pushBack format["%1gm_ge_army_bibera0_win", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_des", _sid];					//repair
		_c pushBack format["%1gm_ge_army_bibera0_des", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_trp", _sid];					//repair
		_c pushBack format["%1gm_ge_army_bibera0_trp", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_wdl", _sid];					//repair
		_c pushBack format["%1gm_ge_army_bibera0_wdl", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_bpz2a0", _sid];					//repair
		_c pushBack format["%1gm_ge_army_bibera0", _sid];					//bridgelayer
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_win", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_win", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_win", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_des", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_des", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_des", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_trp", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_trp", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_trp", _sid];
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_wdl", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_wdl", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_wdl", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//desert camo active
				_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid];
				_c pushBack format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid];
			};
			case 3: {//jungle camo active
				_c pushBack format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid];
				_c pushBack format["%1gm_ge_army_medic_g3a3_80_ols", _sid];
			};
			default {//main camo active
				_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid];
				_c pushBack format["%1gm_ge_army_medic_g3a3_parka_80_ols", _sid];
			};	
		};
		_c pushBack format["%1gm_ge_army_crew_mp2a1_80_oli", _sid];
	};
};

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_iltis_cargo_win", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_iltis_cargo_des", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_iltis_cargo_trp", _sid];
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_iltis_cargo_wdl", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_iltis_cargo", _sid];
};
_c pushBack format["%1gm_ge_army_k125", _sid];

_c pushBack format["%1gm_ge_civ_typ1200", _sid];
_c pushBack format["%1gm_ge_civ_typ247", _sid];
_c pushBack format["%1gm_ge_civ_typ251", _sid];
_c pushBack format["%1gm_ge_civ_typ253", _sid];
_c pushBack format["%1gm_ge_civ_w123", _sid];

_c pushBack format["%1gm_ge_taxi_typ253", _sid];
_c pushBack format["%1gm_ge_taxi_w123", _sid];

_c pushBack format["%1gm_ge_dbp_typ1200", _sid];
_c pushBack format["%1gm_ge_dbp_typ247", _sid];
_c pushBack format["%1gm_ge_dbp_typ251", _sid];
_c pushBack format["%1gm_ge_dbp_w123", _sid];

_c pushBack format["%1gm_ge_ff_typ1200", _sid];
_c pushBack format["%1gm_ge_ff_typ247_firefighter", _sid];
_c pushBack format["%1gm_ge_ff_typ247", _sid];
_c pushBack format["%1gm_ge_ff_typ253", _sid];
_c pushBack format["%1gm_ge_ff_u1300l_medic", _sid];
_c pushBack format["%1gm_ge_ff_w123", _sid];

_c pushBack format["%1gm_ge_pol_typ1200", _sid];
_c pushBack format["%1gm_ge_pol_typ253", _sid];
_c pushBack format["%1gm_ge_pol_w123", _sid];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			_c pushBack format["%1gm_ge_army_kat1_451_refuel_win", _sid];
			_c pushBack format["%1gm_ge_army_kat1_454_reammo_win", _sid];
			_c pushBack format["%1gm_ge_army_u1300l_repair_win", _sid];			//repair
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1gm_ge_army_kat1_451_refuel_des", _sid];
			_c pushBack format["%1gm_ge_army_kat1_454_reammo_des", _sid];
			_c pushBack format["%1gm_ge_army_u1300l_repair_des", _sid];			//repair
		};
		if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
			_c pushBack format["%1gm_ge_army_kat1_451_refuel_trp", _sid];
			_c pushBack format["%1gm_ge_army_kat1_454_reammo_trp", _sid];
			_c pushBack format["%1gm_ge_army_u1300l_repair_trp", _sid];			//repair
		};
		if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
			_c pushBack format["%1gm_ge_army_kat1_451_refuel_wdl", _sid];
			_c pushBack format["%1gm_ge_army_kat1_454_reammo_wdl", _sid];
			_c pushBack format["%1gm_ge_army_u1300l_repair_wdl", _sid];			//repair
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
			_c pushBack format["%1gm_ge_army_kat1_454_reammo", _sid];
			_c pushBack format["%1gm_ge_army_u1300l_repair", _sid];			//repair
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	//_c pushBack format["%", _sid];
};*/

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_GM.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
