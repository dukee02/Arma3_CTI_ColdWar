private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_NVA_ID || CTI_WEST_TOWNS == CTI_NVA_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_NVA_ID || CTI_EAST_TOWNS == CTI_NVA_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_NVA_ID && (_isThisMain select 1) == CTI_PF_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_NVA_ID,(_isThisMain select 1),CTI_PF_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_NVA_SOG.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_o_men_nva_65_35", _sid];		//Crewman (Commander)
		_c pushBack format["%1vn_o_men_nva_65_36", _sid];		//Crewman (Driver)
		_c pushBack format["%1vn_o_men_nva_65_37", _sid];		//Crewman (Gunner)
		_c pushBack format["%1vn_o_men_nva_65_07", _sid];		//Grenadier (SKS)
		_c pushBack format["%1vn_o_men_nva_65_08", _sid];		//Medic (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_65_03", _sid];		//Rifleman (SKS Bayo)
		_c pushBack format["%1vn_o_men_nva_65_02", _sid];		//Rifleman (SKS)
		_c pushBack format["%1vn_o_men_nva_65_12", _sid];		//Sentry (SKS Bayo)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_o_men_nva_37", _sid];		//Crewman (Commander)
		_c pushBack format["%1vn_o_men_nva_38", _sid];		//Crewman (Driver)
		_c pushBack format["%1vn_o_men_nva_39", _sid];		//Crewman (Gunner)
		_c pushBack format["%1vn_o_men_nva_07", _sid];		//Grenadier (SKS)
		_c pushBack format["%1vn_o_men_nva_08", _sid];		//Medic (PPS-43)
		_c pushBack format["%1vn_o_men_nva_12", _sid];		//Sentry (SKS Bayo)
		_c pushBack format["%1vn_o_men_nva_03", _sid];		//Rifleman (SKS Bayo)
		_c pushBack format["%1vn_o_men_nva_02", _sid];		//Rifleman (SKS)
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_o_men_nva_65_14", _sid];		//AT (SKS/ B41)
		_c pushBack format["%1vn_o_men_nva_65_11", _sid];		//Machine Gunner (RPD)
		_c pushBack format["%1vn_o_men_nva_65_06", _sid];		//Rifleman (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_65_09", _sid];		//Sapper (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_65_13", _sid];		//RTO (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_65_30", _sid];		//Mortar Ammo (PPS-52)
		_c pushBack format["%1vn_o_men_nva_65_29", _sid];		//Mortar gunner (PPS-43)
		_c pushBack format["%1vn_o_men_nva_65_31", _sid];		//Mortar tripod (PPS-52)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_o_men_nva_14", _sid];		//AT (SKS/ B41)
		_c pushBack format["%1vn_o_men_nva_32", _sid];		//AT-3 gunner (PPS-43)
		_c pushBack format["%1vn_o_men_nva_11", _sid];		//Machine Gunner (RPD)
		_c pushBack format["%1vn_o_men_nva_13", _sid];		//RTO (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_09", _sid];		//Sapper (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_06", _sid];		//Rifleman (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_30", _sid];		//Mortar Ammo (PPS52)
		_c pushBack format["%1vn_o_men_nva_29", _sid];		//Mortar gunner (PPS-43)
		_c pushBack format["%1vn_o_men_nva_31", _sid];		//Mortar tripod (PPS-52)
	};
	_c pushBack format["%1vn_o_men_aircrew_02", _sid];		//Heli Co-Pilot (TT-33)
	_c pushBack format["%1vn_o_men_aircrew_03", _sid];		//Heli Crew Chief (PM)
	_c pushBack format["%1vn_o_men_aircrew_04", _sid];		//Heli Gunner (TT-33)
	_c pushBack format["%1vn_o_men_aircrew_01", _sid];		//Heli Pilot (PM)
	_c pushBack format["%1vn_o_men_aircrew_07", _sid];		//Jet Pilot (PM)
	_c pushBack format["%1vn_o_men_aircrew_08", _sid];		//Jet Pilot (TT-33)
	_c pushBack format["%1vn_o_men_aircrew_05", _sid];		//Pilot (PM)
	_c pushBack format["%1vn_o_men_aircrew_06", _sid];		//Pilot (TT-33)
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_o_men_nva_65_10", _sid];		//Marksman (SKS)
		_c pushBack format["%1vn_o_men_nva_65_01", _sid];		//Officer (PPS-43)
		_c pushBack format["%1vn_o_men_nva_65_05", _sid];		//Rifleman (Type 56 Bayo)
		_c pushBack format["%1vn_o_men_nva_65_04", _sid];		//Rifleman (Type 56)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_o_men_nva_43", _sid];		//AA (SKS/ 9K32)
		_c pushBack format["%1vn_o_men_nva_10", _sid];		//Marksman (SKS)
		_c pushBack format["%1vn_o_men_nva_45", _sid];		//Marksman (VZ54)
		_c pushBack format["%1vn_o_men_nva_01", _sid];		//Officer (PPSh-41)
		_c pushBack format["%1vn_o_men_nva_05", _sid];		//Rifleman (Type 56 Bayo)
		_c pushBack format["%1vn_o_men_nva_04", _sid];		//Rifleman (Type 56)
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_o_bicycle_01_nva65", _sid];
	_c pushBack format["%1vn_o_bicycle_02_nva65", _sid];
	_c pushBack format["%1vn_o_wheeled_btr40_01_nva65", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_o_wheeled_btr40_mg_02_nva65", _sid];
	_c pushBack format["%1vn_o_wheeled_btr40_mg_01_nva65", _sid];
	_c pushBack format["%1vn_o_wheeled_btr40_mg_04_nva65", _sid];
	_c pushBack format["%1vn_o_wheeled_btr40_mg_05_nva65", _sid];
	_c pushBack format["%1vn_o_wheeled_btr40_mg_06_nva65", _sid];	//mortar
	_c pushBack format["%1vn_o_wheeled_z157_01_nva65", _sid];	
	_c pushBack format["%1vn_o_wheeled_z157_02_nva65", _sid];	
	_c pushBack format["%1vn_o_wheeled_z157_mg_01_nva65", _sid];	
	_c pushBack format["%1vn_o_wheeled_z157_mg_02_nva65", _sid];	//AA
	//_c pushBack format["%1vn_o_wheeled_z157_ammo_nva65", _sid];	
	//_c pushBack format["%1vn_o_wheeled_z157_fuel_nva65", _sid];	
	//_c pushBack format["%1vn_o_wheeled_z157_repair_nva65", _sid];	
	//_c pushBack format["%1vn_o_wheeled_z157_03_nva65", _sid];	//radar HQ?
	_c pushBack format["%1vn_o_wheeled_btr40_02_nva65", _sid];		//medic
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_o_wheeled_btr40_mg_03_nva65", _sid];	//AA
	//_c pushBack format["%1vn_o_wheeled_z157_04_nva65", _sid];		//Rocket arty?
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1vn_o_armor_m113_acav_01", _sid];
	_c pushBack format["%1vn_o_armor_m113_acav_03", _sid];
	_c pushBack format["%1vn_o_armor_m113_01", _sid];
	_c pushBack format["%1vn_o_armor_btr50pk_01", _sid];
	_c pushBack format["%1vn_o_armor_btr50pk_03", _sid];			//medic
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1vn_o_armor_pt76a_01_nva65", _sid];
	_c pushBack format["%1vn_o_armor_btr50pk_02", _sid];
	_c pushBack format["%1vn_o_armor_m125_01", _sid];
	_c pushBack format["%1vn_o_armor_m577_01", _sid];				//command
	_c pushBack format["%1vn_o_armor_m577_02", _sid];				//medic	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1vn_o_armor_ot54_01_nva65", _sid];
	_c pushBack format["%1vn_o_armor_pt76b_01_nva65", _sid];
	_c pushBack format["%1vn_o_armor_type63_01_nva65", _sid];
	_c pushBack format["%1vn_o_armor_m41_01", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1vn_o_armor_t54b_01_nva65", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_o_air_mi2_02_01", _sid];
	_c pushBack format["%1vn_o_air_mi2_01_01", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_o_air_mi2_03_01", _sid];
	_c pushBack format["%1vn_o_air_mi2_04_05", _sid];
	_c pushBack format["%1vn_o_air_mig19_cas", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_o_air_mi2_05_01", _sid];
	_c pushBack format["%1vn_o_air_mig21_cas", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_o_wheeled_z157_repair_nva65", _sid];				//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_o_wheeled_z157_ammo_nva65", _sid];				//Ammotruck
	_c pushBack format["%1vn_o_wheeled_z157_fuel_nva65", _sid];				//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1vn_c_car_01_01", _sid];
	_c pushBack format["%1vn_c_car_04_01", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1vn_o_wheeled_z157_repair_nva65", _sid];				//Repairtruck
	_c pushBack format["%1vn_o_wheeled_z157_ammo_nva65", _sid];				//Ammotruck
	_c pushBack format["%1vn_o_wheeled_z157_fuel_nva65", _sid];				//Fueltruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
			_c pushBack format["%1vn_o_men_nva_65_36", _sid];		//Crewman (Driver)
			_c pushBack format["%1vn_o_men_nva_65_08", _sid];		//Medic (PPSh-41)
			_c pushBack format["%1vn_o_men_nva_65_02", _sid];		//Rifleman (SKS)
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
			_c pushBack format["%1vn_o_men_nva_38", _sid];		//Crewman (Driver)
			_c pushBack format["%1vn_o_men_nva_08", _sid];		//Medic (PPS-43)
			_c pushBack format["%1vn_o_men_nva_02", _sid];		//Rifleman (SKS)
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_o_boat_01_00", _sid];
	_c pushBack format["%1vn_o_boat_01_mg_00", _sid];
	_c pushBack format["%1vn_o_boat_07_01", _sid];
	_c pushBack format["%1vn_o_boat_07_02", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_o_boat_02_00", _sid];
	_c pushBack format["%1vn_o_boat_02_mg_00", _sid];
	_c pushBack format["%1vn_o_boat_08_01", _sid];
	_c pushBack format["%1vn_o_boat_08_02", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_o_boat_03_02", _sid];
	_c pushBack format["%1vn_o_boat_04_02", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_SOG.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
