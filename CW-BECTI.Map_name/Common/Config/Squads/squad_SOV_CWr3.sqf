_side = _this;
_sid = "";
_level = -1;

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
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};*/

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

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
inf_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1cwr3_o_soldier82", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1cwr3_o_soldier82_at_rpg7", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aat_rpg7", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_hg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_driver", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_sapper", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_radio", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_backpack", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1cwr3_o_soldier", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1cwr3_o_soldier_at_rpg7", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_driver", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_sapper", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_hg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_radio", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_backpack", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aat_rpg7", _sid], 1, 20];
	};
	inf_to_add pushBack [format["%1cwr3_o_soldier_crew", _sid], 1, 20];

	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1cwr3_o_soldier82_gl", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1cwr3_o_soldier82_ar", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_mg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_amg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_at_rpg18", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aaa_strela", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aa_strela", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add pushBack [format["%1cwr3_o_soldier_amg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_ar", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_gl", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_at_rpg18", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_mg", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_sl", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aa_strela", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aaa_strela", _sid], 1, 20];
	};
	inf_to_add pushBack [format["%1cwr3_o_camel_pilot", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_o_soldier_pilot", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_o_soldier_pilot_jet", _sid], 1, 20];
	inf_to_add pushBack [format["%1cwr3_o_soldier_pilot_light", _sid], 1, 20];
	
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1cwr3_o_soldier82_at_at4", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aat_at4", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aaa_igla", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_aa_igla", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_sniper", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier82_spotter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add pushBack [format["%1cwr3_o_soldier_at_at4", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aat_at4", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aa_igla", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_aaa_igla", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_sniper", _sid], 1, 20];
		inf_to_add pushBack [format["%1cwr3_o_soldier_spotter", _sid], 1, 20];
	};
	
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_uaz_dshkm", _sid], 1, 40]];
	mot_to_add pushBack [format["%1cwr3_o_uaz_ags30", _sid], 1, 40];
	mot_to_add pushBack [format["%1cwr3_o_uaz_spg9", _sid], 1, 40];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_ural_zu23", _sid], 1, 40]];	
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_brdm2", _sid], 1, 40]];
	mot_to_add pushBack [format["%1cwr3_o_brdm2um", _sid], 1, 40];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_brdm2_atgm", _sid], 1, 40]];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_btr60", _sid], 1, 40]];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//skip this level

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1cwr3_o_btr80", _sid], 1, 40]];
	
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
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	units_tracked pushBack [format["%1cwr3_o_mtlb_pk", _sid], 1, 40];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	units_tracked pushBack [format["%1cwr3_o_bmp1", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_bmp1p", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_pt76b", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_t55", _sid], 1, 40];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	units_tracked pushBack [format["%1cwr3_o_bmp2", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_t55a", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_t64b", _sid], 1, 40];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	units_tracked pushBack [format["%1cwr3_o_t72a", _sid], 1, 40];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	units_tracked pushBack [format["%1cwr3_o_t55amv", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_t64bv", _sid], 1, 40];
	units_tracked pushBack [format["%1cwr3_o_t72b1", _sid], 1, 40];
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair = [[format["%1cwr3_o_ural_zu23", _sid], 1, 40]];
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair = [[format["%1cwr3_o_uaz_aa", _sid], 1, 40]];
};

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair = [[format["%1cwr3_o_zsu", _sid], 1, 40]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair = [[format["%1cwr3_o_mtlb_sa13", _sid], 1, 40]];
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
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1cwr3_o_mi8_amt", _sid], 1, 20]];
	units_air pushBack [format["%1cwr3_o_camel", _sid], 1, 20];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [];
	units_air = [[format["%1cwr3_o_mi8_mtv3", _sid], 1, 20]];
	units_air pushBack [format["%1cwr3_o_mi24p", _sid], 1, 20];
	units_air pushBack [format["%1cwr3_o_su17m4", _sid], 1, 20];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1cwr3_o_mi24d", _sid], 1, 20];
	units_air pushBack [format["%1cwr3_o_mi24v", _sid], 1, 20];
	units_air pushBack [format["%1cwr3_o_mig23", _sid], 1, 20];
	units_air pushBack [format["%1cwr3_o_mig27", _sid], 1, 20];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1cwr3_o_su25", _sid], 1, 20];
	units_air pushBack [format["%1cwr3_o_v80", _sid], 1, 20];
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";