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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
		inf_to_add = [[format["%1vn_b_men_cidg_06", _sid], 1, 60]];					//Rifleman
		inf_to_add pushBack [format["%1vn_b_men_cidg_02", _sid], 1, 20];			//Medic
		inf_to_add pushBack [format["%1vn_b_men_cidg_10", _sid], 1, 20];			//Medic 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_20", _sid], 1, 20];			//Medic 3
		inf_to_add pushBack [format["%1vn_b_men_cidg_14", _sid], 1, 20];			//Rifleman 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_19", _sid], 1, 20];			//Rifleman 3
		inf_to_add pushBack [format["%1vn_b_men_cidg_03", _sid], 1, 20];			//Demolitions
		inf_to_add pushBack [format["%1vn_b_men_cidg_08", _sid], 1, 20];			//Demolitions 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_07", _sid], 1, 20];			//Grenadier
		inf_to_add pushBack [format["%1vn_b_men_cidg_11", _sid], 1, 20];			//Grenadier 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_17", _sid], 1, 20];			//Grenadier 3
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_b_men_army_15", _sid], 1, 60]];					//Rifleman 1		
		inf_to_add pushBack [format["%1vn_b_men_army_16", _sid], 1, 20];			//Rifleman 2
		inf_to_add pushBack [format["%1vn_b_men_army_18", _sid], 1, 20];			//Rifleman 3
		inf_to_add pushBack [format["%1vn_b_men_army_19", _sid], 1, 20];			//Rifleman 4
		inf_to_add pushBack [format["%1vn_b_men_army_20", _sid], 1, 20];			//Rifleman 5
		inf_to_add pushBack [format["%1vn_b_men_army_21", _sid], 1, 20];			//Rifleman 6
		inf_to_add pushBack [format["%1vn_b_men_army_04", _sid], 1, 20];			//Engineer
		inf_to_add pushBack [format["%1vn_b_men_army_07", _sid], 1, 20];			//Grenadier
		inf_to_add pushBack [format["%1vn_b_men_army_17", _sid], 1, 20];			//Grenadier 2
		inf_to_add pushBack [format["%1vn_b_men_army_05", _sid], 1, 20];			//Demolitions
		inf_to_add pushBack [format["%1vn_b_men_army_03", _sid], 1, 40];			//Medic
		//inf_to_add pushBack [format["%1vn_b_men_army_22", _sid], 1, 20];			//Military Policeman
		//inf_to_add pushBack [format["%1vn_b_men_army_26", _sid], 1, 20];			//Tunnel Rat
	};
	//inf_to_add pushBack [format["%1vn_b_men_army_14", _sid], 1, 20];			//Crew (Commander)
	//inf_to_add pushBack [format["%1vn_b_men_army_13", _sid], 1, 20];			//Crew (Driver)
	//inf_to_add pushBack [format["%1vn_b_men_army_23", _sid], 1, 20];			//Crewman (Commander)
	//inf_to_add pushBack [format["%1vn_b_men_army_24", _sid], 1, 20];			//Crewman (Driver)
	//inf_to_add pushBack [format["%1vn_b_men_army_25", _sid], 1, 20];			//Crewman (Gunner)
	//inf_to_add pushBack [format["%1vn_b_men_army_29", _sid], 1, 20];			//Gun crew (Chief of Smoke)
	//inf_to_add pushBack [format["%1vn_b_men_army_31", _sid], 1, 20];			//Gun crew (Rammer)
	//inf_to_add pushBack [format["%1vn_b_men_army_30", _sid], 1, 20];			//Gun crew (Swabber)
	
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
		inf_to_add = [[format["%1vn_b_men_cidg_05", _sid], 1, 20]];					//Machine Gunner
		inf_to_add pushBack [format["%1vn_b_men_cidg_01", _sid], 1, 20];			//Squad Leader (RTO)
		inf_to_add pushBack [format["%1vn_b_men_cidg_12", _sid], 1, 20];			//Marksman
		inf_to_add pushBack [format["%1vn_b_men_cidg_15", _sid], 1, 20];			//Machine Gunner 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_16", _sid], 1, 20];			//Machine Gunner 3
		inf_to_add pushBack [format["%1vn_b_men_cidg_18", _sid], 1, 20];			//Machine Gunner 4
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_b_men_army_06", _sid], 1, 20]];					//Machine Gunner
		inf_to_add pushBack [format["%1vn_b_men_army_12", _sid], 1, 20];			//AT
		inf_to_add pushBack [format["%1vn_b_men_army_27", _sid], 1, 20];			//Machine Gunner 2
		inf_to_add pushBack [format["%1vn_b_men_army_10", _sid], 1, 20];			//Marksman
		inf_to_add pushBack [format["%1vn_b_men_army_01", _sid], 1, 20];			//Officer
		inf_to_add pushBack [format["%1vn_b_men_army_08", _sid], 1, 20];			//RTO
		inf_to_add pushBack [format["%1vn_b_men_army_02", _sid], 1, 20];			//Squad Leader
	};
	/*inf_to_add pushBack [format["%1vn_b_men_aircrew_18", _sid], 1, 20];			//Copilot
	inf_to_add pushBack [format["%1vn_b_men_aircrew_20", _sid], 1, 20];			//Door gunner
	inf_to_add pushBack [format["%1vn_b_men_aircrew_19", _sid], 1, 20];			//Ghostrider
	inf_to_add pushBack [format["%1vn_b_men_aircrew_17", _sid], 1, 20];			//Pilot
	inf_to_add pushBack [format["%1vn_b_men_aircrew_06", _sid], 1, 20];			//Copilot
	inf_to_add pushBack [format["%1vn_b_men_aircrew_07", _sid], 1, 20];			//Crew chief
	inf_to_add pushBack [format["%1vn_b_men_aircrew_08", _sid], 1, 20];			//Door gunner
	inf_to_add pushBack [format["%1vn_b_men_aircrew_26", _sid], 1, 20];			//FAC Copilot (Covey Rider)
	inf_to_add pushBack [format["%1vn_b_men_aircrew_25", _sid], 1, 20];			//FAC Pilot (Covey)
	inf_to_add pushBack [format["%1vn_b_men_aircrew_05", _sid], 1, 20];			//Pilot*/
	
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
		inf_to_add = [[format["%1vn_b_men_cidg_04", _sid], 1, 20]];					//Scout
		inf_to_add pushBack [format["%1vn_b_men_cidg_09", _sid], 1, 20];			//Scout 2
		inf_to_add pushBack [format["%1vn_b_men_cidg_21", _sid], 1, 20];			//Sniper
		inf_to_add pushBack [format["%1vn_b_men_cidg_13", _sid], 1, 20];			//Sniper (NV)
		inf_to_add pushBack [format["%1vn_b_men_cidg_22", _sid], 1, 20];			//Commander
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
		inf_to_add = [[format["%1vn_b_men_army_09", _sid], 1, 20]];					//Scout
		inf_to_add pushBack [format["%1vn_b_men_army_28", _sid], 1, 20];			//Commander
		inf_to_add pushBack [format["%1vn_b_men_army_11", _sid], 1, 20];			//Sniper
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	
	mot_to_add = [[format["%1vn_b_wheeled_m274_mg_03_01", _sid], 1, 40]];
	mot_to_add pushBack [format["%1vn_b_wheeled_m274_mg_02_01", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_b_wheeled_m274_mg_01_01", _sid], 1, 40];

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

	mot_to_add = [[format["%1vn_b_wheeled_m151_mg_06", _sid], 1, 40]];
	mot_to_add pushBack [format["%1vn_b_wheeled_m151_mg_03", _sid], 1, 40];

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
	
	mot_to_add pushBack [format["%1vn_b_wheeled_m151_mg_04", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_b_wheeled_m54_mg_01", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_b_wheeled_m54_mg_03", _sid], 1, 40];
	mot_to_add pushBack [format["%1vn_b_wheeled_m54_mg_02", _sid], 1, 40];
	
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

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	
	mot_to_add pushBack [format["%1vn_b_wheeled_m151_mg_05", _sid], 1, 40];
	
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1vn_b_armor_m113_acav_02", _sid], 1, 40]];
	arm_to_add pushBack [format["%1vn_b_armor_m113_acav_01", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_b_armor_m113_acav_03", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_b_armor_m113_acav_05", _sid], 1, 40];
	
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
	arm_to_add = [[format["%1vn_b_armor_m113_acav_04", _sid], 1, 40]];
	arm_to_add pushBack [format["%1vn_b_armor_m113_acav_06", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_b_armor_m125_01", _sid], 1, 40];
	arm_to_add pushBack [format["%1vn_b_armor_m132_01", _sid], 1, 40];
	
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
	arm_to_add = [[format["%1vn_b_armor_m67_01_01", _sid], 1, 40]];
	arm_to_add pushBack [format["%1vn_b_armor_m41_01_01", _sid], 1, 40];
	
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
	arm_to_add = [[format["%1vn_b_armor_m48_01_01", _sid], 1, 40]];
	
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
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [2, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1vn_b_wheeled_m151_mg_02", _sid], 1, 40]];
	
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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1vn_b_air_oh6a_01", _sid], 1, 40]];
	air_to_add pushBack [format["%1vn_b_air_ch34_03_01", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_ch34_01_01", _sid], 1, 40];
	
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
	air_to_add = [[format["%1vn_b_air_ch34_04_01", _sid], 1, 40]];
	air_to_add pushBack [format["%1vn_b_air_oh6a_06", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_oh6a_03", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_oh6a_02", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_uh1e_02_04", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_uh1e_03_04", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_f100d_cap", _sid], 1, 40];
	
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
	air_to_add = [[format["%1vn_b_air_uh1c_05_01", _sid], 1, 40]];
	air_to_add pushBack [format["%1vn_b_air_uh1b_01_04", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_uh1d_02_04", _sid], 1, 40];
	//air_to_add pushBack [format["%1vn_b_air_ch47_01_01", _sid], 1, 40];
	//air_to_add pushBack [format["%1vn_b_air_ch47_02_01", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_ah1g_02", _sid], 1, 40];
	air_to_add pushBack [format["%1vn_b_air_f4c_bmb", _sid], 1, 40];
	
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
	air_to_add = [[format["%1vn_b_air_ach47_05_01", _sid], 1, 40]];
	air_to_add pushBack [format["%1vn_b_air_ch47_03_01", _sid], 1, 40];
	
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
