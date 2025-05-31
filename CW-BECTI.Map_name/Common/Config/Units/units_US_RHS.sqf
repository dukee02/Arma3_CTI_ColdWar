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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_US_RHS.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_riflemanat", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_gunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_grenadier_m32", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_grenadier", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_engineer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_crewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_driver", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_explosives", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_riflemanat", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_engineer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_crewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_driver", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_explosives", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_grenadier", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_grenadier_m32", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_gunner", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_rifleman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_riflemanl", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m16", _sid];
		_c pushBack format["%1rhsusf_army_ucp_riflemanat", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_101st", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_10th", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_1stcav", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_82nd", _sid];
		_c pushBack format["%1rhsusf_army_ucp_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_army_ucp_medic", _sid];
		_c pushBack format["%1rhsusf_army_ucp_crewman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_driver", _sid];
		_c pushBack format["%1rhsusf_army_ucp_driver_armored", _sid];
		_c pushBack format["%1rhsusf_army_ucp_engineer", _sid];
		_c pushBack format["%1rhsusf_army_ucp_explosives", _sid];
		_c pushBack format["%1rhsusf_army_ucp_grenadier", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_rifleman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_riflemanl", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_10th", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_1stcav", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m590", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m16", _sid];
		_c pushBack format["%1rhsusf_army_ocp_rifleman_m4", _sid];
		_c pushBack format["%1rhsusf_army_ocp_medic", _sid];
		_c pushBack format["%1rhsusf_army_ocp_crewman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_combatcrewman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_driver", _sid];
		_c pushBack format["%1rhsusf_army_ocp_driver_armored", _sid];
		_c pushBack format["%1rhsusf_army_ocp_engineer", _sid];
		_c pushBack format["%1rhsusf_army_ocp_explosives", _sid];
		_c pushBack format["%1rhsusf_army_ocp_grenadier", _sid];
		_c pushBack format["%1rhsusf_army_ocp_riflemanat", _sid];
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
	_building_time = ["CTI_FACTORY_BARRACKS",_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_smaw", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman_m249", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_autorifleman_m249_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_jfo", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_spotter", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_marksman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_helicrew", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_helipilot", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_fso", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_officer", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_smaw", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_jfo", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_fso", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_helicrew", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_helipilot", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman_m249", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_autorifleman_m249_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_officer", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_marksman", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_spotter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_autorifleman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_autoriflemana", _sid];
		_c pushBack format["%1rhsusf_army_ucp_maaws", _sid];
		_c pushBack format["%1rhsusf_army_ucp_fso", _sid];
		_c pushBack format["%1rhsusf_army_ucp_helicrew", _sid];
		_c pushBack format["%1rhsusf_army_ucp_helipilot", _sid];
		_c pushBack format["%1rhsusf_army_ucp_ah64_pilot", _sid];
		_c pushBack format["%1rhsusf_army_ucp_jfo", _sid];
		_c pushBack format["%1rhsusf_army_ucp_marksman", _sid];
		_c pushBack format["%1rhsusf_army_ucp_officer", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_autorifleman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_autoriflemana", _sid];
		_c pushBack format["%1rhsusf_army_ocp_maaws", _sid];
		_c pushBack format["%1rhsusf_army_ocp_jfo", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper", _sid];
		_c pushBack format["%1rhsusf_army_ocp_marksman", _sid];
		_c pushBack format["%1rhsusf_army_ocp_ah64_pilot", _sid];
		_c pushBack format["%1rhsusf_army_ocp_helicrew", _sid];
		_c pushBack format["%1rhsusf_army_ocp_helipilot", _sid];
		_c pushBack format["%1rhsusf_army_ocp_fso", _sid];
		_c pushBack format["%1rhsusf_army_ocp_officer", _sid];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhsusf_usmc_marpat_d_machinegunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_machinegunner_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_javelin", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_sniper_m110", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_squadleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_teamleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_stinger", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_d_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhsusf_usmc_marpat_wd_machinegunner", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_machinegunner_ass", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_javelin", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper_m110", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_sniper_M107", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_squadleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_teamleader", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_stinger", _sid];
		_c pushBack format["%1rhsusf_usmc_marpat_wd_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1rhsusf_army_ucp_machinegunner", _sid];
		_c pushBack format["%1rhsusf_army_ucp_machinegunnera", _sid];
		_c pushBack format["%1rhsusf_army_ucp_javelin", _sid];
		_c pushBack format["%1rhsusf_army_ucp_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_army_ucp_sniper_m24sws", _sid];
		_c pushBack format["%1rhsusf_army_ucp_squadleader", _sid];
		_c pushBack format["%1rhsusf_army_ucp_teamleader", _sid];
		_c pushBack format["%1rhsusf_army_ucp_aa", _sid];
		_c pushBack format["%1rhsusf_army_ucp_uav", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhsusf_army_ocp_machinegunner", _sid];
		_c pushBack format["%1rhsusf_army_ocp_machinegunnera", _sid];
		_c pushBack format["%1rhsusf_army_ocp_javelin", _sid];
		_c pushBack format["%1rhsusf_army_ocp_javelin_assistant", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper_m107", _sid];
		_c pushBack format["%1rhsusf_army_ocp_sniper_m24sws", _sid];
		_c pushBack format["%1rhsusf_army_ocp_squadleader", _sid];
		_c pushBack format["%1rhsusf_army_ocp_teamleader", _sid];
		_c pushBack format["%1rhsusf_army_ocp_uav", _sid];
		_c pushBack format["%1rhsusf_army_ocp_aa", _sid];
	};
};
//set all other vars in a slope
_building_time = ["CTI_FACTORY_BARRACKS",_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m998_d_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_d_2dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_d_2dr_fulltop", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_d_4dr_fulltop", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m998_w_2dr", _sid];
		_c pushBack format["%1rhsusf_m998_w_2dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_w_2dr_fulltop", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr_halftop", _sid];
		_c pushBack format["%1rhsusf_m998_w_4dr_fulltop", _sid];
	};
	_c pushBack format["%1rhsusf_m1025_d", _sid];
	_c pushBack format["%1rhsusf_m1043_d", _sid];
	_c pushBack format["%1rhsusf_mrzr4_d", _sid];
	
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

	if(CTI_ADDON_CHARLIECO > 0) then {
		_c pushBack format["%1chvsavar_ivecoar", _sid];				//medic
		_p pushBack '';
		_n pushBack 'Red Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;	

		_c pushBack format["%1chmaster2_ap", _sid];				//medic
		_p pushBack '';
		_n pushBack 'Civil White Medic';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;
	} else {
		_c pushBack format["rhsgref_cdf_b_gaz66_ap2", _sid];//Medic
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack 'GAZ66 Mobile Respawn';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "service-medic";
			_d pushBack 10;		
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m966_d", _sid];
		_c pushBack format["%1rhsusf_m1045_d", _sid];
		_c pushBack format["%1rhsusf_m1151_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_rsv_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1152_sicps_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1165_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m966_w", _sid];
		_c pushBack format["%1rhsusf_m1025_w", _sid];
		_c pushBack format["%1rhsusf_m1043_w", _sid];
		_c pushBack format["%1rhsusf_m1045_w", _sid];
		_c pushBack format["%1rhsusf_m1151_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_rsv_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1152_sicps_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1165_usarmy_wd", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1025_d_m2", _sid];
		_c pushBack format["%1rhsusf_m1025_d_Mk19", _sid];
		_c pushBack format["%1rhsusf_m1043_d_m2", _sid];
		_c pushBack format["%1rhsusf_m1043_d_mk19", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1025_w_m2", _sid];
		_c pushBack format["%1rhsusf_m1025_w_mk19", _sid];
		_c pushBack format["%1rhsusf_m1043_w_m2", _sid];
		_c pushBack format["%1rhsusf_m1043_w_mk19", _sid];
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1117_D", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1117_W", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1151_m2_lras3_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v1_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1151_m2_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_lras3_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v1_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m2_v2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_m240_v2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19_v2_usarmy_wd", _sid];
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1R_SOV_M2_D_fmtv_socom", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_B_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1151_m2crows_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19crows_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M977A4_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M978A4_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_WD_fmtv_usarmy", _sid];
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

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'M1085 Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;		
	};

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M142_usarmy_D", _sid];
		_c pushBack format["%1rhsusf_M1220_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1239_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_m134d_m240_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_m2_m240_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1165a1_gmv_mk19_m240_socom_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M142_usarmy_WD", _sid];
		_c pushBack format["%1rhsusf_m1151_m2crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1151_mk19crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_usarmy_wd", _sid];
	};
	_c pushBack format["%1rhsusf_stryker_m1126_mk19_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1132_m2_np_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1132_m2_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1126_m2_wd", _sid];
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M977A4_BKIT_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1R_SOV_M2_D_fmtv_socom", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1220_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_M2_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1238A1_Mk19_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_M2_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_MK19_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_M2_Deploy_socom_d", _sid];
		_c pushBack format["%1rhsusf_M1239_MK19_Deploy_socom_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_uik_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2crows_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19crows_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M977A4_BKIT_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_M153_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1220_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m240_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19_uik_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_m2crows_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_m1240a1_mk19crows_usarmy_wd", _sid];
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
	
	_c pushBack format["%1rhsusf_stryker_m1134_wd", _sid];
	_c pushBack format["%1rhsusf_stryker_m1127_m2_wd", _sid];
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
	
	/*if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1133_MEV_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active´
		_c pushBack format["%1CUP_B_M1133_MEV_Woodland", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'M1133 Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;		
	};*/
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1230_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1230_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1232_MK19_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1237_M2_usarmy_d", _sid];
		_c pushBack format["%1rhsusf_M1237_MK19_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1230_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1230_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1232_MK19_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1237_M2_usarmy_wd", _sid];
		_c pushBack format["%1rhsusf_M1237_MK19_usarmy_wd", _sid];
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

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		_c pushBack format["%1rhsusf_M1230a1_usarmy_d", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_M1230a1_usarmy_wd", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'M1230a1 Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy_unarmed", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy_unarmed", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy_M240", _sid];
		_c pushBack format["%1rhsusf_m113d_usarmy_MK19", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy_M2_90", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_M240", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_MK19", _sid];
		_c pushBack format["%1rhsusf_m113_usarmy_MK19_90", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m113d_usarmy_medical", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m113_usarmy_medical", _sid];
	}; 
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'M113A1 Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m109d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m109_usarmy", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A2", _sid];
		_c pushBack format["%1RHS_M6", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A2_wd", _sid];
		_c pushBack format["%1RHS_M6_wd", _sid];
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

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1a1aimd_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1a1aimwd_usarmy", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A2_BUSKI", _sid];
		_c pushBack format["%1RHS_M2A3", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A2_BUSKI_WD", _sid];
		_c pushBack format["%1RHS_M2A3_wd", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1a1aim_tuski_d", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1a1aim_tuski_wd", _sid];
		_c pushBack format["%1rhsusf_m1a2sep1wd_usarmy", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A3_BUSKI", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A3_BUSKI_wd", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1a2sep1tuskid_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1a2sep2d_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1a2sep1tuskiwd_usarmy", _sid];
		_c pushBack format["%1rhsusf_m1a2sep2wd_usarmy", _sid];
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
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1RHS_M2A3_BUSKIII", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1RHS_M2A3_BUSKIII_wd", _sid];
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

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rhsusf_m1a2sep1tuskiid_usarmy", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1rhsusf_m1a2sep1tuskiiwd_usarmy", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1RHS_MELB_MH6M", _sid];
	_c pushBack format["%1RHS_MELB_H6M", _sid];
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
	
	_c pushBack format["%1RHS_UH1Y_UNARMED", _sid];
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

	_c pushBack format["%1RHS_MELB_AH6M", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
		
	_c pushBack format["%1RHS_UH1Y_FFAR", _sid];
	_c pushBack format["%1RHS_UH1Y", _sid];
	_c pushBack format["%1RHS_UH60M_ESSS_d", _sid];
	_c pushBack format["%1RHS_UH60M2_d", _sid];
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
	
	_c pushBack format["%1RHS_CH_47F_10", _sid];
	_c pushBack format["%1RHS_CH_47F_10_cargo", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
	
	_c pushBack format["%1RHS_UH60M_MEV2_d", _sid];
	_c pushBack format["%1RHS_UH60M_MEV_d", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'UH60M Mobile Respawn';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;		
	};
		
	_c pushBack format["%1RHS_UH60M_d", _sid];
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
	
	_c pushBack format["%1RHS_C130J", _sid];
	_c pushBack format["%1RHS_C130J_Cargo", _sid];
	_c pushBack format["%1RHS_AH1Z", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};
	
	_c pushBack format["%1RHS_A10", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
	
	_c pushBack format["%1rhsusf_CH53e_USMC_cargo", _sid];
	_c pushBack format["%1rhsusf_CH53E_USMC_GAU21", _sid];
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
	
	_c pushBack format["%1RHS_AH64D", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
	
	_c pushBack format["%1rhsusf_f22", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};

_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
if(_setupBaseUnits) then {
	switch true do
	{
		case (CTI_ADDON_CHARLIECO == 1): {
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
		case (CTI_SALVAGE_SPECIAL > 0 && CTI_GM_DLC >= 1): {};
		case (CTI_SALVAGE_SPECIAL > 0 && CTI_GM_DLC < 1): {
			_c pushBack format["CTI_Salvager_%1", _side];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1C_Van_02_medevac_F", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1C_Van_02_medevac_F", _sid],"salvager-independent"];
			_d pushBack 10;
		};
		default  {
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1rhsusf_M1084A1P2_B_D_fmtv_usarmy", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1rhsusf_M1084A1P2_B_D_fmtv_usarmy", _sid],"salvager-independent"];
				_d pushBack 10;
			} else {
				_c pushBack format["CTI_Salvager_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1rhsusf_M1084A1P2_WD_fmtv_usarmy", _sid],"salvager"];
				_d pushBack 10;
					
				_c pushBack format["CTI_Salvager_Independent_%1", _faction];
				_p pushBack '';
				_n pushBack 'Salvager Truck';
				_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_REPAIR;
				_s pushBack [format["%1rhsusf_M1084A1P2_WD_fmtv_usarmy", _sid],"salvager-independent"];
				_d pushBack 10;
			};
		};
	};
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_d", _sid];			//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_usarmy_wd", _sid];				//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d", _sid];			//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", _sid];				//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};
	
//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_d", _sid];				//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;
	
	_c pushBack format["%1rhsusf_M978A4_usarmy_d", _sid];			//Fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 10;
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_usarmy_wd", _sid];					//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
	
	_c pushBack format["%1rhsusf_M978A4_usarmy_wd", _sid];				//Fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 10;	
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d", _sid];			//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", _sid];					//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rhsusf_m113d_usarmy_supply", _sid];//Ammotruck
	_p pushBack '';
	_n pushBack 'M113 Ammo';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
};

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
/*if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_B_Seafox_USMC", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 10;
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_US_RHS.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";