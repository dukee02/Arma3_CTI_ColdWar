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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if (isNil "_priorUnits" || _ai == 2) then { 
	
	if(CTI_MAIN_ADDON == 0) then {
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1gm_ge_army_militarypolice_p1_80_oli", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1gm_ge_army_crew_mp2a1_80_oli", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1gm_ge_army_crew_mp2a1_80_oli", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1gm_ge_army_crew_mp2a1_80_oli", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1gm_ge_army_iltis_cargo", _sid], []], 
			[format["%1gm_ge_army_iltis_cargo", _sid], []]
		]];
	} else {
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1BWA3_TL_Fleck", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1TBW_Feldjaeger", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1BWA3_Rifleman_lite_Fleck", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1BWA3_Rifleman_Fleck", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1BWA3_Crew_Fleck", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1BWA3_Helipilot", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1BWA3_Grenadier_Fleck", _sid]];
		
		//Set starting vehicles
		if(CTI_REDD_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1bw_unimog_cargo", _sid], []],
				[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid], []]
			]];
		} else {
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1bw_unimog_cargo", _sid], []],
				[format["%1bw_unimog_cargo", _sid], []]
			]];
		};	
	};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["%1gm_ge_army_militarypolice_p1_80_oli", _sid];
		_c pushBack format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_crew_mp2a1_80_oli", _sid];
		_c pushBack format["%1gm_ge_army_demolition_g3a4_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		_c pushBack format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_engineer_g3a4_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_medic_g3a3_80_ols", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		_c pushBack format["%1gm_ge_army_squadleader_g3a3_p2a1_80_ols", _sid];
		_c pushBack format["%1gm_ge_army_officer_p1_80_oli", _sid];
		_c pushBack format["%1gm_ge_army_antitank_g3a3_milan_80_ols", _sid];
	};
	_adds=3;
};

