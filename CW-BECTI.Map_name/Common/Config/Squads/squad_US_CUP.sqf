_side = _this;
_sid = "";

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

//Infantry setup for the AI groups
units_infantry = [];
if((CTI_MAIN_ADDON == 0 && CTI_ECONOMY_LEVEL_INFANTRY >= 3) || CTI_MAIN_ADDON == 1 || CTI_MAIN_ADDON == -1) then {
	units_infantry = [[format["%1CUP_B_USMC_Medic", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_GL", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT", _sid],1]];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_infantry = [[format["%1CUP_B_USMC_Medic_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_GL_des", _sid],1],[format["%1CUP_B_USMC_Soldier_LAT_des", _sid],1]];
	};
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];

//Wheeled setup for the AI groups
units_wheeled = [];
units_to_add = [];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_to_add = [[format["%1CUP_B_HMMWV_Unarmed_USA", _sid], 1, 50]];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [[format["%1CUP_B_HMMWV_Unarmed_USMC", _sid], 1, 50]];
	};
	units_wheeled pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_to_add = [[format["%1CUP_B_HMMWV_MK19_USMC", _sid], 1, 50]];
	units_to_add pushBack [format["%1CUP_B_HMMWV_M2_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_HMMWV_M1114_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1165_GMV_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_HMMWV_TOW_USMC", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [[format["%1CUP_B_HMMWV_MK19_USA", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_HMMWV_Crows_MK19_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_HMMWV_M2_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_HMMWV_Crows_M2_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_HMMWV_SOV_M2_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1165_GMV_DSRT_USMC", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_HMMWV_TOW_USA", _sid], 1, 50];
	};	
	units_wheeled pushBack units_to_add;	
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_to_add = [[format["%1CUP_B_M1151_Mk19_USMC", _sid], 1, 50]];
	units_to_add pushBack [format["%1CUP_B_M1151_M2_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1167_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_LAV25_USMC", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_LAV25M240_USMC", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [[format["%1CUP_B_M1151_Mk19_DSRT_USMC", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_M1151_M2_DSRT_USMC", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_HMMWV_M2_GPK_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1167_DSRT_USMC", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_LAV25_desert_USMC", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_LAV25M240_desert_USMC", _sid], 1, 50];
	};
	units_wheeled pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	units_to_add = [[format["%1CUP_B_M1130_CV_M2_Woodland", _sid], 1, 50]];
	units_to_add pushBack [format["%1CUP_B_M1126_ICV_M2_Woodland", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1126_ICV_MK19_Woodland", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1135_ATGMV_Woodland", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [[format["%1CUP_B_M1130_CV_M2_Desert", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_M1126_ICV_M2_Desert", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1126_ICV_MK19_Desert", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1135_ATGMV_Desert", _sid], 1, 50];
	};
	units_wheeled pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	units_to_add = [[format["%1CUP_B_RG31_Mk19_USA", _sid], 1, 50]];
	units_to_add pushBack [format["%1CUP_B_RG31E_M2_USA", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_RG31_M2_USA", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_RG31_M2_GC_USA", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1129_MC_MK19_Woodland", _sid], 1, 50];
	units_to_add pushBack [format["%1CUP_B_M1128_MGS_Woodland", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [[format["%1CUP_B_RG31_Mk19_OD_USA", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_RG31E_M2_OD_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_RG31_M2_OD_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_RG31_M2_OD_GC_USA", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1129_MC_MK19_Desert", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_B_M1128_MGS_Desert", _sid], 1, 50];
	};
	units_wheeled pushBack units_to_add;
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];



//Tracked setup for the AI groups
units_tracked = [];

if(CTI_CUP_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		units_to_add = [[format["%1CUP_B_M113_USA", _sid], 1, 40]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_M113_desert_USA", _sid], 1, 40]];
		};
		units_tracked pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		units_to_add = [[format["%1CUP_B_AAV_USMC", _sid], 1, 30]];
		units_to_add pushBack [format["%1CUP_B_M163_USA", _sid], 1, 40];
		units_tracked pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		units_to_add = [[format["%1CUP_B_M60A3_USMC", _sid], 1, 70]];
		units_tracked pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		units_to_add = [[format["%1CUP_B_M7Bradley_USA_W", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_M1A1_Woodland_US_Army", _sid], 1, 70];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_M7Bradley_USA_D", _sid], 1, 50]];
			units_to_add pushBack [format["%1CUP_B_M1A1_DES_US_Army", _sid], 1, 70];
		};
		units_tracked pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		units_to_add = [[format["%1CUP_B_M2Bradley_USA_W", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_B_M1A2_TUSK_MG_US_Army", _sid], 1, 60];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_M2Bradley_USA_D", _sid], 1, 50]];
			units_to_add pushBack [format["%1CUP_B_M1A2_TUSK_MG_DES_US_Army", _sid], 1, 60];
		};
		units_tracked pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		units_to_add = [[format["%1CUP_B_M2A3Bradley_USA_W", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_M2A3Bradley_USA_D", _sid], 1, 50]];
		};
		units_tracked pushBack units_to_add;
	};
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];


//AntiAir setup for the AI groups
units_antiair = [];

if(CTI_CUP_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		units_to_add = [[format["%1CUP_B_HMMWV_Avenger_USMC", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_HMMWV_Avenger_USA", _sid], 1, 50]];
		};
		units_antiair pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		units_to_add = [[format["%1CUP_B_M6LineBacker_USA_W", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_to_add = [[format["%1CUP_B_M6LineBacker_USA_D", _sid], 1, 50]];
		};
		units_antiair pushBack units_to_add;
	};
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];


//Air setup for the AI groups
units_air = [];

if(CTI_CUP_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		units_to_add = [[format["%1CUP_O_Mi8_RU", _sid], 1, 50]];
		units_air pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		units_to_add = [[format["%1CUP_O_Mi24_P_Dynamic_RU", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_O_Mi24_V_Dynamic_RU", _sid], 1, 50];
		units_to_add pushBack [format["%1CUP_O_Su25_Dyn_RU", _sid], 1, 50];
		units_air pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		units_to_add = [[format["%1CUP_O_Ka50_DL_RU", _sid], 1, 50]];
		units_to_add pushBack [format["%1CUP_O_SU34_RU", _sid], 1, 50];
		units_air pushBack units_to_add;
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		units_to_add = [[format["%1CUP_O_Ka52_RU", _sid], 1, 50]];
		units_air pushBack units_to_add;
	};
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_US_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";