_side = _this;
_sid = "";
_level = -1;

/*switch (_side) do {
	case "west": {_sid = "VIOC_B_"};
	case "east": {_sid = "VIOC_O_"};
	case "independent": {_sid = "VIOC_I_"};
	default { };
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
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["Armored", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];
infantry_auto = [];
kind_infantry = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_d_rifleman", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_rifleman_m4", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_riflemanat", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_rifleman_law", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_gunner", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_grenadier_m32", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_grenadier", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_rifleman_m590", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_explosives", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_wd_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_rifleman_m4", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_rifleman_law", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_riflemanat", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_rifleman_m590", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_explosives", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_grenadier", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_grenadier_m32", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_gunner", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhsusf_army_ucp_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_riflemanl", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_rifleman_m4", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_rifleman_m16", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_riflemanat", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_rifleman_m590", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_explosives", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_grenadier", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1rhsusf_army_ocp_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_riflemanl", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_rifleman_m590", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_rifleman_m16", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_rifleman_m4", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_medic", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_explosives", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_grenadier", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_riflemanat", _sid], 1, 20];
	};
	units_infantry append inf_to_add;
	infantry_auto append inf_to_add;
};

_v pushBack format["InfantryT%1", _level];
_t pushBack format["Infantry T%1", _level];
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack format["InfantryT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_d_smaw", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_autorifleman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_autorifleman_m249", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_autorifleman_m249_ass", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_jfo", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_sniper", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_spotter", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_fso", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_officer", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_wd_smaw", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_jfo", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_fso", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_autorifleman_m249", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_autorifleman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_autorifleman_m249_ass", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_officer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_sniper", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_spotter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhsusf_army_ucp_autorifleman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_autoriflemana", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_maaws", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_fso", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_jfo", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_officer", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_sniper", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1rhsusf_army_ocp_autorifleman", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1rhsusf_army_ocp_autoriflemana", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_maaws", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_jfo", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_sniper", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_fso", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_officer", _sid], 1, 20];
	};
	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {infantry_auto append inf_to_add;};
};

_v pushBack format["InfantryT%1", _level];
_t pushBack format["Infantry T%1", _level];
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack format["InfantryT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_d_machinegunner", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_machinegunner_ass", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_javelin", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_javelin_assistant", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_sniper_m107", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_sniper_m110", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_stinger", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_d_uav", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhsusf_usmc_marpat_wd_machinegunner", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_machinegunner_ass", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_javelin", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_javelin_assistant", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_sniper_m110", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_sniper_M107", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_stinger", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_usmc_marpat_wd_uav", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhsusf_army_ucp_machinegunner", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_machinegunnera", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_javelin", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_javelin_assistant", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_sniper_m107", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_sniper_m24sws", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_aa", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ucp_uav", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1rhsusf_army_ocp_machinegunner", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_machinegunnera", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_javelin", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_javelin_assistant", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_sniper_m107", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_sniper_m24sws", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_uav", _sid], 1, 20];
		inf_to_add pushBack [format["%1rhsusf_army_ocp_aa", _sid], 1, 20];
	};
	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {infantry_auto append inf_to_add;};
};

_v pushBack format["InfantryT%1", _level];
_t pushBack format["Infantry T%1", _level];
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack format["InfantryT%1", _level];

_v pushBack "Infantry";
_t pushBack "Infantry (Auto)";
_p pushBack infantry_auto;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "Infantry";

_v pushBack "InfantryAll";
_t pushBack "Infantry T0-Max";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryAll";

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];
wheeled_auto = [];
kind_wheeled = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_m998_d_4dr", _sid], 1, 20]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_m998_w_4dr", _sid], 1, 20]];
	};
	units_wheeled append mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	units_wheeled = [];	//delete unarmed vehicles if max tier allow it
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_m1025_d_m2", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1025_d_Mk19", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1043_d_m2", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1043_d_mk19", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_m1025_w_m2", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1025_w_mk19", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1043_w_m2", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1043_w_mk19", _sid], 1, 40];
	};
	units_wheeled append mot_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {wheeled_auto append mot_to_add;};
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_m1151_mk19_v1_usarmy_d", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1151_m240_v1_usarmy_d", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_m1151_mk19_v1_usarmy_wd", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1151_m240_v1_usarmy_wd", _sid], 1, 40];
	};
	units_wheeled append mot_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {wheeled_auto append mot_to_add;};
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_m1151_m2crows_usarmy_d", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1151_mk19crows_usarmy_d", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_m1151_m2crows_usarmy_wd", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_m1151_mk19crows_usarmy_wd", _sid], 1, 40];
	};
	mot_to_add pushBack [format["%1rhsusf_stryker_m1126_mk19_wd", _sid], 1, 40];
	mot_to_add pushBack [format["%1rhsusf_stryker_m1132_m2_np_wd", _sid], 1, 40];
	mot_to_add pushBack [format["%1rhsusf_stryker_m1132_m2_wd", _sid], 1, 40];
	mot_to_add pushBack [format["%1rhsusf_stryker_m1126_m2_wd", _sid], 1, 40];
	units_wheeled append mot_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {wheeled_auto append mot_to_add;};
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_M1220_M153_M2_usarmy_d", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_M1220_M153_MK19_usarmy_d", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1240a1_m2crows_usarmy_d", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_M1220_M153_M2_usarmy_wd", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_M1220_M153_MK19_usarmy_wd", _sid], 1, 40];
		mot_to_add pushBack [format["%1rhsusf_m1240a1_m2crows_usarmy_wd", _sid], 1, 40];
	};
	mot_to_add pushBack [format["%1rhsusf_stryker_m1134_wd", _sid], 1, 40];
	mot_to_add pushBack [format["%1rhsusf_stryker_m1127_m2_wd", _sid], 1, 40];
	units_wheeled append mot_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {wheeled_auto append mot_to_add;};
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1rhsusf_M1230_MK19_usarmy_d", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_M1237_MK19_usarmy_d", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1rhsusf_M1230_MK19_usarmy_wd", _sid], 1, 40]];
		mot_to_add pushBack [format["%1rhsusf_M1237_MK19_usarmy_wd", _sid], 1, 40];
	};
	units_wheeled append mot_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {wheeled_auto append mot_to_add;};
};

_v pushBack format["MotorizedT%1", _level];
_t pushBack format["Wheeled T%1", _level];
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack format["MotorizedT%1", _level];

_v pushBack "Motorized";
_t pushBack "Wheeled (Auto)";
_p pushBack wheeled_auto;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "Motorized";

_v pushBack "MotorizedAll";
_t pushBack "Wheeled T0-Max";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedAll";

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
tracked_auto = [];
kind_tracked = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1rhsusf_m113d_usarmy_unarmed", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1rhsusf_m113_usarmy_unarmed", _sid], 1, 40]];
	};
	
	units_tracked append arm_to_add;
	tracked_auto append arm_to_add;
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_tracked = [];	//delete unarmed vehicles if max tier allow it
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1rhsusf_m113d_usarmy_M240", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m113d_usarmy_MK19", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1rhsusf_m113_usarmy_M240", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m113_usarmy_MK19", _sid], 1, 40];
	};
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1rhsusf_m113d_usarmy_medical", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1rhsusf_m113_usarmy_medical", _sid], 1, 40]];
	};    
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1rhsusf_m109d_usarmy", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1rhsusf_m109_usarmy", _sid], 1, 40]];
	};
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1RHS_M2A2", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a1aimd_usarmy", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1RHS_M2A2_wd", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a1aimwd_usarmy", _sid], 1, 40];
	};
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1RHS_M2A2_BUSKI", _sid], 1, 40]];
		arm_to_add pushBack [format["%1RHS_M2A3", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a1aim_tuski_d", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1d_usarmy", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1RHS_M2A2_BUSKI_WD", _sid], 1, 40]];
		arm_to_add pushBack [format["%1RHS_M2A3_wd", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a1aim_tuski_wd", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1wd_usarmy", _sid], 1, 40];
	};

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1RHS_M2A3_BUSKI", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1tuskid_usarmy", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep2d_usarmy", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1RHS_M2A3_BUSKI_wd", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1tuskiwd_usarmy", _sid], 1, 40];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep2wd_usarmy", _sid], 1, 40];
	};

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1RHS_M2A3_BUSKIII", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1tuskiid_usarmy", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1RHS_M2A3_BUSKIII_wd", _sid], 1, 40]];
		arm_to_add pushBack [format["%1rhsusf_m1a2sep1tuskiiwd_usarmy", _sid], 1, 40];
	};

	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack format["Tracked T%1", _level];
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_v pushBack "Armored";
_t pushBack "Tracked (Auto)";
_p pushBack tracked_auto;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "Armored";

_v pushBack "ArmoredAll";
_t pushBack "Tracked T0-Max";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "ArmoredAll";

//*********************************************************************************************************************************************
//											AnitAir Vehicles																				  *
//*********************************************************************************************************************************************
//AntiAir setup for the AI groups
units_antiair = [];
antiair_to_add = [];
antiair_auto = [];
/*_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		antiair_to_add = [[format["%1CUP_B_HMMWV_Avenger_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		antiair_to_add = [[format["%1CUP_B_HMMWV_Avenger_USMC", _sid], 1, 40]];
	};
	units_antiair append antiair_to_add;
	antiair_auto append antiair_to_add;
};

_v pushBack format["AntiAirT%1", _level];
_t pushBack format["AntiAir T%1", _level];
_p pushBack antiair_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack format["AntiAirT%1", _level];*/

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [4, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		antiair_to_add = [[format["%1RHS_M6", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		antiair_to_add = [[format["%1RHS_M6_wd", _sid], 1, 40]];
	};
	units_antiair append antiair_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {antiair_auto append antiair_to_add;};
};

_v pushBack format["AntiAirT%1", _level];
_t pushBack format["AntiAir T%1", _level];
_p pushBack antiair_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack format["AntiAirT%1", _level];

_v pushBack "AntiAir";
_t pushBack "AntiAir (Auto)";
_p pushBack antiair_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAir";

_v pushBack "AntiAirAll";
_t pushBack "AntiAir T0-Max";
_p pushBack units_antiair;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAirAll";

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1RHS_MELB_MH6M", _sid], 1, 40]];
	air_to_add pushBack [format["%1RHS_MELB_H6M", _sid], 1, 40];
	
	units_air append air_to_add;
	air_auto append air_to_add;
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = []; //delete unarmed vehicles if max tier allow it
	air_to_add = [[format["%1RHS_MELB_AH6M", _sid], 1, 40]];
	
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1RHS_UH1Y_FFAR", _sid], 1, 40]];
	air_to_add pushBack [format["%1RHS_UH60M_ESSS_d", _sid], 1, 40];
	
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1RHS_UH60M_d", _sid], 1, 40]];
	air_to_add pushBack [format["%1RHS_AH1Z", _sid], 1, 40];
	air_to_add pushBack [format["%1RHS_A10", _sid], 1, 40];
	
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
/*if(_matrix_cnt >= 0) then {_level = _matrix_cnt; };
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1rhsusf_CH53e_USMC_cargo", _sid], 1, 40]];
	air_to_add pushBack [format["%1rhsusf_CH53E_USMC_GAU21", _sid], 1, 40];

	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];*/

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1RHS_AH64D", _sid], 1, 40]];
	
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET > _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];
	
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1rhsusf_f22", _sid], 1, 40]];
	
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack format["Air T%1", _level];
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];

_v pushBack "Air";
_t pushBack "Air (Auto)";
_p pushBack air_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "Air";

_v pushBack "AirAll";
_t pushBack "Air  T0-Max";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "AirAll";

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_US_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

//--- Those are used by the commander to determine the kind of unit an AI team has
if(count kind_infantry > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	} else {
		{
			kind_infantry pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	};
};
if(count kind_wheeled > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	} else {
		{
			kind_wheeled pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	};
};
if(count kind_tracked > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	} else {
		{
			kind_tracked pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	};
};
if(count kind_air > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	} else {
		{
			kind_air pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	};
};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