if(CTI_BW_ADDON > 0) then {
	//Level start (Level 3 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1PzBrig17_Crew_Snow", _sid];
			_c pushBack format["%1PzBrig17_Grenadier_Snow", _sid];
			_c pushBack format["%1PzBrig17_AutoriflemanMG3_Snow", _sid];
			_c pushBack format["%1PzBrig17_Rifleman_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanAT_CG_Snow", _sid];
			_c pushBack format["%1PzBrig17_lite_Snow", _sid];
			_c pushBack format["%1PzBrig17_unarmed_Snow", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_Rifleman_Tropen", _sid];	
			_c pushBack format["%1BWA3_MachineGunner_MG3_Tropen", _sid];
			_c pushBack format["%1BWA3_Grenadier_Tropen", _sid];
			_c pushBack format["%1BWA3_RiflemanAT_CG_Tropen", _sid];
			_c pushBack format["%1BWA3_Rifleman_lite_Tropen", _sid];
			_c pushBack format["%1BWA3_Rifleman_cnarmed_Tropen", _sid];
			_c pushBack format["%1BWA3_Crew_Tropen", _sid];
		};
		_c pushBack format["%1TBW_Feldjaeger", _sid];

		_c pushBack format["%1BWA3_Rifleman_cnarmed_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_lite_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_CG_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG3_Fleck", _sid];
		_c pushBack format["%1BWA3_Grenadier_Fleck", _sid];
		_c pushBack format["%1BWA3_Crew_Fleck", _sid];
	};
	//Level 1 (Level 4 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1PzBrig17_SL_Snow", _sid];
			_c pushBack format["%1PzBrig17_Tank_Commander_Snow", _sid];
			_c pushBack format["%1PzBrig17_Officer_Snow", _sid];
			_c pushBack format["%1PzBrig17_CombatLifeSaver_Snow", _sid];
			_c pushBack format["%1PzBrig17_Engineer_Snow", _sid];
			_c pushBack format["%1PzBrig17_GrenadierG27_Snow", _sid];
			_c pushBack format["%1PzBrig17_Autorifleman_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanAA_Fliegerfaust_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanAT_RGW90_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanG27_Snow", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_Officer_Tropen", _sid];
			_c pushBack format["%1BWA3_SL_Tropen", _sid];		
			_c pushBack format["%1BWA3_Medic_Tropen", _sid];
			_c pushBack format["%1BWA3_Engineer_Tropen", _sid];
			_c pushBack format["%1BWA3_Tank_Commander_Tropen", _sid];
			_c pushBack format["%1BWA3_Rifleman_G27_Tropen", _sid];
			_c pushBack format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid];
			_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Tropen", _sid];
			_c pushBack format["%1BWA3_Grenadier_G27_Tropen", _sid];
			_c pushBack format["%1BWA3_MachineGunner_MG4_Tropen", _sid];
		};
		_c pushBack format["%1bw_pilot", _sid];
		_c pushBack format["%1BWA3_Helipilot", _sid];

		_c pushBack format["%1BWA3_Officer_Fleck", _sid];
		_c pushBack format["%1BWA3_SL_Fleck", _sid];
		_c pushBack format["%1BWA3_Engineer_Fleck", _sid];
		_c pushBack format["%1BWA3_Medic_Fleck", _sid];
		_c pushBack format["%1BWA3_Tank_Commander_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG4_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G27_Fleck", _sid];
		_c pushBack format["%1BWA3_Grenadier_G27_Fleck", _sid];
	};
	//Level 2 (Level 5 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1PzBrig17_TL_Snow", _sid];
			_c pushBack format["%1PzBrig17_AutoriflemanMG5_Snow", _sid];
			_c pushBack format["%1PzBrig17_Marksman_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanAT_Pzf3_Snow", _sid];
			_c pushBack format["%1PzBrig17_RiflemanG28_Snow", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_TL_Tropen", _sid];		
			_c pushBack format["%1BWA3_MachineGunner_MG5_Tropen", _sid];
			_c pushBack format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid];
			_c pushBack format["%1BWA3_Marksman_Tropen", _sid];
			_c pushBack format["%1BWA3_Rifleman_G28_Tropen", _sid];
		};

		_c pushBack format["%1BWA3_TL_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG5_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Fleck", _sid];
		_c pushBack format["%1BWA3_Marksman_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G28_Fleck", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_adds = 0;
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1gm_ge_army_bicycle_01_oli", _sid];
		_c pushBack format["%1gm_ge_army_k125", _sid];
		_c pushBack format["%1gm_ge_army_iltis_cargo", _sid];
		_c pushBack format["%1gm_ge_army_c1300l_container", _sid];
		_c pushBack format["%1gm_ge_army_c1300l_cargo", _sid];
		
		//_c pushBack "gm_ge_army_c1300l_repair";		//repairtruck	
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1gm_ge_army_iltis_mg3", _sid];
		_c pushBack format["%1gm_ge_army_iltis_milan", _sid];
		_c pushBack format["%1gm_ge_army_c1300l_medic", _sid];			//medic
		_c pushBack format["%1gm_ge_army_kat1_451_container", _sid];
		_c pushBack format["%1gm_ge_army_kat1_451_cargo", _sid];
		_c pushBack format["%1gm_ge_army_kat1_454_cargo", _sid];
		
		//_c pushBack "gm_ge_army_kat1_451_reammo";		//ammotruck
		//_c pushBack "gm_ge_army_kat1_451_refuel";		//fueltruck

		_c pushBack format["%1gm_ge_army_fuchsa0_command", _sid];
		_c pushBack format["%1gm_ge_army_fuchsa0_engineer", _sid];	
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1gm_ge_army_fuchsa0_reconnaissance", _sid];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1gm_ge_army_luchsa1", _sid];
		_c pushBack format["%1gm_ge_army_luchsa2", _sid];
	};
};

