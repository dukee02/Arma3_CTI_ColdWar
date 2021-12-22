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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
//if (isNil "_priorUnits" || _ai == 1) then { 
if (CTI_MAIN_ADDON == 0 || _ai == 1) then {
	
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid]];
	
	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid]];
	
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1gm_gc_army_p601", _sid], []], 
		[format["%1gm_gc_army_p601", _sid], []]
	]];
	
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_engineer_mpiaks74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid];
			_c pushBack format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win", _sid];
			_c pushBack format["%1gm_gc_army_radioman_mpiak74n_80_win", _sid];
		};
		_c pushBack format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid];
		_c pushBack format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_engineer_mpiaks74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid];
		_c pushBack format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str", _sid];
		_c pushBack format["%1gm_gc_army_radioman_mpiak74n_80_str", _sid];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid];
			_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_win", _sid];
			_c pushBack format["%1gm_gc_army_machinegunner_pk_80_win", _sid];
			_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_win", _sid];
			_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_paratrooper_mpiaks74n_80_win", _sid];
		};
		_c pushBack format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_pk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_paratrooper_mpiaks74n_80_str", _sid];
		_c pushBack format["%1gm_gc_airforce_pilot_pm_80_blu", _sid];
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_squadleader_mpiak74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_officer_pm_80_win", _sid];
			_c pushBack format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid];
			_c pushBack format["%1gm_gc_army_antiair_mpiak74n_9k32m_80_win", _sid];
			_c pushBack format["%1gm_gc_army_marksman_svd_80_win", _sid];
		};
		_c pushBack format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_officer_80_gry", _sid];
		_c pushBack format["%1gm_gc_army_antitank_mpiak74n_fagot_80_str", _sid];
		_c pushBack format["%1gm_gc_army_antiair_mpiak74n_9k32m_80_str", _sid];
		_c pushBack format["%1gm_gc_army_marksman_svd_80_str", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
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
		_c pushBack format["%1gm_gc_army_bicycle_01_oli", _sid];
		_c pushBack format["%1gm_gc_army_p601", _sid];
		
		//_c pushBack format["%1gm_gc_civ_p601", _sid];
		//_c pushBack format["%1gm_gc_dp_p601", _sid];
		//_c pushBack format["%1gm_gc_pol_p601", _sid];
		//_c pushBack format["%1gm_gc_ff_p601", _sid];
	};
	//Level 1 if RHS is not active, else Level 2
	if(CTI_RHS_ADDON > 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
		_c pushBack format["%1gm_gc_army_ural375d_medic", _sid];		//Medic
		_c pushBack format["%1gm_gc_army_ural375d_cargo", _sid];
		_c pushBack format["%1gm_gc_army_ural44202", _sid];
		_c pushBack format["%1gm_gc_army_ural4320_cargo", _sid];
		//_u pushBack "gm_gc_army_ural4320_reammo";		//Ammotruck
		//_u pushBack "gm_gc_army_ural375d_refuel";		//Fueltruck
		//_u pushBack "gm_gc_army_ural4320_repair";		//Repairtruck
	};	
	//Level 1
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1gm_gc_army_uaz469_cargo", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_dshkm", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_spg9", _sid];
		_c pushBack format["%1gm_gc_army_brdm2", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_brdm2um", _sid];//unarmed			
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		_c pushBack format["%1gm_gc_army_btr60pa", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pu12", _sid];//unarmed		
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1gm_gc_army_btr60pb", _sid];//MG + 2cm
		
		_c pushBack format["%1gm_gc_army_ural375d_mlrs", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	//Start
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1gm_gc_army_bmp1sp2", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1gm_gc_army_zsu234v1", _sid];
		_c pushBack format["%1gm_gc_army_pt76b", _sid];
		_c pushBack format["%1gm_gc_army_t55", _sid];
		
		_c pushBack format["%1gm_gc_army_2s1", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		_c pushBack format["%1gm_gc_army_t55a", _sid];
		_c pushBack format["%1gm_gc_army_t55ak", _sid];
		
		_c pushBack format["%1gm_gc_army_2p16", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1gm_gc_army_t55am2", _sid];
		_c pushBack format["%1gm_gc_army_t55am2b", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
//Level 0
if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1gm_gc_airforce_mi2p", _sid];
		_c pushBack format["%1gm_gc_airforce_mi2t", _sid];
		_c pushBack format["%1gm_gc_airforce_mi2sr", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1gm_gc_airforce_l410s_salon", _sid];
		_c pushBack format["%1gm_gc_airforce_l410t", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1gm_gc_airforce_mi2urn", _sid];
		_c pushBack format["%1gm_gc_airforce_mi2us", _sid];
	};
};
if(CTI_LEN_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
		_c pushBack format["%1len_mi8amt_nva", _sid];//Medic
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1len_l39_nva", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1len_mi24d_AT_nva", _sid];
		_c pushBack format["%1len_mi24p_AT_nva", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1len_mig29a_01_nva", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];

if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_gc_army_ural4320_repair", _sid];//Repairtruck
	_c pushBack format["CTI_Salvager_%1", _side];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	_c pushBack format["%1gm_gc_army_ural4320_reammo", _sid];//Ammotruck
	_c pushBack format["%1gm_gc_army_ural375d_refuel", _sid];//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if(CTI_MAIN_ADDON == 0) then {
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid];
				_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_win", _sid];
			};
			//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//};
			_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid];
			_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_str", _sid];
		};
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1gm_gc_army_bicycle_01_oli", _sid];	
		_c pushBack format["%1gm_gc_army_p601", _sid];
		
		_c pushBack format["%1gm_gc_civ_p601", _sid];
		_c pushBack format["%1gm_gc_dp_p601", _sid];
		_c pushBack format["%1gm_gc_pol_p601", _sid];
		_c pushBack format["%1gm_gc_ff_p601", _sid];
	};	
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
			_c pushBack format["%1gm_gc_army_ural4320_repair", _sid];				//repairtruck
			_c pushBack format["%1gm_gc_army_ural4320_reammo", _sid];				//ammotruck
			_c pushBack format["%1gm_gc_army_ural375d_refuel", _sid];	
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_c pushBack format["%1O_Boat_Transport_01_F", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
