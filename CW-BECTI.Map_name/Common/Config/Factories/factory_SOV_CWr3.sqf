private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_SOV_ID || CTI_WEST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_SOV_ID || CTI_EAST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_CWR3_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWR3.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_SOV_ID,(_isThisMain select 1),CTI_CWR3_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV_CWR3.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1cwr3_o_soldier82_at_rpg7", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aat_rpg7", _sid];
		_c pushBack format["%1cwr3_o_soldier82_hg", _sid];
		_c pushBack format["%1cwr3_o_soldier82_driver", _sid];
		_c pushBack format["%1cwr3_o_soldier82_sapper", _sid];
		_c pushBack format["%1cwr3_o_soldier82_engineer", _sid];
		_c pushBack format["%1cwr3_o_soldier82_medic", _sid];
		_c pushBack format["%1cwr3_o_soldier82_radio", _sid];
		_c pushBack format["%1cwr3_o_soldier82", _sid];
		_c pushBack format["%1cwr3_o_soldier82_backpack", _sid];
		_c pushBack format["%1cwr3_o_soldier82_captive", _sid];
		_c pushBack format["%1cwr3_o_soldier82_light", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1cwr3_o_soldier_aat_rpg7", _sid];
		_c pushBack format["%1cwr3_o_soldier_at_rpg7", _sid];
		_c pushBack format["%1cwr3_o_soldier_driver", _sid];
		_c pushBack format["%1cwr3_o_soldier_sapper", _sid];
		_c pushBack format["%1cwr3_o_soldier_engineer", _sid];
		_c pushBack format["%1cwr3_o_soldier_hg", _sid];
		_c pushBack format["%1cwr3_o_soldier_medic", _sid];
		_c pushBack format["%1cwr3_o_soldier_radio", _sid];
		_c pushBack format["%1cwr3_o_soldier", _sid];
		_c pushBack format["%1cwr3_o_soldier_backpack", _sid];
		_c pushBack format["%1cwr3_o_soldier_captive", _sid];
		_c pushBack format["%1cwr3_o_soldier_light", _sid];
	};
	_c pushBack format["%1cwr3_o_soldier_crew", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1cwr3_o_soldier82_ar", _sid];
		_c pushBack format["%1cwr3_o_soldier82_amg", _sid];
		_c pushBack format["%1cwr3_o_soldier82_at_rpg18", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aaa_strela", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aa_strela", _sid];
		_c pushBack format["%1cwr3_o_soldier82_gl", _sid];
		_c pushBack format["%1cwr3_o_soldier82_marksman", _sid];
		_c pushBack format["%1cwr3_o_soldier82_mg", _sid];
		_c pushBack format["%1cwr3_o_soldier82_sl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1cwr3_o_soldier_amg", _sid];
		_c pushBack format["%1cwr3_o_soldier_ar", _sid];
		_c pushBack format["%1cwr3_o_soldier_gl", _sid];
		_c pushBack format["%1cwr3_o_soldier_at_rpg18", _sid];
		_c pushBack format["%1cwr3_o_soldier_mg", _sid];
		_c pushBack format["%1cwr3_o_soldier_marksman", _sid];
		_c pushBack format["%1cwr3_o_soldier_sl", _sid];
		_c pushBack format["%1cwr3_o_soldier_aa_strela", _sid];
		_c pushBack format["%1cwr3_o_soldier_aaa_strela", _sid];
	};
	_c pushBack format["%1cwr3_o_camel_pilot", _sid];
	_c pushBack format["%1cwr3_o_soldier_pilot", _sid];
	_c pushBack format["%1cwr3_o_soldier_pilot_jet", _sid];
	_c pushBack format["%1cwr3_o_soldier_pilot_light", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		_c pushBack format["%1cwr3_o_soldier82_at_at4", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aat_at4", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aaa_igla", _sid];
		_c pushBack format["%1cwr3_o_soldier82_aa_igla", _sid];
		_c pushBack format["%1cwr3_o_soldier82_sniper", _sid];
		_c pushBack format["%1cwr3_o_soldier82_spotter", _sid];
		_c pushBack format["%1cwr3_o_soldier82_tl", _sid];
		_c pushBack format["%1cwr3_o_officer82", _sid];
		_c pushBack format["%1cwr3_o_officer82_night", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1cwr3_o_soldier_at_at4", _sid];
		_c pushBack format["%1cwr3_o_soldier_aat_at4", _sid];
		_c pushBack format["%1cwr3_o_soldier_aa_igla", _sid];
		_c pushBack format["%1cwr3_o_soldier_aaa_igla", _sid];
		_c pushBack format["%1cwr3_o_soldier_sniper", _sid];
		_c pushBack format["%1cwr3_o_soldier_spotter", _sid];
		_c pushBack format["%1cwr3_o_soldier_tl", _sid];
		_c pushBack format["%1cwr3_o_officer", _sid];
		_c pushBack format["%1cwr3_o_officer_night", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_uaz452", _sid];
	_c pushBack format["%1cwr3_o_uaz452_mev", _sid];
	_c pushBack format["%1cwr3_o_uaz", _sid];
	_c pushBack format["%1cwr3_o_uaz_open", _sid];
	_c pushBack format["%1cwr3_o_uaz_ags30", _sid];
	_c pushBack format["%1cwr3_o_uaz_dshkm", _sid];
	_c pushBack format["%1cwr3_o_uaz_spg9", _sid];
	_c pushBack format["%1cwr3_o_ural", _sid];
	_c pushBack format["%1cwr3_o_ural_hq", _sid];
	_c pushBack format["%1cwr3_o_ural_open", _sid];
	_c pushBack format["%1cwr3_o_ural_empty", _sid];
	//_c pushBack format["%1cwr3_o_ural_repair", _sid];
	//_c pushBack format["%1cwr3_o_ural_reammo", _sid];
	//_c pushBack format["%1cwr3_o_ural_refuel", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_uaz_mev", _sid];//Medic
	_c pushBack format["%1cwr3_o_ural_zu23", _sid];//Flak			
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_brdm2", _sid];
	_c pushBack format["%1cwr3_o_brdm2um", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_brdm2_atgm", _sid];
	_c pushBack format["%1cwr3_o_uaz_aa", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_btr60", _sid];
	_c pushBack format["%1cwr3_o_bm21", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_btr80", _sid];
	//_c pushBack format["%1cwr3_o_scud", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_mtlb_pk", _sid];
	_c pushBack format["%1cwr3_o_mtlb_mev", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_bmp1", _sid];
	_c pushBack format["%1cwr3_o_bmp1p", _sid];
	_c pushBack format["%1cwr3_o_pt76b", _sid];
	_c pushBack format["%1cwr3_o_t55", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_bmp2", _sid];
	_c pushBack format["%1cwr3_o_bmp2_hq", _sid];
	_c pushBack format["%1cwr3_o_bmp2_zu23", _sid];
	_c pushBack format["%1cwr3_o_zsu", _sid];
	_c pushBack format["%1cwr3_o_t55a", _sid];
	_c pushBack format["%1cwr3_o_t64b", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_bmp2_mev", _sid];
	_c pushBack format["%1cwr3_o_mtlb_sa13", _sid];
	_c pushBack format["%1cwr3_o_t72a", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_t55amv", _sid];
	_c pushBack format["%1cwr3_o_t64bv", _sid];
	_c pushBack format["%1cwr3_o_t72b1", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1cwr3_o_an2", _sid];
	_c pushBack format["%1cwr3_o_camel", _sid];
	_c pushBack format["%1cwr3_o_mi8_amt", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1cwr3_o_mi8_mev", _sid];
	_c pushBack format["%1cwr3_o_mi8_mtv3", _sid];
	_c pushBack format["%1cwr3_o_mi24p", _sid];
	_c pushBack format["%1cwr3_o_su17m4", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1cwr3_o_mi24d", _sid];
	_c pushBack format["%1cwr3_o_mi24v", _sid];
	_c pushBack format["%1cwr3_o_mi6a", _sid];
	_c pushBack format["%1cwr3_o_mi6t", _sid];
	_c pushBack format["%1cwr3_o_an12", _sid];
	_c pushBack format["%1cwr3_o_an12_unarmed", _sid];
	_c pushBack format["%1cwr3_o_mig23", _sid];
	_c pushBack format["%1cwr3_o_mig27", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1cwr3_o_su25", _sid];
	_c pushBack format["%1cwr3_o_v80", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_ural_repair", _sid];				//Repairtruck
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	_c pushBack format["%1cwr3_o_mtlb_repair", _sid];				//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1cwr3_o_ural_reammo", _sid];				//Ammotruck
	_c pushBack format["%1cwr3_o_ural_refuel", _sid];				//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["%1cwr3_o_soldier82_medic", _sid];
		_c pushBack format["%1cwr3_o_soldier82", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1cwr3_o_uaz", _sid];
	_c pushBack format["%1cwr3_o_uaz_open", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1cwr3_o_ural_repair", _sid];				//repairtruck
		_c pushBack format["%1cwr3_o_ural_reammo", _sid];				//ammotruck
		_c pushBack format["%1cwr3_o_ural_refuel", _sid];				//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1cwr3_o_zodiac", _sid];
	_c pushBack format["%1cwr3_o_boat", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CWr3.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
