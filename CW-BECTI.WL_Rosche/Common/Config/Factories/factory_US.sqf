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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
if (isNil "_priorUnits" || _ai == 2) then { 
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_US_captain", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_US_grenadier", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_US_driver", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_US_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_US_driver", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_US_Pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_US_grenadier", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1LIB_US_Willys_MB", _sid], []], 
		[format["%1LIB_US_Willys_MB", _sid], []]
	]];

	//if a camo is active, we will overwrite it
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_US_Captain_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_US_Grenadier_w", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_US_Driver_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_US_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_US_Driver_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_US_Pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_US_Grenadier_w", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_US_Willys_MB_w", _sid], []], 
			[format["%1LIB_US_Willys_MB_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_US_NAC_captain", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_US_NAC_grenadier", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_US_NAC_driver", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_US_NAC_rifleman", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_US_NAC_driver", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_US_Pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_US_NAC_grenadier", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_US_NAC_Willys_MB", _sid], []], 
			[format["%1LIB_US_NAC_Willys_MB", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Driver_w", _sid];
		_c pushBack format["%1LIB_US_Engineer_w", _sid];
		_c pushBack format["%1LIB_US_Grenadier_w", _sid];
		_c pushBack format["%1LIB_US_Medic_w", _sid];
		_c pushBack format["%1LIB_US_Radioman_w", _sid];
		_c pushBack format["%1LIB_US_Rifleman_w", _sid];
		_c pushBack format["%1LIB_US_Smgunner_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_driver", _sid];
		_c pushBack format["%1LIB_US_NAC_engineer", _sid];
		_c pushBack format["%1LIB_US_NAC_grenadier", _sid];
		_c pushBack format["%1LIB_US_NAC_medic", _sid];
		_c pushBack format["%1LIB_US_NAC_radioman", _sid];
		_c pushBack format["%1LIB_US_NAC_rifleman", _sid];
		_c pushBack format["%1LIB_US_NAC_smgunner", _sid];
	};
	
	_c pushBack format["%1LIB_US_driver", _sid];
	_c pushBack format["%1LIB_US_rifleman", _sid];
	_c pushBack format["%1LIB_US_engineer", _sid];
	_c pushBack format["%1LIB_US_grenadier", _sid];
	_c pushBack format["%1LIB_US_medic", _sid];
	_c pushBack format["%1LIB_US_radioman", _sid];
	_c pushBack format["%1LIB_US_Bomber_Crew", _sid];
	_c pushBack format["%1LIB_US_Bomber_Pilot", _sid];
	_c pushBack format["%1LIB_US_Pilot", _sid];
	_c pushBack format["%1LIB_US_tank_crew", _sid];
	_c pushBack format["%1LIB_US_smgunner", _sid];
				
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_AT_soldier_w", _sid];
		_c pushBack format["%1LIB_US_Corporal_w", _sid];
		_c pushBack format["%1LIB_US_FC_rifleman_w", _sid];
		_c pushBack format["%1LIB_US_Second_lieutenant_w", _sid];
		_c pushBack format["%1LIB_US_Mgunner_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_FC_rifleman", _sid];
		_c pushBack format["%1LIB_US_NAC_corporal", _sid];
		_c pushBack format["%1LIB_US_NAC_AT_soldier", _sid];
		_c pushBack format["%1LIB_US_NAC_mgunner", _sid];
		_c pushBack format["%1LIB_US_NAC_second_lieutenant", _sid];
	};
	
	_c pushBack format["%1LIB_US_mgunner", _sid];
	_c pushBack format["%1LIB_US_FC_rifleman", _sid];
	_c pushBack format["%1LIB_US_tank_sergeant", _sid];
	_c pushBack format["%1LIB_US_AT_soldier", _sid];
	_c pushBack format["%1LIB_US_corporal", _sid];
	_c pushBack format["%1LIB_US_second_lieutenant", _sid];
	_c pushBack format["%1LIB_US_tank_second_lieutenant", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_First_lieutenant_w", _sid];
		_c pushBack format["%1LIB_US_Sniper_w", _sid];
		_c pushBack format["%1LIB_US_Captain_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_first_lieutenant", _sid];
		_c pushBack format["%1LIB_US_NAC_sniper", _sid];
		_c pushBack format["%1LIB_US_NAC_captain", _sid];
	};

	_c pushBack format["%1LIB_US_first_lieutenant", _sid];
	_c pushBack format["%1LIB_US_sniper", _sid];
	_c pushBack format["%1LIB_US_captain", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_Hood_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_M1919_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_Ambulance_w", _sid];		//medic
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_M1919", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Ambulance", _sid];	//medic	
	};
	
	_c pushBack format["%1R71USA", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_Hood", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_M1919", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_Ambulance", _sid];			//medic	
	
	/*class  	fow_v_willys_usa;*/
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_GMC_Open_w", _sid];
		_c pushBack format["%1LIB_US_GMC_Tent_w", _sid];				//large FOB
		//_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
		//_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
		//_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
	};
	
	_c pushBack format["%1LIB_US_GMC_Open", _sid];
	_c pushBack format["%1LIB_US_GMC_Ambulance", _sid];					//medic
	_c pushBack format["%1LIB_US_GMC_Tent", _sid];						//large FOB
	//_c pushBack format["%1LIB_US_GMC_Fuel", _sid];						//fueltruck
	//_c pushBack format["%1LIB_US_GMC_Parm", _sid];						//repairtruck
	//_c pushBack format["%1LIB_US_GMC_Ammo", _sid];						//ammotruck
	
	/*class  	fow_v_gmc_usa;
	class  	fow_v_gmc_open_usa;*/
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Scout_m3_w", _sid];
		_c pushBack format["%1LIB_US_Scout_M3_FFV_w", _sid];			//FOB
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Scout_M3", _sid];
		_c pushBack format["%1LIB_US_NAC_Scout_M3_FFV", _sid];			//FOB
	};
	
	_c pushBack format["%1LIB_US_Scout_M3", _sid];
	_c pushBack format["%1LIB_US_Scout_M3_FFV", _sid];					//FOB
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_M3_Halftrack_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_M3_Halftrack", _sid];
	};
	_c pushBack format["%1LIB_US_M3_Halftrack", _sid];
};
//Level 4
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	_c pushBack format["%1LIB_M8_Greyhound", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
/*if(CTI_FOW_ADDON > 0) then {
	//Level 0(-1)
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1fow_v_lvta2_usa", _sid];
	};
	//Level 0
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1LIB_M3A3_Stuart", _sid];
	};
} else {*/
	//Level 0
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1LIB_M3A3_Stuart", _sid];
	};
	
	/*class  	csa38_m3a37AD2;
	class  	csa38_m3a37AD3;
	class  	csa38_m3a37AD4;
	class  	csa38_m3a37AD5;
	class  	csa38_m3a37ADW2;
	class  	csa38_m3a37ADW3;
	class  	csa38_m3a37ADW4;
	class  	csa38_m3a37ADW5;
	class  	csa38_m3a37ADW;*/
