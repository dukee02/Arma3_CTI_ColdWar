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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_BWA3.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_lite_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_Tropen", _sid];	
		_c pushBack format["%1BWA3_Medic_Tropen", _sid];
		_c pushBack format["%1BWA3_Crew_Tropen", _sid];
		_c pushBack format["%1BWA3_Engineer_Tropen", _sid];	
		_c pushBack format["%1BWA3_Grenadier_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG3_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_CG_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Pioneer_Tropen", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_lite_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_Fleck", _sid];
		_c pushBack format["%1BWA3_Crew_Fleck", _sid];
		_c pushBack format["%1BWA3_Medic_Fleck", _sid];
		_c pushBack format["%1BWA3_Engineer_Fleck", _sid];
		_c pushBack format["%1BWA3_Grenadier_Fleck", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG3_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_CG_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Pioneer_Fleck", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Fleck", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Multi", _sid];	
		_c pushBack format["%1BWA3_Rifleman_lite_Multi", _sid];
		_c pushBack format["%1BWA3_Rifleman_Multi", _sid];	
		_c pushBack format["%1BWA3_Medic_Multi", _sid];	
		_c pushBack format["%1BWA3_Crew_Multi", _sid];	
		_c pushBack format["%1BWA3_Engineer_Multi", _sid];	
		_c pushBack format["%1BWA3_Grenadier_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG3_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAT_CG_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Pioneer_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Multi", _sid];
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

	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG4_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Medic_Tropen", _sid];		
		_c pushBack format["%1BWA3_recon_LAT_Tropen", _sid];		
		_c pushBack format["%1BWA3_recon_Tropen", _sid];		
		_c pushBack format["%1BWA3_Marksman_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Marksman_Tropen", _sid];		
		_c pushBack format["%1BWA3_Tank_Commander_Tropen", _sid];
		_c pushBack format["%1BWA3_SL_Tropen", _sid];		
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG4_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Medic_Fleck", _sid];		
		_c pushBack format["%1BWA3_recon_LAT_Fleck", _sid];		
		_c pushBack format["%1BWA3_recon_Fleck", _sid];		
		_c pushBack format["%1BWA3_Marksman_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Marksman_Fleck", _sid];		
		_c pushBack format["%1BWA3_Tank_Commander_Fleck", _sid];
		_c pushBack format["%1BWA3_SL_Fleck", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG4_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Medic_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_LAT_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Multi", _sid];	
		_c pushBack format["%1BWA3_Marksman_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Marksman_Multi", _sid];	
		_c pushBack format["%1BWA3_Tank_Commander_Multi", _sid];	
		_c pushBack format["%1BWA3_SL_Multi", _sid];
	};
	_c pushBack format["%1BWA3_Helipilot", _sid];
	
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

	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG5_Tropen", _sid];
		_c pushBack format["%1BWA3_Officer_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_G27_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_G28_Tropen", _sid];
		_c pushBack format["%1BWA3_TL_Tropen", _sid];	
		_c pushBack format["%1BWA3_recon_TL_Tropen", _sid];	
		_c pushBack format["%1BWA3_Sniper_G29_Tropen", _sid];		
		_c pushBack format["%1BWA3_Sniper_G82_Tropen", _sid];		
		_c pushBack format["%1BWA3_Spotter_Tropen", _sid];					
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG5_Fleck", _sid];
		_c pushBack format["%1BWA3_Officer_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G27_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G28_Fleck", _sid];
		_c pushBack format["%1BWA3_TL_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_TL_Fleck", _sid];		
		_c pushBack format["%1BWA3_Sniper_G29_Fleck", _sid];		
		_c pushBack format["%1BWA3_Sniper_G82_Fleck", _sid];		
		_c pushBack format["%1BWA3_Spotter_Fleck", _sid];		
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG5_Multi", _sid];	
		_c pushBack format["%1BWA3_Officer_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Multi", _sid];	
		_c pushBack format["%1BWA3_Rifleman_G27_Multi", _sid];
		_c pushBack format["%1BWA3_TL_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_TL_Multi", _sid];	
		_c pushBack format["%1BWA3_Sniper_G29_Multi", _sid];	
		_c pushBack format["%1BWA3_Sniper_G82_Multi", _sid];	
		_c pushBack format["%1BWA3_Spotter_Multi", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid];	
		_c pushBack format["%1BWA3_Multi_Fleck", _sid];
		_c pushBack format["%1BW_LKW_Transport_offen_Winter", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Winter", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Tropen", _sid];	
		_c pushBack format["%1BWA3_Multi_Tropen", _sid];
		_c pushBack format["%1BW_LKW_Transport_offen_Tropen", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid];	
		_c pushBack format["%1BWA3_Multi_Fleck", _sid];
		_c pushBack format["%1BW_LKW_Transport_offen_fleck", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Fleck", _sid];
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
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid];
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
		_c pushBack format["%1BW_LKW_Medic_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BW_LKW_Medic_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BW_LKW_Medic_Fleck", _sid];
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Sanitaeter (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Sanitaeter (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Puma_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Puma_Fleck", _sid];
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
		_c pushBack format["%1BWA3_Panzerhaubitze2000_Tropen", _sid];
		_c pushBack format["%1BWA3_Skorpion_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Panzerhaubitze2000_Fleck", _sid];
		_c pushBack format["%1BWA3_Skorpion_Fleck", _sid];
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
		_c pushBack format["%1BWA3_Leopard2_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Leopard2_Fleck", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	//_c pushBack format["%1BWA3_Tiger_Gunpod_FZ", _sid];
	_c pushBack format["%1BWA3_Tiger_Gunpod_Heavy", _sid];
	//_c pushBack format["%1BWA3_Tiger_Gunpod_PARS", _sid];

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

	//_c pushBack format["%1BWA3_Tiger_RMK_Heavy", _sid];
	_c pushBack format["%1BWA3_Tiger_RMK_PARS", _sid];
	//_c pushBack format["%1BWA3_Tiger_RMK_Universal", _sid];

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
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory._setupBaseUnits = false;
_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_BWA3_ID) then {_setupBaseUnits = true;};

_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
if(_setupBaseUnits) then {
	if(CTI_ADDON_CHARLIECO < 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			_c pushBack format["CTI_Salvager_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Winter", _sid],"salvager"];
					
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Winter", _sid],"salvager-independent"];
			};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["CTI_Salvager_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Tropen", _sid],"salvager"];
					
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Tropen", _sid],"salvager-independent"];
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			_c pushBack format["CTI_Salvager_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Fleck", _sid],"salvager"];
					
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_s pushBack [format["%1BW_LKW_Geraet_Fleck", _sid],"salvager-independent"];
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_d pushBack 10;
		};
	};
};


_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BW_LKW_Reparatur_Winter", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active	
		_c pushBack format["%1BW_LKW_Reparatur_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active	
		_c pushBack format["%1BW_LKW_Reparatur_Fleck", _sid];	
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
};
	
//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BW_LKW_Munition_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BW_LKW_Munition_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1BW_LKW_Munition_Fleck", _sid];
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
		_c pushBack format["%1BW_LKW_Treibstoff_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BW_LKW_Treibstoff_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1BW_LKW_Treibstoff_Fleck", _sid];
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
};

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 10;
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_BW_BWA3.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
