/*
format["<vanilla_unitname>", _sid] gets used later 4 the upcomming sidepatch
format["", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
*/
private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_ai = -1;
_sid = "";

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_ai = CTI_WEST_AI;};
	case east: {/*_sid = "VIOC_O_";*/_ai = CTI_EAST_AI;};
	case resistance: {_sid = "_g";};
	default {_sid = "";};
};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};
//Check if the based units have to set.
_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_ChDKZ_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};

if (_setupBaseUnits) then {
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["rhsgref_ins%1_commander", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["rhsgref_ins%1_rifleman_aksu", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["rhsgref_ins%1_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["rhsgref_ins%1_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["rhsgref_ins%1_pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["rhsgref_ins%1_crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["rhsgref_ins%1_crew", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["rhsgref_ins%1_uaz", _sid], []], 
		[format["rhsgref_ins%1_uaz", _sid], []]
	]];

	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["rhsgref_ins%1_rifleman", _sid];
	_c pushBack format["rhsgref_ins%1_rifleman_akm", _sid];
	_c pushBack format["rhsgref_ins%1_rifleman_aks74", _sid];
	_c pushBack format["rhsgref_ins%1_rifleman_aksu", _sid];
	_c pushBack format["rhsgref_ins%1_grenadier_rpg", _sid];
	_c pushBack format["rhsgref_ins%1_arifleman_rpk", _sid];
	_c pushBack format["rhsgref_ins%1_crew", _sid];
	_c pushBack format["rhsgref_ins%1_medic", _sid];
	_c pushBack format["rhsgref_ins%1_militiaman_mosin", _sid];
	_c pushBack format["rhsgref_ins%1_grenadier", _sid];
	_c pushBack format["rhsgref_ins%1_saboteur", _sid];
	_c pushBack format["rhsgref_ins%1_engineer", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["rhsgref_ins%1_machinegunner", _sid];
	_c pushBack format["rhsgref_ins%1_rifleman_RPG26", _sid];
	_c pushBack format["rhsgref_ins%1_squadleader", _sid];
	_c pushBack format["rhsgref_ins%1_pilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["rhsgref_ins%1_spotter", _sid];
	_c pushBack format["rhsgref_ins%1_sniper", _sid];
	_c pushBack format["rhsgref_ins%1_commander", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_gaz66", _sid];
	_c pushBack format["rhsgref_ins%1_gaz66_flat", _sid];
	_c pushBack format["rhsgref_ins%1_gaz66o", _sid];
	_c pushBack format["rhsgref_ins%1_gaz66o_flat", _sid];
	_c pushBack format["rhsgref_ins%1_kraz255b1_flatbed", _sid];
	_c pushBack format["rhsgref_ins%1_kraz255b1_cargo_open", _sid];
	_c pushBack format["rhsgref_ins%1_zil131", _sid];
	_c pushBack format["rhsgref_ins%1_zil131_flatbed_cover", _sid];
	_c pushBack format["rhsgref_ins%1_zil131_open", _sid];
	_c pushBack format["rhsgref_ins%1_zil131_flatbed", _sid];
	
	_c pushBack format["rhsgref_ins%1_gaz66_zu23", _sid];//Flak
	_c pushBack format["rhsgref_ins%1_gaz66_ap2", _sid];//Medic
	_c pushBack format["rhsgref_ins%1_gaz66_r142", _sid];//HQ

	//_c pushBack format["rhsgref_ins%1_gaz66_ammo", _sid];
	//_c pushBack format["rhsgref_ins%1_gaz66_repair", _sid];
	//_c pushBack format["rhsgref_ins%1_kraz255b1_fuel", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_uaz", _sid];
	_c pushBack format["rhsgref_ins%1_uaz_open", _sid];
	_c pushBack format["rhsgref_ins%1_uaz_ags", _sid];
	if(_side == resistance) then {
		_c pushBack "rhsgref_ins_g_uaz_dshkm_chdkz";
	} else {
		_c pushBack "rhsgref_ins_uaz_dshkm";
	};
	_c pushBack format["rhsgref_ins%1_uaz_spg9", _sid];
	_c pushBack format["rhsgref_ins%1_ural", _sid];
	_c pushBack format["rhsgref_ins%1_ural_open", _sid];
	_c pushBack format["rhsgref_ins%1_ural_work", _sid];
	_c pushBack format["rhsgref_ins%1_ural_work_open", _sid];

	_c pushBack format["rhsgref_ins%1_ural_Zu23", _sid];//Flak
	//_c pushBack format["rhsgref_ins%1_ural_repair", _sid];//Repairtruck		
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		_c pushBack format["rhsgref_BRDM2_ins%1", _sid];				
		_c pushBack format["rhsgref_BRDM2UM_ins%1", _sid];				
		_c pushBack format["rhsgref_BRDM2_HQ_ins%1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		_c pushBack format["rhsgref_BRDM2_ATGM_ins%1", _sid];
		_c pushBack format["rhsgref_ins%1_btr60", _sid];
		_c pushBack format["rhsgref_ins%1_BM21", _sid];//Artytruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
		_c pushBack format["rhsgref_ins%1_btr70", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_bmd1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_bmd1p", _sid];
	_c pushBack format["rhsgref_ins%1_bmp1", _sid];
	_c pushBack format["rhsgref_ins%1_bmp1d", _sid];
	_c pushBack format["rhsgref_ins%1_bmp1k", _sid];
	_c pushBack format["rhsgref_ins%1_bmp1p", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_bmd2", _sid];
	_c pushBack format["rhsgref_ins%1_bmp2e", _sid];
	_c pushBack format["rhsgref_ins%1_bmp2", _sid];
	_c pushBack format["rhsgref_ins%1_bmp2d", _sid];
	_c pushBack format["rhsgref_ins%1_bmp2k", _sid];
	_c pushBack format["rhsgref_ins%1_2s1_at", _sid];
	_c pushBack format["rhsgref_ins%1_zsu234", _sid];
	_c pushBack format["rhsgref_ins%1_2s1", _sid];
	_c pushBack format["rhsgref_ins%1_t72ba", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_t72bb", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_t72bc", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["rhsgref_ins%1_Mi8amt", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	//_c pushBack format["rhsgref_ins%1_zil131_flatbed_cover", _sid];//salvager
};
	
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_gaz66_repair", _sid];				//Repairtruck
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_ural_repair", _sid];			//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_ChDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["rhsgref_ins%1_gaz66_ammo", _sid];				//Ammotruck
	_c pushBack format["rhsgref_ins%1_kraz255b1_fuel", _sid];				//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["rhsgref_ins%1_rifleman", _sid];
		_c pushBack format["rhsgref_ins%1_crew", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["rhsgref_ins%1_uaz", _sid];	
	_c pushBack format["rhsgref_ins%1_uaz", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["rhsgref_ins%1_gaz66_repair", _sid];					//Repairtruck
		_c pushBack format["rhsgref_ins%1_gaz66_ammo", _sid];					//Ammotruck
		_c pushBack format["rhsgref_ins%1_kraz255b1_fuel", _sid];				//Fueltruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_u pushBack format["O_Boat_Transport_01_F", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_ChDKZ_GUE_RHS.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
