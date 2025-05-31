private ["_side", "_faction", "_sid", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_sid = "";
_building_time = 10;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_faction = "West";};
	case east: {/*_sid = "VIOC_O_";*/_faction = "East";};
	case resistance: {/*_sid = "VIOC_I_";*/_faction = "Resistance";};
	default {_sid = "";_faction = "";};
};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_GM.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid];
	};
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_bicycle_01_oli", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.25] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	

	_c pushBack format["%1gm_ge_army_k125", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_w123_cargo", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_iltis_mg3", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_kat1_451_container_win", _sid];
		//_c pushBack format["%1gm_ge_army_kat1_451_cargo_win", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_kat1_451_container_des", _sid];
		//_c pushBack format["%1gm_ge_army_kat1_451_cargo_des", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_kat1_451_container_trp", _sid];
		//_c pushBack format["%1gm_ge_army_kat1_451_cargo_trp", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_kat1_451_container_wdl", _sid];
		//_c pushBack format["%1gm_ge_army_kat1_451_cargo_wdl", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_kat1_451_container", _sid];
		//_c pushBack format["%1gm_ge_army_kat1_451_cargo", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_iltis_milan_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_iltis_milan_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_iltis_milan_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_iltis_milan_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_iltis_milan", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_command_win", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_command_des", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_des", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_command_trp", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_command_wdl", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_command", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer", _sid];	
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_u1300l_medic_win_rc", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_u1300l_medic_des_rc", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_u1300l_medic_trp_rc", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_u1300l_medic_wdl_rc", _sid];			//medic
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_u1300l_medic", _sid];			//medic
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'Rettungswagen (Mobile Respawn)';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;		
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active	
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance", _sid];
	};
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_m113a1g_medic", _sid];				//medic
	_p pushBack '';
	_n pushBack 'Sanitäter (Mobile Respawn)';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,(_tech_level-1),true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 10;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan", _sid];
	};

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,(_tech_level-1)] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {	
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_marder1a1a_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_marder1a1a", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,(_tech_level-1)] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_marder1a1plus_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_marder1a1plus_des", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_marder1a1plus_trp", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_marder1a1plus_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_marder1a1plus", _sid];	
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,(_tech_level-1),true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["%1gm_ge_army_Leopard1a1", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_marder1a2_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_marder1a2_des", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_marder1a2_trp", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_marder1a2_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_marder1a2", _sid];	
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_gepard1a1_win", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_win", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_gepard1a1_des", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_des", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_gepard1a1_trp", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_trp", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_gepard1a1_wdl", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3_wdl", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_gepard1a1", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a3", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_bo105m_vbh", _sid];
	_c pushBack format["%1gm_ge_army_bo105p1m_vbh", _sid];
	_c pushBack format["%1gm_ge_army_bo105p1m_vbh_swooper", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_airforce_do28d2", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["%1gm_ge_airforce_do28d2_medevac", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'Do28d2 Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;	
	};
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_ch53g", _sid];
	_c pushBack format["%1gm_ge_army_ch53gs", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};
};
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1gm_ge_army_bo105p_pah1", _sid];
	_c pushBack format["%1gm_ge_army_bo105p_pah1a1", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_GM_ID) then {_setupBaseUnits = true;};

