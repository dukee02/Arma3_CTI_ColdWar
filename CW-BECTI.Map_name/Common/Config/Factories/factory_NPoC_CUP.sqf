/*
format["%1<vanilla_cnitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo
*/
private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_adds"];
_side = _this;
_ai = -1;
_sid = "";
_adds = 0;

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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if ((isNil "_priorUnits" || _ai == -1) && CTI_CUP_ADDON > 0) then { 
	
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_GUE_Commander", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_GUE_Soldier_AKSU", _sid]];
	
	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_GUE_Saboteur", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_GUE_Soldier_AKM", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_GUE_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_I_GUE_Pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_GUE_Soldier_AKS74", _sid]];
	
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1CUP_I_TT650_NAPA", _sid], []], 
		[format["%1CUP_I_Hilux_unarmed_NAPA", _sid], []]
	]];
	
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	//VDV_EMR = green camo - VDV = brown camo
	//Level start (Level 3 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
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
	//Level 1 (Level 4 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		_c pushBack format["%1CUP_I_GUE_Soldier_AR", _sid];
		_c pushBack format["%1CUP_I_GUE_Soldier_MG", _sid];
		_c pushBack format["%1CUP_I_GUE_Pilot", _sid];
		_c pushBack format["%1CUP_I_GUE_Soldier_AT", _sid];
	};
	//Level 2 (Level 5 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		_c pushBack format["%1CUP_I_GUE_Soldier_AA", _sid];
		_c pushBack format["%1CUP_I_GUE_Officer", _sid];
		_c pushBack format["%1CUP_I_GUE_Sniper", _sid];
		_c pushBack format["%1CUP_I_GUE_Soldier_AA2", _sid];
		_c pushBack format["%1CUP_I_GUE_Soldier_Scout", _sid];
		_c pushBack format["%1CUP_I_GUE_Commander", _sid];
	};
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
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_I_TT650_NAPA", _sid];
		_c pushBack format["%1CUP_I_Datsun_PK", _sid];
		_c pushBack format["%1CUP_I_Datsun_PK_Random", _sid];
		_c pushBack format["%1CUP_I_Datsun_4seat", _sid];
		_c pushBack format["%1CUP_I_Hilux_unarmed_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_AGS30_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_DSHKM_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1CUP_I_Hilux_metis_NAPA", _sid];
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
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1CUP_I_Hilux_btr60_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_BMP1_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_MLRS_NAPA", _sid];
		_c pushBack format["%1CUP_I_Datsun_AA", _sid];
		_c pushBack format["%1CUP_I_Datsun_AA_Random", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_zu23_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1CUP_I_Hilux_armored_metis_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_MLRS_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_podnos_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_SPG9_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_UB32_NAPA", _sid];
		_c pushBack format["%1CUP_I_BRDM2_HQ_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_igla_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
		_c pushBack format["%1CUP_I_Hilux_armored_BMP1_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_BTR60_NAPA", _sid];
		_c pushBack format["%1CUP_I_BRDM2_NAPA", _sid];
		_c pushBack format["%1CUP_I_BRDM2_ATGM_NAPA", _sid];
		_c pushBack format["%1CUP_I_Hilux_armored_igla_NAPA", _sid];
	};
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
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1CUP_I_MTLB_pk_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1CUP_I_BMP2_NAPA", _sid];
		_c pushBack format["%1CUP_I_BMP2_AMB_NAPA", _sid];
		_c pushBack format["%1CUP_I_BMP_HQ_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%1CUP_I_T34_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1CUP_I_T55_NAPA", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		_c pushBack format["%1CUP_I_T72_NAPA", _sid];
	};
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
/*_c = [];
if(CTI_MAIN_ADDON == 0) then {
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		};
	};	
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		};
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
*/
//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1CUP_B_LCU1600_USMC", _sid];
	_c pushBack format["%1CUP_B_RHIB_USMC", _sid];
	_c pushBack format["%1CUP_B_Seafox_USMC", _sid];
	_c pushBack format["%1CUP_B_Zodiac_USMC", _sid];
};
if(CTI_ECONOMY_LEVEL_NAVAL >= 1) then {
	_c pushBack format["%1CUP_B_RHIB2Turret_USMC", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NPoC_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
