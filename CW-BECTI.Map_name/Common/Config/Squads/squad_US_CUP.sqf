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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_B_USMC_Soldier_des", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Engineer_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_GL_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_SpecOps_SD_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_LAT_des", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_Light_des", _sid], 1, 20];			//unarmed ^^
		inf_to_add pushBack [format["%1CUP_B_USMC_Medic_des", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_B_USMC_Soldier", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Engineer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_GL", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_SpecOps_SD", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_LAT", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_Light", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Medic", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_UCP", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_EOD_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_GL_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Medic_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_ACOG_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_LAT_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Light_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Backpack_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_Sapper_UCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_OCP", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_EOD_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_GL_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Medic_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_ACOG_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_LAT_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Light_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Backpack_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_Sapper_OCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_OEFCP", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_EOD_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_GL_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Medic_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_ACOG_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_LAT_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Light_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Backpack_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Engineer_Sapper_OEFCP", _sid], 1, 20];
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
		inf_to_add = [[format["%1CUP_B_USMC_Soldier_AT_des", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_AR_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_MG_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_SpecOps_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_SL_des", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_B_USMC_Soldier_AT", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_AR", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_MG", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_SpecOps", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_SL", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AAT_UCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AT_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AAR_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AR_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AMG_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_MG_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_EBR_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Officer_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_SL_UCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AAT_OCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AT_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AAR_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AR_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AMG_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_MG_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_EBR_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Officer_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_SL_OCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AAT_OEFCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AAR_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AT_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AR_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AMG_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_MG_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_EBR_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Officer_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_SL_OEFCP", _sid], 1, 20];
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
		inf_to_add = [[format["%1CUP_B_USMC_Soldier_HAT_des", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_Marksman_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_AA_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Officer_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Sniper_M40A3_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Spotter_des", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_UAV_des", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_B_USMC_Soldier_HAT", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_Marksman", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Soldier_AA", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Officer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Sniper_M40A3", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_USMC_Spotter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AA_UCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AHAT_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_HAT_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_UAV_UCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AA_OCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AHAT_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_HAT_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_UAV_OCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_B_US_Soldier_AA_OEFCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_AHAT_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_HAT_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_Marksman_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Soldier_UAV_OEFCP", _sid], 1, 20];
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
		inf_to_add = [[format["%1CUP_B_USMC_Sniper_M107_des", _sid], 1, 20]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_B_USMC_Sniper_M107", _sid], 1, 20]];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_B_US_Sniper_M107_UCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_M110_TWS_UCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Spotter_UCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_B_US_Sniper_M107_OCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_M110_TWS_OCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Spotter_OCP", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_B_US_Sniper_M107_OEFCP", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1CUP_B_US_Sniper_M110_TWS_OEFCP", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_B_US_Spotter_OEFCP", _sid], 1, 20];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 6) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_Unarmed_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_Unarmed_USMC", _sid], 1, 40]];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_M1152_DSRT_USMC", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_M1151_DSRT_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Transport_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Terminal_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_SOV_M2_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_MTVR_USA", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_M1152_USMC", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_MTVR_USMC", _sid], 1, 40];
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
	units_wheeled = [];	//delete unarmed vehicles if max tier allow it
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_MK19_USA", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Crows_M2_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Crows_MK19_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_M2_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_M1114_USMC", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_MK19_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_M2_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1165_GMV_USMC", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_TOW_USA", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_M2_GPK_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1151_M2_DSRT_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1151_Deploy_DSRT_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1167_DSRT_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_LAV25_desert_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_LAV25M240_desert_USMC", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_HMMWV_TOW_USMC", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_M1151_M2_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1151_Deploy_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1151_Mk19_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1167_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_LAV25_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_LAV25M240_USMC", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_LAV25M240_green", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_M1130_CV_M2_Desert", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_M1133_MEV_Desert", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1126_ICV_M2_Desert", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1126_ICV_MK19_Desert", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1135_ATGMV_Desert", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Avenger_USA", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_M1130_CV_M2_Woodland", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_M1133_MEV_Woodland", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1126_ICV_M2_Woodland", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1135_ATGMV_Woodland", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_HMMWV_Avenger_USMC", _sid], 1, 40];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1CUP_B_RG31_Mk19_USA", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_RG31E_M2_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_RG31_M2_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_RG31_M2_GC_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1129_MC_MK19_Desert", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1128_MGS_Desert", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1CUP_B_RG31_Mk19_OD_USA", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_B_RG31E_M2_OD_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_RG31_M2_OD_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_RG31_M2_OD_GC_USA", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1129_MC_MK19_Woodland", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_B_M1128_MGS_Woodland", _sid], 1, 40];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1CUP_B_M113A1_HQ_desert_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M113A1_HQ_olive_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M113A1_HQ_USA", _sid], 1, 40]];
	};	
	arm_to_add = [[format["%1CUP_B_AAV_Unarmed_USMC", _sid], 1, 40]];
	
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
		arm_to_add = [[format["%1CUP_B_M113A1_desert_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M113A1_olive_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M113A1_USA", _sid], 1, 40]];
	};
	arm_to_add pushBack [format["%1CUP_B_AAV_USMC", _sid], 1, 70];
	
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
		arm_to_add = [[format["%1CUP_B_M113A3_desert_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M113A3_olive_USA", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M113A3_USA", _sid], 1, 40]];
	};
	arm_to_add = [[format["%1CUP_B_M163_USA", _sid], 1, 40]];
	
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
	arm_to_add = [[format["%1CUP_B_M60A3_USMC", _sid], 1, 40]];
	
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
		arm_to_add = [[format["%1CUP_B_M7Bradley_USA_D", _sid], 1, 40]];
		arm_to_add pushBack [format["%1CUP_B_M1A1_DES_US_Army", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M270_DPICM_USA", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M270_HE_USA", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M7Bradley_USA_W", _sid], 1, 40]];
		arm_to_add pushBack [format["%1CUP_B_M1A1_Woodland_US_Army", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M270_DPICM_USMC", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M270_HE_USMC", _sid], 1, 40];
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
		arm_to_add = [[format["%1CUP_B_M2Bradley_USA_D", _sid], 1, 40]];
		arm_to_add pushBack [format["%1CUP_B_M6LineBacker_USA_D", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M1A1_DES_US_Army", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M1A1SA_Desert_US_Army", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M2Bradley_USA_W", _sid], 1, 40]];
		arm_to_add pushBack [format["%1CUP_B_M6LineBacker_USA_W", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M1A1_Woodland_US_Army", _sid], 1, 40];
		arm_to_add pushBack [format["%1CUP_B_M1A1SA_Woodland_US_Army", _sid], 1, 40];
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
		arm_to_add = [[format["%1CUP_B_M2A3Bradley_USA_D", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M2A3Bradley_USA_W", _sid], 1, 40]];
	};

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1CUP_B_M1A1SA_Desert_TUSK_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_Desert_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1FEP_Desert_USMC", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M1A1SA_TUSK_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1FEP_OD_USMC", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M1A1SA_TUSK_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1FEP_Woodland_USMC", _sid], 1, 40]];
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
		arm_to_add = [[format["%1CUP_B_M1A2C_Desert_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_Desert_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1FEP_TUSK_Desert_USMC", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M1A2C_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1EP_TUSK_OD_USMC", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M1A2C_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A1EP_TUSK_Woodland_USMC", _sid], 1, 40]];
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
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_Desert_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_II_Desert_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_II_Desert_US_Army", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_II_OD_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_II_OD_US_Army", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 3) then {		//all camo active
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army", _sid], 1, 40]];
		arm_to_add = [[format["%1CUP_B_M1A2C_TUSK_II_Woodland_US_Army", _sid], 1, 40]];
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

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
kind_wheeled pushBack format["AntiAirT%1", _level];

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		antiair_to_add = [[format["%1CUP_B_M6LineBacker_USA_D", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		antiair_to_add = [[format["%1CUP_B_M6LineBacker_USA_W", _sid], 1, 40]];
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1CUP_B_MH6J_USA", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_B_MH6M_USA", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_AC47_Spooky_USA", _sid], 1, 40];
	
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
	air_to_add = [[format["%1CUP_B_UH1Y_UNA_USMC", _sid], 1, 50]];
	air_to_add pushBack [format["%1CUP_B_AH6J_USA", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_AH6M_USA", _sid], 1, 40];
	
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
	air_to_add = [[format["%1CUP_B_UH1Y_Gunship_Dynamic_USMC", _sid], 1, 40]];
	
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
	air_to_add = [[format["%1CUP_B_AH1Z_Dynamic_USMC", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_B_MH60L_DAP_2x_USN", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_MH60L_DAP_4x_USN", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_MH60L_DAP_2x_US", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_MH60L_DAP_4x_US", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_AV8B_DYN_USMC", _sid], 1, 40];
	air_to_add pushBack [format["%1CUP_B_A10_DYN_USA", _sid], 1, 40];
	
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
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; };
/*if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1CUP_B_CH53E_USMC", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_B_CH53E_VIV_USMC", _sid], 1, 40];
};*/

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1CUP_B_AH64_DL_USA", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_B_AH64D_DL_USA", _sid], 1, 40];
	
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
	air_to_add = [[format["%1CUP_B_F35B_USMC", _sid], 1, 40]];
	air_to_add pushBack [format["%1CUP_B_F35B_Stealth_USMC", _sid], 1, 40];
	
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
