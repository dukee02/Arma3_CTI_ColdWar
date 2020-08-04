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

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side, CTI_BARRACKS];
if (isNil "_priorUnits" || _ai == 0) then { 
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_GER_oberst", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_GER_unequip", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_GER_gun_crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_GER_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_GER_gun_crew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_GER_pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_GER_gun_crew", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1LIB_Kfz1_Hood", _sid], []], 
		[format["%1LIB_Kfz1_Hood", _sid], []]
	]];

	//if a camo is active, we will overwrite it
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_GER_Oberst_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_GER_Recruit_w", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_GER_Gun_crew_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_GER_Rifleman_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_GER_Gun_crew_w", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_GER_pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_GER_Gun_crew_w", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_Kfz1_Hood_w", _sid], []], 
			[format["%1LIB_Kfz1_Hood_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1LIB_DAK_NCO", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1LIB_DAK_Sentry", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1LIB_DAK_spg_crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1LIB_DAK_Soldier", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1LIB_DAK_spg_crew", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1LIB_GER_pilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1LIB_DAK_spg_crew", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_DAK_Kfz1_hood", _sid], []], 
			[format["%1LIB_DAK_Kfz1_hood", _sid], []]
		]];
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log; };
_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Gun_crew_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman3_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Recruit_w", _sid];
		_c pushBack format["%1LIB_GER_Smgunner_w", _sid];
		_c pushBack format["%1LIB_GER_AT_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_Ober_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Medic_w", _sid];
		_c pushBack format["%1LIB_GER_Radioman_w", _sid];
		_c pushBack format["%1LIB_GER_Unequip_w", _sid];
		_c pushBack format["%1LIB_GER_Sapper_w", _sid];
		_c pushBack format["%1LIB_GER_Sapper_gefr_w", _sid];
		_c pushBack format["%1LIB_GER_LAT_Rifleman_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_AT_grenadier", _sid];
		_c pushBack format["%1LIB_DAK_Soldier_2", _sid];
		_c pushBack format["%1LIB_DAK_grenadier", _sid];
		_c pushBack format["%1LIB_DAK_Soldier_3", _sid];
		_c pushBack format["%1LIB_DAK_medic", _sid];
		_c pushBack format["%1LIB_DAK_radioman", _sid];
		_c pushBack format["%1LIB_DAK_Soldier", _sid];
		_c pushBack format["%1LIB_DAK_sapper", _sid];
		_c pushBack format["%1LIB_DAK_sapper_gefr", _sid];
		_c pushBack format["%1LIB_DAK_spg_crew", _sid];
		_c pushBack format["%1LIB_DAK_Sentry_2", _sid];
		_c pushBack format["%1LIB_DAK_Sentry", _sid];
	};
		
	_c pushBack format["%1LIB_GER_ober_rifleman", _sid];
	_c pushBack format["%1LIB_GER_tank_crew", _sid];
	_c pushBack format["%1LIB_GER_gun_crew", _sid];
	_c pushBack format["%1LIB_GER_Soldier2", _sid];
	_c pushBack format["%1LIB_GER_unequip", _sid];
	_c pushBack format["%1LIB_GER_Soldier3", _sid];
	_c pushBack format["%1LIB_GER_rifleman", _sid];
	_c pushBack format["%1LIB_GER_sapper", _sid];
	_c pushBack format["%1LIB_GER_sapper_gefr", _sid];
	_c pushBack format["%1LIB_GER_smgunner", _sid];
	_c pushBack format["%1LIB_GER_radioman", _sid];
	_c pushBack format["%1LIB_GER_medic", _sid];
	_c pushBack format["%1LIB_GER_pilot", _sid];
};
//Level 1
if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Mgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Ober_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_ober_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_AT_soldier_w", _sid];
		_c pushBack format["%1LIB_GER_Gun_unterofficer_w", _sid];
		_c pushBack format["%1LIB_GER_Gun_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Rifleman_ADS_w", _sid];
		_c pushBack format["%1LIB_GER_Lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Unterofficer_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Soldier_4", _sid];
		_c pushBack format["%1LIB_DAK_AT_soldier", _sid];
		_c pushBack format["%1LIB_DAK_Lieutenant", _sid];
		_c pushBack format["%1LIB_DAK_spg_unterofficer", _sid];
		_c pushBack format["%1LIB_DAK_spg_lieutenant", _sid];
	};

	_c pushBack format["%1LIB_GER_mgunner", _sid];
	_c pushBack format["%1LIB_GER_tank_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_tank_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_gun_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_ober_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_AT_grenadier", _sid];
	_c pushBack format["%1LIB_GER_stggunner", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_GER_Hauptmann_w", _sid];
		_c pushBack format["%1LIB_GER_Oberst_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_smgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_ober_grenadier_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_lieutenant_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_mgunner_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_ober_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Soldier_camo_MP40_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_rifleman_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_unterofficer_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_sniper_2_w", _sid];
		_c pushBack format["%1LIB_GER_Scout_sniper_w", _sid];
		_c pushBack format["%1LIB_GER_Stggunner_w", _sid];
	};
		
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_NCO_2", _sid];
		_c pushBack format["%1LIB_DAK_NCO", _sid];
		_c pushBack format["%1LIB_DAK_Sniper", _sid];
	};

	_c pushBack format["%1LIB_GER_AT_soldier", _sid];
	_c pushBack format["%1LIB_GER_scout_smgunner", _sid];
	_c pushBack format["%1LIB_GER_scout_lieutenant", _sid];
	_c pushBack format["%1LIB_GER_scout_mgunner", _sid];
	_c pushBack format["%1LIB_GER_scout_ober_rifleman", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo2_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo3_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo4_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo_base", _sid];
	_c pushBack format["%1LIB_GER_soldier_camo5_base", _sid];
	_c pushBack format["%1LIB_GER_scout_rifleman", _sid];
	_c pushBack format["%1LIB_GER_scout_unterofficer", _sid];
	_c pushBack format["%1LIB_GER_scout_sniper", _sid];
	_c pushBack format["%1LIB_GER_hauptmann", _sid];
	_c pushBack format["%1LIB_GER_oberst", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Kfz1_w", _sid];
		_c pushBack format["%1LIB_Kfz1_Hood_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Kfz1", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_hood", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_MG42", _sid];
	};
	_c pushBack format["%1ifa3_gaz55_ger", _sid];
	_c pushBack format["%1R71GerPre43", _sid];
	_c pushBack format["%1R71Ger44", _sid];
	_c pushBack format["%1R71Ger44Camo", _sid];
	_c pushBack format["%1LIB_Kfz1", _sid];
	_c pushBack format["%1LIB_Kfz1_camo", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood_camo", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood_sernyt", _sid];
	_c pushBack format["%1LIB_Kfz1_sernyt", _sid];
	_c pushBack format["%1LIB_Kfz1_MG42", _sid];
	_c pushBack format["%1LIB_Kfz1_MG42_camo", _sid];
	_c pushBack format["%1LIB_Kfz1_MG42_sernyt", _sid];	
};
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Open_G_Camo_w", _sid];
		_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo_w", _sid];
		_c pushBack format["%1LIB_OpelBlitz_Ambulance_w", _sid];			//medic
		_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo_w", _sid];			//FOB
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						//large FOB
		//_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
		//_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		//_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Tent", _sid];
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ambulance", _sid];		//medic
		_c pushBack format["%1LIB_DAK_OpelBlitz_Open", _sid];			//FOB
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					//large FOB
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];			//repairtruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];			//ammotruck
		//_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];			//fueltruck
	};
	_c pushBack format["%1LIB_OpelBlitz_Tent_Y_Camo", _sid];
	_c pushBack format["%1LIB_OpelBlitz_Ambulance", _sid];				//medic
	_c pushBack format["%1LIB_OpelBlitz_Open_Y_Camo", _sid];			//FOB
	_c pushBack format["%1LIB_SdKfz_7", _sid];							//large FOB
	//_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];					//repairtruck
	//_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];					//ammotruck
	//_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];					//fueltruck
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Sdkfz251_w", _sid];
		_c pushBack format["%1LIB_SdKfz251_FFV_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz251", _sid];
		_c pushBack format["%1LIB_DAK_SdKfz251_FFV", _sid];
	};
	_c pushBack format["%1LIB_SdKfz251_FFV", _sid];
	_c pushBack format["%1ifa3_sdkfz251T_2mg", _sid];
	_c pushBack format["%1ifa3_sdkfz251T", _sid];
	_c pushBack format["%1LIB_SdKfz251", _sid];
};
//Level 3
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_AA_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7_AA", _sid];
		_c pushBack format["%1LIB_DAK_M3_Halftrack", _sid];
		_c pushBack format["%1LIB_DAK_Scout_M3", _sid];
		_c pushBack format["%1LIB_DAK_Scout_M3_FFV", _sid];
		//_c pushBack format["%1LIB_SdKfz222_gelbbraun", _sid];				//gets deletet -.-
	};
	_c pushBack format["%1LIB_SdKfz_7_AA", _sid];
	//_c pushBack format["%1LIB_SdKfz222", _sid];						//gets deletet -.-
	//_c pushBack format["%1LIB_SdKfz222_camo", _sid];					//gets deletet -.-
};
//Level 4
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	//_c pushBack format["%1LIB_SdKfz234_1", _sid];						//gets deletet -.-
	//_c pushBack format["%1LIB_SdKfz234_2", _sid];						//gets deletet -.-
	//_c pushBack format["%1LIB_SdKfz234_3", _sid];						//gets deletet -.-
	//_c pushBack format["%1LIB_SdKfz234_4", _sid];						//gets deletet -.-
	_c pushBack format["%1ifa3_Ba10_wm", _sid];
};