if(CTI_BW_ADDON > 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1bw_cnimog_cargo", _sid];
		_c pushBack format["%1bw_cnimog_cargo_covered", _sid];
	};
	
	if(CTI_MAIN_ADDON == 0) then { _adds = 2; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {
		_c pushBack format["%1TBW_Offroad_Feldjaeger", _sid];
		_c pushBack format["%1TBW_VAN_Feldjaeger", _sid];
	};
	
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+2; } else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {		//(2 || 4)
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_Eagle_Tropen", _sid];
			_c pushBack format["%1BWA3_Eagle_FLW100_Tropen", _sid];
		};
		_c pushBack format["%1BWA3_Eagle_Fleck", _sid];
		_c pushBack format["%1BWA3_Eagle_FLW100_Fleck", _sid];
	};
	
	_adds = _adds+1;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {		//(3 || 5)
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1KGB_B_MRAP_03_F_WIN", _sid];
			_c pushBack format["%1KGB_B_MRAP_03_gmg_F_WIN", _sid];
			_c pushBack format["%1KGB_B_MRAP_03_hmg_F_WIN", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1KGB_B_MRAP_03_F_DES", _sid];
			_c pushBack format["%1KGB_B_MRAP_03_gmg_F_DES", _sid];
			_c pushBack format["%1KGB_B_MRAP_03_hmg_F_DES", _sid];
		};
		_c pushBack format["%1KGB_B_MRAP_03_F", _sid];
		_c pushBack format["%1KGB_B_MRAP_03_gmg_F", _sid];
		_c pushBack format["%1KGB_B_MRAP_03_hmg_F", _sid];
	};

	if(CTI_MAIN_ADDON == 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+1; }; // else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {			//(1 || 2 mit redd 2 || 3)
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1BW_Dingo_GL_Win", _sid];
			_c pushBack format["%1BW_Dingo_Win", _sid];
			_c pushBack format["%1BW_LKW_Medic_Winter", _sid];				//medic	
			_c pushBack format["%1BW_LKW_Transport_offen_Winter", _sid];			
			_c pushBack format["%1BW_LKW_Transport_Winter", _sid];			
			_c pushBack format["%1BW_LKW_Geraet_Winter", _sid];	
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BW_Dingo_GL_Des", _sid];
			_c pushBack format["%1BW_Dingo_Des", _sid];
			_c pushBack format["%1BW_LKW_Medic_Tropen", _sid];				//medic	
			_c pushBack format["%1BW_LKW_Transport_offen_Tropen", _sid];
			_c pushBack format["%1BW_LKW_Transport_Tropen", _sid];				
			_c pushBack format["%1BW_LKW_Geraet_Tropen", _sid];	
		};
		_c pushBack format["%1BW_Dingo_GL_Wdl", _sid];
		_c pushBack format["%1BW_Dingo_Wdl", _sid];
		
		_c pushBack format["%1BW_LKW_Medic_Fleck", _sid];				//medic	
		_c pushBack format["%1BW_LKW_Transport_offen_fleck", _sid];
				
		_c pushBack format["%1BW_LKW_Transport_Fleck", _sid];			
		_c pushBack format["%1BW_LKW_Geraet_Fleck", _sid];				
		//_c pushBack "BW_LKW_Reparatur_Fleck";				//repairtruck
		//_c pushBack "BW_LKW_Reparatur_Winter";			//repairtruck
		//_c pushBack "BW_LKW_Reparatur_Tropen";			//repairtruck
		//_c pushBack "BW_LKW_Munition_Fleck";				//ammotruck
		//_c pushBack "BW_LKW_Munition_Winter";				//ammotruck
		//_c pushBack "BW_LKW_Munition_Tropen";				//ammotruck
		//_c pushBack "BW_LKW_Treibstoff_Fleck";			//fueltruck
		//_c pushBack "BW_LKW_Treibstoff_Winter";			//fueltruck
		//_c pushBack "BW_LKW_Treibstoff_Tropen";			//fueltruck
	};
};

if(CTI_CUP_ADDON == 1) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+1; }; // else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CUP_B_Dingo_GL_GER_Des", _sid];
			_c pushBack format["%1CUP_B_Dingo_GER_Des", _sid];
		};
		_c pushBack format["%1CUP_B_Dingo_GL_GER_Wdl", _sid];
		_c pushBack format["%1CUP_B_Dingo_GER_Wdl", _sid];
	};
};

