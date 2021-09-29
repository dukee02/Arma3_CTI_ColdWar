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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
//if ((isNil "_priorUnits" || _ai == 5) && CTI_CUP_ADDON > 0) then { 
if ((CTI_MAIN_ADDON != 0  || _ai == 5) && CTI_CUP_ADDON > 0) then { 
	
	//if(CTI_MAIN_ADDON > 0) then {
		missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_VDV", _sid]];
		missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Light_VDV_EMR", _sid]];

		missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Crew_VDV_EMR", _sid]];
		missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_VDV_EMR", _sid]];
		missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Crew_VDV_EMR", _sid]];
		missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_O_RU_Pilot_VDV_EMR", _sid]];
		missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_AR_VDV_EMR", _sid]];

		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1CUP_O_UAZ_Unarmed_RU", _sid], []], 
			[format["%1CUP_O_UAZ_Open_RU", _sid], []]
		]];
	//};
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	//VDV_EMR = green camo - VDV = brown camo
	//Level start (Level 3 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0+_adds) then {
		_c pushBack format["%1CUP_O_RU_Soldier_AR_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Light_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Crew_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Explosive_Specialist_VDV_EMR", _sid];

		_c pushBack format["%1CUP_O_RU_Soldier_AR_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Light_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Crew_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Explosive_Specialist_VDV", _sid];
	};
	
	//Level 1 (Level 4 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 1+_adds) then {
		_c pushBack format["%1CUP_O_RU_Soldier_AA_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Engineer_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Medic_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Spotter_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Officer_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Pilot_VDV_EMR", _sid];	

		_c pushBack format["%1CUP_O_RU_Soldier_AA_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Engineer_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Medic_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Spotter_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Officer_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Pilot_VDV", _sid];
	};
	
	//Level 2 (Level 5 with CW)
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 2+_adds) then {
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_VDV_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_VDV_EMR", _sid];

		_c pushBack format["%1CUP_O_RU_Soldier_HAT_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_VDV", _sid];
		_c pushBack format["%1CUP_O_RU_Commander_VDV", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
		_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1CUP_O_UAZ_SPG9_RU", _sid];			//SPG (AT)
		_c pushBack format["%1CUP_O_UAZ_AGS30_RU", _sid];			//GMG
		_c pushBack format["%1CUP_O_UAZ_MG_RU", _sid];				//MG
		_c pushBack format["%1CUP_O_UAZ_METIS_RU", _sid];			//Metris (ATGM)
		
		_c pushBack format["%1CUP_O_BRDM2_RUS", _sid];				//MG + 2cm
		_c pushBack format["%1CUP_O_BRDM2_ATGM_RUS", _sid];			//4x ATGM
		_c pushBack format["%1CUP_O_BRDM2_HQ_RUS", _sid];			//MG		
		_c pushBack format["%1CUP_O_UAZ_AMB_RU", _sid];				//Medic
	};
	if(CTI_RHS_ADDON > 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
		_c pushBack format["%1CUP_O_Ural_Open_RU", _sid];
		_c pushBack format["%1CUP_O_Ural_ZU23_RU", _sid];			//Flak
		_c pushBack format["%1CUP_O_Ural_RU", _sid];
		_c pushBack format["%1CUP_O_Ural_Empty_RU", _sid];
		//_u pushBack "CUP_O_Ural_Reammo_RU";			//Ammotruck
		//_u pushBack "CUP_O_Ural_Refuel_RU";			//Fueltruck
		//_u pushBack "CUP_O_Ural_Repair_RU";			//Repairtruck
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CUP_O_BTR60_Winter_RU", _sid];	//2cm + MG	
		};
		_c pushBack format["%1CUP_O_BTR60_RU", _sid];				//2cm + MG
		_c pushBack format["%1CUP_O_BTR60_Green_RU", _sid];			//2cm + MG
		_c pushBack format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid];		//MG front + rear
		_c pushBack format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid];		//GMG + rear MG
		_c pushBack format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid];		//3cm Cannon
		_c pushBack format["%1CUP_O_GAZ_Vodnik_MedEvac_RU", _sid];	//Medic
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
		_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
		_c pushBack format["%1CUP_O_BM21_RU", _sid];				//Artytruck
		//_u pushBack "CUP_O_Kamaz_Reammo_RU";			//Ammotruck
		//_u pushBack "CUP_O_Kamaz_Refuel_RU";			//Fueltruck
		//_u pushBack "CUP_O_Kamaz_Repair_RU";			//Repairtruck
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4+_adds) then {
		_c pushBack format["%1CUP_O_BTR90_RU", _sid];
		_c pushBack format["%1CUP_O_BTR90_HQ_RU", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		_c pushBack format["%1CUP_O_BMP2_RU", _sid];			//2cm + Metris(ATGM)
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		_c pushBack format["%1CUP_O_BMP2_AMB_RU", _sid];		//Medic
		_c pushBack format["%1CUP_O_BMP_HQ_RU", _sid];			//Cannon		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CUP_O_MTLB_pk_WDL_RU", _sid];
		};
		_c pushBack format["%1CUP_O_MTLB_pk_Green_RU", _sid];
		_c pushBack format["%1CUP_O_MTLB_pk_Winter_RU", _sid];
		_c pushBack format["%1CUP_O_BMP3_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		_c pushBack format["%1CUP_O_T72_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		_c pushBack format["%1CUP_O_2S6_RU", _sid];
		_c pushBack format["%1CUP_O_2S6M_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		_c pushBack format["%1CUP_O_T90_RU", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
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
		_c pushBack format["%1CUP_O_Mi8_VIV_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		_c pushBack format["%1CUP_O_Mi8_RU", _sid];
		_c pushBack format["%1CUP_O_Mi8_medevac_RU", _sid];//Medic
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		_c pushBack format["%1CUP_O_Mi24_P_Dynamic_RU", _sid];
		_c pushBack format["%1CUP_O_Mi24_V_Dynamic_RU", _sid];
		_c pushBack format["%1CUP_O_Ka60_Grey_RU", _sid];
		_c pushBack format["%1CUP_O_Su25_Dyn_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_c pushBack format["%1CUP_O_Ka50_DL_RU", _sid];
		_c pushBack format["%1CUP_O_SU34_RU", _sid];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_c pushBack format["%1CUP_O_Ka52_RU", _sid];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//Repairtruck
	_c pushBack format["%1CUP_O_Kamaz_Repair_RU", _sid];			//Repairtruck
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//Ammotruck
	_c pushBack format["%1CUP_O_Kamaz_Reammo_RU", _sid];			//Ammotruck
	_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
	_c pushBack format["%1CUP_O_Kamaz_Refuel_RU", _sid];			//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if(CTI_MAIN_ADDON == 0) then {
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
			//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			//};
			//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//};
			_c pushBack format["%1CUP_O_RU_Soldier_VDV", _sid];
			_c pushBack format["%1CUP_O_RU_Medic_VDV_EMR", _sid];
		};
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];	
		_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
	};	
	if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
		if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
			_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//repairtruck
			_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//ammotruck
			_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];*/
