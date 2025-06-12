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
if((_isThisMain select 0) == CTI_BW_ID && ((_isThisMain select 1) == CTI_BWA3_ID || (_isThisMain select 1) == CTI_BWADD_ID)) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_Redd.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_BW_ID,(_isThisMain select 1),CTI_BWADD_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_Redd.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid];
	};
	_c pushBack format["%1gm_ge_army_crew_mp2a1_80_oli", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];
*/
//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_winter", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_winter", _sid];
		
		//_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_winter", _sid];
		//_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_winter", _sid];
		//_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_trope", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_trope", _sid];
		
		//_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_trope", _sid];
		//_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_trope", _sid];
		//_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_trope", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_fleck", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_fleck", _sid];
		
		//_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_fleck", _sid];
		//_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_fleck", _sid];
		//_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_fleck", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FJg", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid];
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FJg", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid];
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid];
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_San", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_San", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_San", _sid];
		
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Wintertarn", _sid];
		
		_c pushBack format["%1rnt_sppz_2a2_luchs_wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Tropentarn", _sid];
		
		_c pushBack format["%1rnt_sppz_2a2_luchs_tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Flecktarn", _sid];
		
		_c pushBack format["%1rnt_sppz_2a2_luchs_flecktarn", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Marder_1A5_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Marder_1A5_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Marder_1A5_Flecktarn", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_ge_army_bo105m_vbh", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_winter", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_trope", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_fleck", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_winter", _sid];
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_winter", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_trope", _sid];
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_trope", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_fleck", _sid];
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_fleck", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid];
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid];
		};
	};
};

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_winter", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_winter", _sid];
		_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_trope", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_trope", _sid];
		_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_trope", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_fleck", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_fleck", _sid];
		_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_fleck", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_REDD_ID] call CTI_CO_FNC_GetTechmatrix;

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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_REDD.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
