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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV_CUP.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Summer", _sid];
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
_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
//Pilots are basic units, so we need to set it up without tier-check to prevent issues
_c pushBack format["%1CUP_O_RU_Pilot_M_EMR", _sid];
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AR_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Officer_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Summer", _sid];
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
_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid];
};
if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid];
};
//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
//	_c pushBack format["%1", _sid];
//};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
	_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid];
};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Spotter_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7 || CTI_TOWN_CAMO == 4) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Summer", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
	_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];
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
	
	_c pushBack format["%1CUP_O_UAZ_SPG9_RU", _sid];			//SPG (AT)
	_c pushBack format["%1CUP_O_UAZ_AGS30_RU", _sid];			//GMG
	_c pushBack format["%1CUP_O_UAZ_MG_RU", _sid];				//MG
	_c pushBack format["%1CUP_O_Ural_Open_RU", _sid];
	_c pushBack format["%1CUP_O_Ural_RU", _sid];
	_c pushBack format["%1CUP_O_Ural_Empty_RU", _sid];
	//_u pushBack "CUP_O_Ural_Reammo_RU";			//Ammotruck
	//_u pushBack "CUP_O_Ural_Refuel_RU";			//Fueltruck
	//_u pushBack "CUP_O_Ural_Repair_RU";			//Repairtruck
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
	
	_c pushBack format["%1CUP_O_Ural_ZU23_RU", _sid];			//Flak	
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
	
	_c pushBack format["%1CUP_O_UAZ_AMB_RU", _sid];				//Medic
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
		
	_c pushBack format["%1CUP_O_UAZ_METIS_RU", _sid];			//Metris (ATGM)
	_c pushBack format["%1CUP_O_BRDM2_HQ_RUS", _sid];			//MG
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
	
	_c pushBack format["%1CUP_O_BRDM2_RUS", _sid];				//MG + 2cm
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
	
	_c pushBack format["%1CUP_O_BRDM2_ATGM_RUS", _sid];			//4x ATGM
	_c pushBack format["%1CUP_O_UAZ_AA_RU", _sid];				//2x AA
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_BTR60_Winter_RU", _sid];	//2cm + MG	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_BTR60_Green_RU", _sid];			//2cm + MG
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_BTR60_RU", _sid];				//2cm + MG
	};
	_c pushBack format["%1CUP_O_BM21_RU", _sid];				//Artytruck
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
	
	_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
	_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
	//_u pushBack "CUP_O_Kamaz_Reammo_RU";			//Ammotruck
	//_u pushBack "CUP_O_Kamaz_Refuel_RU";			//Fueltruck
	//_u pushBack "CUP_O_Kamaz_Repair_RU";			//Repairtruck
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_BTR80_WINTER_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_WINTER_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_BTR80_DESERT_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_DESERT_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_BTR80_GREEN_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_GREEN_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_BTR80_CAMO_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_CAMO_RU", _sid];
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
	
	_c pushBack format["%1CUP_O_BTR90_RU", _sid];
	_c pushBack format["%1CUP_O_BTR90_HQ_RU", _sid];
	_c pushBack format["%1CUP_O_GAZ_Vodnik_Unarmed_RU", _sid];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_Tigr_233014_WINTER_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_233011_WINTER_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_WINTER_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_Tigr_233011_DESERT_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_233014_DESERT_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_DESERT_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_Tigr_233011_GREEN_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_GREEN_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_233014_GREEN_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_Tigr_233011_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_233014_RU", _sid];
	};
	_c pushBack format["%1CUP_O_Tigr_233034_RU", _sid];
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
		
	_c pushBack format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid];		//MG front + rear
	_c pushBack format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid];		//GMG + rear MG
	_c pushBack format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid];		//3cm Cannon
	_c pushBack format["%1CUP_O_GAZ_Vodnik_KPVT_RU", _sid];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_Tigr_233014_WINTER_PK_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_WINTER_KORD_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_WINTER_PK_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_Tigr_233014_DESERT_PK_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_DESERT_KORD_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_DESERT_PK_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_Tigr_233014_GREEN_PK_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_GREEN_KORD_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_GREEN_PK_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_Tigr_233014_PK_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_KORD_RU", _sid];
		_c pushBack format["%1CUP_O_Tigr_M_233114_PK_RU", _sid];
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
	
	_c pushBack format["%1CUP_O_GAZ_Vodnik_MedEvac_RU", _sid];	//Medic
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Vodnik Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Vodnik Medic (Mobile Respawn)';
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_MTLB_pk_Winter_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_MTLB_pk_Green_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_MTLB_pk_WDL_RU", _sid];
	};
	_c pushBack format["%1CUP_O_BMP_HQ_RU", _sid];
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
	
	_c pushBack format["%1CUP_O_BMP2_RU", _sid];			//2cm + Metris(ATGM)
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
	
	_c pushBack format["%1CUP_O_BMP2_AMB_RU", _sid];		//Medic	
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

	_c pushBack format["%1CUP_O_BMP3_RU", _sid];
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
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_T72_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_2S6_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_HEAVY;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_2S6M_RU", _sid];
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
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_T90_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Mi8AMT_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_Mi8_VIV_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Mi8_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;

	_c pushBack format["%1CUP_O_Mi8_medevac_RU", _sid];//Medic
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

	_c pushBack format["%1CUP_O_Mi24_P_Dynamic_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Mi24_V_Dynamic_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_MI6A_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_MI6T_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Ka50_DL_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_Ka60_Grey_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_Su25_Dyn_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Ka52_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
	_c pushBack format["%1CUP_O_Pchela1T_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_SU34_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;	
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
if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_CUP_ID) then {_setupBaseUnits = true;};
//if((_isThisMain select 0) == CTI_SOV_ID && ((_isThisMain select 1) == CTI_CUP_ID || (count ((_side) call CTI_CO_FNC_GetSideUpgrades) > 0))) then {_setupBaseUnits = true;};

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
			_s pushBack [format["%1chEPA_RenaultM", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1ccfm_mercedes", _sid],"salvager-independent"];
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
			_s pushBack [format["%1C_IDAP_Van_02_medevac_F", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1C_IDAP_Van_02_medevac_F", _sid],"salvager-independent"];
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
			_s pushBack [format["%1CUP_O_Ural_Empty_RU", _sid],"salvager"];
			_d pushBack 10;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CUP_O_Ural_Empty_RU", _sid],"salvager-independent"];
			_d pushBack 10;	
		};
	};
};


_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

if(CTI_ECONOMY_LEVEL_WHEELED >=_tech_level) then {
	_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//Repairtruck
	_p pushBack '';
	_n pushBack 'Repair Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack "service-repairtruck";
	_d pushBack 10;
};

_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	if(_tech_level > 3) then {_tech_level = 3};					//lower the prise a bit
	_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_O_Kamaz_Repair_RU", _sid];			//Repairtruck
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
	_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 10;
};

_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	if(_tech_level > 3) then {_tech_level = 3};					//lower the prise a bit
	_building_time = [CTI_FACTORY_AMMO,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	_c pushBack format["%1CUP_O_Kamaz_Reammo_RU", _sid];			//Ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 10;	
	_c pushBack format["%1CUP_O_Kamaz_Refuel_RU", _sid];			//Fueltruck
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
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_PBX_RU", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 10;	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CUP_O_ZUBR_RU", _sid];
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
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_SOV_CUP.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