//};
//Level 1
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	_c pushBack format["%1LIB_M5A1_Stuart", _sid];
	
	/*class  	fow_v_m5a1_usa;*/

	/*class  	csa38_m5a17ADW;
	class  	csa38_cromwell_4EN;
	class  	csa38_cromwell_DCSW;
	class  	csa38_cromwell_4ENW;*/
};
//Level 2
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_M4A3_75_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_M4A3_75", _sid];
	};
	_c pushBack format["%1LIB_M4A3_75", _sid];
	_c pushBack format["%1LIB_M4A3_75_Tubes", _sid];
	_c pushBack format["%1IFa3_M4A3_75", _sid];
	
	/*class  	fow_v_m4a2_usa;*/

	/*class  	csa38_cromwell_C;
	class  	csa38_cromwell_D;
	class  	csa38_cromwell_2;
	class  	csa38_cromwell_CW;
	class  	csa38_cromwell_DW;
	class  	csa38_cromwell_2W;*/
};
//Level 3
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	_c pushBack format["%1LIB_M4A3_76", _sid];
};
//Level 4
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	_c pushBack format["%1LIB_M4A3_76_HVSS", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_c pushBack format["%1LIB_C47_Skytrain", _sid];
	_c pushBack format["%1LIB_C47_RAF_bob", _sid];
	_c pushBack format["%1LIB_C47_RAF_snafu", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_P39_2", _sid];
		_c pushBack format["%1LIB_US_NAC_P39_3", _sid];
		_c pushBack format["%1LIB_US_NAC_P39", _sid];
	};
	
	_c pushBack format["%1LIB_US_P39", _sid];
	_c pushBack format["%1LIB_US_P39_2", _sid];
};
//Level 3
if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
	_c pushBack format["%1LIB_P47", _sid];
};
//Level 4
//if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
	/*class  	fow_va_f6f;
	class  	fow_va_f6f_kick;
	class  	fow_va_f6f_sweet;
	class  	fow_va_f6f_c;
	class  	fow_va_f6f_c_death;
	class  	fow_va_f6f_c_kick;
	class  	fow_va_f6f_c_sweet;*/
