private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_sid = "_b";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_CDF_ID || CTI_WEST_TOWNS == CTI_CDF_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_CDF_ID || CTI_EAST_TOWNS == CTI_CDF_ID) then {_setupBaseUnits = true};
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
	if((_isThisMain select 0) == CTI_CDF_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_CDF_ID,(_isThisMain select 1),CTI_RHS_ID]] call CTI_CO_FNC_Log;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_CDF_RHS.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
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
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
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
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_gaz66", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66_flat", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66o", _sid];
	_c pushBack format["rhsgref_cdf%1_gaz66o_flat", _sid];
	_c pushBack format["rhsgref_cdf%1_zil131", _sid];
	_c pushBack format["rhsgref_cdf%1_zil131_open", _sid];
	_c pushBack format["rhsgref_cdf%1_zil131_flatbed", _sid];
	//_c pushBack format["rhsgref_cdf%1_zil131_flatbed_cover", _sid];//salvager

	_c pushBack format["rhsgref_cdf%1_gaz66_zu23", _sid];//Flak
	_c pushBack format["rhsgref_cdf%1_gaz66_ap2", _sid];//Medic
	_c pushBack format["rhsgref_cdf%1_gaz66_r142", _sid];//HQ

	//_c pushBack format["rhsgref_cdf%1_gaz66_ammo", _sid];//Ammo
	//_c pushBack format["rhsgref_cdf%1_gaz66_repair", _sid];//Rapair
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_reg_uaz", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_open", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_ags", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_dshkm", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_spg9", _sid];
	_c pushBack format["rhsgref_cdf%1_ural", _sid];
	_c pushBack format["rhsgref_cdf%1_ural_open", _sid];

	_c pushBack format["rhsgref_cdf%1_ural_Zu23", _sid];//Flak

	//_c pushBack format["rhsgref_cdf%1_ural_fuel", _sid];//Fuel
	//_c pushBack format["rhsgref_cdf%1_ural_repair", _sid];//Repairtruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_BRDM2%1", _sid];
	_c pushBack format["rhsgref_BRDM2UM%1", _sid];
	_c pushBack format["rhsgref_BRDM2_HQ%1", _sid];
	_c pushBack format["rhsgref_cdf%1_btr60", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_BRDM2_ATGM%1", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_BM21", _sid];
	_c pushBack format["rhsgref_cdf%1_btr70", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_btr80", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_bmd1", _sid];
	_c pushBack format["rhsgref_cdf%1_bmd1k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmd1pk", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_bmd1p", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1d", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp1p", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_bmd2", _sid];  
	_c pushBack format["rhsgref_cdf%1_bmd2k", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2e", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2d", _sid];
	_c pushBack format["rhsgref_cdf%1_bmp2k", _sid];
	_c pushBack format["rhsgref_cdf%1_t72ba_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_2s1", _sid];
	_c pushBack format["rhsgref_cdf%1_2s1_at", _sid];
	_c pushBack format["rhsgref_cdf%1_zsu234", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_t72bb_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_t80b_tv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_t80bv_tv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_t80u_tv", _sid];
	_c pushBack format["rhsgref_cdf%1_t80uk_tv", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["RHS_AN2_B", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_cdf%1_reg_Mi8amt", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_cdf%1_reg_Mi17Sh", _sid];
	if(_side == west) then {
		_c pushBack format["rhs_l159_cdf%1_CDF", _sid];
		_c pushBack format["rhs_l39_cdf%1_cdf", _sid];
	} else {
		_c pushBack format["rhs_l159_cdf%1", _sid];
		_c pushBack format["rhs_l39_cdf%1", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_cdf%1_Mi24D", _sid];
	_c pushBack format["rhsgref_cdf%1_Mi24D_Early", _sid];
	_c pushBack format["rhsgref_cdf%1_Mi35", _sid];
	_c pushBack format["rhsgref_cdf%1_mig29s", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_cdf%1_su25", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_b_mi24g_CAS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	//_c pushBack format["rhsgref_cdf%1_zil131_flatbed_cover", _sid];//salvager
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_gaz66_repair", _sid];			//Repairtruck
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_ural_repair", _sid];			//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_CDF_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_gaz66_ammo", _sid];				//Ammotruck
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_cdf%1_ural_fuel", _sid];				//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 3: {//jungle camo active
				_c pushBack format["rhsgref_cdf%1_ngd_rifleman", _sid];
				_c pushBack format["rhsgref_cdf%1_ngd_crew", _sid];
			};
			case 4: {//urban camo active
				_c pushBack format["rhsgref_cdf%1_para_rifleman", _sid];
				_c pushBack format["rhsgref_cdf%1_para_crew", _sid];
			};
			default {//main camo active
				_c pushBack format["rhsgref_cdf%1_reg_rifleman", _sid];
				_c pushBack format["rhsgref_cdf%1_reg_crew", _sid];
			};	
		};
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["rhsgref_cdf%1_reg_uaz", _sid];
	_c pushBack format["rhsgref_cdf%1_reg_uaz_open", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["rhsgref_cdf%1_gaz66_repair", _sid];			//Repairtruck
		_c pushBack format["rhsgref_cdf%1_gaz66_ammo", _sid];				//Ammotruck
		_c pushBack format["rhsgref_cdf%1_ural_fuel", _sid];				//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_u pushBack format["O_Boat_Transport_01_F", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_CDF_RHS.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
