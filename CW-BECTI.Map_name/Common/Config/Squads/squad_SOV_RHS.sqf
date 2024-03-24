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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1rhs_vdv_des_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhs_vdv_des_rifleman_asval", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_rifleman_asval", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_rifleman_lite", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_engineer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_at", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_grenadier_rpg", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_strelok_rpg_assist", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhs_vdv_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhs_vdv_rifleman_asval", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_rifleman_lite", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_engineer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_at", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_grenadier_rpg", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_strelok_rpg_assist", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhs_vdv_mflora_rifleman", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1rhs_vdv_mflora_rifleman_lite", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_engineer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_at", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_grenadier_rpg", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_strelok_rpg_assist", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1rhs_vdv_flora_rifleman", _sid], 1, 60]];
		inf_to_add pushBack [format["%1rhs_vdv_flora_rifleman_lite", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_engineer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_medic", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_at", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_grenadier_rpg", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_strelok_rpg_assist", _sid], 1, 40];
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
		inf_to_add = [[format["%1rhs_vdv_des_efreitor", _sid], 1, 40]];
		inf_to_add pushBack [format["%1rhs_vdv_des_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_junior_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_machinegunner", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_machinegunner_assistant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_aa", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_arifleman", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_LAT", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhs_vdv_efreitor", _sid], 1, 40]];
		inf_to_add pushBack [format["%1rhs_vdv_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_junior_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_machinegunner", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_machinegunner_assistant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_aa", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_arifleman", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_rifleman_alt", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_LAT", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhs_vdv_mflora_efreitor", _sid], 1, 40]];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_junior_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_machinegunner", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_machinegunner_assistant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_aa", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_LAT", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1rhs_vdv_flora_efreitor", _sid], 1, 40]];
		inf_to_add pushBack [format["%1rhs_vdv_flora_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_junior_sergeant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_machinegunner", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_machinegunner_assistant", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_aa", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_LAT", _sid], 1, 40];
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
		inf_to_add = [[format["%1rhs_vdv_des_marksman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhs_vdv_des_marksman_asval", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_officer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_grenadier", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_des_RShG2", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1rhs_vdv_marksman_asval", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhs_vdv_marksman", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_officer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_grenadier", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_grenadier_alt", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_RShG2", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1rhs_vdv_mflora_marksman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_officer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_grenadier", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_mflora_RShG2", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1rhs_vdv_flora_marksman", _sid], 1, 20]];
		inf_to_add pushBack [format["%1rhs_vdv_flora_officer", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_grenadier", _sid], 1, 40];
		inf_to_add pushBack [format["%1rhs_vdv_flora_RShG2", _sid], 1, 40];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1rhs_gaz66_vdv", _sid], 1, 20]];
	mot_to_add pushBack [format["%1rhs_gaz66_flat_vdv", _sid], 1, 20];
	
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
	mot_to_add = [[format["%1rhs_btr60_vdv", _sid], 1, 40]];
	
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
	mot_to_add = [[format["%1RHS_BM21_VDV_01", _sid], 1, 40]];//Artytruck		
	
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
	mot_to_add = [[format["%1rhs_btr70_vdv", _sid], 1, 40]];
	
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
	mot_to_add = [[format["%1rhs_btr80_vdv", _sid], 1, 40]];
	mot_to_add pushBack [format["%1rhs_btr80a_vdv", _sid], 1, 40];
	
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
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; };
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1rhs_tigr_sts_vdv", _sid], 1, 40]];
	mot_to_add pushBack [format["%1rhs_tigr_m_vdv", _sid], 1, 40];
};
_matrix_cnt = _matrix_cnt + 1;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1rhs_9k79", _sid], 1, 40]];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1rhs_brm1k_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_bmd1k", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd1pk", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_bmp1_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_bmp1d_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmp1k_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmp1p_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd1", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd1p", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd1r", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_bmp2e_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_bmp2d_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmp2k_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd2", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd2k", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_bmd2m", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t72ba_tv", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_bmp2_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_sprut_vdv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t72bb_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80b", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80bk", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_bmd4_vdv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_bmd4m_vdv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t72bc_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80a", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80bv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80bvk", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t90_tv", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_bmd4ma_vdv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_t90a_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t90saa_tv", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_t72bd_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_t72be_tv", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80u", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80u45m", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80ue1", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80uk", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t80um", _sid], 1, 50];
	arm_to_add pushBack [format["%1rhs_t90sab_tv", _sid], 1, 50];

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
	arm_to_add = [[format["%1rhs_t90am_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_t90sm_tv", _sid], 1, 50];

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

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1rhs_t15_tv", _sid], 1, 50]];
	arm_to_add pushBack [format["%1rhs_t14_tv", _sid], 1, 50];

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
kind_tracked pushBack format["ArmoredT%1", _level];*/

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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1rhs_gaz66_zu23_vdv", _sid], 1, 40]];

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
kind_wheeled pushBack format["AntiAirT%1", _level];

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1RHS_Ural_Zu23_VDV_01", _sid], 1, 40]];

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
kind_wheeled pushBack format["AntiAirT%1", _level];

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1rhs_zsu234_aa", _sid], 1, 40]];

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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1RHS_Mi8mt_vvs", _sid], 1, 20]];

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
	air_to_add = [[format["%1RHS_Mi24P_vvs", _sid], 1, 40]];
	air_to_add pushBack [format["%1RHS_Mi8MTV3_vvs", _sid], 1, 50];
	air_to_add pushBack [format["%1RHS_Mi8AMTSh_vvs", _sid], 1, 50];
	
	units_air = [];
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
	air_to_add = [[format["%1RHS_Mi24V_vvs", _sid], 1, 50]];
	air_to_add pushBack [format["%1RHS_Mi24Vt_vvs", _sid], 1, 50];
	air_to_add pushBack [format["%1rhs_mig29s_vvs", _sid], 1, 50];

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
	air_to_add = [[format["%1rhs_ka60_grey", _sid], 1, 40]];
	air_to_add pushBack [format["%1rhs_mi28n_vvs", _sid], 1, 40];
	air_to_add pushBack [format["%1RHS_Su25SM_vvs", _sid], 1, 40];

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
	air_to_add = [[format["%1RHS_Ka52_vvs", _sid], 1, 30]];

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
	air_to_add = [[format["%1RHS_T50_vvs_generic", _sid], 1, 50]];

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

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