/*
if(CTI_FOW_ADDON > 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1fow_v_kubelwagen_ger_heer", _sid];
		_c pushBack format["%1fow_v_kubelwagen_camo_ger_heer", _sid];
		_c pushBack format["%1fow_v_kubelwagen_mg34_ger_heer", _sid];
		_c pushBack format["%1fow_v_truppenfahrrad_ger_heer", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_opelblitz3_W", _sid];
			_c pushBack format["%1CSA38_opelblitz2_W", _sid];
			_c pushBack format["%1CSA38_opelblitz_W", _sid];
			_c pushBack format["%1CSA38_opelblitz4_W", _sid];
			_c pushBack format["%1CSA38_opelblitz5_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CSA38_opelblitz3_DE", _sid];
			_c pushBack format["%1CSA38_opelblitz2_DE", _sid];
			_c pushBack format["%1CSA38_opelblitz4_DE", _sid];
			_c pushBack format["%1CSA38_opelblitz_DE", _sid];
			_c pushBack format["%1CSA38_opelblitz5_DE", _sid];
		};
		_c pushBack format["%1CSA38_opelblitz3", _sid];
		_c pushBack format["%1CSA38_opelblitz2", _sid];
		_c pushBack format["%1CSA38_opelblitz", _sid];
		_c pushBack format["%1CSA38_opelblitz4", _sid];
		_c pushBack format["%1CSA38_opelblitz5", _sid];
		_c pushBack format["%1CSA38_opelblitz6", _sid];
		_c pushBack format["%1CSA38_opelblitz3_LATE", _sid];
		_c pushBack format["%1CSA38_opelblitz3_LATE2", _sid];
		_c pushBack format["%1CSA38_opelblitz2_LATE2", _sid];
		_c pushBack format["%1CSA38_opelblitz2_LATE", _sid];
		_c pushBack format["%1CSA38_opelblitz_LATE2", _sid];
		_c pushBack format["%1CSA38_opelblitz_LATE", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1fow_v_sdkfz_250_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_250_camo_foliage_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_250_camo_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_251_camo_ger_heer", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1fow_v_sdkfz_250_9_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_250_9_camo_foliage_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_250_9_camo_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_222_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_222_foliage_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_222_camo_ger_heer", _sid];
		_c pushBack format["%1fow_v_sdkfz_222_camo_foliage_ger_heer", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
		_c pushBack format["%1fow_v_sdkfz_234_1", _sid];
	};
};
*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
//Level 0
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1pz2f2", _sid];
	};
	_c pushBack format["%1pz2f", _sid];
};
//Level 1
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_StuG_III_G_w", _sid];
		_c pushBack format["%1LIB_StuG_III_G_WS_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1ifa3_pz3j", _sid];
	_c pushBack format["%1ifa3_pz3N", _sid];
	_c pushBack format["%1ifa3_StuG_III_G", _sid];
	_c pushBack format["%1ifa3_StuH_42", _sid];
	_c pushBack format["%1LIB_SdKfz124", _sid];
	_c pushBack format["%1LIB_StuG_III_G", _sid];
};
//Level 2
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind_w", _sid];
		_c pushBack format["%1LIB_PzKpfwIV_H_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_FlakPanzerIV_Wirbelwind", _sid];
		_c pushBack format["%1LIB_DAK_PzKpfwIV_H", _sid];
	};
	_c pushBack format["%1ifa3_PzKpfwIV_H", _sid];
	_c pushBack format["%1ifa3_t34_76_ger", _sid];
	_c pushBack format["%1LIB_FlakPanzerIV_Wirbelwind", _sid];
	_c pushBack format["%1LIB_PzKpfwIV_H", _sid];
	_c pushBack format["%1LIB_PzKpfwIV_H_tarn51c", _sid];
	_c pushBack format["%1LIB_PzKpfwIV_H_tarn51d", _sid];
};
//Level 3
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwVI_E_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_PzKpfwVI_E", _sid];
	};
	_c pushBack format["%1LIB_PzKpfwVI_E", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_2", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_tarn51c", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_tarn51d", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_tarn52c", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_tarn52d", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_E_1", _sid];
};
//Level 4
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_PzKpfwV_w", _sid];
		_c pushBack format["%1LIB_PzKpfwVI_B_w", _sid];
		_c pushBack format["%1LIB_PzKpfwVI_B_camo_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1LIB_PzKpfwV", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_B", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_B_tarn51c", _sid];
	_c pushBack format["%1LIB_PzKpfwVI_B_tarn51d", _sid];
};

/*
if(CTI_FOW_ADDON == 1) then {
	//Level (-1) only active if FOW is active -> comming soon
	if(CTI_ECONOMY_LEVEL_TRACKED >= -1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_pzbfwIamb_W", _sid];
			_c pushBack format["%1CSA38_pzbfwI_W", _sid];
			_c pushBack format["%1CSA38_pzkpfwIA_W", _sid];
			_c pushBack format["%1CSA38_pzkpfwI_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CSA38_pzbfwIamb_DE", _sid];
			_c pushBack format["%1CSA38_pzbfwI_DE", _sid];
			_c pushBack format["%1CSA38_pzkpfwIA_DE", _sid];
		};
		_c pushBack format["%1CSA38_pzbfwI_FR", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA_FR", _sid];
		_c pushBack format["%1CSA38_pzkpfwI_FR", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_ltm35_W", _sid];
			_c pushBack format["%1CSA38_ltm38_W", _sid];
			_c pushBack format["%1CSA38_pzIIa_W", _sid];
			_c pushBack format["%1CSA38_pzIIb_W", _sid];
			_c pushBack format["%1CSA38_pzII_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CSA38_pzIIa_DE", _sid];
			_c pushBack format["%1CSA38_pzIIb_DE", _sid];
			_c pushBack format["%1CSA38_pzII_DE", _sid];
		};
		_c pushBack format["%1CSA38_ltm38_LATE2", _sid];
		_c pushBack format["%1CSA38_ltm38_LATE", _sid];
		_c pushBack format["%1CSA38_ltm35_FR", _sid];
		_c pushBack format["%1CSA38_ltm38_FR", _sid];
		_c pushBack format["%1CSA38_pzIIa_FR", _sid];
		_c pushBack format["%1CSA38_pzIIb_FR", _sid];
		_c pushBack format["%1CSA38_pzII_FR", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_pzIIIB_W", _sid];
			_c pushBack format["%1CSA38_pzIIID_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		};
		_c pushBack format["%1CSA38_pzIIIB_LATE", _sid];
		_c pushBack format["%1CSA38_pzIIIC_LATE", _sid];
		_c pushBack format["%1CSA38_pzIIIB_FR", _sid];
		_c pushBack format["%1CSA38_pzIIIC_FR", _sid];
		_c pushBack format["%1CSA38_pzIIID_FR", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_pzIV_W", _sid];
			_c pushBack format["%1CSA38_pzIVB_W", _sid];
			_c pushBack format["%1CSA38_pzIVC_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		};
		_c pushBack format["%1CSA38_pzIV_LATE", _sid];
		_c pushBack format["%1CSA38_pzIVB_LATE", _sid];
		_c pushBack format["%1CSA38_pzIVC_LATE", _sid];
		_c pushBack format["%1CSA38_pzIV_FR", _sid];
		_c pushBack format["%1CSA38_pzIVB_FR", _sid];
		_c pushBack format["%1CSA38_pzIVC_FR", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		};
		_c pushBack format["%1fow_v_panther_ger_heer", _sid];
		_c pushBack format["%1fow_v_panther_camo_foliage_ger_heer", _sid];
		_c pushBack format["%1fow_v_panther_camo_ger_heer", _sid];
	};
};
*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];



_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
//	_c pushBack format["%1LIB_Ju52", _sid];
//};
//Level 1
if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Ju87_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Ju87_2", _sid];
		_c pushBack format["%1LIB_DAK_Ju87", _sid];
		_c pushBack format["%1LIB_Ju87_Italy2", _sid];
		_c pushBack format["%1LIB_Ju87_Italy", _sid];
	};
	_c pushBack format["%1ifa3_ju87_mg", _sid];
	_c pushBack format["%1LIB_Ju87", _sid];
};
//Level 3
if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_FW190F8_2_w", _sid];
		_c pushBack format["%1LIB_FW190F8_3_w", _sid];
		_c pushBack format["%1LIB_FW190F8_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_FW190F8", _sid];
		_c pushBack format["%1LIB_DAK_FW190F8_Desert2", _sid];
		_c pushBack format["%1LIB_DAK_FW190F8_Desert3", _sid];
		_c pushBack format["%1LIB_DAK_FW190F8_Desert", _sid];
		_c pushBack format["%1LIB_FW190F8_Italy", _sid];
	};
	_c pushBack format["%1LIB_FW190F8", _sid];
	_c pushBack format["%1LIB_FW190F8_4", _sid];
	_c pushBack format["%1LIB_FW190F8_5", _sid];
	_c pushBack format["%1LIB_FW190F8_2", _sid];
	_c pushBack format["%1LIB_FW190F8_3", _sid];
};

if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1sab_avia", _sid];
		_c pushBack format["%1sab_bu131", _sid];
		_c pushBack format["%1sab_avia_2", _sid];
		_c pushBack format["%1sab_w34", _sid];
		_c pushBack format["%1sab_w34f", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1sab_bf109", _sid];
		_c pushBack format["%1sab_ju87", _sid];
		_c pushBack format["%1sab_bf110", _sid];
		_c pushBack format["%1sab_bf110_2", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1sab_ju88", _sid];
		_c pushBack format["%1sab_ju88_2", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1sab_fw190", _sid];
		_c pushBack format["%1sab_fw190_2", _sid];
		_c pushBack format["%1sab_he111", _sid];
	};
	//Level 4
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1sab_bv141", _sid];
		_c pushBack format["%1sab_do335", _sid];
		_c pushBack format["%1sab_ta152c", _sid];
	};
	//Level 5
	if(CTI_ECONOMY_LEVEL_AIR >= 5) then {
		_c pushBack format["%1sab_he162", _sid];
		_c pushBack format["%1sab_hix", _sid];
		_c pushBack format["%1sab_me262", _sid];
		_c pushBack format["%1sab_me262_2", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
	};
	_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
		_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_GER_Recruit_w", _sid];
			_c pushBack format["%1LIB_GER_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_medic", _sid];
			_c pushBack format["%1LIB_DAK_Sentry", _sid];
		};
		_c pushBack format["%1LIB_GER_rifleman", _sid];
		_c pushBack format["%1LIB_GER_medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Kfz1_w", _sid];
		_c pushBack format["%1LIB_Kfz1_Hood_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Kfz1", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_hood", _sid];
	};
	_c pushBack format["%1ifa3_gaz55_ger", _sid];
	_c pushBack format["%1R71GerPre43", _sid];
	_c pushBack format["%1R71Ger44", _sid];
	_c pushBack format["%1R71Ger44Camo", _sid];
	_c pushBack format["%1LIB_Kfz1", _sid];
	_c pushBack format["%1LIB_Kfz1_camo", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood_camo", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood_sernyt", _sid];
	_c pushBack format["%1LIB_Kfz1_sernyt", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
			_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
			_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
		};
		_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
		_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

_c = [];
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
if(CTI_SAB_ADDON == 1) then {
	//Level 0
	if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
		_c pushBack format["%1sab_boat_freighter_o", _sid];
		_c pushBack format["%1sab_boat_torpedo_o", _sid];
		_c pushBack format["%1sab_boat_s38_o", _sid];
		_c pushBack format["%1sab_boat_sreighter_o", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_NAVAL >= 1) then {
		_c pushBack format["%1sab_boat_destroyer_o", _sid];
		_c pushBack format["%1sab_boat_u7", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_NAVAL >= 2) then {
		_c pushBack format["%1sab_boat_cruiser_o", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_NAVAL >= 3) then {
		_c pushBack format["%1sab_boat_battleship_o", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
