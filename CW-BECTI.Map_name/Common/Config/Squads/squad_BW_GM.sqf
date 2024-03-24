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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1gm_ge_army_rifleman_g3a3_parka_80_win", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1gm_ge_army_demolition_g3a4_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_g3a3_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_engineer_g3a4_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_medic_g3a3_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_radioman_g3a3_parka_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1gm_ge_army_demolition_g3a4_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_engineer_g3a4_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_medic_g3a3_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_radioman_g3a3_80_ols", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1gm_ge_army_rifleman_g3a3_parka_80_ols", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1gm_ge_army_demolition_g3a4_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_g3a3_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf44_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_engineer_g3a4_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_medic_g3a3_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_radioman_g3a3_parka_80_ols", _sid], 1, 20];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1gm_ge_army_machinegunner_mg3_parka_80_win", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_hk69a1_parka_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_hk69a1_80_ols", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1gm_ge_army_machinegunner_mg3_parka_80_ols", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_pzf84_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_antitank_assistant_g3a3_pzf84_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_hk69a1_parka_80_ols", _sid], 1, 20];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1gm_ge_army_officer_p1_parka_80_win", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_milan_parka_80_win", _sid], 1, 20];
		//inf_to_add pushBack [format["%1gm_ge_army_antiair_g3a3_fim43_parka_80_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_marksman_g3a3_parka_80_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1gm_ge_army_officer_p1_80_oli", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_milan_80_ols", _sid], 1, 20];
		//inf_to_add pushBack [format["%1gm_ge_army_antiair_g3a3_fim43_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_marksman_g3a3_80_ols", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1gm_ge_army_officer_p1_parka_80_ols", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1gm_ge_army_antitank_g3a3_milan_parka_80_ols", _sid], 1, 20];
		//inf_to_add pushBack [format["%1gm_ge_army_antiair_g3a3_fim43_parka_80_ols", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_marksman_g3a3_parka_80_ols", _sid], 1, 20];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1gm_ge_army_antitank_g36a1_milan_90_win", _sid], 1, 20]];	
		//inf_to_add pushBack [format["%1gm_ge_army_antiair_g36a1_fim43_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_demolition_g36a1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_hk69a1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_mg3_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_marksman_g3a3_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_medic_g36a1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_officer_p1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_engineer_g36a1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_radioman_g36a1_90_win", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_rifleman_g36a1_90_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1gm_ge_army_antitank_g36a1_milan_90_flk", _sid], 1, 20]];	
		//inf_to_add pushBack [format["%1gm_ge_army_antiair_g36a1_fim43_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_crew_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_demolition_g36a1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_grenadier_hk69a1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_mg3_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_marksman_g3a3_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_medic_g36a1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_officer_p1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_engineer_g36a1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_radioman_g36a1_90_flk", _sid], 1, 20];
		inf_to_add pushBack [format["%1gm_ge_army_rifleman_g36a1_90_flk", _sid], 1, 20];
	};
	units_infantry append inf_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1gm_ge_army_antitank_g36a1_pzf3_90_win", _sid], 1, 20]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1gm_ge_army_antitank_g36a1_pzf3_90_flk", _sid], 1, 20]];
	};
	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {infantry_auto append inf_to_add;};
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo_win", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_u1300l_container_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo_des", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_u1300l_container_des", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo_trp", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_u1300l_container_trp", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo_wdl", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_u1300l_container_wdl", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_u1300l_container", _sid], 1, 20];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3_win", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan_win", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command_win", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer_win", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3_des", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan_des", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command_des", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer_des", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3_trp", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan_trp", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command_trp", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer_trp", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3_wdl", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan_wdl", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command_wdl", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer_wdl", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3", _sid], 1, 40]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command", _sid], 1, 20];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer", _sid], 1, 20];	
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		mot_to_add = [[format["%1gm_ge_army_fuchsa0_reconnaissance_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1gm_ge_army_fuchsa0_reconnaissance_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1gm_ge_army_fuchsa0_reconnaissance_trp", _sid], 1, 40]];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		mot_to_add = [[format["%1gm_ge_army_fuchsa0_reconnaissance_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		mot_to_add = [[format["%1gm_ge_army_fuchsa0_reconnaissance", _sid], 1, 40]];
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
	mot_to_add = [[format["%1gm_ge_army_luchsa1", _sid], 1, 40]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		mot_to_add = [[format["%1gm_ge_army_kat1_463_mlrs_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1gm_ge_army_kat1_463_mlrs_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1gm_ge_army_kat1_463_mlrs_trp", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		mot_to_add = [[format["%1gm_ge_army_kat1_463_mlrs_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		mot_to_add = [[format["%1gm_ge_army_kat1_463_mlrs", _sid], 1, 40]];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		mot_to_add = [[format["%1gm_ge_army_luchsa2_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1gm_ge_army_luchsa2_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1gm_ge_army_luchsa2_trp", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		mot_to_add = [[format["%1gm_ge_army_luchsa2_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		mot_to_add = [[format["%1gm_ge_army_luchsa2", _sid], 1, 40]];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_command_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc_des", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_command_des", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc_trp", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_command_trp", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_command_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_command", _sid], 1, 40];
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
	arm_to_add = [[format["%1gm_ge_army_m113a1g_medic", _sid], 1, 40]];
	_c pushBack format["%", _sid];				//medic
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan_des", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan_trp", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a1a_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_marder1a1plus_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a1a_des", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_marder1a1plus_des", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a1a_trp", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_marder1a1plus_trp", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a1a_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_marder1a1plus_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a1a", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_marder1a1plus", _sid], 1, 40];
	};
	arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1", _sid], 1, 40];

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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a1a1_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2_win", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_m109g_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a1a1_des", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2_des", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_m109g_des", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a1a1_trp", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2_trp", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_m109g_trp", _sid], 1, 40];	
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a1a1_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2_wdl", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_m109g_wdl", _sid], 1, 40];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a1a1", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_m109g", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a2_win", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3_win", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1_win", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a2_des", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3_des", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1_des", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a2_trp", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3_trp", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1_trp", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a2_wdl", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3_wdl", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1_wdl", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add = [[format["%1gm_ge_army_marder1a2", _sid], 1, 40]];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3", _sid], 1, 40];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a5_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a5_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a5_trp", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a5_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		arm_to_add = [[format["%1gm_ge_army_Leopard1a5", _sid], 1, 40]];
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
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		antiair_to_add = [[format["%1gm_ge_army_gepard1a1_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		antiair_to_add = [[format["%1gm_ge_army_gepard1a1_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		antiair_to_add = [[format["%1gm_ge_army_gepard1a1_trp", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		antiair_to_add = [[format["%1gm_ge_army_gepard1a1_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		antiair_to_add = [[format["%1gm_ge_army_gepard1a1", _sid], 1, 40]];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1gm_ge_army_bo105m_vbh", _sid], 1, 40]];
	air_to_add pushBack [format["%1gm_ge_army_bo105p1m_vbh", _sid], 1, 40];
	air_to_add pushBack [format["%1gm_ge_army_bo105p1m_vbh_swooper", _sid], 1, 40];
	
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
	air_to_add = [[format["%1gm_ge_army_bo105p_pah1", _sid], 1, 40]];
	air_to_add pushBack [format["%1gm_ge_army_bo105p_pah1a1", _sid], 1, 40];
	
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_BW_GM.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

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
