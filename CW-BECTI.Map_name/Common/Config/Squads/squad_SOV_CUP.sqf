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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {	
		//units_infantry pushBack [format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid], 1, 60];	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Exp_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Medic_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_LAT_Ratnik_Winter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Exp_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Medic_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_LAT_Ratnik_Desert", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Saiga_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_Ratnik_Autumn", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Exp_Ratnik_Autumn", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Medic_Ratnik_Autumn", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Ratnik_Autumn", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_LAT_Ratnik_Autumn", _sid], 1, 20];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_Ratnik_BeigeDigital", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Exp_Ratnik_BeigeDigital", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Medic_Ratnik_BeigeDigital", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Ratnik_BeigeDigital", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_LAT_Ratnik_BeigeDigital", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid], 1, 60]];	
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Exp_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Repair_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Exp_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Medic_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_LAT_Ratnik_Summer", _sid], 1, 20];
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
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AAR_Ratnik_Winter", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AR_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Marksman_Ratnik_Winter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AAR_Ratnik_Desert", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AR_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_Marksman_Ratnik_Desert", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AR_M_EMR_V2", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAR_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Officer_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AAR_Ratnik_Autumn", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AR_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Marksman_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_Ratnik_Autumn", _sid], 1, 20];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AAR_Ratnik_BeigeDigital", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Marksman_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AAR_Ratnik_Summer", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AR_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AAT_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AT_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Survivor_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_Marksman_Ratnik_Summer", _sid], 1, 20];
	};
	//inf_to_add pushBack [format["%1CUP_O_RU_Pilot_M_EMR", _sid], 1, 20];
	
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
		inf_to_add = [[format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid], 1, 10]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_Ratnik_Winter", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_Ratnik_Winter", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_TL_Ratnik_Winter", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid], 1, 10]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_Ratnik_Desert", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_Ratnik_Desert", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_TL_Ratnik_Desert", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		inf_to_add = [[format["%1CUP_O_RU_Spotter_M_EMR", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Sniper_M_EMR", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Sniper_KSVK_M_EMR", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid], 1, 10];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AHAT_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_M_EMR_V2", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_M_EMR_V2", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Autumn", _sid], 1, 40]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_Ratnik_Autumn", _sid], 1, 20];
		//inf_to_add pushBack [format["%1CUP_O_RU_Recon_TL_Ratnik_Autumn", _sid], 1, 20];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		inf_to_add = [[format["%1CUP_O_RU_Soldier_AHAT_Ratnik_BeigeDigital", _sid], 1, 20]];
		inf_to_add pushBack [format["%1CUP_O_RU_Recon_TL_Ratnik_BeigeDigital", _sid], 1, 10];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid], 1, 10];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_Ratnik_BeigeDigital", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		inf_to_add = [[format["%1CUP_O_RU_Recon_TL_Ratnik_Summer", _sid], 1, 10]];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid], 1, 10];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_HAT_Ratnik_Summer", _sid], 1, 20];
		inf_to_add pushBack [format["%1CUP_O_RU_Soldier_AA_Ratnik_Summer", _sid], 1, 20];
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_UAZ_SPG9_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_UAZ_AGS30_RU", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_UAZ_MG_RU", _sid], 1, 40];
	
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
	mot_to_add = [[format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 40]];
	
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
	mot_to_add = [[format["%1CUP_O_UAZ_METIS_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_BRDM2_RUS", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_BRDM2_HQ_RUS", _sid], 1, 40];
	
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
	mot_to_add = [[format["%1CUP_O_BRDM2_ATGM_RUS", _sid], 1, 40]];
	
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
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1CUP_O_BTR60_Winter_RU", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		mot_to_add = [[format["%1CUP_O_BTR60_Green_RU", _sid], 1, 40]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		mot_to_add = [[format["%1CUP_O_BTR60_RU", _sid], 1, 40]];
	};
	mot_to_add pushBack [format["%1CUP_O_BM21_RU", _sid], 1, 40];
	
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
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; };
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
	_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
};*/
_matrix_cnt = _matrix_cnt + 1;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		mot_to_add = [[format["%1CUP_O_BTR80_WINTER_RU", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_O_BTR80A_WINTER_RU", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		mot_to_add = [[format["%1CUP_O_BTR80_DESERT_RU", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_O_BTR80A_DESERT_RU", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//main camo active
		mot_to_add = [[format["%1CUP_O_BTR80_CAMO_RU", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_O_BTR80A_CAMO_RU", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_O_BTR80_GREEN_RU", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_O_BTR80A_GREEN_RU", _sid], 1, 40];
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
	mot_to_add = [[format["%1CUP_O_BTR90_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_BTR90_HQ_RU", _sid], 1, 40];
	
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
	mot_to_add = [[format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_KPVT_RU", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid], 1, 40];
	
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		arm_to_add = [[format["%1CUP_O_MTLB_pk_Winter_RU", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		arm_to_add = [[format["%1CUP_O_MTLB_pk_Green_RU", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		arm_to_add = [[format["%1CUP_O_MTLB_pk_WDL_RU", _sid], 1, 50]];
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
	arm_to_add = [[format["%1CUP_O_BMP2_RU", _sid], 1, 50]];

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
	arm_to_add = [[format["%1CUP_O_BMP3_RU", _sid], 1, 50]];

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
	arm_to_add = [[format["%1CUP_O_T72_RU", _sid], 1, 50]];

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
	arm_to_add = [[format["%1CUP_O_T90_RU", _sid], 1, 50]];

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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 40]];

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

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1CUP_O_UAZ_AA_RU", _sid], 1, 40]];

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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	antiair_to_add = [[format["%1CUP_O_2S6_RU", _sid], 1, 40]];
	antiair_to_add pushBack [format["%1CUP_O_2S6M_RU", _sid], 1, 40];

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
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1CUP_O_Mi8AMT_RU", _sid], 1, 20]];
	air_to_add pushBack [format["%1CUP_O_Mi8_VIV_RU", _sid], 1, 20];

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
	air_to_add = [[format["%1CUP_O_Mi8_RU", _sid], 1, 40]];
	
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
	air_to_add = [[format["%1CUP_O_Mi24_P_Dynamic_RU", _sid], 1, 50]];
	air_to_add pushBack [format["%1CUP_O_Mi24_V_Dynamic_RU", _sid], 1, 50];

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
	air_to_add = [[format["%1CUP_O_Ka50_DL_RU", _sid], 1, 30]];
	air_to_add pushBack [format["%1CUP_O_Ka60_Grey_RU", _sid], 1, 30];
	air_to_add pushBack [format["%1CUP_O_Su25_Dyn_RU", _sid], 1, 50];

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
	air_to_add = [[format["%1CUP_O_Ka52_RU", _sid], 1, 30]];

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
	air_to_add = [[format["%1CUP_O_SU34_RU", _sid], 1, 50]];

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
