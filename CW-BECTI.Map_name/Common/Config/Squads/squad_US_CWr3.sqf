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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1cwr3_b_soldier82", _sid], 1, 60]];	
	inf_to_add pushBack [format["%1cwr3_b_soldier82_sapper", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_engineer", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_medic", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_radio", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_backpack", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_at_m67", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aat_m67", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_hg", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_m14", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_at_law", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_gl", _sid], 1, 20];
	
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1cwr3_b_soldier82_aar_m16", _sid], 1, 20]];	
	inf_to_add pushBack [format["%1cwr3_b_soldier82_ar_m16", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aar", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_ar", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aa_redeye", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aaa_redeye", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_at_carlgustaf", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aat_carlgustaf", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_amg", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_mg", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_marksman", _sid], 1, 20];
	
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1cwr3_b_soldier82_at_m47", _sid], 1, 20]];	
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aat_m47", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_sniper", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_spotter", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_b_soldier82_aa_stinger", _sid], 1, 20];
		
	units_infantry append inf_to_add;
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_b_m151_m2", _sid], 1, 40]];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_b_hmmwv_m2", _sid], 1, 40]];
	mot_to_add = [[format["%1cwr3_b_hmmwv_mk19", _sid], 1, 40]];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_b_hmmwv_tow", _sid], 1, 40]];
	
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1cwr3_b_m113a1_hq", _sid], 1, 40]];
	
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1cwr3_b_m113a1", _sid], 1, 40]];
	
	units_tracked = [];
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	arm_to_add = [[format["%1cwr3_b_m113a3", _sid], 1, 40]];
	arm_to_add = [[format["%1cwr3_b_m163", _sid], 1, 40]];
	
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1cwr3_b_m60a3", _sid], 1, 40]];
	arm_to_add = [[format["%1cwr3_b_m60a3_tts", _sid], 1, 40]];
	
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1cwr3_b_m1", _sid], 1, 40]];
	arm_to_add = [[format["%1cwr3_b_m1a1", _sid], 1, 40]];
	
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1cwr3_b_m2a2", _sid], 1, 40]];
	
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

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	aa_to_add = [[format["%1cwr3_b_m163", _sid], 1, 40]];
	
	units_antiair append aa_to_add;
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_camel", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_mh6j", _sid], 1, 40];
	
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_ah6j", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_uh1", _sid], 1, 40];
	
	units_air = [];
	units_air append air_to_add;
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_uh1_armed", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_uh1_gunship", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_f4e", _sid], 1, 40];
	
	units_air append air_to_add;
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_ah1f", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_uh60_x4_esss", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_uh60_m2", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_uh60_m240", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_a10", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_f16c", _sid], 1, 40];
	
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_ah64", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_ah64_hellfire", _sid], 1, 40];
	
	units_air append air_to_add;
};
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1cwr3_b_kiowa_at", _sid], 1, 40]];
	air_to_add pushBack [format["%1cwr3_b_kiowa_dyn", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_kiowa_ffar", _sid], 1, 40];
	air_to_add pushBack [format["%1cwr3_b_kiowa_m2", _sid], 1, 40];
	
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