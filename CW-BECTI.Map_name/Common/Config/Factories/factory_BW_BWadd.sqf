private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_BW_ID || CTI_WEST_TOWNS == CTI_BW_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_BW_ID || CTI_EAST_TOWNS == CTI_BW_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_BWADD_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWadd.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_BW_ID,(_isThisMain select 1),CTI_BWADD_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_BWadd.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1PzBrig17_unarmed_Snow", _sid];
		_c pushBack format["%1PzBrig17_lite_Snow", _sid];
		_c pushBack format["%1PzBrig17_Rifleman_Snow", _sid];
		_c pushBack format["%1PzBrig17_CombatLifeSaver_Snow", _sid];
		_c pushBack format["%1PzBrig17_Crew_Snow", _sid];
		_c pushBack format["%1PzBrig17_Engineer_Snow", _sid];	
		_c pushBack format["%1PzBrig17_Grenadier_Snow", _sid];
		_c pushBack format["%1PzBrig17_AutoriflemanMG3_Snow", _sid];
		_c pushBack format["%1PzBrig17_RiflemanAT_CG_Snow", _sid];
		_c pushBack format["%1PzBrig17_recon_Pioneer_Snow", _sid];	
		_c pushBack format["%1PzBrig17_recon_Radioman_Snow", _sid];	
	};
	_c pushBack format["%1TBW_Feldjaeger", _sid];
	_c pushBack format["%1TBW_Marine_Besatzung_Helm", _sid];
	_c pushBack format["%1TBW_Marine_Besatzung", _sid];
	_c pushBack format["%1TBW_Marine_Besatzung_Hemd_blau", _sid];
	_c pushBack format["%1TBW_Marine_Besatzung_Hemd_tropen", _sid];
	_c pushBack format["%1TBW_Taucher_Fleck", _sid];
	_c pushBack format["%1TBW_Kampfschwimmer_Fleck", _sid];
	_c pushBack format["%1TBW_Kampfschwimmer_Multi", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1PzBrig17_RiflemanAT_RGW90_Snow", _sid];
		_c pushBack format["%1PzBrig17_Autorifleman_Snow", _sid];
		_c pushBack format["%1PzBrig17_recon_Medic_Snow", _sid];		
		_c pushBack format["%1PzBrig17_recon_LAT_Snow", _sid];		
		_c pushBack format["%1PzBrig17_recon_Snow", _sid];		
		_c pushBack format["%1PzBrig17_Marksman_Snow", _sid];
		_c pushBack format["%1PzBrig17_recon_Marksman_Snow", _sid];		
		_c pushBack format["%1PzBrig17_Tank_Commander_Snow", _sid];
		_c pushBack format["%1PzBrig17_SL_Snow", _sid];
	};
	_c pushBack format["%1bw_pilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1PzBrig17_GrenadierG27_Snow", _sid];
		_c pushBack format["%1PzBrig17_AutoriflemanMG5_Snow", _sid];
		_c pushBack format["%1PzBrig17_Officer_Snow", _sid];
		_c pushBack format["%1PzBrig17_RiflemanAA_Fliegerfaust_Snow", _sid];
		_c pushBack format["%1PzBrig17_RiflemanAT_Pzf3_Snow", _sid];
		_c pushBack format["%1PzBrig17_RiflemanG27_Snow", _sid];
		_c pushBack format["%1PzBrig17_RiflemanG28_Snow", _sid];
		_c pushBack format["%1PzBrig17_TL_Snow", _sid];
		_c pushBack format["%1PzBrig17_recon_TL_Snow", _sid];		
		_c pushBack format["%1PzBrig17_SniperG29_Snow", _sid];		
		_c pushBack format["%1PzBrig17_SniperG82_Snow", _sid];		
		_c pushBack format["%1PzBrig17_Spotter_Snow", _sid];	
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1bw_unimog_cargo", _sid];
	_c pushBack format["%1bw_unimog_cargo_covered", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Eagle_Tropen", _sid];
		_c pushBack format["%1BWA3_Eagle_FLW100_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1BWA3_Eagle_Fleck", _sid];	
		_c pushBack format["%1BWA3_Eagle_FLW100_Fleck", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1KGB_B_MRAP_03_gmg_F_WIN", _sid];
		_c pushBack format["%1KGB_B_MRAP_03_hmg_F_WIN", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1KGB_B_MRAP_03_gmg_F_DES", _sid];
		_c pushBack format["%1KGB_B_MRAP_03_hmg_F_DES", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1KGB_B_MRAP_03_gmg_F", _sid];	
		_c pushBack format["%1KGB_B_MRAP_03_hmg_F", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_trp", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1gm_ge_army_Leopard1a5", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];
*/
//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1bw_bo105_p1m", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1kyo_MH47E_Ramp", _sid];
	_c pushBack format["%1bw_ec135_transport", _sid];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1bw_bo105_pah1", _sid];
};*/
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1bw_ec135_pars", _sid];
	_c pushBack format["%1bw_nh90", _sid];
	_c pushBack format["%1bw_nh90_marine", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1bw_nh90_armed", _sid];
	_c pushBack format["%1bw_ec135_fz_raketen", _sid];
};
	
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
/*_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_win", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_des", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_trp", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair_wdl", _sid];			//repair
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_u1300l_repair", _sid];			//repair
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];
*/
//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_win", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_win", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_win", _sid];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_des", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_des", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_des", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_trp", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_trp", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_trp", _sid];
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo_wdl", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel_wdl", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo_wdl", _sid];
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
	_c pushBack format["%1gm_ge_army_kat1_451_reammo", _sid];
	_c pushBack format["%1gm_ge_army_kat1_451_refuel", _sid];
	_c pushBack format["%1gm_ge_army_kat1_454_reammo", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];
*/
//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1bw_unimog_cargo", _sid];
		_c pushBack format["%1bw_unimog_cargo_covered", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//desert camo active
				_c pushBack format["%1PzBrig17_Rifleman_Snow", _sid];
				_c pushBack format["%1PzBrig17_CombatLifeSaver_Snow", _sid];
			};
			default {//main camo active
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	//_c pushBack format["%", _sid];
};*/

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWADD.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
