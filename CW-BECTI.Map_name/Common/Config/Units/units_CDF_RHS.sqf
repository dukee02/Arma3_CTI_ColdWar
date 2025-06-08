private ["_side", "_faction", "_sid", "_building_time", "_tech_level", "_price_unit", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_sid = "";
_building_time = 10;

switch (_side) do {
	case west: {_sid = "_b";_faction = "West";};
	case east: {_sid = "";_faction = "East";};
	case resistance: {_sid = "";_faction = "Resistance";};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_ChDKZ_RHS.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["rhsgref_cdf%1_ngd_rifleman", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_rifleman_lite", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_crew", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_grenadier_rpg", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_engineer", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_medic", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_rifleman_ak74", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_grenadier", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["rhsgref_cdf%1_para_rifleman", _sid];
		_c pushBack format["rhsgref_cdf%1_para_rifleman_lite", _sid];
		_c pushBack format["rhsgref_cdf%1_para_crew", _sid];
		_c pushBack format["rhsgref_cdf%1_para_grenadier_rpg", _sid];
		_c pushBack format["rhsgref_cdf%1_para_autorifleman", _sid];
		_c pushBack format["rhsgref_cdf%1_para_engineer", _sid];
		_c pushBack format["rhsgref_cdf%1_para_grenadier", _sid];
		_c pushBack format["rhsgref_cdf%1_para_marksman", _sid];
		_c pushBack format["rhsgref_cdf%1_para_medic", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["rhsgref_cdf%1_reg_rifleman", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_rifleman_lite", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_crew", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_grenadier_rpg", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_engineer", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_medic", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_rifleman_akm", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_rifleman_aks74", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_grenadier", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["rhsgref_cdf%1_ngd_machinegunner", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_rifleman_rpg75", _sid];
		_c pushBack format["rhsgref_cdf%1_ngd_squadleader", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["rhsgref_cdf%1_para_machinegunner", _sid];
		_c pushBack format["rhsgref_cdf%1_para_squadleader", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["rhsgref_cdf%1_reg_machinegunner", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_rifleman_rpg75", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_arifleman_rpk", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_squadleader", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_crew_commander", _sid];
	};
	_c pushBack format["rhsgref_cdf%1_air_pilot", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["rhsgref_cdf%1_ngd_officer", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["rhsgref_cdf%1_para_officer", _sid];
		_c pushBack format["rhsgref_cdf%1_para_specialist_aa", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["rhsgref_cdf%1_reg_officer", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_specialist_aa", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_marksman", _sid];
		_c pushBack format["rhsgref_cdf%1_reg_general", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	_price_unit = [CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_gaz66", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66_flat", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66o", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66o_flat", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_zil131", _sid];
	_c pushBack format["rhsgref_cdf%1_zil131_open", _sid];
	_c pushBack format["rhsgref_cdf%1_zil131_flatbed", _sid];
	//_c pushBack format["rhsgref_cdf%1_zil131_flatbed_cover", _sid];//salvager
	_c pushBack format["rhsgref_cdf%1_gaz66_zu23", _sid];//Flak
	_c pushBack format["rhsgref_cdf%1_gaz66_r142", _sid];//HQ
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_gaz66_ap2", _sid];//Medic
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'UAZ Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'UAZ Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
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

	_c pushBack format["rhsgref_cdf%1_reg_uaz", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_open", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_reg_uaz_ags", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_dshkm", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_spg9", _sid];
	_c pushBack format["rhsgref_cdf%1_ural", _sid];
	_c pushBack format["rhsgref_cdf%1_ural_open", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};
	
	_c pushBack format["rhsgref_cdf%1_ural_Zu23", _sid];//Flak
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_BRDM2%1", _sid];
	_c pushBack format["rhsgref_BRDM2UM%1", _sid];
	_c pushBack format["rhsgref_BRDM2_HQ%1", _sid];
	_c pushBack format["rhsgref_cdf%1_btr60", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_BRDM2_ATGM%1", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_reg_BM21", _sid];//Artytruck
	_c pushBack format["rhsgref_cdf%1_btr70", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_btr80", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["rhsgref_cdf%1_bmd1", _sid];
	_c pushBack format["rhsgref_cdf%1_bmd1k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmd1pk", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_bmd1p", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_bmp1", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1d", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1p", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_bmd2", _sid];  
	_c pushBack format["rhsgref_cdf%1_bmd2k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2e", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2d", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2k", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};


	_c pushBack format["rhsgref_cdf%1_t72ba_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_2s1", _sid];
	_c pushBack format["rhsgref_cdf%1_2s1_at", _sid];
	_c pushBack format["rhsgref_cdf%1_zsu234", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_t72bb_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_t80b_tv", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_t80bv_tv", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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

	_c pushBack format["rhsgref_cdf%1_t80u_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_t80uk_tv", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["RHS_AN2_B", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_reg_Mi8amt", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Mi8 Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Mi8 Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "service-medic";
		_d pushBack 10;
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_reg_Mi17Sh", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};

	if(_side == west) then {
		_c pushBack format["rhs_l159_cdf%1_CDF", _sid];
		_c pushBack format["rhs_l39_cdf%1_cdf", _sid];
	} else {
		_c pushBack format["rhs_l159_cdf%1", _sid];
		_c pushBack format["rhs_l39_cdf%1", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_Mi24D", _sid];
	_c pushBack format["rhsgref_cdf%1_Mi24D_Early", _sid];
	_c pushBack format["rhsgref_cdf%1_Mi35", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["rhsgref_cdf%1_mig29s", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_su25", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_b_mi24g_CAS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	_price_unit = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _price_unit;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
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
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_CDF_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};

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
			_s pushBack [format["chEPA_RenaultM", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["ccfm_mercedes", _sid],"salvager-independent"];
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
			_s pushBack [format["C_IDAP_Van_02_medevac_F", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["C_IDAP_Van_02_medevac_F", _sid],"salvager-independent"];
			_d pushBack 10;
		};
		default  {
			_c pushBack format["CTI_Salvager_%1", _side];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["rhsgref_cdf%1_zil131_flatbed_cover", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["rhsgref_cdf%1_zil131_flatbed_cover", _sid],"salvager-independent"];
			_d pushBack 10;	
		};
	};
};
	
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	_c pushBack format["rhsgref_cdf%1_gaz66_repair", _sid];			//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	_c pushBack format["rhsgref_cdf%1_ural_repair", _sid];			//Repairtruck
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["rhsgref_cdf%1_gaz66_ammo", _sid];				//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["rhsgref_cdf%1_ural_fuel", _sid];				//Fueltruck
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
//_tech_level = 0;
//_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
//_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time};};
/*_c pushBack 'O_Boat_Transport_01_F';
_p pushBack '';
_n pushBack '';
_o pushBack 1000;
_t pushBack _building_time;
_u pushBack (_tech_level*_tech_level_no_upgrade_inv);
_f pushBack CTI_FACTORY_NAVAL;
_s pushBack "";
_d pushBack 10;*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_ChDKZ_RHS.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
