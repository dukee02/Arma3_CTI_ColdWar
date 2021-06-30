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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if ((isNil "_priorUnits") && CTI_CUP_ADDON > 0) then { 
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {										//Desert camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_I_RACS_Pilot", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light", _sid]];

			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []], 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []]
			]];
		};
		case 3: {										//Woodland if all camos active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_I_RACS_Pilot", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light_wdl", _sid]];

			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []], 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []]
			]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_I_RACS_Pilot", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];

			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []], 
				[format["%1CUP_I_LR_Transport_RACS", _sid], []]
			]];
		};
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	//VDV_EMR = green camo - VDV = brown camo
	//Level start (Level 3 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			_c pushBack format["%1CUP_I_RACS_Soldier_AAT", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_MAT", _sid];
			_c pushBack format["%1CUP_I_RACS_Crew", _sid];
			_c pushBack format["%1CUP_I_RACS_Engineer", _sid];
			_c pushBack format["%1CUP_I_RACS_GL", _sid];
			_c pushBack format["%1CUP_I_RACS_Medic", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_Light", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_LAT", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
			_c pushBack format["%1CUP_I_RACS_Soldier_AAT_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_MAT_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Engineer_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_GL_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Medic_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_Light_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid];
		};
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_GL_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid];
	};
	//Level 1 (Level 4 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			_c pushBack format["%1CUP_I_RACS_Soldier_AMG", _sid];
			_c pushBack format["%1CUP_I_RACS_AR", _sid];
			_c pushBack format["%1CUP_I_RACS_MMG", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
			_c pushBack format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_AR_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_MMG_wdl", _sid];
		};
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_AR_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Pilot", _sid];
	};
	//Level 2 (Level 5 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			_c pushBack format["%1CUP_I_RACS_Soldier_AA", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_HAT", _sid];
			_c pushBack format["%1CUP_I_RACS_M", _sid];
			_c pushBack format["%1CUP_I_RACS_Officer", _sid];
			_c pushBack format["%1CUP_I_RACS_Sniper", _sid];
			_c pushBack format["%1CUP_I_RACS_SL", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
			_c pushBack format["%1CUP_I_RACS_Soldier_AA_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_M_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Officer_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_Sniper_wdl", _sid];
			_c pushBack format["%1CUP_I_RACS_SL_wdl", _sid];
		};
		_c pushBack format["%1CUP_I_RACS_Soldier_AA_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_M_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Officer_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_SL_Urban", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_I_LR_Transport_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1CUP_I_LR_Ambulance_RACS", _sid];				//Medic
		_c pushBack format["%1CUP_I_LR_MG_RACS", _sid];
		_c pushBack format["%1CUP_I_MTVR_RACS", _sid];
		_c pushBack format["%1CUP_I_LR_AA_RACS", _sid];
		//_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Ammotruck
		//_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Fueltruck
		//_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];				//Repairtruck
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1CUP_I_LAV25_HQ_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1CUP_I_LAV25_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
		_c pushBack format["%1CUP_I_LAV25M240_RACS", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1CUP_I_AAV_Unarmed_RACS", _sid];
		_c pushBack format["%1CUP_I_AAV_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1CUP_I_M113_RACS", _sid];	
		_c pushBack format["%1CUP_I_M113_RACS_URB", _sid];
		_c pushBack format["%1CUP_I_M113_Med_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%CUP_I_M163_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1CUP_I_M60A3_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		_c pushBack format["%1CUP_I_T72_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		_c pushBack format["%1CUP_I_M270_DPICM_RACS", _sid];
		_c pushBack format["%1CUP_I_M270_HE_RACS", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
//Level 0
//if(CTI_MAIN_ADDON == 0) then {
//};
if(CTI_CUP_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1CUP_I_MH6J_RACS", _sid];
		_c pushBack format["%1CUP_I_SA330_Puma_HC1_RACS", _sid];
		_c pushBack format["%1CUP_I_SA330_Puma_HC2_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1CUP_I_AH6J_RACS", _sid];
		_c pushBack format["%1CUP_I_UH1H_RACS", _sid];
		_c pushBack format["%1CUP_I_UH1H_Slick_RACS", _sid];
		_c pushBack format["%1CUP_I_UH60L_Unarmed_RACS", _sid];
		_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_Racs", _sid];
		_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_MEV_Racs", _sid];
		_c pushBack format["%1CUP_I_C130J_RACS", _sid];
		_c pushBack format["%1CUP_I_C130J_Cargo_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%CUP_I_UH1H_Armed_RACS", _sid];
		_c pushBack format["%CUP_I_UH1H_gunship_RACS", _sid];
		_c pushBack format["%CUP_I_UH60L_RACS", _sid];
		_c pushBack format["%CUP_I_UH60L_FFV_RACS", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%CUP_I_CH47F_RACS", _sid];
		_c pushBack format["%CUP_I_CH47F_VIV_RACS", _sid];
		_c pushBack format["%CUP_I_JAS39_RACS", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Repairtruck
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];				//Ammotruck
	_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				_c pushBack format["%1CUP_I_RACS_Medic", _sid];
				_c pushBack format["%1CUP_I_RACS_Soldier", _sid];
			};
			if(CTI_CAMO_ACTIVATION == 3) then {		//Woodland if all camos active
				_c pushBack format["%1CUP_I_RACS_Medic_wdl", _sid];
				_c pushBack format["%1CUP_I_RACS_Soldier_wdl", _sid];
			};
			_c pushBack format["%1CUP_I_RACS_Medic_Urban", _sid];
			_c pushBack format["%1CUP_I_RACS_Soldier_Urban", _sid];
		};
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_I_LR_Transport_RACS", _sid];
	};	
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
			_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Repairtruck
			_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];					//Ammotruck
			_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Fueltruck
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1CUP_I_LCVP_RACS", _sid];
	_c pushBack format["%1CUP_I_LCVP_VIV_RACS", _sid];
	_c pushBack format["%1CUP_I_RHIB_RACS", _sid];
	_c pushBack format["%1CUP_I_RHIB2Turret_RACS", _sid];
};
if(CTI_ECONOMY_LEVEL_NAVAL >= 1) then {
	_c pushBack format["%1CUP_I_LCU1600_RACS", _sid];
};
if(CTI_ECONOMY_LEVEL_NAVAL >= 2) then {
	_c pushBack format["%1CUP_I_Frigate_RACS", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
