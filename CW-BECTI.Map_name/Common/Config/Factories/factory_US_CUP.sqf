private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		/*_sid = "VIOC_B_";*/_tag = "WEST_";
		if(CTI_WEST_AI == CTI_US_ID || CTI_WEST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case east: {
		/*_sid = "VIOC_O_";*/_tag = "EAST_";
		if(CTI_EAST_AI == CTI_US_ID || CTI_EAST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
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
if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_CUP_ID) then {_setupBaseUnits = true;};
//if((_isThisMain select 0) == CTI_US_ID && ((_isThisMain select 1) == CTI_CUP_ID || (count ((_side) call CTI_CO_FNC_GetSideUpgrades) > 0))) then {_setupBaseUnits = true;};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["is this main: %1 <%2=%3|%4=%5>", _setupBaseUnits,(_isThisMain select 0),CTI_US_ID,(_isThisMain select 1),CTI_CUP_ID]] call CTI_CO_FNC_Log;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_CUP.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_USMC_Crew_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Engineer_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_GL_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_des", _sid];
		_c pushBack format["%1CUP_B_USMC_SpecOps_SD_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_LAT_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_Light_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Medic_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_USMC_Crew", _sid];
		_c pushBack format["%1CUP_B_USMC_Engineer", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_GL", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier", _sid];
		_c pushBack format["%1CUP_B_USMC_SpecOps_SD", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_LAT", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_Light", _sid];
		_c pushBack format["%1CUP_B_USMC_Medic", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_B_US_Crew_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_EOD_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_GL_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Medic_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_ACOG_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_LAT_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Light_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Backpack_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_Sapper_UCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_B_US_Crew_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_EOD_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_GL_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Medic_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_ACOG_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_LAT_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Light_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Backpack_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_Sapper_OCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_B_US_Crew_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_EOD_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_GL_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Medic_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_ACOG_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_LAT_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Light_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Backpack_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Engineer_Sapper_OEFCP", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_USMC_Soldier_AT_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_AR_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_MG_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Pilot_des", _sid];
		_c pushBack format["%1CUP_B_USMC_SpecOps_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_SL_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_USMC_Soldier_AT", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_AR", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_MG", _sid];
		_c pushBack format["%1CUP_B_USMC_Pilot", _sid];
		_c pushBack format["%1CUP_B_USMC_SpecOps", _sid];
		_c pushBack format["%1CUP_B_US_Pilot", _sid];
		_c pushBack format["%1CUP_B_US_Pilot_Light", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_SL", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_B_US_Soldier_AAT_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AT_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AAR_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AR_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AMG_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_MG_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_EBR_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Officer_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_SL_UCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_B_US_Soldier_AAT_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AT_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AAR_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AR_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AMG_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_MG_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_EBR_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Officer_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_SL_OCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_B_US_Soldier_AAT_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AAR_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AT_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AR_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AMG_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_MG_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_EBR_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Officer_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_SL_OEFCP", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_USMC_Soldier_HAT_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_Marksman_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_AA_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Officer_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Sniper_M40A3_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Spotter_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_TL_des", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_UAV_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_USMC_Soldier_HAT", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_Marksman", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_AA", _sid];
		_c pushBack format["%1CUP_B_USMC_Officer", _sid];
		_c pushBack format["%1CUP_B_USMC_Sniper_M40A3", _sid];
		_c pushBack format["%1CUP_B_USMC_Spotter", _sid];
		_c pushBack format["%1CUP_B_USMC_Soldier_TL", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_B_US_Soldier_AA_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AHAT_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_HAT_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_TL_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_UAV_UCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_B_US_Soldier_AA_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AHAT_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_HAT_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_TL_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_UAV_OCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_B_US_Soldier_AA_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_AHAT_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_HAT_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_Marksman_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_TL_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Soldier_UAV_OEFCP", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_B_USMC_Sniper_M107_des", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_USMC_Sniper_M107", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_B_US_Sniper_M107_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_M110_TWS_UCP", _sid];
		_c pushBack format["%1CUP_B_US_Spotter_UCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_B_US_Sniper_M107_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_M110_TWS_OCP", _sid];
		_c pushBack format["%1CUP_B_US_Spotter_OCP", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_B_US_Sniper_M107_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Sniper_M110_TWS_OEFCP", _sid];
		_c pushBack format["%1CUP_B_US_Spotter_OEFCP", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
	//};
	//if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	//};
	_c pushBack format["%1CUP_B_M1030_USMC", _sid];
	_c pushBack format["%1CUP_B_TowingTractor_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1152_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Transport_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Terminal_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_SOV_M2_USA", _sid];
		_c pushBack format["%1CUP_B_MTVR_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Unarmed_USA", _sid];
		//_c pushBack format["%1CUP_B_MTVR_Ammo_USA", _sid];				//Ammotruck
		//_c pushBack format["%1CUP_B_MTVR_Refuel_USA", _sid];			//Fueltruck
		//_c pushBack format["%1CUP_B_MTVR_Repair_USA", _sid];			//Repairtruck
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M1152_USMC", _sid];
		_c pushBack format["%1CUP_B_MTVR_USMC", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Unarmed_USMC", _sid];
		//_c pushBack format["%1CUP_B_MTVR_Refuel_USMC", _sid];				//Ammotruck
		//_c pushBack format["%1CUP_B_MTVR_Repair_USMC", _sid];				//Fueltruck
		//_c pushBack format["%1CUP_B_MTVR_Ammo_USMC", _sid];					//Repairtruck
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_HMMWV_MK19_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Crows_M2_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Crows_MK19_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_M2_USA", _sid];
		_c pushBack format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25_HQ_desert_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_HMMWV_M1114_USMC", _sid];
		_c pushBack format["%1CUP_B_HMMWV_MK19_USMC", _sid];
		_c pushBack format["%1CUP_B_HMMWV_M2_USMC", _sid];
		_c pushBack format["%1CUP_B_M1165_GMV_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25_HQ_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25_HQ_green", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_HMMWV_Ambulance_USA", _sid];		//Medic
		_c pushBack format["%1CUP_B_HMMWV_TOW_USA", _sid];
		_c pushBack format["%1CUP_B_HMMWV_M2_GPK_USA", _sid];
		_c pushBack format["%1CUP_B_M1151_M2_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_Deploy_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_M1167_DSRT_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25_desert_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25M240_desert_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_HMMWV_Ambulance_USMC", _sid];			//Medic
		_c pushBack format["%1CUP_B_HMMWV_TOW_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_M2_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_Deploy_USMC", _sid];
		_c pushBack format["%1CUP_B_M1151_Mk19_USMC", _sid];
		_c pushBack format["%1CUP_B_M1167_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25M240_USMC", _sid];
		_c pushBack format["%1CUP_B_LAV25M240_green", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1130_CV_M2_Desert", _sid];
		_c pushBack format["%1CUP_B_M1133_MEV_Desert", _sid];
		_c pushBack format["%1CUP_B_M1126_ICV_M2_Desert", _sid];
		_c pushBack format["%1CUP_B_M1126_ICV_MK19_Desert", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Avenger_USA", _sid];
		_c pushBack format["%1CUP_B_M1135_ATGMV_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M1130_CV_M2_Woodland", _sid];
		_c pushBack format["%1CUP_B_M1133_MEV_Woodland", _sid];
		_c pushBack format["%1CUP_B_M1126_ICV_M2_Woodland", _sid];
		_c pushBack format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid];
		_c pushBack format["%1CUP_B_HMMWV_Avenger_USMC", _sid];
		_c pushBack format["%1CUP_B_M1135_ATGMV_Woodland", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_RG31_Mk19_USA", _sid];
		_c pushBack format["%1CUP_B_RG31E_M2_USA", _sid];
		_c pushBack format["%1CUP_B_RG31_M2_USA", _sid];
		_c pushBack format["%1CUP_B_RG31_M2_GC_USA", _sid];
		_c pushBack format["%1CUP_B_M1129_MC_MK19_Desert", _sid];
		_c pushBack format["%1CUP_B_M1128_MGS_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_RG31_Mk19_OD_USA", _sid];
		_c pushBack format["%1CUP_B_RG31E_M2_OD_USA", _sid];
		_c pushBack format["%1CUP_B_RG31_M2_OD_USA", _sid];
		_c pushBack format["%1CUP_B_RG31_M2_OD_GC_USA", _sid];
		_c pushBack format["%1CUP_B_M1129_MC_MK19_Woodland", _sid];
		_c pushBack format["%1CUP_B_M1128_MGS_Woodland", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M113A1_HQ_desert_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M113A1_HQ_olive_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M113A1_HQ_USA", _sid];
	};
	_c pushBack format["%1CUP_B_AAV_Unarmed_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M113A1_desert_USA", _sid];
		_c pushBack format["%1CUP_B_M113A1_Med_desert_USA", _sid];
		_c pushBack format["%1CUP_B_M113A3_HQ_desert_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M113A3_HQ_olive_USA", _sid];
		_c pushBack format["%1CUP_B_M113A1_olive_USA", _sid];
		_c pushBack format["%1CUP_B_M113A1_Med_olive_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M113A3_HQ_USA", _sid];
		_c pushBack format["%1CUP_B_M113A1_USA", _sid];
		_c pushBack format["%1CUP_B_M113A1_Med_USA", _sid];
	};
	_c pushBack format["%1CUP_B_AAV_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M113A3_desert_USA", _sid];
		_c pushBack format["%1CUP_B_M113A3_Med_desert_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M113A3_olive_USA", _sid];
		_c pushBack format["%1CUP_B_M113A3_Med_olive_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M113A3_USA", _sid];
		_c pushBack format["%1CUP_B_M113A3_Med_USA", _sid];
	};
	_c pushBack format["%1CUP_B_M163_USA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1CUP_B_M60A3_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M7Bradley_USA_D", _sid];
		_c pushBack format["%1CUP_B_M270_DPICM_USA", _sid];
		_c pushBack format["%1CUP_B_M270_HE_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M7Bradley_USA_W", _sid];
		_c pushBack format["%1CUP_B_M270_DPICM_USMC", _sid];
		_c pushBack format["%1CUP_B_M270_HE_USMC", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M2Bradley_USA_D", _sid];
		_c pushBack format["%1CUP_B_M6LineBacker_USA_D", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M2Bradley_USA_W", _sid];
		_c pushBack format["%1CUP_B_M6LineBacker_USA_W", _sid];
	};

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1A1_DES_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1SA_Desert_US_Army", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M1A1SA_OD_US_Army", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		_c pushBack format["%1CUP_B_M1A1_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1SA_Woodland_US_Army", _sid];
	};
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M2A3Bradley_USA_D", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M2A3Bradley_USA_W", _sid];
	};
	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1A1SA_Desert_TUSK_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_Desert_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1FEP_Desert_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M1A1SA_TUSK_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1FEP_OD_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		_c pushBack format["%1CUP_B_M1A1SA_TUSK_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1FEP_Woodland_USMC", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1A2C_Desert_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_Desert_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1FEP_TUSK_Desert_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M1A2C_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1EP_TUSK_OD_USMC", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		_c pushBack format["%1CUP_B_M1A2C_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A1EP_TUSK_Woodland_USMC", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M1A2C_TUSK_Desert_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_II_Desert_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2C_TUSK_II_Desert_US_Army", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M1A2C_TUSK_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_II_OD_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2C_TUSK_II_OD_US_Army", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		_c pushBack format["%1CUP_B_M1A2C_TUSK_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army", _sid];
		_c pushBack format["%1CUP_B_M1A2C_TUSK_II_Woodland_US_Army", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_MH6J_USA", _sid];
	_c pushBack format["%1CUP_B_MH6J_OBS_USA", _sid];
	_c pushBack format["%1CUP_B_MH6M_USA", _sid];
	_c pushBack format["%1CUP_B_MH6M_OBS_USA", _sid];
	_c pushBack format["%1CUP_B_AC47_Spooky_USA", _sid];
	_c pushBack format["%1CUP_B_C47_USA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_UH1Y_UNA_USMC", _sid];
	_c pushBack format["%1CUP_B_AH6J_USA", _sid];
	_c pushBack format["%1CUP_B_AH6M_USA", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_UH1Y_MEV_USMC", _sid];
	_c pushBack format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid];
	_c pushBack format["%1CUP_B_UH60S_USN", _sid];
	_c pushBack format["%1CUP_B_UH60M_US", _sid];
	_c pushBack format["%1CUP_B_UH60M_FFV_US", _sid];
	_c pushBack format["%1CUP_B_UH60M_Unarmed_US", _sid];
	_c pushBack format["%1CUP_B_UH60M_Unarmed_FFV_US", _sid];
	_c pushBack format["%1CUP_B_MH60S_USMC", _sid];
	_c pushBack format["%1CUP_MH60S_Unarmed_USN", _sid];
	_c pushBack format["%1CUP_MH60S_Unarmed_FFV_USN", _sid];
	_c pushBack format["%1CUP_B_CH47F_USA", _sid];
	_c pushBack format["%1CUP_B_CH47F_VIV_USA", _sid];
	_c pushBack format["%1CUP_B_MH47E_USA", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_AH1Z_Dynamic_USMC", _sid];
	_c pushBack format["%1CUP_B_UH60M_Unarmed_FFV_MEV_US", _sid];
	_c pushBack format["%1CUP_B_MH60L_DAP_2x_USN", _sid];
	_c pushBack format["%1CUP_B_MH60L_DAP_4x_USN", _sid];
	_c pushBack format["%1CUP_B_MH60L_DAP_2x_US", _sid];
	_c pushBack format["%1CUP_B_MH60L_DAP_4x_US", _sid];
	_c pushBack format["%1CUP_B_AV8B_DYN_USMC", _sid];
	_c pushBack format["%1CUP_B_C130J_USMC", _sid];
	_c pushBack format["%1CUP_B_C130J_Cargo_USMC", _sid];
	_c pushBack format["%1CUP_B_A10_DYN_USA", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_CH53E_USMC", _sid];
	_c pushBack format["%1CUP_B_CH53E_VIV_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_AH64_DL_USA", _sid];
	_c pushBack format["%1CUP_B_AH64D_DL_USA", _sid];
	_c pushBack format["%1CUP_B_MV22_USMC", _sid];
	_c pushBack format["%1CUP_B_MV22_USMC_RAMPGUN", _sid];
	_c pushBack format["%1CUP_B_MV22_VIV_USMC", _sid];
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_B_F35B_USMC", _sid];
	_c pushBack format["%1CUP_B_F35B_Stealth_USMC", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1CUP_B_MTVR_Repair_USA", _sid];			//Repairtruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1CUP_B_MTVR_Repair_USMC", _sid];				//Repairtruck
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M113A3_Repair_desert_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M113A3_Repair_olive_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M113A3_Repair_USA", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
	_c pushBack format["%1CUP_B_MTVR_Ammo_USA", _sid];			//Ammotruck
	_c pushBack format["%1CUP_B_MTVR_Refuel_USA", _sid];		//Fueltruck
};
if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
	_c pushBack format["%1CUP_B_MTVR_Ammo_USMC", _sid];					//Ammotruck
	_c pushBack format["%1CUP_B_MTVR_Refuel_USMC", _sid];				//Fueltruck
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		_c pushBack format["%1CUP_B_M113A3_Reammo_desert_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_B_M113A3_Reammo_olive_USA", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		_c pushBack format["%1CUP_B_M113A3_Reammo_USA", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1CUP_B_HMMWV_Unarmed_USA", _sid];
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
			_c pushBack format["%1CUP_B_HMMWV_Unarmed_USMC", _sid];
		};
		_c pushBack format["%1CUP_B_M1030_USMC", _sid];
	};	
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			_c pushBack format["%1CUP_B_MTVR_Repair_USA", _sid];			//Repairtruck
			_c pushBack format["%1CUP_B_MTVR_Ammo_USA", _sid];				//Ammotruck
			_c pushBack format["%1CUP_B_MTVR_Refuel_USA", _sid];			//Fueltruck
		};
		if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
			_c pushBack format["%1CUP_B_MTVR_Ammo_USMC", _sid];					//Repairtruck
			_c pushBack format["%1CUP_B_MTVR_Refuel_USMC", _sid];				//Ammotruck
			_c pushBack format["%1CUP_B_MTVR_Repair_USMC", _sid];				//Fueltruck
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 2: {//desert camo active
				_c pushBack format["%1CUP_B_USMC_Soldier_des", _sid];
				_c pushBack format["%1CUP_B_USMC_Medic_des", _sid];
			};
			case 3: {//jungle camo active
				_c pushBack format["%1CUP_B_USMC_Soldier", _sid];
				_c pushBack format["%1CUP_B_USMC_Medic", _sid];
			};
			case 4: {//urban camo active
				_c pushBack format["%1CUP_B_US_Soldier_UCP", _sid];
				_c pushBack format["%1CUP_B_US_Medic_UCP", _sid];
			};
			case 6: {//special camo active
				_c pushBack format["%1CUP_B_US_Soldier_OCP", _sid];
				_c pushBack format["%1CUP_B_US_Medic_OCP", _sid];
			};
			default {//main camo active
				_c pushBack format["%1CUP_B_US_Soldier_OEFCP", _sid];
				_c pushBack format["%1CUP_B_US_Medic_OEFCP", _sid];
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_B_Seafox_USMC", _sid];
	_c pushBack format["%1CUP_B_Zodiac_USMC", _sid];
};
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_B_RHIB_USMC", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_B_LCU1600_USMC", _sid];
	_c pushBack format["%1CUP_B_RHIB2Turret_USMC", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
