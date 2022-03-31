_side = _this;
_sid = "";
_level = 0;

/*if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};*/

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];
_adds = 0;

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["ArmoredMBT", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "ArmoredMBT"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//Infantry setup for the AI groups
units_infantry = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_GL", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Light", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_LAT", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Unarmed", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_Urban", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Engineer_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_GL_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Medic_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Light_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_LAT_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Unarmed_Urban", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_wdl", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Engineer_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_GL_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Medic_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Light_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_LAT_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_Unarmed_wdl", _sid], 1, 20];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AAT", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_MAT", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_AMG", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_AR", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_MMG", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_M", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_SL", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AAT_Urban", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_MAT_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_AMG_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_AR_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_MMG_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_M_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_SL_Urban", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AAT_wdl", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_MAT_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_AMG_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_AR_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_MMG_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_M_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_SL_wdl", _sid], 1, 20];
	};
};
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AA", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_HAT", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Sniper", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AA_Urban", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_HAT_Urban", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Sniper_Urban", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 4) || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1CUP_I_RACS_Soldier_AA_wdl", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_I_RACS_Soldier_HAT_wdl", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_I_RACS_Sniper_wdl", _sid], 1, 20];
	};
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_I_LR_MG_RACS", _sid], 1, 40]];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_I_LR_Ambulance_RACS", _sid], 1, 10]];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_I_LAV25_RACS", _sid], 1, 50]];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_I_LAV25M240_RACS", _sid], 1, 40]];
	units_wheeled append mot_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	arm_to_add = [[format["%1CUP_I_AAV_Unarmed_RACS", _sid], 1, 40]];
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	units_tracked = [];
	arm_to_add = [[format["%1CUP_I_AAV_RACS", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		arm_to_add pushBack [format["%1CUP_I_M113_RACS_URB", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 4 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		arm_to_add pushBack [format["%1CUP_I_M113_RACS", _sid], 1, 40];
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	arm_to_add = [[format["%1CUP_I_M113_Med_RACS", _sid], 1, 10]];
	arm_to_add pushBack [format["%1CUP_I_M163_RACS", _sid], 1, 40];
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	arm_to_add = [[format["%1CUP_I_M60A3_RACS", _sid], 1, 40]];
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	arm_to_add = [[format["%1CUP_I_T72_RACS", _sid], 1, 40]];
	//arm_to_add pushBack [format["%1CUP_I_M270_DPICM_RACS", _sid], 1, 10];
	//arm_to_add pushBack [format["%1CUP_I_M270_HE_RACS", _sid], 1, 10];
	units_tracked append arm_to_add;
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];

//*********************************************************************************************************************************************
//											AnitAir Vehicles																				  *
//*********************************************************************************************************************************************
//AntiAir setup for the AI groups
units_antiair = [];
aa_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	units_antiair = [[format["%1CUP_I_LR_AA_RACS", _sid], 1, 50]];
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_RACS_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1CUP_I_MH6J_RACS", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_I_SA330_Puma_HC1_RACS", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_I_SA330_Puma_HC2_RACS", _sid], 1, 40];
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [];
	air_to_add = [[format["%1CUP_I_AH6J_RACS", _sid], 1, 30]];
	air_to_add pushBack [format["%1CUP_I_UH1H_RACS", _sid], 1, 20];
	air_to_add pushBack [format["%1CUP_I_UH1H_Slick_RACS", _sid], 1, 20];
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%CUP_I_UH1H_Armed_RACS", _sid], 1, 30]];
	air_to_add pushBack [format["%CUP_I_UH1H_gunship_RACS", _sid], 1, 40];
	air_to_add pushBack [format["%CUP_I_UH60L_RACS", _sid], 1, 30];
	air_to_add pushBack [format["%CUP_I_UH60L_FFV_RACS", _sid], 1, 30];
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%CUP_I_JAS39_RACS", _sid], 1, 50]];
	units_air append air_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_US_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";