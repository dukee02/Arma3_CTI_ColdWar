private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_US_ID || CTI_WEST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_US_ID || CTI_EAST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_PF_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_US_ID,(_isThisMain select 1),CTI_PF_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_SOG.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_b_men_cidg_02", _sid];			//Medic
		_c pushBack format["%1vn_b_men_cidg_10", _sid];			//Medic 2
		_c pushBack format["%1vn_b_men_cidg_20", _sid];			//Medic 3
		_c pushBack format["%1vn_b_men_cidg_06", _sid];			//Rifleman
		_c pushBack format["%1vn_b_men_cidg_14", _sid];			//Rifleman 2
		_c pushBack format["%1vn_b_men_cidg_19", _sid];			//Rifleman 3
		_c pushBack format["%1vn_b_men_cidg_03", _sid];			//Demolitions
		_c pushBack format["%1vn_b_men_cidg_08", _sid];			//Demolitions 2
		_c pushBack format["%1vn_b_men_cidg_07", _sid];			//Grenadier
		_c pushBack format["%1vn_b_men_cidg_11", _sid];			//Grenadier 2
		_c pushBack format["%1vn_b_men_cidg_17", _sid];			//Grenadier 3
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_b_men_army_15", _sid];			//Rifleman 1
		_c pushBack format["%1vn_b_men_army_16", _sid];			//Rifleman 2
		_c pushBack format["%1vn_b_men_army_18", _sid];			//Rifleman 3
		_c pushBack format["%1vn_b_men_army_19", _sid];			//Rifleman 4
		_c pushBack format["%1vn_b_men_army_20", _sid];			//Rifleman 5
		_c pushBack format["%1vn_b_men_army_21", _sid];			//Rifleman 6
		_c pushBack format["%1vn_b_men_army_04", _sid];			//Engineer
		_c pushBack format["%1vn_b_men_army_07", _sid];			//Grenadier
		_c pushBack format["%1vn_b_men_army_17", _sid];			//Grenadier 2
		_c pushBack format["%1vn_b_men_army_05", _sid];			//Demolitions
		_c pushBack format["%1vn_b_men_army_03", _sid];			//Medic
		_c pushBack format["%1vn_b_men_army_22", _sid];			//Military Policeman
		_c pushBack format["%1vn_b_men_army_26", _sid];			//Tunnel Rat
	};
	_c pushBack format["%1vn_b_men_army_14", _sid];			//Crew (Commander)
	_c pushBack format["%1vn_b_men_army_13", _sid];			//Crew (Driver)
	_c pushBack format["%1vn_b_men_army_23", _sid];			//Crewman (Commander)
	_c pushBack format["%1vn_b_men_army_24", _sid];			//Crewman (Driver)
	_c pushBack format["%1vn_b_men_army_25", _sid];			//Crewman (Gunner)
	_c pushBack format["%1vn_b_men_army_29", _sid];			//Gun crew (Chief of Smoke)
	_c pushBack format["%1vn_b_men_army_31", _sid];			//Gun crew (Rammer)
	_c pushBack format["%1vn_b_men_army_30", _sid];			//Gun crew (Swabber)
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_b_men_cidg_01", _sid];			//Squad Leader (RTO)
		_c pushBack format["%1vn_b_men_cidg_12", _sid];			//Marksman
		_c pushBack format["%1vn_b_men_cidg_05", _sid];			//Machine Gunner
		_c pushBack format["%1vn_b_men_cidg_15", _sid];			//Machine Gunner 2
		_c pushBack format["%1vn_b_men_cidg_16", _sid];			//Machine Gunner 3
		_c pushBack format["%1vn_b_men_cidg_18", _sid];			//Machine Gunner 4
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_b_men_army_12", _sid];			//AT
		_c pushBack format["%1vn_b_men_army_06", _sid];			//Machine Gunner
		_c pushBack format["%1vn_b_men_army_27", _sid];			//Machine Gunner 2
		_c pushBack format["%1vn_b_men_army_10", _sid];			//Marksman
		_c pushBack format["%1vn_b_men_army_01", _sid];			//Officer
		_c pushBack format["%1vn_b_men_army_08", _sid];			//RTO
		_c pushBack format["%1vn_b_men_army_02", _sid];			//Squad Leader
	};
	_c pushBack format["%1vn_b_men_aircrew_18", _sid];			//Copilot
	_c pushBack format["%1vn_b_men_aircrew_20", _sid];			//Door gunner
	_c pushBack format["%1vn_b_men_aircrew_19", _sid];			//Ghostrider
	_c pushBack format["%1vn_b_men_aircrew_17", _sid];			//Pilot
	_c pushBack format["%1vn_b_men_aircrew_06", _sid];			//Copilot
	_c pushBack format["%1vn_b_men_aircrew_07", _sid];			//Crew chief
	_c pushBack format["%1vn_b_men_aircrew_08", _sid];			//Door gunner
	_c pushBack format["%1vn_b_men_aircrew_26", _sid];			//FAC Copilot (Covey Rider)
	_c pushBack format["%1vn_b_men_aircrew_25", _sid];			//FAC Pilot (Covey)
	_c pushBack format["%1vn_b_men_aircrew_05", _sid];			//Pilot
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1vn_b_men_cidg_04", _sid];			//Scout
		_c pushBack format["%1vn_b_men_cidg_09", _sid];			//Scout 2
		_c pushBack format["%1vn_b_men_cidg_21", _sid];			//Sniper
		_c pushBack format["%1vn_b_men_cidg_13", _sid];			//Sniper (NV)
		_c pushBack format["%1vn_b_men_cidg_22", _sid];			//Commander
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1vn_b_men_army_28", _sid];			//Commander
		_c pushBack format["%1vn_b_men_army_09", _sid];			//Scout
		_c pushBack format["%1vn_b_men_army_11", _sid];			//Sniper
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_b_wheeled_m274_01_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m274_mg_03_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m274_mg_02_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m274_mg_01_01", _sid];

	_c pushBack format["%1vn_b_wheeled_m151_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m151_02", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_b_wheeled_m151_mg_06", _sid];
	_c pushBack format["%1vn_b_wheeled_m151_mg_03", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_01_airport", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_01_sog", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_02_sog", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_02", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_repair", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_repair_airport", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_ammo", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_ammo_airport", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_fuel", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_fuel_airport", _sid];
	//_c pushBack format["%1vn_b_wheeled_m54_03", _sid];			//HQ
	_c pushBack format["%1vn_b_wheeled_m151_mg_02", _sid];		//AA
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_b_wheeled_m151_mg_04", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_mg_01", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_mg_03", _sid];
	_c pushBack format["%1vn_b_wheeled_m54_mg_02", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1vn_b_wheeled_m151_mg_05", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1vn_b_armor_m113_01", _sid];
	_c pushBack format["%1vn_b_armor_m113_acav_02", _sid];
	_c pushBack format["%1vn_b_armor_m113_acav_01", _sid];
	_c pushBack format["%1vn_b_armor_m113_acav_03", _sid];
	_c pushBack format["%1vn_b_armor_m113_acav_05", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1vn_b_armor_m113_acav_04", _sid];
	_c pushBack format["%1vn_b_armor_m113_acav_06", _sid];
	_c pushBack format["%1vn_b_armor_m125_01", _sid];
	_c pushBack format["%1vn_b_armor_m132_01", _sid];
	_c pushBack format["%1vn_b_armor_m577_01", _sid];//command
	_c pushBack format["%1vn_b_armor_m577_02", _sid];//medic	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1vn_b_armor_m67_01_01", _sid];
	_c pushBack format["%1vn_b_armor_m41_01_01", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1vn_b_armor_m48_01_01", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_b_air_oh6a_01", _sid];
	_c pushBack format["%1vn_b_air_ch34_03_01", _sid];
	_c pushBack format["%1vn_b_air_ch34_01_01", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_b_air_ch34_04_01", _sid];
	_c pushBack format["%1vn_b_air_oh6a_06", _sid];
	_c pushBack format["%1vn_b_air_oh6a_03", _sid];
	_c pushBack format["%1vn_b_air_oh6a_02", _sid];
	_c pushBack format["%1vn_b_air_uh1e_02_04", _sid];
	_c pushBack format["%1vn_b_air_uh1e_03_04", _sid];
	_c pushBack format["%1vn_b_air_uh1e_01_04", _sid];
	_c pushBack format["%1vn_b_air_f100d_cap", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_b_air_uh1c_05_01", _sid];
	_c pushBack format["%1vn_b_air_uh1b_01_04", _sid];
	_c pushBack format["%1vn_b_air_uh1d_02_04", _sid];
	_c pushBack format["%1vn_b_air_uh1d_01_07", _sid];//Medic
	_c pushBack format["%1vn_b_air_ch47_01_01", _sid];
	_c pushBack format["%1vn_b_air_ah1g_02", _sid];
	_c pushBack format["%1vn_b_air_f4c_bmb", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1vn_b_air_ach47_05_01", _sid];
	_c pushBack format["%1vn_b_air_ch47_03_01", _sid];
	_c pushBack format["%1vn_b_air_ch47_02_01", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_c pushBack format["%1vn_b_wheeled_m54_repair", _sid];				//Repairtruck
_c pushBack format["%1vn_b_wheeled_m54_repair_airport", _sid];				//Repairtruck

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
_c pushBack format["%1vn_b_wheeled_m54_ammo", _sid];			//Ammotruck
_c pushBack format["%1vn_b_wheeled_m54_ammo_airport", _sid];			//Ammotruck
_c pushBack format["%1vn_b_wheeled_m54_fuel", _sid];		//Fueltruck
_c pushBack format["%1vn_b_wheeled_m54_fuel_airport", _sid];		//Fueltruck

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
			_c pushBack format["%1vn_b_men_cidg_06", _sid];			//Rifleman
			_c pushBack format["%1vn_b_men_cidg_02", _sid];			//Medic
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
			_c pushBack format["%1vn_b_men_army_13", _sid];			//Crew (Driver)
			_c pushBack format["%1vn_b_men_army_15", _sid];			//Rifleman 1
			_c pushBack format["%1vn_b_men_army_03", _sid];			//Medic
		};
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1vn_c_car_02_01", _sid];
	_c pushBack format["%1vn_c_car_03_01", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1vn_b_wheeled_m54_repair_airport", _sid];				//Repairtruck
		_c pushBack format["%1vn_b_wheeled_m54_ammo_airport", _sid];			//Ammotruck
		_c pushBack format["%1vn_b_wheeled_m54_fuel_airport", _sid];		//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_b_boat_09_01", _sid];
	_c pushBack format["%1vn_b_boat_10_01", _sid];
	_c pushBack format["%1vn_b_boat_11_01", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_b_boat_12_02", _sid];
	_c pushBack format["%1vn_b_boat_13_02", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1vn_b_boat_06_02", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_SOG.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