if(CTI_REDD_ADDON == 1) then {

	if(CTI_MAIN_ADDON == 0) then { _adds = 2; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_San", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FJg", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_San", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FJg", _sid];
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid];
		};
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_San", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid];
		_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid];
	};
	
	if(CTI_MAIN_ADDON == 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_winter", _sid];
			_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_winter", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_trope", _sid];
			_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_trope", _sid];
		};
		_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_transport_fleck", _sid];
		_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_transport_fleck", _sid];
		
		//_c pushBack "rnt_lkw_10t_mil_gl_kat_i_repair_trope";		//repairtruck	
		//_c pushBack "rnt_lkw_10t_mil_gl_kat_i_repair_winter";		//repairtruck	
		//_c pushBack "rnt_lkw_10t_mil_gl_kat_i_repair_fleck";		//repairtruck	
		//_c pushBack "rnt_lkw_5t_mil_gl_kat_i_fuel_trope";			//fueltruck
		//_c pushBack "rnt_lkw_5t_mil_gl_kat_i_fuel_winter";		//fueltruck
		//_c pushBack "rnt_lkw_5t_mil_gl_kat_i_fuel_fleck";			//fueltruck
		//_c pushBack "rnt_lkw_7t_mil_gl_kat_i_mun_trope";			//ammotruck
		//_c pushBack "rnt_lkw_7t_mil_gl_kat_i_mun_winter";			//ammotruck
		//_c pushBack "rnt_lkw_7t_mil_gl_kat_i_mun_fleck";			//ammotruck
	};

	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid];
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid];
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid];
		};
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid];
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid];	
	};
	
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid];
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid];
			_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Tropentarn", _sid];
		};
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid];
		_c pushBack format["%1Redd_Tank_Fuchs_1A4_San_Flecktarn", _sid];	
	};
	
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1rnt_sppz_2a2_luchs_wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1rnt_sppz_2a2_luchs_tropentarn", _sid];
		};
		_c pushBack format["%1rnt_sppz_2a2_luchs_flecktarn", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Start
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1gm_ge_army_m113a1g_apc", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_command", _sid];
		_c pushBack format["%1gm_ge_army_m113a1g_medic", _sid];				//medic
		_c pushBack format["%1gm_ge_army_m113a1g_apc_milan", _sid];
		//_c pushBack format["%1gm_ge_army_bpz2a0", _sid];					//repair
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1gm_ge_army_gepard1a1", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a1", _sid];	
		_c pushBack format["%1gm_ge_army_Leopard1a1a1", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a1a2", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%1gm_ge_army_Leopard1a3", _sid];
		_c pushBack format["%1gm_ge_army_Leopard1a3a1", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1gm_ge_army_Leopard1a5", _sid];
	};
};

if(CTI_REDD_ADDON == 1) then {

	if(CTI_MAIN_ADDON == 0) then { _adds=1; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid];
		};
		_c pushBack format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid];		
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Marder_1A5_Wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Marder_1A5_Tropentarn", _sid];
		};
		_c pushBack format["%1Redd_Marder_1A5_Flecktarn", _sid];	
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2+_adds) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid];
			_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid];
			_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid];
		};
		_c pushBack format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid];
		_c pushBack format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid];
	};
};

if(CTI_BW_ADDON > 0) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 4; } else { _adds = 0; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_Puma_Tropen", _sid];
		};
		_c pushBack format["%1BWA3_Puma_Fleck", _sid];
	};
	
	if(CTI_MAIN_ADDON == 0) then { _adds = 5; } else { _adds = 1; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1BWA3_Leopard2_Tropen", _sid];
		};
		_c pushBack format["%1BWA3_Leopard2_Fleck", _sid];
	};
};

