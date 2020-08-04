private ["_side", "_c", "_sid", "_priorUnits", "_ai"];
_side = _this;
_ai = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
	_ai = CTI_WEST_AI;
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_ai = CTI_EAST_AI;
	} 
	else {
		_sid = "VIOC_I_";
	};
};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
if (isNil "_priorUnits" || _ai == 3) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_Officer", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_Rifleman_Jerkins", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_Rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_Tank_Crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_Grenadier", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1LIB_UniversalCarrier", _sid], []], 
		[format["%1LIB_UniversalCarrier", _sid], []]
	]];

	//if a camo is active, we will overwrite it
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_Officer_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_Grenadier_w", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_Grenadier_w", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_w", _sid], []], 
			[format["%1LIB_UniversalCarrier_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_UK_DR_Officer", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_UK_DR_Grenadier", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_UK_DR_Rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_UK_DR_Rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_UK_DR_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_UK_DR_Tank_Crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_UK_DR_Grenadier", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_desert", _sid], []], 
			[format["%1LIB_UniversalCarrier_desert", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Radioman_w", _sid];
		_c pushBack format["%1LIB_UK_Rifleman_w", _sid];
		_c pushBack format["%1LIB_UK_Medic_w", _sid];
		_c pushBack format["%1LIB_UK_Grenadier_w", _sid];
		_c pushBack format["%1LIB_UK_Engineer_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Engineer", _sid];
		_c pushBack format["%1LIB_UK_DR_Grenadier", _sid];
		_c pushBack format["%1LIB_UK_DR_Medic", _sid];
		_c pushBack format["%1LIB_UK_DR_Radioman", _sid];
		_c pushBack format["%1LIB_UK_DR_Rifleman", _sid];
		_c pushBack format["%1LIB_UK_DR_Tank_Crew", _sid];
	};
	
	_c pushBack format["%1LIB_UK_Engineer", _sid];
	_c pushBack format["%1LIB_UK_Grenadier", _sid];
	_c pushBack format["%1LIB_UK_Grenadier_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Medic", _sid];
	_c pushBack format["%1LIB_UK_Rifleman", _sid];
	_c pushBack format["%1LIB_UK_Rifleman_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Tank_Crew", _sid];
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_AT_Soldier_w", _sid];
		_c pushBack format["%1LIB_UK_Corporal_w", _sid];
		_c pushBack format["%1LIB_UK_LanceCorporal_w", _sid];
		_c pushBack format["%1LIB_UK_Sergeant_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_AT_Soldier", _sid];
		_c pushBack format["%1LIB_UK_DR_LanceCorporal", _sid];
		_c pushBack format["%1LIB_UK_DR_Corporal", _sid];
		_c pushBack format["%1LIB_UK_DR_Sergeant", _sid];
	};
	
	_c pushBack format["%1LIB_UK_AT_Soldier", _sid];
	_c pushBack format["%1LIB_UK_Corporal", _sid];
	_c pushBack format["%1LIB_UK_Corporal_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_LanceCorporal", _sid];
	_c pushBack format["%1LIB_UK_LanceCorporal_Jerkins", _sid];
	_c pushBack format["%1LIB_UK_Sergeant", _sid];
	_c pushBack format["%1LIB_UK_Sergeant_Jerkins", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Officer_w", _sid];
		_c pushBack format["%1LIB_UK_Sniper_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Tank_Commander", _sid];
		_c pushBack format["%1LIB_UK_DR_Sniper", _sid];
		_c pushBack format["%1LIB_UK_DR_Officer", _sid];
	};

	_c pushBack format["%1LIB_UK_Sniper", _sid];
	_c pushBack format["%1LIB_UK_Officer", _sid];
	_c pushBack format["%1LIB_UK_Tank_Commander", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UniversalCarrier_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UniversalCarrier_desert", _sid];
	};
	
	_c pushBack format["%1LIB_UniversalCarrier", _sid];	
	
	/*class  	fow_v_universalCarrier;*/
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//_c pushBack format["%1LIB_AustinK5_Open", _sid];
		//_c pushBack format["%1LIB_AustinK5_DR_Tent", _sid];				//large FOB
		//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];				//ammotruck
	//};
	
	_c pushBack format["%1LIB_US6_Open_Cargo", _sid];
	_c pushBack format["%1LIB_US6_Open", _sid];
	//_c pushBack format["%1LIB_US6_Tent", _sid];								//FOB
	//_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
	//_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
	
	//_c pushBack format["%1LIB_AustinK5_Open", _sid];
	//_c pushBack format["%1LIB_AustinK5_Tent", _sid];						//large FOB
	//_c pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
	
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Willys_MB_w", _sid];
		_c pushBack format["%1LIB_UK_Willys_MB_M1919_w", _sid];
		_c pushBack format["%1LIB_UK_Willys_MB_Ambulance_w", _sid];			//medic
		_c pushBack format["%1LIB_UK_Willys_MB_Hood_w", _sid];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Willys_MB", _sid];
		_c pushBack format["%1LIB_UK_DR_Willys_MB_M1919", _sid];
		_c pushBack format["%1LIB_UK_DR_Willys_MB_Ambulance", _sid];		//medic
		_c pushBack format["%1LIB_UK_DR_Willys_MB_Hood", _sid];				
	};
	
	_c pushBack format["%1LIB_UK_Willys_MB", _sid];
	_c pushBack format["%1LIB_UK_Willys_MB_M1919", _sid];
	_c pushBack format["%1LIB_UK_Willys_MB_Ambulance", _sid];				//medic
	_c pushBack format["%1LIB_UK_Willys_MB_Hood", _sid];					
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_UK_M3_Halftrack", _sid];
};
//Level 4
//if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
//};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
/*if(CTI_FOW_ADDON > 0) then {
	//Level 0(-1)
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_Crusader_Mk1AA_desert", _sid];
		};
		_c pushBack format["%1LIB_Crusader_Mk1AA", _sid];
	};
	//Level 0
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_Crusader_Mk3_desert", _sid];
		};
		_c pushBack format["%1LIB_Crusader_Mk3", _sid];
	};
} else {*/
	//Level 0
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//	_c pushBack format["%1LIB_Crusader_Mk1AA_desert", _sid];
		//	_c pushBack format["%1LIB_Crusader_Mk3_desert", _sid];
		//};
		//_c pushBack format["%1LIB_Crusader_Mk1AA", _sid];
		//_c pushBack format["%1LIB_Crusader_Mk3", _sid];
		
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Churchill_Mk7_w", _sid];
			_c pushBack format["%1LIB_Churchill_Mk7_Crocodile_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_Churchill_Mk7_desert", _sid];
			_c pushBack format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid];
		};
		_c pushBack format["%1LIB_Churchill_Mk7", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Crocodile", _sid];
	};
