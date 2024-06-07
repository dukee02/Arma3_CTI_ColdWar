private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_DEN_ID || CTI_WEST_TOWNS == CTI_DEN_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_DEN_ID || CTI_EAST_TOWNS == CTI_DEN_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_DK_ID && (_isThisMain select 1) == CTI_GM_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_DK_ID,(_isThisMain select 1),if((_isThisMain select 0) == CTI_DK_ID && (_isThisMain select 1) == CTI_GM_ID) then {_setupBaseUnits = true;};
]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_DK.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_demolition_gvm95_90_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_mg3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_rifleman_gvm95_90_win", _sid];
			_c pushBack format["%1gm_dk_army_demolition_g3a4_84_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win", _sid];
			_c pushBack format["%1gm_dk_army_machinegunner_mg3_84_win", _sid];
			_c pushBack format["%1gm_dk_army_rifleman_g3a3_84_win", _sid];
		};
		_c pushBack format["%1gm_dk_army_crew_84_oli", _sid];
		_c pushBack format["%1gm_dk_army_demolition_g3a4_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_mg3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_rifleman_g3a3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_demolition_gvm95_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_machinegunner_mg3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_rifleman_gvm95_90_m84", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_antitank_assistant_gvm95_pzf84_90_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_gvm95_pzf84_90_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_assistant_g3a3_pzf84_84_win", _sid];
			_c pushBack format["%1gm_dk_army_antitank_g3a3_pzf84_84_win", _sid];
			_c pushBack format["%1gm_dk_army_medic_g3a3_84_win", _sid];
		};
		_c pushBack format["%1gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_g3a3_pzf84_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_medic_g3a3_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_antitank_gvm95_pzf84_90_m84", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_dk_army_marksman_g3a3_90_win", _sid];
			_c pushBack format["%1gm_dk_army_squadleader_gvm95_p2a1_90_win", _sid];
			_c pushBack format["%1gm_dk_army_squadleader_g3a3_p2a1_84_win", _sid];
		};
		_c pushBack format["%1gm_dk_army_squadleader_g3a3_p2a1_84_m84", _sid];
		_c pushBack format["%1gm_dk_army_marksman_g3a3_90_m84", _sid];
		_c pushBack format["%1gm_dk_army_squadleader_gvm95_p2a1_90_m84", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
/*_adds = 0;
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%", _sid];
		//_c pushBack "";		//repairtruck	
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1", _sid];
		_c pushBack format["%1", _sid];			//medic
		//_c pushBack "";		//ammotruck
		//_c pushBack "";		//fueltruck
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1", _sid];
	};
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Start
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1gm_dk_army_m113a1dk_command", _sid];
		_c pushBack format["%1gm_dk_army_m113a1dk_engineer", _sid];
		_c pushBack format["%1gm_dk_army_m113a1dk_apc", _sid];
		_c pushBack format["%1gm_dk_army_m113a1dk_medic", _sid];				//medic
		//_c pushBack format["%1gm_dk_army_bpz2a0", _sid];					//repair
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1gm_dk_army_m113a2dk", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%1gm_dk_army_Leopard1a3", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
/*//Level 0
if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1gm_ge_army_bo105m_vbh", _sid];
		_c pushBack format["%1gm_ge_army_bo105p1m_vbh", _sid];
		_c pushBack format["%1gm_ge_army_bo105p1m_vbh_swooper", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1gm_ge_army_bo105p_pah1", _sid];
		_c pushBack format["%1gm_ge_army_bo105p_pah1a1", _sid];
		_c pushBack format["%1gm_ge_airforce_do28d2", _sid];
		_c pushBack format["%1gm_ge_airforce_do28d2_medevac", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1gm_ge_army_ch53g", _sid];
		_c pushBack format["%1gm_ge_army_ch53gs", _sid];
	};
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_dk_army_bpz2a0", _sid];					//repair
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
/*if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_MAIN_ADDON == 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
			//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			//};
			//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//};
			_c pushBack format["%1gm_dk_army_rifleman_gvm95_90_m84", _sid];
			_c pushBack format["%1gm_dk_army_medic_g3a3_84_m84", _sid];
		};
	};
	
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1B_Boat_Transport_01_F", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];