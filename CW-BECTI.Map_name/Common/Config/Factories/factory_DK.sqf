/*
format["%1<vanilla_cnitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo
*/
private ["_side", "_c", "_sid", "_priorUnits", "_ai"];
_side = _this;
_ai = -1;
_sid = "";

if(_side == west) then {
	//_sid = "VIOC_B_";
	_ai = CTI_WEST_AI;
} 
else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_ai = CTI_EAST_AI;
	} 
	else {
		//_sid = "VIOC_I_";
	};
};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if (isNil "_priorUnits" || _ai == 2) then { 
	
	if(CTI_MAIN_ADDON == 0) then {
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1gm_dk_army_squadleader_gvm95_p2a1_90_m84", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1gm_dk_army_demolition_gvm95_90_m84", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1gm_dk_army_rifleman_gvm95_90_m84", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1gm_dk_army_rifleman_gvm95_90_m84", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1gm_dk_army_crew_84_oli", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1gm_dk_army_crew_84_oli", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1gm_dk_army_crew_84_oli", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1gm_ge_civ_typ1200", _sid], []], 
			[format["%1gm_ge_civ_typ1200", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

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
/*_c = [];
_adds = 0;
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
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];
*/
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
/*_c = [];
//Level 0
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
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];*/

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
/*_c = [];
if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];*/

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
/*_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1B_Boat_Transport_01_F", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_DK.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/