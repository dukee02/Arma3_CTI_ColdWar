_side = _this;
_sid = "";
_level = -1;

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
};
if(CTI_VIO_ADDON == 0) then {_sid = "";};*/

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

if(CTI_UPGRADE_MODE < 1) then {
	//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["InfantryCUP", 2, 40]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["MotorizedCUP", 2, 60]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAirCUP", 1, 20], ["ArmoredMBTCUP", 2, 80]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["AirCUP", 1, 40]]];

	missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["InfantryCUP", "MotorizedCUP", "ArmoredMBTCUP"]];

	//--- Those are used by the commander to determine the kind of unit an AI team has
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["InfantryCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["MotorizedCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAirCUP", "ArmoredMBTCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["AirCUP"]];
} else {
	//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]	
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side]) + [["InfantryCUP", 2, 40]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side]) + [["MotorizedCUP", 2, 60]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side]) + [["AntiAirCUP", 1, 20], ["ArmoredMBTCUP", 2, 80]]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_CATEGORY_AIR", _side]) + [["AirCUP", 1, 40]]];

	missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_TOWN_DEFENSE", _side]) + ["InfantryCUP", "MotorizedCUP", "ArmoredMBTCUP"]];

	//--- Those are used by the commander to determine the kind of unit an AI team has
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_KIND_INFANTRY", _side]) + ["InfantryCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_KIND_LIGHT", _side]) + ["MotorizedCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_KIND_HEAVY", _side]) + ["AntiAirCUP", "ArmoredMBTCUP"]];
	missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], (missionNamespace getVariable format["CTI_SQUADS_%1_KIND_AIR", _side]) + ["AirCUP"]];
}; 

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];
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
};

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
};

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
};

_v pushBack "InfantryCUP";
_t pushBack "[CUP] Infantry";
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
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_UAZ_SPG9_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_UAZ_AGS30_RU", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_UAZ_MG_RU", _sid], 1, 40];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 40]];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_UAZ_METIS_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_BRDM2_RUS", _sid], 1, 40];
	mot_to_add pushBack [format["%1CUP_O_BRDM2_HQ_RUS", _sid], 1, 40];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_BRDM2_ATGM_RUS", _sid], 1, 40]];
	units_wheeled append mot_to_add;
};

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
};

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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_BTR90_RU", _sid], 1, 40]];
	mot_to_add pushBack [format["%1CUP_O_BTR90_HQ_RU", _sid], 1, 40];
	units_wheeled append mot_to_add;
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid], 1, 40]];
		mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_KPVT_RU", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid], 1, 40];
		mot_to_add pushBack [format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid], 1, 40];
	units_wheeled append mot_to_add;
};

_v pushBack "MotorizedCUP";
_t pushBack "[CUP] Motorized";
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
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		units_tracked pushBack [format["%1CUP_O_MTLB_pk_Winter_RU", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		units_tracked pushBack [format["%1CUP_O_MTLB_pk_Green_RU", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		units_tracked pushBack [format["%1CUP_O_MTLB_pk_WDL_RU", _sid], 1, 50];
	};
	units_tracked pushBack [format["%1CUP_O_BMP_HQ_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_tracked pushBack [format["%1CUP_O_BMP2_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_tracked pushBack [format["%1CUP_O_BMP3_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_tracked pushBack [format["%1CUP_O_T72_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_tracked pushBack [format["%1CUP_O_T90_RU", _sid], 1, 50];
};

_v pushBack "ArmoredMBTCUP";
_t pushBack "[CUP] Tanks";
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair = [[format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 40]];
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair pushBack [format["%1CUP_O_UAZ_AA_RU", _sid], 1, 40];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	units_antiair pushBack [format["%1CUP_O_2S6_RU", _sid], 1, 40];
	units_antiair pushBack [format["%1CUP_O_2S6M_RU", _sid], 1, 40];
};

_v pushBack "AntiAirCUP";
_t pushBack "[CUP] AntiAir";
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
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1CUP_O_Mi8AMT_RU", _sid], 1, 20]];
	units_air pushBack [format["%1CUP_O_Mi8_VIV_RU", _sid], 1, 20];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air = [[format["%1CUP_O_Mi8_RU", _sid], 1, 40]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1CUP_O_Mi24_P_Dynamic_RU", _sid], 1, 50];
	units_air pushBack [format["%1CUP_O_Mi24_V_Dynamic_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1CUP_O_Ka50_DL_RU", _sid], 1, 30];
	units_air pushBack [format["%1CUP_O_Ka60_Grey_RU", _sid], 1, 30];
	units_air pushBack [format["%1CUP_O_Su25_Dyn_RU", _sid], 1, 50];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1CUP_O_Ka52_RU", _sid], 1, 30];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	units_air pushBack [format["%1CUP_O_SU34_RU", _sid], 1, 50];
};

_v pushBack "AirCUP";
_t pushBack "[CUP] Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";