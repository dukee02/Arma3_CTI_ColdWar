private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_NPOC_ID || CTI_WEST_TOWNS == CTI_NPOC_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_NPOC_ID || CTI_EAST_TOWNS == CTI_NPOC_ID) then {_setupBaseUnits = true};
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
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_NPOC_ID && (_isThisMain select 1) == CTI_CUP_ID) then {_setupBaseUnits = true;};
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_NPOC_ID,(_isThisMain select 1),CTI_CUP_ID]] call CTI_CO_FNC_Log;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_NPoC_CUP.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CUP_I_GUE_Forester", _sid];
	_c pushBack format["%1CUP_I_GUE_Woodman", _sid];
	_c pushBack format["%1CUP_I_GUE_Local", _sid];
	_c pushBack format["%1CUP_I_GUE_Farmer", _sid];
	_c pushBack format["%1CUP_I_GUE_Gamekeeper", _sid];
	_c pushBack format["%1CUP_I_GUE_Villager", _sid];
	
	_c pushBack format["%1CUP_I_GUE_Ammobearer", _sid];
	_c pushBack format["%1CUP_I_GUE_Crew", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_GL", _sid];
	_c pushBack format["%1CUP_I_GUE_Engineer", _sid];
	_c pushBack format["%1CUP_I_GUE_Medic", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_AKS74", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_AKM", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_AKSU", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_LAT", _sid];
	_c pushBack format["%1CUP_I_GUE_Saboteur", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CUP_I_GUE_Soldier_AR", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_MG", _sid];
	_c pushBack format["%1CUP_I_GUE_Pilot", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_AT", _sid];
	_c pushBack format["%1CUP_I_GUE_Officer", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CUP_I_GUE_Soldier_AA", _sid];
	_c pushBack format["%1CUP_I_GUE_Sniper", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_AA2", _sid];
	_c pushBack format["%1CUP_I_GUE_Soldier_Scout", _sid];
	_c pushBack format["%1CUP_I_GUE_Commander", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_TT650_NAPA", _sid];
	_c pushBack format["%1CUP_I_Datsun_PK", _sid];
	_c pushBack format["%1CUP_I_Datsun_PK_Random", _sid];
	_c pushBack format["%1CUP_I_Datsun_4seat", _sid];
	_c pushBack format["%1CUP_I_Hilux_unarmed_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_AGS30_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_DSHKM_NAPA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_Hilux_podnos_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_SPG9_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_UB32_NAPA", _sid];
	_c pushBack format["%1CUP_V3S_Open_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_unarmed_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_DSHKM_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_AGS30_NAPA", _sid];
	_c pushBack format["%1CUP_I_Ural_ZU23_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_zu23_NAPA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_Hilux_metis_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_btr60_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_BMP1_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_MLRS_NAPA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_Hilux_armored_MLRS_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_zu23_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_podnos_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_SPG9_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_UB32_NAPA", _sid];
	_c pushBack format["%1CUP_I_Datsun_AA", _sid];
	_c pushBack format["%1CUP_I_Datsun_AA_Random", _sid];
	_c pushBack format["%1CUP_I_Hilux_igla_NAPA", _sid];
	_c pushBack format["%1CUP_I_BRDM2_HQ_NAPA", _sid];
	_c pushBack format["%1CUP_I_BRDM2_NAPA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_Hilux_armored_metis_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_BMP1_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_BTR60_NAPA", _sid];
	_c pushBack format["%1CUP_I_BRDM2_ATGM_NAPA", _sid];
	_c pushBack format["%1CUP_I_Hilux_armored_igla_NAPA", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NPOC_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_MTLB_pk_NAPA", _sid];
	_c pushBack format["%1CUP_I_BMP_HQ_NAPA", _sid];
	_c pushBack format["%1CUP_I_T34_NAPA", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_BMP2_NAPA", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_BMP2_AMB_NAPA", _sid];
	_c pushBack format["%1CUP_I_T55_NAPA", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_T72_NAPA", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//_c = [];
//Level 0
//if(CTI_MAIN_ADDON == 0) then {
//};
/*if(CTI_CUP_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
/*_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_B_MTVR_Ammo_USMC", _sid];					//Repairtruck
	if(CTI_MAIN_ADDON == 1 ) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];
*/
//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_B_MTVR_Refuel_USMC", _sid];				//Ammotruck
	_c pushBack format["%1CUP_B_MTVR_Repair_USMC", _sid];				//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];
*/
//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_I_TT650_NAPA", _sid];
		_c pushBack format["%1CUP_I_Datsun_PK_Random", _sid];
	};
};
/*if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//repairtruck
		_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//ammotruck
		_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
	};
};*/
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["%1CUP_I_GUE_Medic", _sid];
		_c pushBack format["%1CUP_I_GUE_Soldier_AKM", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1CUP_B_LCU1600_USMC", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