//};
//Level 1
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Churchill_Mk7_AVRE_w", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Howitzer_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_Churchill_Mk7_AVRE_desert", _sid];
		_c pushBack format["%1LIB_Churchill_Mk7_Howitzer_desert", _sid];
	};
	_c pushBack format["%1LIB_Churchill_Mk7_AVRE", _sid];
	_c pushBack format["%1LIB_Churchill_Mk7_Howitzer", _sid];
	
	/*class csa38_matildaii_5;
	class csa38_matildaii_4;
	class csa38_matildaii_1;
	class csa38_matildaiiCS_1;
	class csa38_matildaiiCS_5;
	class csa38_matildaiiCS_4;
	class csa38_matildaii;
	class csa38_matildaii_2;
	class csa38_matildaii_6;
	class csa38_matildaiiCS_6;
	class csa38_matildaiiCS;
	class csa38_matildaiiCS_2;
	class csa38_matildaii_3;
	class csa38_matildaiiCS_3;*/
};
//Level 2
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Cromwell_Mk4_w", _sid];
	};
	_c pushBack format["%1LIB_Cromwell_Mk4", _sid];
	
	/*class fow_v_cromwell_uk;*/
};
//Level 3
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_M4A3_75", _sid];
	};
	_c pushBack format["%1LIB_UK_Italy_M4A3_75", _sid];
	
	/*class csa38_valentineMkIIgreen2;
	class csa38_valentineMkIIgreen3;
	class csa38_valentineMkIIgreen;
	class csa38_valentineMkIIgreen4;
	class csa38_valentineMkII5;
	class csa38_valentineMkII4;
	class csa38_valentineMkII3;
	class csa38_valentineMkII6;
	class csa38_valentineMkII2;
	class csa38_valentineMkII;
	class csa38_valentineMkIIW;*/
};
//Level 4
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	_c pushBack format["%1LIB_M4A4_FIREFLY", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_c pushBack format["%1LIB_C47_RAF", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
	_c pushBack format["%1LIB_RAF_P39", _sid];
};
//Level 3
//if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
	/*
	class fow_va_f6f_faa;
	class fow_va_f6f_c_faa;
	*/
//};

if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1sab_gladiator", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1sab_ca12bo", _sid];
	};
	//Level 2
	//Level 3
	//Level 4
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1sab_mb5", _sid];
	};
	//Level 5
	if(CTI_ECONOMY_LEVEL_AIR >= 5) then {
		_c pushBack format["%1sab_meteor", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//_c pushBack format["%1LIB_AustinK5_DR_Tent", _sid];					//repairtruck
	//};
	//_c pushBack format["%1LIB_AustinK5_Tent", _sid];						//repairtruck
	_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];					//ammotruck
	//};
	//pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_UK_Rifleman_w", _sid];
			_c pushBack format["%1LIB_UK_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_UK_DR_Rifleman", _sid];
			_c pushBack format["%1LIB_UK_DR_Medic", _sid];
		};
		_c pushBack format["%1LIB_UK_Rifleman", _sid];
		_c pushBack format["%1LIB_UK_Medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UniversalCarrier_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UniversalCarrier_desert", _sid];
	};
	
	_c pushBack format["%1LIB_UniversalCarrier", _sid];	
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];					//ammotruck
		//};
		//_c pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
		_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1LIB_UK_LCA", _sid];
	_c pushBack format["%1LIB_UK_LCI", _sid];
};
if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
		_c pushBack format["%1sab_boat_liberty_rn", _sid];
		_c pushBack format["%1sab_boat_torpedo_rn", _sid];
		_c pushBack format["%1sab_boat_subchaser_rn", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_NAVAL >= 1) then {
		_c pushBack format["%1sab_boat_destroyer_rn", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_NAVAL >= 2) then {
		_c pushBack format["%1sab_boat_cruiser_rn", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_NAVAL >= 3) then {
		_c pushBack format["%1sab_boat_battleship_rn", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
