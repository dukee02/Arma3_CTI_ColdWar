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
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_BWA3_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_BW_ID,(_isThisMain select 1),CTI_BWA3_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_BWA3.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_lite_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_Tropen", _sid];	
		_c pushBack format["%1BWA3_Medic_Tropen", _sid];
		_c pushBack format["%1BWA3_Crew_Tropen", _sid];
		_c pushBack format["%1BWA3_Engineer_Tropen", _sid];	
		_c pushBack format["%1BWA3_Grenadier_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG3_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_CG_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Pioneer_Tropen", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_lite_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_Fleck", _sid];
		_c pushBack format["%1BWA3_Crew_Fleck", _sid];
		_c pushBack format["%1BWA3_Medic_Fleck", _sid];
		_c pushBack format["%1BWA3_Engineer_Fleck", _sid];
		_c pushBack format["%1BWA3_Grenadier_Fleck", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG3_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_CG_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Pioneer_Fleck", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Fleck", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_Rifleman_unarmed_Multi", _sid];	
		_c pushBack format["%1BWA3_Rifleman_lite_Multi", _sid];
		_c pushBack format["%1BWA3_Rifleman_Multi", _sid];	
		_c pushBack format["%1BWA3_Medic_Multi", _sid];	
		_c pushBack format["%1BWA3_Crew_Multi", _sid];	
		_c pushBack format["%1BWA3_Engineer_Multi", _sid];	
		_c pushBack format["%1BWA3_Grenadier_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG3_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAT_CG_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Pioneer_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Radioman_Multi", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG4_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Medic_Tropen", _sid];		
		_c pushBack format["%1BWA3_recon_LAT_Tropen", _sid];		
		_c pushBack format["%1BWA3_recon_Tropen", _sid];		
		_c pushBack format["%1BWA3_Marksman_Tropen", _sid];
		_c pushBack format["%1BWA3_recon_Marksman_Tropen", _sid];		
		_c pushBack format["%1BWA3_Tank_Commander_Tropen", _sid];
		_c pushBack format["%1BWA3_SL_Tropen", _sid];		
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG4_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Medic_Fleck", _sid];		
		_c pushBack format["%1BWA3_recon_LAT_Fleck", _sid];		
		_c pushBack format["%1BWA3_recon_Fleck", _sid];		
		_c pushBack format["%1BWA3_Marksman_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_Marksman_Fleck", _sid];		
		_c pushBack format["%1BWA3_Tank_Commander_Fleck", _sid];
		_c pushBack format["%1BWA3_SL_Fleck", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_RiflemanAT_RGW90_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG4_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Medic_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_LAT_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Multi", _sid];	
		_c pushBack format["%1BWA3_Marksman_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_Marksman_Multi", _sid];	
		_c pushBack format["%1BWA3_Tank_Commander_Multi", _sid];	
		_c pushBack format["%1BWA3_SL_Multi", _sid];
	};
	_c pushBack format["%1BWA3_Helipilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Tropen", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG5_Tropen", _sid];
		_c pushBack format["%1BWA3_Officer_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Tropen", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_G27_Tropen", _sid];
		_c pushBack format["%1BWA3_Rifleman_G28_Tropen", _sid];
		_c pushBack format["%1BWA3_TL_Tropen", _sid];	
		_c pushBack format["%1BWA3_recon_TL_Tropen", _sid];	
		_c pushBack format["%1BWA3_Sniper_G29_Tropen", _sid];		
		_c pushBack format["%1BWA3_Sniper_G82_Tropen", _sid];		
		_c pushBack format["%1BWA3_Spotter_Tropen", _sid];					
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Fleck", _sid];
		_c pushBack format["%1BWA3_MachineGunner_MG5_Fleck", _sid];
		_c pushBack format["%1BWA3_Officer_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Fleck", _sid];
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G27_Fleck", _sid];
		_c pushBack format["%1BWA3_Rifleman_G28_Fleck", _sid];
		_c pushBack format["%1BWA3_TL_Fleck", _sid];
		_c pushBack format["%1BWA3_recon_TL_Fleck", _sid];		
		_c pushBack format["%1BWA3_Sniper_G29_Fleck", _sid];		
		_c pushBack format["%1BWA3_Sniper_G82_Fleck", _sid];		
		_c pushBack format["%1BWA3_Spotter_Fleck", _sid];		
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		_c pushBack format["%1BWA3_Grenadier_G27_Multi", _sid];	
		_c pushBack format["%1BWA3_MachineGunner_MG5_Multi", _sid];	
		_c pushBack format["%1BWA3_Officer_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAA_Fliegerfaust_Multi", _sid];	
		_c pushBack format["%1BWA3_RiflemanAT_PzF3_Multi", _sid];	
		_c pushBack format["%1BWA3_Rifleman_G27_Multi", _sid];
		_c pushBack format["%1BWA3_TL_Multi", _sid];	
		_c pushBack format["%1BWA3_recon_TL_Multi", _sid];	
		_c pushBack format["%1BWA3_Sniper_G29_Multi", _sid];	
		_c pushBack format["%1BWA3_Sniper_G82_Multi", _sid];	
		_c pushBack format["%1BWA3_Spotter_Multi", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid];	

		_c pushBack format["%1BWA3_Multi_Fleck", _sid];	
		_c pushBack format["%1BW_LKW_Transport_offen_Winter", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Winter", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Tropen", _sid];

		_c pushBack format["%1BWA3_Multi_Tropen", _sid];	
		_c pushBack format["%1BW_LKW_Transport_offen_Tropen", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Tropen", _sid];		
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid];

		_c pushBack format["%1BWA3_Multi_Fleck", _sid];	
		_c pushBack format["%1BW_LKW_Transport_offen_fleck", _sid];	
		_c pushBack format["%1BW_LKW_Transport_Fleck", _sid];	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid];	
		_c pushBack format["%1BW_LKW_Medic_Winter", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Tropen", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Tropen", _sid];	
		_c pushBack format["%1BW_LKW_Medic_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid];	
		_c pushBack format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid];	
		_c pushBack format["%1BW_LKW_Medic_Fleck", _sid];	
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Puma_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Puma_Fleck", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Panzerhaubitze2000_Tropen", _sid];
		_c pushBack format["%1BWA3_Skorpion_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Panzerhaubitze2000_Fleck", _sid];
		_c pushBack format["%1BWA3_Skorpion_Fleck", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BWA3_Leopard2_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1BWA3_Leopard2_Fleck", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//_c pushBack format["%1BWA3_Tiger_Gunpod_FZ", _sid];
	_c pushBack format["%1BWA3_Tiger_Gunpod_Heavy", _sid];
	//_c pushBack format["%1BWA3_Tiger_Gunpod_PARS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	//_c pushBack format["%1BWA3_Tiger_RMK_Heavy", _sid];
	_c pushBack format["%1BWA3_Tiger_RMK_PARS", _sid];
	//_c pushBack format["%1BWA3_Tiger_RMK_Universal", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
};
/*if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//_c pushBack format["%1BW_LKW_Geraet_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		//_c pushBack format["%1BW_LKW_Geraet_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		//_c pushBack format["%1BW_LKW_Geraet_Fleck", _sid];
	};
};*/

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BW_LKW_Reparatur_Winter", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active	
		_c pushBack format["%1BW_LKW_Reparatur_Tropen", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active	
		_c pushBack format["%1BW_LKW_Reparatur_Fleck", _sid];	
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1BW_LKW_Munition_Winter", _sid];
		_c pushBack format["%1BW_LKW_Treibstoff_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1BW_LKW_Munition_Tropen", _sid];
		_c pushBack format["%1BW_LKW_Treibstoff_Tropen", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		_c pushBack format["%1BW_LKW_Munition_Fleck", _sid];
		_c pushBack format["%1BW_LKW_Treibstoff_Fleck", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			_c pushBack format["%1BWA3_Multi_Fleck", _sid];
			_c pushBack format["%1BW_LKW_Transport_offen_Winter", _sid];
			_c pushBack format["%1BW_LKW_Transport_Winter", _sid];	
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1BWA3_Multi_Tropen", _sid];
			_c pushBack format["%1BW_LKW_Transport_offen_Tropen", _sid];
			_c pushBack format["%1BW_LKW_Transport_Tropen", _sid];	
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			_c pushBack format["%1BWA3_Multi_Fleck", _sid];
			_c pushBack format["%1BW_LKW_Transport_offen_fleck", _sid];
			_c pushBack format["%1BW_LKW_Transport_Fleck", _sid];
		};
	};
};

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			_c pushBack format["%1BW_LKW_Munition_Winter", _sid];
			_c pushBack format["%1BW_LKW_Treibstoff_Winter", _sid];
			_c pushBack format["%1BW_LKW_Reparatur_Winter", _sid];	
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1BW_LKW_Munition_Tropen", _sid];
			_c pushBack format["%1BW_LKW_Treibstoff_Tropen", _sid];
			_c pushBack format["%1BW_LKW_Reparatur_Tropen", _sid];	
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			_c pushBack format["%1BW_LKW_Munition_Fleck", _sid];
			_c pushBack format["%1BW_LKW_Treibstoff_Fleck", _sid];
			_c pushBack format["%1BW_LKW_Reparatur_Fleck", _sid];
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 2: {//desert camo active
				_c pushBack format["%1BWA3_Rifleman_Tropen", _sid];	
				_c pushBack format["%1BWA3_Medic_Tropen", _sid];
				_c pushBack format["%1BWA3_Crew_Tropen", _sid];
			};
			case 3: {//jungle camo active
				_c pushBack format["%1BWA3_Rifleman_Fleck", _sid];
				_c pushBack format["%1BWA3_Crew_Fleck", _sid];
				_c pushBack format["%1BWA3_Medic_Fleck", _sid];
			};
			default {//main camo active
				_c pushBack format["%1BWA3_Rifleman_Multi", _sid];	
				_c pushBack format["%1BWA3_Medic_Multi", _sid];	
				_c pushBack format["%1BWA3_Crew_Multi", _sid];	
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_BW_BWA3.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
