/*
format["%1<vanilla_cnitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
*/
private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
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
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
//_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
//if ((isNil "_priorUnits" || _ai == 4) && CTI_CUP_ADDON > 0) then { 
//Check if the based mod is set as main, or the nation is explicit set.
if ((CTI_CUP_ADDON > 0) || _ai == CTI_RACS_SIDE) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {									//Desert camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light", _sid]];
		};
		case 4: {									//urban camo
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light_Urban", _sid]];
		};
		default {									//Woodland if all camos active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_I_RACS_Officer_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_I_RACS_AR_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_I_RACS_Soldier_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_I_RACS_Soldier_Light_wdl", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_I_RACS_Soldier_Light_wdl", _sid]];
		};
	};
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_I_RACS_Pilot", _sid]];
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1CUP_I_LR_Transport_RACS", _sid], []], 
		[format["%1CUP_I_LR_Transport_RACS", _sid], []]
	]];
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer", _sid];
		_c pushBack format["%1CUP_I_RACS_GL", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_GL_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Engineer_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_GL_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Medic_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Light_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid];
	};
	_c pushBack format["%1CUP_I_RACS_Crew", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG", _sid];
		_c pushBack format["%1CUP_I_RACS_AR", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG", _sid];
		_c pushBack format["%1CUP_I_RACS_M", _sid];
		_c pushBack format["%1CUP_I_RACS_SL", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_AR_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_M_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_SL_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_MAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_AR_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_MMG_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_M_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_SL_wdl", _sid];
	};
	_c pushBack format["%1CUP_I_RACS_Pilot", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT", _sid];
		_c pushBack format["%1CUP_I_RACS_Officer", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Officer_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Soldier_AA_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Officer_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Sniper_wdl", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_TowingTractor_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_Transport_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_MG_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_LR_Ambulance_RACS", _sid];
	_c pushBack format["%1CUP_I_MTVR_RACS", _sid];
	//_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];
	//_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];
	//_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_LAV25_HQ_RACS", _sid];
	_c pushBack format["%1CUP_I_LAV25_RACS", _sid];
	_c pushBack format["%1CUP_I_LR_AA_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_LAV25M240_RACS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_AAV_Unarmed_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_AAV_RACS", _sid];
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_I_M113_RACS_URB", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 4 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_M113_RACS", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_M113_Med_RACS", _sid];
	_c pushBack format["%1CUP_I_M163_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_M60A3_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_I_T72_RACS", _sid];
	_c pushBack format["%1CUP_I_M270_DPICM_RACS", _sid];
	_c pushBack format["%1CUP_I_M270_HE_RACS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_I_MH6J_RACS", _sid];
	_c pushBack format["%1CUP_I_SA330_Puma_HC1_RACS", _sid];
	_c pushBack format["%1CUP_I_SA330_Puma_HC2_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_I_AH6J_RACS", _sid];
	_c pushBack format["%1CUP_I_UH1H_RACS", _sid];
	_c pushBack format["%1CUP_I_UH1H_Slick_RACS", _sid];
	_c pushBack format["%1CUP_I_UH60L_Unarmed_RACS", _sid];
	_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_Racs", _sid];
	_c pushBack format["%1CUP_I_UH60L_Unarmed_FFV_MEV_Racs", _sid];
	_c pushBack format["%1CUP_I_C130J_RACS", _sid];
	_c pushBack format["%1CUP_I_C130J_Cargo_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%CUP_I_UH1H_Armed_RACS", _sid];
	_c pushBack format["%CUP_I_UH1H_gunship_RACS", _sid];
	_c pushBack format["%CUP_I_UH60L_RACS", _sid];
	_c pushBack format["%CUP_I_UH60L_FFV_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%CUP_I_CH47F_RACS", _sid];
	_c pushBack format["%CUP_I_CH47F_VIV_RACS", _sid];
	_c pushBack format["%CUP_I_JAS39_RACS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED > _level) then {
	_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Repairtruck
	_c pushBack format["CTI_Salvager_%1", _side];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED > _level) then {
	_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];				//Ammotruck
	_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_I_RACS_Medic", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_I_RACS_Medic_Urban", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_Urban", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		_c pushBack format["%1CUP_I_RACS_Medic_wdl", _sid];
		_c pushBack format["%1CUP_I_RACS_Soldier_wdl", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1CUP_I_LR_Transport_RACS", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		_c pushBack format["%1CUP_I_MTVR_Repair_RACS", _sid];				//Repairtruck
		_c pushBack format["%1CUP_I_MTVR_Ammo_RACS", _sid];					//Ammotruck
		_c pushBack format["%1CUP_I_MTVR_Refuel_RACS", _sid];				//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_I_LCVP_RACS", _sid];
	_c pushBack format["%1CUP_I_LCVP_VIV_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_I_RHIB_RACS", _sid];
	_c pushBack format["%1CUP_I_RHIB2Turret_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_I_LCU1600_RACS", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_I_Frigate_RACS", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_RACS_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
