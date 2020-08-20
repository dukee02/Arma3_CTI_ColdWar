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

if(CTI_MAIN_ADDON == 0) then {_adds = 3;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if ((isNil "_priorUnits" || _ai == 2) && CTI_RHS_ADDON > 0 && CTI_MAIN_ADDON > 0) then { 
	
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1rhs_vdv_officer", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1rhs_vdv_combatcrew", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1rhs_vdv_driver_armored", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1rhs_vdv_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1rhs_vdv_combatcrew", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1rhs_pilot", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1rhs_vdv_grenadier_rpg", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1rhs_uaz_vdv", _sid], []], 
		[format["%1rhs_uaz_open_vdv", _sid], []]
	]];
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_RHS_ADDON > 0) then {
	//vdv = green dot camo - vdv_des = light brown - vdv_flora = green stripes camo - vdv_mflora = brown camo
	//Level start (Level 3 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1rhs_vdv_des_crew", _sid];
			_c pushBack format["%1rhs_vdv_des_armoredcrew", _sid];
			_c pushBack format["%1rhs_vdv_des_combatcrew", _sid];
			_c pushBack format["%1rhs_vdv_des_driver", _sid];
			_c pushBack format["%1rhs_vdv_des_driver_armored", _sid];
			_c pushBack format["%1rhs_vdv_des_machinegunner", _sid];
			_c pushBack format["%1rhs_vdv_des_machinegunner_assistant", _sid];
			_c pushBack format["%1rhs_vdv_des_rifleman", _sid];
			_c pushBack format["%1rhs_vdv_des_rifleman_asval", _sid];
			_c pushBack format["%1rhs_vdv_des_rifleman_lite", _sid];
			_c pushBack format["%1rhs_vdv_des_at", _sid];
			_c pushBack format["%1rhs_vdv_des_grenadier_rpg", _sid];
			_c pushBack format["%1rhs_vdv_des_strelok_rpg_assist", _sid];
		};
		_c pushBack format["%1rhs_vdv_crew", _sid];
		_c pushBack format["%1rhs_vdv_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_driver", _sid];
		_c pushBack format["%1rhs_vdv_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_asval", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_at", _sid];
		_c pushBack format["%1rhs_vdv_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_strelok_rpg_assist", _sid];
		
		_c pushBack format["%1rhs_vdv_flora_crew", _sid];
		_c pushBack format["%1rhs_vdv_flora_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_flora_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_flora_driver", _sid];
		_c pushBack format["%1rhs_vdv_flora_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_flora_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_flora_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_flora_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_flora_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_flora_at", _sid];
		_c pushBack format["%1rhs_vdv_flora_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_flora_strelok_rpg_assist", _sid];

		_c pushBack format["%1rhs_vdv_mflora_crew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_driver", _sid];
		_c pushBack format["%1rhs_vdv_mflora_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_mflora_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_mflora_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_mflora_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_mflora_at", _sid];
		_c pushBack format["%1rhs_vdv_mflora_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_mflora_strelok_rpg_assist", _sid];
		
	};	
	//Level 1 (Level 4 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1rhs_vdv_des_crew_commander", _sid];
			_c pushBack format["%1rhs_vdv_des_engineer", _sid];
			_c pushBack format["%1rhs_vdv_des_medic", _sid];
			_c pushBack format["%1rhs_vdv_des_sergeant", _sid];
			_c pushBack format["%1rhs_vdv_des_efreitor", _sid];
			_c pushBack format["%1rhs_vdv_des_junior_sergeant", _sid];
			_c pushBack format["%1rhs_vdv_des_aa", _sid];
			_c pushBack format["%1rhs_vdv_des_arifleman", _sid];
			_c pushBack format["%1rhs_vdv_des_LAT", _sid];
		};
		_c pushBack format["%1rhs_pilot", _sid];
		_c pushBack format["%1rhs_pilot_combat_heli", _sid];
		_c pushBack format["%1rhs_pilot_tan", _sid];
		_c pushBack format["%1rhs_pilot_transport_heli", _sid];
		
		_c pushBack format["%1rhs_vdv_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_engineer", _sid];
		_c pushBack format["%1rhs_vdv_medic", _sid];
		_c pushBack format["%1rhs_vdv_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_aa", _sid];
		_c pushBack format["%1rhs_vdv_arifleman", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_alt", _sid];
		_c pushBack format["%1rhs_vdv_LAT", _sid];
		
		_c pushBack format["%1rhs_vdv_flora_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_flora_engineer", _sid];
		_c pushBack format["%1rhs_vdv_flora_medic", _sid];
		_c pushBack format["%1rhs_vdv_flora_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_flora_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_flora_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_flora_aa", _sid];
		_c pushBack format["%1rhs_vdv_flora_LAT", _sid];

		_c pushBack format["%1rhs_vdv_mflora_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_mflora_engineer", _sid];
		_c pushBack format["%1rhs_vdv_mflora_medic", _sid];
		_c pushBack format["%1rhs_vdv_mflora_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_mflora_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_aa", _sid];
		_c pushBack format["%1rhs_vdv_mflora_LAT", _sid];
	};
	//Level 2 (Level 5 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1rhs_vdv_des_marksman", _sid];
			_c pushBack format["%1rhs_vdv_des_marksman_asval", _sid];
			_c pushBack format["%1rhs_vdv_des_officer", _sid];
			_c pushBack format["%1rhs_vdv_des_officer_armored", _sid];
			_c pushBack format["%1rhs_vdv_des_grenadier", _sid];
			_c pushBack format["%1rhs_vdv_des_RShG2", _sid];
		};
		_c pushBack format["%1rhs_vdv_marksman_asval", _sid];
		_c pushBack format["%1rhs_vdv_marksman", _sid];
		_c pushBack format["%1rhs_vdv_officer", _sid];
		_c pushBack format["%1rhs_vdv_officer_armored", _sid];
		_c pushBack format["%1rhs_vdv_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_grenadier_alt", _sid];
		_c pushBack format["%1rhs_vdv_RShG2", _sid];
	
		_c pushBack format["%1rhs_vdv_flora_marksman", _sid];
		_c pushBack format["%1rhs_vdv_flora_officer", _sid];
		_c pushBack format["%1rhs_vdv_flora_officer_armored", _sid];
		_c pushBack format["%1rhs_vdv_flora_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_flora_RShG2", _sid];

		_c pushBack format["%1rhs_vdv_mflora_marksman", _sid];
		_c pushBack format["%1rhs_vdv_mflora_officer", _sid];
		_c pushBack format["%1rhs_vdv_mflora_officer_armored", _sid];
		_c pushBack format["%1rhs_vdv_mflora_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_mflora_RShG2", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_adds = 0;
if(CTI_RHS_ADDON > 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1rhs_uaz_vdv", _sid];
		_c pushBack format["%1rhs_uaz_open_vdv", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1rhs_gaz66_ap2_vdv", _sid];			//Medic
		_c pushBack format["%1rhs_gaz66_vdv", _sid];
		_c pushBack format["%1rhs_gaz66_flat_vdv", _sid];
		_c pushBack format["%1rhs_gaz66o_vdv", _sid];
		_c pushBack format["%1rhs_gaz66o_flat_vdv", _sid];
		_c pushBack format["%1rhs_zil131_vdv", _sid];
		_c pushBack format["%1rhs_zil131_open_vdv", _sid];
		_c pushBack format["%1rhs_zil131_flatbed_vdv", _sid];
		_c pushBack format["%1rhs_gaz66_zu23_vdv", _sid];			//Flak
		_c pushBack format["%1rhs_gaz66_r142_vdv", _sid];
		_c pushBack format["%1rhs_zil131_flatbed_cover_vdv", _sid];
		//_u pushBack "rhs_gaz66_ammo_vdv";				//Ammotruck
		//_u pushBack "rhs_gaz66_repair_vdv";			//Repairtruck
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1RHS_Ural_VDV_01", _sid];
		_c pushBack format["%1RHS_Ural_Flat_VDV_01", _sid];
		_c pushBack format["%1RHS_Ural_Open_VDV_01", _sid];
		_c pushBack format["%1RHS_Ural_Open_Flat_VDV_01", _sid];
		_c pushBack format["%1RHS_Ural_Zu23_VDV_01", _sid];			//Flak
		_c pushBack format["%1RHS_BM21_VDV_01", _sid];				//Artytruck
		_c pushBack format["%1rhs_btr60_vdv", _sid];
		//_u pushBack "RHS_Ural_Fuel_VDV_01";			//Fueltruck
		//_u pushBack "RHS_Ural_Repair_VDV_01";			//Repairtruck
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1rhs_kamaz5350_vdv", _sid];
		_c pushBack format["%1rhs_kamaz5350_flatbed_cover_vdv", _sid];
		_c pushBack format["%1rhs_kamaz5350_open_vdv", _sid];
		_c pushBack format["%1rhs_kamaz5350_flatbed_vdv", _sid];
		_c pushBack format["%1rhs_btr70_vdv", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
		_c pushBack format["%1rhs_9k79", _sid];
		_c pushBack format["%1rhs_9k79_K", _sid];
		_c pushBack format["%1rhs_9k79_B", _sid];
		_c pushBack format["%1rhs_btr80_vdv", _sid];
		_c pushBack format["%1rhs_btr80a_vdv", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 5) then {
		_c pushBack format["%1rhs_tigr_vdv", _sid];
		_c pushBack format["%1rhs_tigr_3camo_vdv", _sid];
		_c pushBack format["%1rhs_tigr_sts_vdv", _sid];
		_c pushBack format["%1rhs_tigr_sts_3camo_vdv", _sid];
		_c pushBack format["%1rhs_tigr_m_vdv", _sid];
		_c pushBack format["%1rhs_tigr_m_3camo_vdv", _sid];
		_c pushBack format["%1rhs_typhoon_vdv", _sid];
	};	
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_RHS_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1rhs_bmp2e_vdv", _sid];//2cm + Metris(ATGM) outside
		_c pushBack format["%1rhs_bmp2_vdv", _sid];//2cm + Metris(ATGM) outside
		_c pushBack format["%1rhs_bmp2d_vdv", _sid];//2cm + Metris(ATGM) outside
		_c pushBack format["%1rhs_bmp2k_vdv", _sid];//2cm + Metris(ATGM) outside
		_c pushBack format["%1rhs_prp3_vdv", _sid];//MG		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1rhs_bmp1p_vdv", _sid];//MG + Cannon + Metris(ATGM) outside
		_c pushBack format["%1rhs_bmp1_vdv", _sid];//MG + Cannon + ATGM
		_c pushBack format["%1rhs_bmp1d_vdv", _sid];//MG + Cannon + ATGM
		_c pushBack format["%1rhs_bmp1k_vdv", _sid];//MG + Cannon + ATGM
		_c pushBack format["%1rhs_brm1k_vdv", _sid];//MG + Cannon
		_c pushBack format["%1rhs_zsu234_aa", _sid];//4x 2cm AA		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%1rhs_sprut_vdv", _sid];
		_c pushBack format["%1rhs_2s1_tv", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1rhs_t72ba_tv", _sid];
		_c pushBack format["%1rhs_t72bb_tv", _sid];
		_c pushBack format["%1rhs_t72bc_tv", _sid];
		_c pushBack format["%1rhs_bmd1", _sid];
		_c pushBack format["%1rhs_bmd1k", _sid];
		_c pushBack format["%1rhs_bmd1pk", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		_c pushBack format["%1rhs_t80", _sid];
		_c pushBack format["%1rhs_t80b", _sid];
		_c pushBack format["%1rhs_t80bk", _sid];
		_c pushBack format["%1rhs_bmd1p", _sid];
		_c pushBack format["%1rhs_bmd1r", _sid];
		_c pushBack format["%1rhs_bmd2", _sid];
		_c pushBack format["%1rhs_bmd2k", _sid];
		_c pushBack format["%1rhs_bmd2m", _sid];
		_c pushBack format["%1rhs_2s3_tv", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		_c pushBack format["%1rhs_bmd4_vdv", _sid];
		_c pushBack format["%1rhs_bmd4m_vdv", _sid];
		_c pushBack format["%1rhs_bmd4ma_vdv", _sid];
		_c pushBack format["%1rhs_t72bd_tv", _sid];
		_c pushBack format["%1rhs_t72be_tv", _sid];
		_c pushBack format["%1rhs_t80a", _sid];
		_c pushBack format["%1rhs_t80bv", _sid];
		_c pushBack format["%1rhs_t80bvk", _sid];
		_c pushBack format["%1rhs_t80u", _sid];
		_c pushBack format["%1rhs_t80u45m", _sid];
		_c pushBack format["%1rhs_t80ue1", _sid];
		_c pushBack format["%1rhs_t80uk", _sid];
		_c pushBack format["%1rhs_t80um", _sid];
		_c pushBack format["%1rhs_t90_tv", _sid];
		_c pushBack format["%1rhs_t90a_tv", _sid];
		_c pushBack format["%1rhs_t90am_tv", _sid];
		_c pushBack format["%1rhs_t90saa_tv", _sid];
		_c pushBack format["%1rhs_t90sab_tv", _sid];
		_c pushBack format["%1rhs_t90sm_tv", _sid];
		//_c pushBack format["%1rhs_t14_tv", _sid];		//activate or not?
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
//Level 0
if(CTI_RHS_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1RHS_Mi8AMT_vdv", _sid];//Medic
		_c pushBack format["%1RHS_Mi8mt_vdv", _sid];
		_c pushBack format["%1RHS_Mi8mt_Cargo_vdv", _sid];
		_c pushBack format["%1RHS_Mi8T_vdv", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1RHS_Mi8MTV3_vdv", _sid];
		_c pushBack format["%1RHS_Mi8mtv3_Cargo_vdv", _sid];
		_c pushBack format["%1RHS_Mi8MTV3_heavy_vdv", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1RHS_Mi24P_vdv", _sid];
		_c pushBack format["%1RHS_Mi24V_vdv", _sid];
		_c pushBack format["%1rhs_mi28n_vvsc", _sid];
		_c pushBack format["%1rhs_mi28n_vvs", _sid];
		_c pushBack format["%1RHS_Su25SM_vvsc", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1rhs_ka60_c", _sid];
	};

	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1RHS_Ka52_vvsc", _sid];
		_c pushBack format["%1rhs_mig29s_vvsc", _sid];
		_c pushBack format["%1rhs_mig29sm_vvsc", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_RHS_ADDON > 0) then {
	_c pushBack format["%1rhs_gaz66_repair_vdv", _sid];//Repairtruck
	_c pushBack format["%1RHS_Ural_Repair_VDV_01", _sid];//Repairtruck
	if(CTI_MAIN_ADDON == 1 && CTI_CUP_ADDON == 0) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_RHS_ADDON > 0) then {
	_c pushBack format["%1rhs_gaz66_ammo_vdv", _sid];					//Ammotruck
	_c pushBack format["%1RHS_Ural_Fuel_VDV_01", _sid];					//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
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
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				_c pushBack format["%1rhs_vdv_des_rifleman", _sid];
				_c pushBack format["%1rhs_vdv_des_medic", _sid];
			};
			_c pushBack format["%1rhs_vdv_rifleman", _sid];
			_c pushBack format["%1rhs_vdv_medic", _sid];
		};
	};
};
if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1rhs_uaz_vdv", _sid];	
		_c pushBack format["%1rhs_uaz_open_vdv", _sid];
	};	
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_MAIN_ADDON == 0) then {
			_c pushBack format["%1rhs_gaz66_repair_vdv", _sid];							//repairtruck
			_c pushBack format["%1rhs_gaz66_ammo_vdv", _sid];							//ammotruck
			_c pushBack format["%1RHS_Ural_Fuel_VDV_01", _sid];							//fueltruck
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_u pushBack format["%1O_Boat_Transport_01_F", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
