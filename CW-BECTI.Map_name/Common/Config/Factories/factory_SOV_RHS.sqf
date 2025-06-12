private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_SOV_ID || CTI_WEST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_SOV_ID || CTI_EAST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_RHS_ID) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_SOV_ID,(_isThisMain select 1),CTI_RHS_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV_RHS.sqf";
};
//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhs_vdv_des_crew", _sid];
		_c pushBack format["%1rhs_vdv_des_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_des_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_des_driver", _sid];
		_c pushBack format["%1rhs_vdv_des_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_des_engineer", _sid];
		_c pushBack format["%1rhs_vdv_des_medic", _sid];
		_c pushBack format["%1rhs_vdv_des_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_des_rifleman_asval", _sid];
		_c pushBack format["%1rhs_vdv_des_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_des_at", _sid];
		_c pushBack format["%1rhs_vdv_des_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_des_strelok_rpg_assist", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhs_vdv_crew", _sid];
		_c pushBack format["%1rhs_vdv_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_driver", _sid];
		_c pushBack format["%1rhs_vdv_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_engineer", _sid];
		_c pushBack format["%1rhs_vdv_medic", _sid];
		_c pushBack format["%1rhs_vdv_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_asval", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_at", _sid];
		_c pushBack format["%1rhs_vdv_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_strelok_rpg_assist", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhs_vdv_mflora_crew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_mflora_driver", _sid];
		_c pushBack format["%1rhs_vdv_mflora_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_mflora_engineer", _sid];
		_c pushBack format["%1rhs_vdv_mflora_medic", _sid];
		_c pushBack format["%1rhs_vdv_mflora_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_mflora_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_mflora_at", _sid];
		_c pushBack format["%1rhs_vdv_mflora_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_mflora_strelok_rpg_assist", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhs_vdv_flora_crew", _sid];
		_c pushBack format["%1rhs_vdv_flora_armoredcrew", _sid];
		_c pushBack format["%1rhs_vdv_flora_combatcrew", _sid];
		_c pushBack format["%1rhs_vdv_flora_driver", _sid];
		_c pushBack format["%1rhs_vdv_flora_driver_armored", _sid];
		_c pushBack format["%1rhs_vdv_flora_engineer", _sid];
		_c pushBack format["%1rhs_vdv_flora_medic", _sid];
		_c pushBack format["%1rhs_vdv_flora_rifleman", _sid];
		_c pushBack format["%1rhs_vdv_flora_rifleman_lite", _sid];
		_c pushBack format["%1rhs_vdv_flora_at", _sid];
		_c pushBack format["%1rhs_vdv_flora_grenadier_rpg", _sid];
		_c pushBack format["%1rhs_vdv_flora_strelok_rpg_assist", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhs_vdv_des_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_des_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_des_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_des_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_des_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_des_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_des_aa", _sid];
		_c pushBack format["%1rhs_vdv_des_arifleman", _sid];
		_c pushBack format["%1rhs_vdv_des_LAT", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhs_vdv_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_aa", _sid];
		_c pushBack format["%1rhs_vdv_arifleman", _sid];
		_c pushBack format["%1rhs_vdv_rifleman_alt", _sid];
		_c pushBack format["%1rhs_vdv_LAT", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhs_vdv_mflora_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_mflora_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_mflora_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_mflora_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_mflora_aa", _sid];
		_c pushBack format["%1rhs_vdv_mflora_LAT", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhs_vdv_flora_crew_commander", _sid];
		_c pushBack format["%1rhs_vdv_flora_machinegunner", _sid];
		_c pushBack format["%1rhs_vdv_flora_machinegunner_assistant", _sid];
		_c pushBack format["%1rhs_vdv_flora_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_flora_efreitor", _sid];
		_c pushBack format["%1rhs_vdv_flora_junior_sergeant", _sid];
		_c pushBack format["%1rhs_vdv_flora_aa", _sid];
		_c pushBack format["%1rhs_vdv_flora_LAT", _sid];
	};
	_c pushBack format["%1rhs_pilot_combat_heli", _sid];
	_c pushBack format["%1rhs_pilot_tan", _sid];
	_c pushBack format["%1rhs_pilot_transport_heli", _sid];
};
_c pushBack format["%1rhs_pilot", _sid];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1rhs_vdv_des_marksman", _sid];
		_c pushBack format["%1rhs_vdv_des_marksman_asval", _sid];
		_c pushBack format["%1rhs_vdv_des_officer", _sid];
		_c pushBack format["%1rhs_vdv_des_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_des_RShG2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1rhs_vdv_marksman_asval", _sid];
		_c pushBack format["%1rhs_vdv_marksman", _sid];
		_c pushBack format["%1rhs_vdv_officer", _sid];
		_c pushBack format["%1rhs_vdv_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_grenadier_alt", _sid];
		_c pushBack format["%1rhs_vdv_RShG2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1rhs_vdv_mflora_marksman", _sid];
		_c pushBack format["%1rhs_vdv_mflora_officer", _sid];
		_c pushBack format["%1rhs_vdv_mflora_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_mflora_RShG2", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1rhs_vdv_flora_marksman", _sid];
		_c pushBack format["%1rhs_vdv_flora_officer", _sid];
		_c pushBack format["%1rhs_vdv_flora_grenadier", _sid];
		_c pushBack format["%1rhs_vdv_flora_RShG2", _sid];
	};
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
	_c pushBack format["%1rhs_vdv_des_officer_armored", _sid];
};
if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
	_c pushBack format["%1rhs_vdv_officer_armored", _sid];
};
if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
	_c pushBack format["%1rhs_vdv_mflora_officer_armored", _sid];
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
	_c pushBack format["%1rhs_vdv_flora_officer_armored", _sid];
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_gaz66_vdv", _sid];
	_c pushBack format["%1rhs_gaz66_flat_vdv", _sid];
	_c pushBack format["%1rhs_gaz66o_vdv", _sid];
	_c pushBack format["%1rhs_gaz66o_flat_vdv", _sid];
	_c pushBack format["%1rhs_zil131_vdv", _sid];
	_c pushBack format["%1rhs_zil131_open_vdv", _sid];
	_c pushBack format["%1rhs_zil131_flatbed_vdv", _sid];
	_c pushBack format["%1rhs_gaz66_zu23_vdv", _sid];			//Flak
	_c pushBack format["%1rhs_gaz66_r142_vdv", _sid];			//HQ
	_c pushBack format["%1rhs_gaz66_ap2_vdv", _sid];			//Medic
	//_c pushBack format["%1rhs_zil131_flatbed_cover_vdv", _sid];	//salvager
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_uaz_vdv", _sid];
	_c pushBack format["%1rhs_uaz_open_vdv", _sid];
	_c pushBack format["%1RHS_Ural_VDV_01", _sid];
	_c pushBack format["%1RHS_Ural_Flat_VDV_01", _sid];
	_c pushBack format["%1RHS_Ural_Open_VDV_01", _sid];
	_c pushBack format["%1RHS_Ural_Open_Flat_VDV_01", _sid];
	_c pushBack format["%1rhs_btr60_vdv", _sid];
	//_u pushBack "RHS_Ural_Fuel_VDV_01";			//Fueltruck
	//_u pushBack "RHS_Ural_Repair_VDV_01";			//Repairtruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1RHS_Ural_Zu23_VDV_01", _sid];			//Flak
	_c pushBack format["%1RHS_BM21_VDV_01", _sid];				//Artytruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_kamaz5350_vdv", _sid];
	_c pushBack format["%1rhs_kamaz5350_flatbed_cover_vdv", _sid];
	_c pushBack format["%1rhs_kamaz5350_open_vdv", _sid];
	_c pushBack format["%1rhs_kamaz5350_flatbed_vdv", _sid];
	_c pushBack format["%1rhs_btr70_vdv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_tigr_vdv", _sid];
	_c pushBack format["%1rhs_tigr_3camo_vdv", _sid];
	_c pushBack format["%1rhs_btr80_vdv", _sid];
	_c pushBack format["%1rhs_btr80a_vdv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_tigr_sts_vdv", _sid];
	_c pushBack format["%1rhs_tigr_sts_3camo_vdv", _sid];
	_c pushBack format["%1rhs_tigr_m_vdv", _sid];
	_c pushBack format["%1rhs_tigr_m_3camo_vdv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_typhoon_vdv", _sid];
	_c pushBack format["%1rhs_9k79", _sid];
	_c pushBack format["%1rhs_9k79_K", _sid];
	_c pushBack format["%1rhs_9k79_B", _sid];
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
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_brm1k_tv", _sid];
	_c pushBack format["%1rhs_bmd1k", _sid];
	_c pushBack format["%1rhs_bmd1pk", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_bmp1_tv", _sid];
	_c pushBack format["%1rhs_bmp1d_tv", _sid];
	_c pushBack format["%1rhs_bmp1k_tv", _sid];
	_c pushBack format["%1rhs_bmp1p_tv", _sid];
	_c pushBack format["%1rhs_bmd1", _sid];
	_c pushBack format["%1rhs_bmd1p", _sid];
	_c pushBack format["%1rhs_bmd1r", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_bmp2e_tv", _sid];
	_c pushBack format["%1rhs_bmp2d_tv", _sid];
	_c pushBack format["%1rhs_bmp2k_tv", _sid];
	_c pushBack format["%1rhs_bmd2", _sid];
	_c pushBack format["%1rhs_bmd2k", _sid];
	_c pushBack format["%1rhs_bmd2m", _sid];
	_c pushBack format["%1rhs_t72ba_tv", _sid];
	_c pushBack format["%1rhs_2s1_tv", _sid];
	_c pushBack format["%1rhs_2s1_at_tv", _sid];
	_c pushBack format["%1rhs_2s3_tv", _sid];
	_c pushBack format["%1rhs_2s3_at_tv", _sid];
	_c pushBack format["%1rhs_zsu234_aa", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_bmp2_tv", _sid];
	_c pushBack format["%1rhs_sprut_vdv", _sid];
	_c pushBack format["%1rhs_t72bb_tv", _sid];
	_c pushBack format["%1rhs_t80", _sid];
	_c pushBack format["%1rhs_t80b", _sid];
	_c pushBack format["%1rhs_t80bk", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_bmd4_vdv", _sid];
	_c pushBack format["%1rhs_bmd4m_vdv", _sid];
	_c pushBack format["%1rhs_t72bc_tv", _sid];
	_c pushBack format["%1rhs_t80a", _sid];
	_c pushBack format["%1rhs_t80bv", _sid];
	_c pushBack format["%1rhs_t80bvk", _sid];
	_c pushBack format["%1rhs_t90_tv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_bmd4ma_vdv", _sid];
	_c pushBack format["%1rhs_t90a_tv", _sid];
	_c pushBack format["%1rhs_t90saa_tv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_t72bd_tv", _sid];
	_c pushBack format["%1rhs_t72be_tv", _sid];
	_c pushBack format["%1rhs_t80u", _sid];
	_c pushBack format["%1rhs_t80u45m", _sid];
	_c pushBack format["%1rhs_t80ue1", _sid];
	_c pushBack format["%1rhs_t80uk", _sid];
	_c pushBack format["%1rhs_t80um", _sid];
	_c pushBack format["%1rhs_t90sab_tv", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_t90am_tv", _sid];
	_c pushBack format["%1rhs_t90sm_tv", _sid];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1rhs_t15_tv", _sid];
	_c pushBack format["%1rhs_t14_tv", _sid];
};*/

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
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_Mi8mt_vvs", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_Mi8AMT_vvs", _sid];
	_c pushBack format["%1RHS_Mi8MTV3_vvs", _sid];
	_c pushBack format["%1RHS_Mi8AMTSh_vvs", _sid];
	_c pushBack format["%1RHS_Mi24P_vvs", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_Mi24V_vvs", _sid];
	_c pushBack format["%1RHS_Mi24Vt_vvs", _sid];
	_c pushBack format["%1rhs_mig29s_vvs", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1rhs_ka60_grey", _sid];
	_c pushBack format["%1rhs_mi28n_vvs", _sid];
	_c pushBack format["%1RHS_Su25SM_vvs", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_Ka52_vvs", _sid];
	_c pushBack format["%1RHS_TU95MS_vvs_old", _sid];
	_c pushBack format["%1rhs_pchela1t_vvs", _sid];//drone
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1RHS_T50_vvs_generic", _sid];
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
if (_setupBaseUnits) then {
	_c pushBack format["CTI_Salvager_%1", _side];
	//_c pushBack format["%1rhs_zil131_flatbed_cover_vdv", _sid];	//salvager
};
	
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_gaz66_repair_vdv", _sid];				//Repairtruck
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1RHS_Ural_Repair_VDV_01", _sid];			//Repairtruck
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_prp3_tv", _sid];			//repair
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_gaz66_ammo_vdv", _sid];				//Ammotruck
	_c pushBack format["%1rhs_kraz255b1_fuel_vdv", _sid];				//Fueltruck
};

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1RHS_Ural_Ammo_VDV_01", _sid];			//Ammotruck
	_c pushBack format["%1RHS_Ural_Fuel_VDV_01", _sid];			//Fueltruck
};

_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1rhs_kamaz5350_ammo_vdv", _sid];			//Ammotruck
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
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1rhs_uaz_vdv", _sid];	
	_c pushBack format["%1rhs_uaz_open_vdv", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1rhs_gaz66_repair_vdv", _sid];					//Repairtruck
		_c pushBack format["%1rhs_gaz66_ammo_vdv", _sid];					//Ammotruck
		_c pushBack format["%1rhs_kraz255b1_fuel_vdv", _sid];				//Fueltruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
			_c pushBack format["%1rhs_vdv_des_crew", _sid];
			_c pushBack format["%1rhs_vdv_des_rifleman", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
			_c pushBack format["%1rhs_vdv_crew", _sid];
			_c pushBack format["%1rhs_vdv_rifleman", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
			_c pushBack format["%1rhs_vdv_mflora_crew", _sid];
			_c pushBack format["%1rhs_vdv_mflora_rifleman", _sid];
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
			_c pushBack format["%1rhs_vdv_flora_crew", _sid];
			_c pushBack format["%1rhs_vdv_flora_rifleman", _sid];
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
_c = [];
/*if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_u pushBack format["%1O_Boat_Transport_01_F", _sid];
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_RHS.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