//};

if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1sab_c47", _sid];
		_c pushBack format["%1sab_p26", _sid];
		_c pushBack format["%1sab_ryanpt", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1sab_texan", _sid];
		_c pushBack format["%1sab_dauntless", _sid];
		_c pushBack format["%1sab_avenger", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1sab_p38", _sid];
		_c pushBack format["%1sab_corsair", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1sab_mustang", _sid];
		_c pushBack format["%1sab_p51b", _sid];
		_c pushBack format["%1sab_a26", _sid];
		_c pushBack format["%1sab_b25", _sid];
	};
	//Level 4
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1sab_tigercat", _sid];
		_c pushBack format["%1sab_f6f", _sid];
		_c pushBack format["%1sab_b24", _sid];
	};
	//Level 5
	if(CTI_ECONOMY_LEVEL_AIR >= 5) then {
		_c pushBack format["%1sab_p61", _sid];
		_c pushBack format["%1sab_b17", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	
	_c pushBack format["%1LIB_US_GMC_Parm", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
	};
	
	_c pushBack format["%1LIB_US_GMC_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_US_GMC_Fuel", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_US_Rifleman_w", _sid];
			_c pushBack format["%1LIB_US_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_US_NAC_rifleman", _sid];
			_c pushBack format["%1LIB_US_NAC_medic", _sid];
		};
		_c pushBack format["%1LIB_US_rifleman", _sid];
		_c pushBack format["%1LIB_US_medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_US_Willys_MB_w", _sid];	
		_c pushBack format["%1LIB_US_Willys_MB_Hood_w", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_US_NAC_Willys_MB", _sid];	
		_c pushBack format["%1LIB_US_NAC_Willys_MB_Hood", _sid];	
	};
	
	_c pushBack format["%1R71USA", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB", _sid];	
	_c pushBack format["%1LIB_US_Willys_MB_Hood", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_US_GMC_Ammo_w", _sid];				//ammotruck
			_c pushBack format["%1LIB_US_GMC_Fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_US_GMC_Parm_w", _sid];				//repairtruck
		};
		_c pushBack format["%1LIB_US_GMC_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_US_GMC_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_US_GMC_Parm", _sid];						//repairtruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1LIB_LCA", _sid];
	_c pushBack format["%1LIB_LCI", _sid];
	_c pushBack format["%1LIB_LCM3_Armed", _sid];
	_c pushBack format["%1LIB_LCVP", _sid];
	
	/*class  	fow_usa_lcvp;*/
};
if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
		_c pushBack format["%1sab_boat_freighter", _sid];
		_c pushBack format["%1sab_boat_liberty", _sid];
		_c pushBack format["%1sab_boat_rubberboat", _sid];
		_c pushBack format["%1sab_boat_torpedo", _sid];
		_c pushBack format["%1sab_boat_sreighter", _sid];
		_c pushBack format["%1sab_boat_subchaser", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_NAVAL >= 1) then {
		_c pushBack format["%1sab_boat_destroyer", _sid];
		_c pushBack format["%1sab_boat_u7_o", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_NAVAL >= 2) then {
		_c pushBack format["%1sab_boat_cruiser", _sid];
		_c pushBack format["%1sab_item_carrier_2", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_NAVAL >= 3) then {
		_c pushBack format["%1sab_boat_battleship", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