if(CTI_CUP_ADDON > 0) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 5; } else { _adds = 1; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		_c pushBack format["%1CUP_B_Leopard2A6_GER", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
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

if(CTI_BW_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1bw_bo105_p1m", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1bw_bo105_pah1", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1bw_nh90_marine", _sid];
		_c pushBack format["%1bw_nh90_armed", _sid];
		_c pushBack format["%1bw_nh90", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1bw_ec135_transport", _sid];
		_c pushBack format["%1bw_ec135_fz_raketen", _sid];
		_c pushBack format["%1bw_ec135_pars", _sid];
		_c pushBack format["%1kyo_MH47E_base", _sid];
		_c pushBack format["%1kyo_MH47E_Ramp", _sid];
		_c pushBack format["%1kyo_MH47E_HC", _sid];
		_c pushBack format["%1BWA3_Tiger_Gunpod_FZ", _sid];
		_c pushBack format["%1BWA3_Tiger_Gunpod_Heavy", _sid];
		_c pushBack format["%1BWA3_Tiger_Gunpod_PARS", _sid];
	};

	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1BWA3_Tiger_RMK_Heavy", _sid];
		_c pushBack format["%1BWA3_Tiger_RMK_PARS", _sid];
		_c pushBack format["%1BWA3_Tiger_RMK_universal", _sid];
	};
};

if(CTI_CUP_ADDON > 0) then {

	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1CUP_B_UH1D_GER_KSK", _sid];
		_c pushBack format["%1CUP_B_UH1D_GER_KSK_Des", _sid];
		_c pushBack format["%1CUP_B_UH1D_slick_GER_KSK", _sid];
		_c pushBack format["%1CUP_B_UH1D_slick_GER_KSK_Des", _sid];
	};
	
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1CUP_B_UH1D_armed_GER_KSK", _sid];
		_c pushBack format["%1CUP_B_UH1D_gunship_GER_KSK", _sid];
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CUP_B_UH1D_armed_GER_KSK_Des", _sid];
			_c pushBack format["%1CUP_B_UH1D_gunship_GER_KSK_Des", _sid];	
		};
	};
	
	if(CTI_BW_ADDON == 1) then { _adds = 4; } else { _adds = 2; };
	if(CTI_ECONOMY_LEVEL_AIR >= 0+_adds) then {
		_c pushBack format["%1CUP_B_CH53E_GER", _sid];
		_c pushBack format["%1CUP_B_CH53E_VIV_GER", _sid];
	};
};

if(CTI_LEN_ADDON > 0) then {

	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1len_uh1d_bw", _sid];
	};
};

if(CTI_EF_TORNADO_ADDON == 1) then {

	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1Tornado_AWS_GER", _sid];	
	};
	
	//if(CTI_BW_ADDON == 1) then { _adds = 4; } else { _adds = 3; };
	//if(CTI_ECONOMY_LEVEL_AIR >= 0+_adds) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1EAWS_EF2000_GER_CAP", _sid];	
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_ge_army_u1300l_repair", _sid];
	_c pushBack format["%1gm_ge_army_bpz2a0", _sid];					//repair
	_c pushBack format["CTI_Salvager_%1", _side];
};
if(CTI_BW_ADDON == 1 && CTI_REDD_ADDON == 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1BW_LKW_Reparatur_Winter", _sid];						//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active	
		_c pushBack format["%1BW_LKW_Reparatur_Tropen", _sid];						//repairtruck
	};
	_c pushBack format["%1BW_LKW_Reparatur_Fleck", _sid];							//repairtruck
	if(CTI_MAIN_ADDON == 1) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
