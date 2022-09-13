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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		inf_to_add = [[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_engineer_mpiaks74n_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_radioman_mpiak74n_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_medic_mpiak74n_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		inf_to_add = [[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_engineer_mpiaks74n_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_radioman_mpiak74n_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_medic_mpiak74n_80_str", _sid], 1, 20];
	};
	
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [[format["%1gm_gc_army_machinegunner_lmgrpk_80_win", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_pk_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		inf_to_add = [[format["%1gm_gc_army_machinegunner_lmgrpk_80_str", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_pk_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str", _sid], 1, 20];
	};
	
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_win", _sid], 1, 20]];	
		//inf_to_add pushBack [format["%1gm_gc_army_antiair_mpiak74n_9k32m_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_marksman_svd_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
		inf_to_add = [[format["%1gm_gc_army_antitank_mpiak74n_fagot_80_str", _sid], 1, 20]];	
		//inf_to_add pushBack [format["%1gm_gc_army_antiair_mpiak74n_9k32m_80_str", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_gc_army_marksman_svd_80_str", _sid], 1, 20];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1gm_gc_army_p601", _sid], 1, 40]];
	
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_uaz469_dshkm_win", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_uaz469_spg9_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_uaz469_dshkm_wdl", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_uaz469_spg9_wdl", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_uaz469_dshkm", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_uaz469_spg9", _sid], 1, 20];
	};
	units_wheeled = mot_to_add;
};	

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_brdm2_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_brdm2_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_brdm2", _sid], 1, 40]];	
	};	
	units_wheeled append mot_to_add;	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_btr60pb_win", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_ural375d_mlrs_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_btr60pb_wdl", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_ural375d_mlrs_wdl", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1gm_gc_army_btr60pb", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_gc_army_ural375d_mlrs", _sid], 1, 20];
	};
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_bmp1sp2_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_bmp1sp2_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_bmp1sp2", _sid], 1, 40]];
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_pt76b_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55_win", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2s1_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_pt76b_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55_wdl", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2s1_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active	
		arm_to_add = [[format["%1gm_gc_army_pt76b", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2s1", _sid], 1, 40];
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55a_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55ak_win", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2p16_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55a_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55ak_wdl", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2p16_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55a", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55ak", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_gc_army_2p16", _sid], 1, 40];	
	};
	units_tracked append arm_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55am2_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55am2b_win", _sid], 1, 40];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55am2_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55am2b_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_t55am2", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_gc_army_t55am2b", _sid], 1, 40];
	};
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_zsu234v1_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_zsu234v1_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1gm_gc_army_zsu234v1", _sid], 1, 40]];
	};
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NVA_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1gm_gc_airforce_mi2p", _sid], 1, 50];
	units_air pushBack [format["%1gm_gc_airforce_mi2t", _sid], 1, 50];
	units_air pushBack [format["%1gm_gc_airforce_mi2sr", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1gm_gc_airforce_l410s_salon", _sid], 1, 50];
	units_air pushBack [format["%1gm_gc_airforce_l410t", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1gm_gc_airforce_mi2urn", _sid], 1, 40]];
	units_air pushBack [format["%1gm_gc_airforce_mi2us", _sid], 1, 50];
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_NVA_GM.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
