/*
format["%1<vanilla_unitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo
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

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
//if (isNil "_priorUnits" || _ai == 1) then { 
if ((CTI_GM_DLC > 0 || _ai == CTI_NVA_ID) || ( CTI_GM_DLC > 0 && CTI_CUP_ADDON < 2 && CTI_CWR3_ADDON < 2)) then {
	
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
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_engineer_mpiaks74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid];
		_c pushBack format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win", _sid];
		_c pushBack format["%1gm_gc_army_radioman_mpiak74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_paratrooper_mpiaks74n_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		_c pushBack format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_engineer_mpiaks74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid];
		_c pushBack format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str", _sid];
		_c pushBack format["%1gm_gc_army_radioman_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_str", _sid];
		_c pushBack format["%1gm_gc_army_paratrooper_mpiaks74n_80_str", _sid];
	};
	_c pushBack format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_win", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_pk_80_win", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_win", _sid];
		_c pushBack format["%1gm_gc_army_officer_pm_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		_c pushBack format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_pk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str", _sid];
		_c pushBack format["%1gm_gc_army_officer_80_gry", _sid];
	};
	_c pushBack format["%1gm_gc_airforce_pilot_pm_80_blu", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_squadleader_mpiak74n_80_win", _sid];
		_c pushBack format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid];
		_c pushBack format["%1gm_gc_army_antiair_mpiak74n_9k32m_80_win", _sid];
		_c pushBack format["%1gm_gc_army_marksman_svd_80_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		_c pushBack format["%1gm_gc_army_squadleader_mpiak74n_80_str", _sid];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1gm_gc_army_bicycle_01_oli", _sid];
	_c pushBack format["%1gm_gc_army_p601", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_uaz469_cargo_win", _sid];
		_c pushBack format["%1gm_gc_army_ural375d_medic_win", _sid];		//Medic
		_c pushBack format["%1gm_gc_army_ural375d_cargo_win", _sid];
		_c pushBack format["%1gm_gc_army_ural44202_win", _sid];
		_c pushBack format["%1gm_gc_army_ural4320_cargo_win", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_dshkm_win", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_spg9_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_uaz469_cargo_wdl", _sid];
		_c pushBack format["%1gm_gc_army_ural375d_medic_wdl", _sid];		//Medic
		_c pushBack format["%1gm_gc_army_ural375d_cargo_wdl", _sid];
		_c pushBack format["%1gm_gc_army_ural44202_wdl", _sid];
		_c pushBack format["%1gm_gc_army_ural4320_cargo_wdl", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_dshkm_wdl", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_spg9_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_uaz469_cargo", _sid];
		_c pushBack format["%1gm_gc_army_ural375d_medic", _sid];		//Medic
		_c pushBack format["%1gm_gc_army_ural375d_cargo", _sid];
		_c pushBack format["%1gm_gc_army_ural44202", _sid];
		_c pushBack format["%1gm_gc_army_ural4320_cargo", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_dshkm", _sid];
		_c pushBack format["%1gm_gc_army_uaz469_spg9", _sid];
	};
};	

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_brdm2_win", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_brdm2um_win", _sid];//unarmed	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_brdm2_wdl", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_brdm2um_wdl", _sid];//unarmed	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_brdm2", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_brdm2um", _sid];//unarmed	
	};		
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_btr60pa_win", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pu12_win", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pb_win", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_ural375d_mlrs_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_btr60pa_wdl", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pu12_wdl", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pb_wdl", _sid];//MG + 2cm
		_c pushBack format["%1gm_gc_army_ural375d_mlrs_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_btr60pa", _sid];//unarmed
		_c pushBack format["%1gm_gc_army_btr60pu12", _sid];//unarmed
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_bmp1sp2_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_bmp1sp2_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_bmp1sp2", _sid];	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_pt76b_win", _sid];
		_c pushBack format["%1gm_gc_army_t55_win", _sid];
		_c pushBack format["%1gm_gc_army_2s1_win", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_pt76b_wdl", _sid];
		_c pushBack format["%1gm_gc_army_t55_wdl", _sid];
		_c pushBack format["%1gm_gc_army_2s1_wdl", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active	
		_c pushBack format["%1gm_gc_army_pt76b", _sid];
		_c pushBack format["%1gm_gc_army_t55", _sid];
		_c pushBack format["%1gm_gc_army_2s1", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_t55a_win", _sid];
		_c pushBack format["%1gm_gc_army_t55ak_win", _sid];
		_c pushBack format["%1gm_gc_army_2p16_win", _sid];
		_c pushBack format["%1gm_gc_army_zsu234v1_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_t55a_wdl", _sid];
		_c pushBack format["%1gm_gc_army_t55ak_wdl", _sid];
		_c pushBack format["%1gm_gc_army_2p16_wdl", _sid];
		_c pushBack format["%1gm_gc_army_zsu234v1_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_t55a", _sid];
		_c pushBack format["%1gm_gc_army_t55ak", _sid];
		_c pushBack format["%1gm_gc_army_2p16", _sid];
		_c pushBack format["%1gm_gc_army_zsu234v1", _sid];	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_t55am2_win", _sid];
		_c pushBack format["%1gm_gc_army_t55am2b_win", _sid];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1gm_gc_army_t55am2_wdl", _sid];
		_c pushBack format["%1gm_gc_army_t55am2b_wdl", _sid];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_gc_airforce_mi2p", _sid];
	_c pushBack format["%1gm_gc_airforce_mi2t", _sid];
	_c pushBack format["%1gm_gc_airforce_mi2sr", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_gc_airforce_l410s_salon", _sid];
	_c pushBack format["%1gm_gc_airforce_l410t", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1gm_gc_airforce_mi2urn", _sid];
	_c pushBack format["%1gm_gc_airforce_mi2us", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_repair_win", _sid];//Repairtruck
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_repair_wdl", _sid];//Repairtruck
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_repair", _sid];//Repairtruck
};
_c pushBack format["CTI_Salvager_%1", _side];

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_reammo_win", _sid];//Ammotruck
	_c pushBack format["%1gm_gc_army_ural375d_refuel_win", _sid];//Fueltruck
};
if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_reammo_wdl", _sid];//Ammotruck
	_c pushBack format["%1gm_gc_army_ural375d_refuel_wdl", _sid];//Fueltruck
};
if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
	_c pushBack format["%1gm_gc_army_ural4320_reammo", _sid];//Ammotruck
	_c pushBack format["%1gm_gc_army_ural375d_refuel", _sid];//Fueltruck
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid];
			_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_win", _sid];
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
			_c pushBack format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid];
			_c pushBack format["%1gm_gc_army_medic_mpiak74n_80_str", _sid];
		};
	_c pushBack format["%1gm_gc_army_crew_mpiaks74nk_80_blk", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1gm_gc_army_bicycle_01_oli", _sid];	
	_c pushBack format["%1gm_gc_army_p601", _sid];
	
	_c pushBack format["%1gm_gc_civ_p601", _sid];
	_c pushBack format["%1gm_gc_dp_p601", _sid];
	_c pushBack format["%1gm_gc_pol_p601", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_ural4320_repair_win", _sid];//Repairtruck
			_c pushBack format["%1gm_gc_army_ural4320_reammo_win", _sid];//Ammotruck
			_c pushBack format["%1gm_gc_army_ural375d_refuel_win", _sid];//Fueltruck
		};
		if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_ural4320_repair_wdl", _sid];//Repairtruck
			_c pushBack format["%1gm_gc_army_ural4320_reammo_wdl", _sid];//Ammotruck
			_c pushBack format["%1gm_gc_army_ural375d_refuel_wdl", _sid];//Fueltruck
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
			_c pushBack format["%1gm_gc_army_ural4320_repair", _sid];//Repairtruck
			_c pushBack format["%1gm_gc_army_ural4320_reammo", _sid];//Ammotruck
			_c pushBack format["%1gm_gc_army_ural375d_refuel", _sid];//Fueltruck
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
/*_level = 0;
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
*/

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_NVA_GM.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