if(CTI_REDD_ADDON == 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_winter", _sid];		//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_trope", _sid];		//repairtruck
	};		
	_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_fleck", _sid];			//repairtruck
	if(CTI_MAIN_ADDON == 1) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
};
if(CTI_BW_ADDON == 1 && CTI_REDD_ADDON == 0) then {
	_c pushBack format["%1BW_LKW_Munition_Tropen", _sid];			//ammotruck
	_c pushBack format["%1BW_LKW_Treibstoff_Tropen", _sid];			//fueltruck		
	_c pushBack format["%1BW_LKW_Munition_Winter", _sid];			//ammotruck
	_c pushBack format["%1BW_LKW_Treibstoff_Winter", _sid];			//fueltruck
	_c pushBack format["%1BW_LKW_Munition_Fleck", _sid];			//ammotruck
	_c pushBack format["%1BW_LKW_Treibstoff_Fleck", _sid];			//fueltruck
};
if(CTI_REDD_ADDON > 0) then {
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_trope", _sid];			//fueltruck
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_winter", _sid];			//fueltruck
	_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_fleck", _sid];			//fueltruck
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_trope", _sid];			//ammotruck
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_winter", _sid];			//ammotruck
	_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_fleck", _sid];			//ammotruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
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
			_c pushBack format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid];
			_c pushBack format["%1gm_ge_army_medic_g3a3_80_ols", _sid];
		};
	};
	if(CTI_BW_ADDON > 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				_c pushBack format["%1PzBrig17_Rifleman_Snow", _sid];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				_c pushBack format["%1BWA3_Rifleman_Tropen", _sid];
				_c pushBack format["%1BWA3_Medic_Tropen", _sid];
			};
			_c pushBack format["%1BWA3_Rifleman_Fleck", _sid];
			_c pushBack format["%1BWA3_Medic_Fleck", _sid];
		};
	};
	
};
if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1gm_ge_army_bicycle_01_oli", _sid];	
		_c pushBack format["%1gm_ge_army_k125", _sid];	
		_c pushBack format["%1gm_ge_army_iltis_cargo", _sid];
	};	
} else {
	if(CTI_BW_ADDON > 0 && CTI_REDD_ADDON == 0) then {
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
			_c pushBack format["%1bw_unimog_cargo", _sid];	
			_c pushBack format["%1bw_unimog_cargo_covered", _sid];	
		};
	};
	if(CTI_REDD_ADDON == 1) then {
		
		if(CTI_MAIN_ADDON == 0) then { _adds = 2; } else { _adds = 0; };
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid];	
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid];	
			};
			_c pushBack format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid];	
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_MAIN_ADDON == 0) then {
			_c pushBack format["%1gm_ge_army_c1300l_repair", _sid];							//repairtruck
			_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];						//ammotruck
			_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];						//fueltruck
		} else {
			if(CTI_BW_ADDON > 0 && CTI_REDD_ADDON == 0) then {
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					_c pushBack format["%1BW_LKW_Reparatur_Winter", _sid];					//repairtruck
					_c pushBack format["%1BW_LKW_Munition_Winter", _sid];					//ammotruck
					_c pushBack format["%1BW_LKW_Treibstoff_Winter", _sid];					//fueltruck
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					_c pushBack format["%1BW_LKW_Reparatur_Tropen", _sid];					//repairtruck
					_c pushBack format["%1BW_LKW_Munition_Tropen", _sid];					//ammotruck
					_c pushBack format["%1BW_LKW_Treibstoff_Tropen", _sid];					//fueltruck
				};
				_c pushBack format["%1BW_LKW_Reparatur_Fleck", _sid];						//repairtruck	
				_c pushBack format["%1BW_LKW_Munition_Fleck", _sid];						//ammotruck
				_c pushBack format["%1BW_LKW_Treibstoff_Fleck", _sid];						//fueltruck
			};
			if(CTI_REDD_ADDON == 1) then {
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_winter", _sid];	//repairtruck
					_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_winter", _sid];		//ammotruck
					_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_winter", _sid];		//fueltruck
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_trope", _sid];	//repairtruck
					_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_trope", _sid];		//ammotruck
					_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_trope", _sid];		//fueltruck
				};
				_c pushBack format["%1rnt_lkw_10t_mil_gl_kat_i_repair_fleck", _sid];		//repairtruck
				_c pushBack format["%1rnt_lkw_7t_mil_gl_kat_i_mun_fleck", _sid];			//ammotruck
				_c pushBack format["%1rnt_lkw_5t_mil_gl_kat_i_fuel_fleck", _sid];			//fueltruck
			};
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1B_Boat_Transport_01_F", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];