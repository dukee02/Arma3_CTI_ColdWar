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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		inf_to_add = [[format["%1BWA3_Rifleman_Tropen", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1BWA3_Rifleman_lite_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Medic_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Engineer_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Grenadier_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG3_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_CG_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Pioneer_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Radioman_Tropen", _sid], 1, 20];	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		inf_to_add = [[format["%1BWA3_Rifleman_Fleck", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1BWA3_Rifleman_lite_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Medic_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Engineer_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Grenadier_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG3_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_CG_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Pioneer_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Radioman_Fleck", _sid], 1, 20];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1BWA3_Rifleman_Multi", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1BWA3_Rifleman_lite_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Medic_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Engineer_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Grenadier_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG3_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_CG_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Pioneer_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Radioman_Multi", _sid], 1, 20];
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
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG4_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Medic_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_LAT_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Marksman_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Tank_Commander_Tropen", _sid], 1, 20];		
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		inf_to_add = [[format["%1BWA3_RiflemanAT_RGW90_Fleck", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG4_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Marksman_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Medic_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_LAT_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Marksman_Fleck", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1BWA3_RiflemanAT_RGW90_Multi", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG4_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Marksman_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Medic_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_LAT_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_recon_Marksman_Multi", _sid], 1, 20];
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
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		//declared in BWadd, maybe fallback if BWadd not active?
	//};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		inf_to_add = [[format["%1BWA3_Grenadier_G27_Tropen", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG5_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Rifleman_G27_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Rifleman_G28_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G29_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G82_Tropen", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Spotter_Tropen", _sid], 1, 20];
		//inf_to_add pushBack [format["%1BWA3_RiflemanAA_Fliegerfaust_Tropen", _sid], 1, 20];					
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//Jungle camo active
		inf_to_add = [[format["%1BWA3_Grenadier_G27_Fleck", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG5_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_PzF3_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Rifleman_G27_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Rifleman_G28_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G29_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G82_Fleck", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Spotter_Fleck", _sid], 1, 20];
		//inf_to_add pushBack [format["%1BWA3_RiflemanAA_Fliegerfaust_Fleck", _sid], 1, 20];	
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
		inf_to_add = [[format["%1BWA3_Grenadier_G27_Multi", _sid], 1, 20]];	
		inf_to_add pushBack [format["%1BWA3_MachineGunner_MG5_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_RiflemanAT_PzF3_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Rifleman_G27_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G29_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Sniper_G82_Multi", _sid], 1, 20];
		inf_to_add pushBack [format["%1BWA3_Spotter_Multi", _sid], 1, 20];
		//inf_to_add pushBack [format["%1BWA3_RiflemanAA_Fliegerfaust_Multi", _sid], 1, 20];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1BWA3_Dingo2_FLW100_MG3_Tropen", _sid], 1, 40]];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_M2_Tropen", _sid], 1, 20];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_GMW_Tropen", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1BWA3_Dingo2_FLW100_MG3_Fleck", _sid], 1, 40]];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_M2_Fleck", _sid], 1, 20];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_GMW_Fleck", _sid], 1, 20];
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
		mot_to_add = [[format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid], 1, 40]];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid], 1, 20];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid], 1, 20];	
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		mot_to_add = [[format["%1BWA3_Dingo2_FLW100_MG3_CG13_Tropen", _sid], 1, 40]];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Tropen", _sid], 1, 20];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Tropen", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		mot_to_add = [[format["%1BWA3_Dingo2_FLW100_MG3_CG13_Fleck", _sid], 1, 40]];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_M2_CG13_Fleck", _sid], 1, 20];
		mot_to_add pushBack [format["%1BWA3_Dingo2_FLW200_GMW_CG13_Fleck", _sid], 1, 20];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1BWA3_Puma_Tropen", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1BWA3_Puma_Fleck", _sid], 1, 40]];
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		arm_to_add = [[format["%1BWA3_Panzerhaubitze2000_Tropen", _sid], 1, 10]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1BWA3_Panzerhaubitze2000_Fleck", _sid], 1, 10]];
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
		arm_to_add = [[format["%1BWA3_Leopard2_Tropen", _sid], 1, 60]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		arm_to_add = [[format["%1BWA3_Leopard2_Fleck", _sid], 1, 60]];
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
/*
units_antiair = [];
antiair_to_add = [];
antiair_auto = [];

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		aa_to_add = [[format["%1gm_ge_army_gepard1a1_win", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		aa_to_add = [[format["%1gm_ge_army_gepard1a1_des", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		aa_to_add = [[format["%1gm_ge_army_gepard1a1_trp", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		aa_to_add = [[format["%1gm_ge_army_gepard1a1_wdl", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
		aa_to_add = [[format["%1gm_ge_army_gepard1a1", _sid], 1, 40]];
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
*/
//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1BWA3_Tiger_Gunpod_Heavy", _sid], 1, 40]];
	//air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_FZ", _sid], 1, 40];
	//air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_PARS", _sid], 1, 40];
	
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
	air_to_add = [[format["%1BWA3_Tiger_RMK_PARS", _sid], 1, 40]];
	//air_to_add pushBack [format["%1BWA3_Tiger_RMK_Universal", _sid], 1, 40];
	//air_to_add pushBack [format["%1BWA3_Tiger_RMK_Heavy", _sid], 1, 40];
	
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_BW_BWA3.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

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