_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
if(_setupBaseUnits) then {
	switch true do
	{
		case (CTI_ADDON_CHARLIECO == 1): {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_GM.sqf", format["Salvager CHARLIECO declared: [%1|%2|%3] ", CTI_ADDON_CHARLIECO, CTI_SALVAGE_SPECIAL, CTI_CAMO_ACTIVATION]] call CTI_CO_FNC_Log};

			_c pushBack format["CTI_Salvager_%1", _side];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1EPA", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1FPT_MAN", _sid],"salvager-independent"];
			_d pushBack 10;
		};
		case (CTI_SALVAGE_SPECIAL > 0): {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_GM.sqf", format["Salvager GM Fire declared: [%1|%2|%3] ", CTI_ADDON_CHARLIECO, CTI_SALVAGE_SPECIAL, CTI_CAMO_ACTIVATION]] call CTI_CO_FNC_Log};

			_c pushBack format["CTI_Salvager_%1", _side];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1gm_ge_ff_u1300l_firefighter", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			//_s pushBack [format["%1gm_ge_ff_u1300l_firefighter", _sid],"salvager-independent"];
			_s pushBack [format["%1gm_ge_ff_typ1200", _sid],"salvager-independent"];
			_d pushBack 10;
		};
		default  {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_GM.sqf", format["Salvager default declared: [%1|%2|%3] ", CTI_ADDON_CHARLIECO, CTI_SALVAGE_SPECIAL, CTI_CAMO_ACTIVATION]] call CTI_CO_FNC_Log};

			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_win", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_win", _sid],"salvager-independent"];
				_d pushBack 10;
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_des", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_des", _sid],"salvager-independent"];
				_d pushBack 10;
			};
			if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_trp", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_trp", _sid],"salvager-independent"];
				_d pushBack 10;
			};
			if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_wdl", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo_wdl", _sid],"salvager-independent"];
				_d pushBack 10;
			};
			if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1gm_ge_army_kat1_451_cargo", _sid],"salvager-independent"];
				_d pushBack 10;
			};
		};
	};
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

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
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_bibera0_win", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_bibera0_des", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_bibera0_trp", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_bibera0_wdl", _sid];					//bridgelayer
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_bibera0", _sid];					//bridgelayer
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "";
		_d pushBack 10;
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_win", _sid];					//repair
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_des", _sid];					//repair
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_trp", _sid];					//repair
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_bpz2a0_wdl", _sid];					//repair
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_bpz2a0", _sid];					//repair
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 10;
	};
};
	
//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_win", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_win", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_des", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_des", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_trp", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_trp", _sid];
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_wdl", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_wdl", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo", _sid];
};
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;
};


if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_win", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_des", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_trp", _sid];
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_wdl", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
};
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 10;
};

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	/*_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 10;*/
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

//*******************************************************************************************************************************************
//											 Civilian units																		  	  		*
//*******************************************************************************************************************************************
_tech_level = 0;
_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

_c pushBack format["%1gm_ge_civ_typ1200", _sid];
_c pushBack format["%1gm_ge_civ_typ247", _sid];
_c pushBack format["%1gm_ge_civ_typ251", _sid];
_c pushBack format["%1gm_ge_civ_typ253", _sid];

_c pushBack format["%1gm_ge_taxi_typ253", _sid];

_c pushBack format["%1gm_ge_dbp_typ1200", _sid];
_c pushBack format["%1gm_ge_dbp_typ247", _sid];
_c pushBack format["%1gm_ge_dbp_typ251", _sid];
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
};

_c pushBack format["%1gm_ge_ff_typ1200", _sid];
_c pushBack format["%1gm_ge_ff_typ247_firefighter", _sid];
_c pushBack format["%1gm_ge_ff_typ247", _sid];
_c pushBack format["%1gm_ge_ff_typ253", _sid];

_c pushBack format["%1gm_ge_pol_typ1200", _sid];
_c pushBack format["%1gm_ge_pol_typ253", _sid];
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
};

_c pushBack format["%1gm_ge_civ_w123", _sid];

_c pushBack format["%1gm_ge_taxi_w123", _sid];

_c pushBack format["%1gm_ge_dbp_w123", _sid];
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
};

_c pushBack format["%1gm_ge_ff_w123", _sid];

_c pushBack format["%1gm_ge_pol_w123", _sid];
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
};

_c pushBack format["%1gm_ge_ff_u1300l_medic", _sid];
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _p;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_p pushBack '';
	_n pushBack 'Rettungswagen FW (Mobile Respawn)';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 10;		
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_GM.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
