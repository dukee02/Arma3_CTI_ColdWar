private ["_side", "_c", "_sid", "_setupBaseUnits", "_tech_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_UKRAIN_ID || CTI_WEST_TOWNS == CTI_UKRAIN_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_UKRAIN_ID || CTI_EAST_TOWNS == CTI_UKRAIN_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "";_tag = "GUER_";
	};
	default {_sid = "";};
};

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
//Check if the based units have to set.
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_UKRAIN_ID && (_isThisMain select 1) == CTI_CUP_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_UKRAIN_ID,(_isThisMain select 1),CTI_CUP_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_UKR_CUP.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman_AT", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman_AKM", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman_Ammo", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman_PSO", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_AAT", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_AAR", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_AMG", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Crewman", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Engineer", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Grenadier", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Grenatier_AKM", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Medic", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Sapper_2", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Sapper", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//main camo active
		_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman_AT", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman_1P90", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman_Ammo", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman_PSO", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_AAT", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_AAR", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_AMG", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Crewman", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Engineer", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Grenadier", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Medic", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Sapper", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_TDF_Soldier_Autorifleman", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Machinegunner", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_ATSpecialist", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Marksman", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman_SKS", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_SquadLeader", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//main camo active
		_c pushBack format["%1CUP_B_AFU_Soldier_Autorifleman", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Machinegunner", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ATSpecialist", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Marksman", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconTL", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_SquadLeader", _sid];
	};
	_c pushBack format["%1CUP_B_AFU_Soldier_HeliCrew", _sid];
	_c pushBack format["%1CUP_B_AFU_Soldier_HeliPilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_TDF_Soldier_MissileSoldier_AA", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Sniper_AM", _sid];
		_c pushBack format["%1CUP_B_TDF_Soldier_Spotter_MM14", _sid];
		_c pushBack format["%1CUP_B_TDF_Solider_TeamLeader", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//main camo active
		_c pushBack format["%1CUP_B_AFU_Soldier_MissileSoldier_AA", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ATSpecialist_METIS", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Sniper_AM", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_Spotter", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_TeamLeader", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconDemo", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconGL", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconMarksman", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconMedic", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconScout", _sid];
		_c pushBack format["%1CUP_B_AFU_Soldier_ReconScoutAT", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
	//};
	//if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	//};
	_c pushBack format["%1CUP_B_UAZ_Unarmed_AFU", _sid];
	_c pushBack format["%1CUP_B_UAZ_Open_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_UAZ_AGS30_AFU", _sid];
	_c pushBack format["%1CUP_B_UAZ_MG_AFU", _sid];
	_c pushBack format["%1CUP_B_Ural_AFU", _sid];
	_c pushBack format["%1CUP_B_Ural_Empty_AFU", _sid];
	_c pushBack format["%1CUP_B_Ural_Open_AFU", _sid];
	//_c pushBack format["%1CUP_B_Ural_Reammo_AFU", _sid];
	//_c pushBack format["%1CUP_B_Ural_Refuel_AFU", _sid];
	//_c pushBack format["%1CUP_B_Ural_Repair_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_UAZ_AMB_AFU", _sid];
	_c pushBack format["%1CUP_B_UAZ_SPG9_AFU", _sid];
	_c pushBack format["%1CUP_B_BRDM2_HQ_AFU", _sid];
	_c pushBack format["%1CUP_B_BRDM2_AFU", _sid];
	_c pushBack format["%1CUP_B_Ural_ZU23_AFU", _sid];
	_c pushBack format["%1CUP_B_BTR60_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1151_Unarmed_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1151_Unarmed_DF_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_233011_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_233014_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_M_233114_AFU", _sid];
	//other camo selectable?
	//_c pushBack format["%1CUP_B_Tigr_233011_GREEN_AFU", _sid];
	//_c pushBack format["%1CUP_B_Tigr_233014_GREEN_AFU", _sid];
	//_c pushBack format["%1CUP_B_Tigr_M_233114_GREEN_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_UAZ_METIS_AFU", _sid];
	_c pushBack format["%1CUP_B_BM21_AFU", _sid];
	_c pushBack format["%1CUP_B_BRDM2_ATGM_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_233014_PK_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_M_233114_KORD_AFU", _sid];
	_c pushBack format["%1CUP_B_Tigr_M_233114_PK_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1151_ogpk_m2_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1151_ogpk_m240_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1151_ogpk_mk19_AFU", _sid];
	//other camo selectable?
	//_c pushBack format["%1CUP_B_Tigr_233014_PK_GREEN_AFU", _sid];
	//_c pushBack format["%1CUP_B_Tigr_M_233114_KORD_GREEN_AFU", _sid];
	//_c pushBack format["%1CUP_B_Tigr_M_233114_PK_GREEN_AFU", _sid];
	//_c pushBack format["%1CUP_B_nM1151_ogpk_m2_DF_AFU", _sid];
	//_c pushBack format["%1CUP_B_nM1151_ogpk_m240_DF_AFU", _sid];
	//_c pushBack format["%1CUP_B_nM1151_ogpk_mk19_DF_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_UAZ_AA_AFU", _sid];
	_c pushBack format["%1CUP_B_nM1097_AVENGER_AFU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_c pushBack format["%1CUP_B_MTLB_pk_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	//_c pushBack format["%1CUP_B_Leopard_1A3GRNCROSS_UA", _sid];
	_c pushBack format["%1CUP_B_Leopard_1A3GRN_UA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_c pushBack format["%1CUP_B_M1A1_AFU", _sid];
	_c pushBack format["%1CUP_B_M2Bradley_AFU", _sid];
	_c pushBack format["%1CUP_B_M6LineBacker_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_c pushBack format["%1CUP_B_M2A3Bradley_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_c pushBack format["%1CUP_B_Leopard2A6Green_UA", _sid];
	//_c pushBack format["%1CUP_B_Leopard2A6_UA", _sid];
	_c pushBack format["%1CUP_B_M1A1_TUSK_AFU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_c pushBack format["%1CUP_B_Mi17_AFU", _sid];
	_c pushBack format["%1CUP_B_Mi17_VIV_AFU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_c pushBack format["%1CUP_B_Mi171Sh_AFU", _sid];
	_c pushBack format["%1CUP_B_Mi17_medevac_AFU", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_c pushBack format["%1CUP_B_Mi24_D_Dynamic_AFU", _sid];
	_c pushBack format["%1CUP_B_Mi24_D_MEV_Dynamic_AFU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_Ural_Repair_AFU", _sid];				//Repairtruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_c pushBack format["%1CUP_B_Ural_Reammo_AFU", _sid];			//Ammotruck
	_c pushBack format["%1CUP_B_Ural_Refuel_AFU", _sid];		//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 2: {//desert camo active
				_c pushBack format["%1CUP_B_TDF_Soldier_Rifleman", _sid];
				_c pushBack format["%1CUP_B_TDF_Soldier_Medic", _sid];
			};
			default {//main camo active
				_c pushBack format["%1CUP_B_AFU_Soldier_Rifleman", _sid];
				_c pushBack format["%1CUP_B_AFU_Soldier_Medic", _sid];
			};	
		};
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1CUP_B_UAZ_Unarmed_AFU", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_B_Ural_Repair_AFU", _sid];			//Repairtruck
		_c pushBack format["%1CUP_B_Ural_Reammo_AFU", _sid];			//Ammotruck
		_c pushBack format["%1CUP_B_Ural_Refuel_AFU", _sid];			//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UKRAIN_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1", _sid];
};
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1", _sid];
};
*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UKR_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
