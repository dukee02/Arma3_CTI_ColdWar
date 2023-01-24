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
inf_to_add = [];
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
};

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
};

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
};

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
};

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
};

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
/*units_antiair = [];
aa_to_add = [];

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

	units_tracked append aa_to_add;
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];
*/
//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1BWA3_Tiger_Gunpod_FZ", _sid], 1, 40]];
	air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_Heavy", _sid], 1, 40];
	air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_PARS", _sid], 1, 40];
	
	units_air append air_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1BWA3_Tiger_RMK_Heavy", _sid], 1, 40]];
	air_to_add pushBack [format["%1BWA3_Tiger_RMK_PARS", _sid], 1, 40];
	air_to_add pushBack [format["%1BWA3_Tiger_RMK_Universal", _sid], 1, 40];
	
	units_air append air_to_add;
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_BW_BWA3.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
