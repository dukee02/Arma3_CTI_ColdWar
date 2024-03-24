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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {	
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1vn_o_men_nva_65_02", _sid], 1, 60]];			//Rifleman (SKS)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_35", _sid], 1, 40];		//Crewman (Commander)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_36", _sid], 1, 40];		//Crewman (Driver)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_37", _sid], 1, 40];		//Crewman (Gunner)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_07", _sid], 1, 40];		//Grenadier (SKS)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_08", _sid], 1, 40];		//Medic (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_03", _sid], 1, 40];		//Rifleman (SKS Bayo)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_12", _sid], 1, 40];		//Sentry (SKS Bayo)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_o_men_nva_02", _sid], 1, 60]];			//Rifleman (SKS)
		inf_to_add pushBack [format["%1vn_o_men_nva_37", _sid], 1, 40];		//Crewman (Commander)
		inf_to_add pushBack [format["%1vn_o_men_nva_38", _sid], 1, 40];		//Crewman (Driver)
		inf_to_add pushBack [format["%1vn_o_men_nva_39", _sid], 1, 40];		//Crewman (Gunner)
		inf_to_add pushBack [format["%1vn_o_men_nva_07", _sid], 1, 40];		//Grenadier (SKS)
		inf_to_add pushBack [format["%1vn_o_men_nva_08", _sid], 1, 40];		//Medic (PPS-43)
		inf_to_add pushBack [format["%1vn_o_men_nva_12", _sid], 1, 40];		//Sentry (SKS Bayo)
		inf_to_add pushBack [format["%1vn_o_men_nva_03", _sid], 1, 40];		//Rifleman (SKS Bayo)
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1vn_o_men_nva_65_11", _sid], 1, 60]];			//Machine Gunner (RPD)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_14", _sid], 1, 40];		//AT (SKS/ B41)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_06", _sid], 1, 40];		//Rifleman (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_09", _sid], 1, 40];		//Sapper (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_13", _sid], 1, 40];		//RTO (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_30", _sid], 1, 40];		//Mortar Ammo (PPS-52)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_29", _sid], 1, 40];		//Mortar gunner (PPS-43)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_31", _sid], 1, 40];		//Mortar tripod (PPS-52)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_o_men_nva_11", _sid], 1, 60]];			//Machine Gunner (RPD)
		inf_to_add pushBack [format["%1vn_o_men_nva_14", _sid], 1, 40];		//AT (SKS/ B41)
		inf_to_add pushBack [format["%1vn_o_men_nva_32", _sid], 1, 40];		//AT-3 gunner (PPS-43)
		inf_to_add pushBack [format["%1vn_o_men_nva_13", _sid], 1, 40];		//RTO (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_09", _sid], 1, 40];		//Sapper (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_06", _sid], 1, 40];		//Rifleman (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_30", _sid], 1, 40];		//Mortar Ammo (PPS52)
		inf_to_add pushBack [format["%1vn_o_men_nva_29", _sid], 1, 40];		//Mortar gunner (PPS-43)
		inf_to_add pushBack [format["%1vn_o_men_nva_31", _sid], 1, 40];		//Mortar tripod (PPS-52)
	};
	/*inf_to_add pushBack [format["%1vn_o_men_aircrew_02", _sid], 1, 40];		//Heli Co-Pilot (TT-33)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_03", _sid], 1, 40];		//Heli Crew Chief (PM)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_04", _sid], 1, 40];		//Heli Gunner (TT-33)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_01", _sid], 1, 40];		//Heli Pilot (PM)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_07", _sid], 1, 40];		//Jet Pilot (PM)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_08", _sid], 1, 40];		//Jet Pilot (TT-33)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_05", _sid], 1, 40];		//Pilot (PM)
	inf_to_add pushBack [format["%1vn_o_men_aircrew_06", _sid], 1, 40];		//Pilot (TT-33)*/
	
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
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1vn_o_men_nva_65_10", _sid], 1, 60]];			//Marksman (SKS)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_01", _sid], 1, 40];		//Officer (PPS-43)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_05", _sid], 1, 40];		//Rifleman (Type 56 Bayo)
		inf_to_add pushBack [format["%1vn_o_men_nva_65_04", _sid], 1, 40];		//Rifleman (Type 56)
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_o_men_nva_10", _sid], 1, 60]];			//Marksman (SKS)
		//inf_to_add pushBack [format["%1vn_o_men_nva_43", _sid], 1, 40];		//AA (SKS/ 9K32)
		inf_to_add pushBack [format["%1vn_o_men_nva_45", _sid], 1, 40];		//Marksman (VZ54)
		inf_to_add pushBack [format["%1vn_o_men_nva_01", _sid], 1, 40];		//Officer (PPSh-41)
		inf_to_add pushBack [format["%1vn_o_men_nva_05", _sid], 1, 40];		//Rifleman (Type 56 Bayo)
		inf_to_add pushBack [format["%1vn_o_men_nva_04", _sid], 1, 40];		//Rifleman (Type 56)
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1vn_o_wheeled_btr40_01_nva65", _sid], 1, 40]];
	
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
	mot_to_add = [[format["%1vn_o_wheeled_btr40_mg_02_nva65", _sid], 1, 40]];	
	mot_to_add pushBack [format["%1vn_o_wheeled_btr40_mg_01_nva65", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_o_wheeled_btr40_mg_04_nva65", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_o_wheeled_btr40_mg_05_nva65", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_o_wheeled_btr40_mg_06_nva65", _sid], 1, 40];
	
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

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add pushBack [format["%1vn_o_wheeled_btr40_mg_03_nva65", _sid], 1, 40];
	
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
kind_wheeled pushBack format["MotorizedT%1", _level];*/

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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	arm_to_add pushBack [format["%1vn_o_armor_m113_acav_01", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_m113_acav_03", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_m113_01", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_btr50pk_01", _sid], 1, 40];

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
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	arm_to_add pushBack [format["%1vn_o_armor_pt76a_01_nva65", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_btr50pk_02", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_m125_01", _sid], 1, 40];

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
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	arm_to_add pushBack [format["%1vn_o_armor_ot54_01_nva65", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_pt76b_01_nva65", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_type63_01_nva65", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_o_armor_m41_01", _sid], 1, 40];

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
if(CTI_ECONOMY_PRIZE_TRACKED >= _level) then {
	arm_to_add pushBack [format["%1vn_o_armor_t54b_01_nva65", _sid], 1, 40];

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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1vn_o_wheeled_z157_mg_02_nva65", _sid], 1, 40]];

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
	antiair_to_add = [[format["%1vn_o_wheeled_btr40_mg_03_nva65", _sid], 1, 40]];

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

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NVA_ID, CTI_PF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1vn_o_air_mi2_02_01", _sid], 1, 20]];
	air_to_add pushBack [format["%1vn_o_air_mi2_01_01", _sid], 1, 20];

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
	units_air = [];
	air_to_add = [[format["%1vn_o_air_mi2_03_01", _sid], 1, 20]];
	air_to_add pushBack [format["%1vn_o_air_mi2_04_05", _sid], 1, 20];
	air_to_add pushBack [format["%1vn_o_air_mig19_cas", _sid], 1, 20];

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
	air_to_add = [[format["%1vn_o_air_mi2_05_01", _sid], 1, 20]];
	air_to_add pushBack [format["%1vn_o_air_mig21_cas", _sid], 1, 20];

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_NVA_SOG.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

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
