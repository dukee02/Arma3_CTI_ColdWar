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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_RACS_CUP.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<5): {5}; case (_time>50): {50}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer", _sid];
		_c pushBack format["%1CUP_I_RACS_GL", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_GL_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_GL_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid];
	};
	_c pushBack format["%1CUP_I_RACS_Crew", _sid];
	
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
//Pilots are basic units, so we need to set it up without tier-check to prevent issues
_c pushBack format["%1CUP_I_RACS_Pilot", _sid];
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG", _sid];
		_c pushBack format["%1CUP_I_RACS_AR", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG", _sid];
		_c pushBack format["%1CUP_I_RACS_M", _sid];
		_c pushBack format["%1CUP_I_RACS_SL", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_AR_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_M_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_SL_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_AR_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_M_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_SL_wdl", _sid];
	};
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

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//TLs spawn as AI-commanders, so we need to set it up without tier-check to prevent issues
_time = (5*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
_building_time = switch(true) do {case (_time<5): {5}; case (_time>50): {50}; default {_time}};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
	_c pushBack format["%1CUP_I_RACS_Officer", _sid];
};
if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
	_c pushBack format["%1CUP_I_RACS_Officer_Urban", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
	_c pushBack format["%1CUP_I_RACS_Officer_wdl", _sid];
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper_wdl", _sid];
	};
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_TowingTractor_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_Transport_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_MG_RACS", _sid];

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
	
	_c pushBack format["%1CUP_I_LR_Ambulance_RACS", _sid];
	_p pushBack '';
	if(CTI_RESPAWN_MOBILE <= 0) then {
		_n pushBack 'Medic (Heal only)';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	} else {
		_n pushBack 'Medic (Mobile Respawn)';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	};
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 10;	

	_c pushBack format["%1CUP_I_MTVR_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
	//_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];
	//_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];
	//_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_LAV25_HQ_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;

	_c pushBack format["%1CUP_I_LAV25_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_AA_RACS", _sid];
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

	_c pushBack format["%1CUP_I_LAV25M240_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 10;	
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_AAV_Unarmed_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_AAV_RACS", _sid];
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_I_M113_RACS_URB", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 4 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_M113_RACS", _sid];
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
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_M113_Med_RACS", _sid];
	_p pushBack '';
	if(CTI_RESPAWN_MOBILE <= 0) then {
		_n pushBack 'BMP2 Medic (Heal only)';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	} else {
		_n pushBack 'BMP2 Medic (Mobile Respawn)';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	};
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "service-medic";
	_d pushBack 10;	

	_c pushBack format["%1CUP_I_M163_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_M60A3_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_I_T72_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_I_M270_DPICM_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_I_M270_HE_RACS", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_MH6J_RACS", _sid];
	_c pushBack format["%1CUP_I_SA330_Puma_HC1_RACS", _sid];
	_c pushBack format["%1CUP_I_SA330_Puma_HC2_RACS", _sid];
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
	
	_c pushBack format["%1CUP_I_UH1H_RACS", _sid];
	_c pushBack format["%1CUP_I_UH1H_Slick_RACS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;	
	};

	_c pushBack format["%1CUP_I_UH60L_Unarmed_RACS", _sid];
	_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_Racs", _sid];
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

	_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_MEV_Racs", _sid];//Medic
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'UH60L Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'UH60L Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "service-medic";
		_d pushBack 10;	
	};

	_c pushBack format["%1CUP_I_AH6J_RACS", _sid];
	_c pushBack format["%1CUP_I_C130J_RACS", _sid];
	_c pushBack format["%1CUP_I_C130J_Cargo_RACS", _sid];
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
	
	_c pushBack format["%CUP_I_UH1H_Armed_RACS", _sid];
	_c pushBack format["%CUP_I_UH1H_gunship_RACS", _sid];
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

	_c pushBack format["%CUP_I_UH60L_RACS", _sid];
	_c pushBack format["%CUP_I_UH60L_FFV_RACS", _sid];
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
	
	_c pushBack format["%CUP_I_CH47F_RACS", _sid];
	_c pushBack format["%CUP_I_CH47F_VIV_RACS", _sid];
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

	_c pushBack format["%CUP_I_JAS39_RACS", _sid];
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED > _tech_level) then {
	_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
	
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1CUP_I_MTVR_RACS", _sid],"salvager"];
	_d pushBack 10;
		
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvager Truck';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1CUP_I_MTVR_RACS", _sid],"salvager-independent"];
	_d pushBack 10;
};

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
if(CTI_ECONOMY_LEVEL_WHEELED > _tech_level) then {	
	_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];					//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
	
	_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Fueltruck
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
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_LCVP_RACS", _sid];
	_c pushBack format["%1CUP_I_LCVP_VIV_RACS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_RHIB_RACS", _sid];
	_c pushBack format["%1CUP_I_RHIB2Turret_RACS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_LCU1600_RACS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_I_Frigate_RACS", _sid];
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_RACS_CUP.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";