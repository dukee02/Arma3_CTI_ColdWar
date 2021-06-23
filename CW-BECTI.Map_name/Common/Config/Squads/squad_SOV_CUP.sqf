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
	units_infantry = [[format["%1CUP_O_RU_Medic_VDV", _sid],1],[format["%1CUP_O_RU_Soldier_VDV", _sid],1],[format["%1CUP_O_RU_Soldier_VDV", _sid],1],[format["%1CUP_O_RU_Soldier_GL_VDV", _sid],1],[format["%1CUP_O_RU_Soldier_GL_VDV", _sid],1],[format["%1CUP_O_RU_Soldier_AT_VDV", _sid],1]];
	//if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	//	units_infantry = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1]];
	//};
		
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
	units_wheeled pushBack [format["%1CUP_O_UAZ_Open_RU", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_wheeled pushBack [format["%1CUP_O_UAZ_SPG9_RU", _sid], 1, 50];			//SPG (AT)
	units_wheeled pushBack [format["%1CUP_O_UAZ_AGS30_RU", _sid], 1, 50];			//GMG
	units_wheeled pushBack [format["%1CUP_O_UAZ_MG_RU", _sid], 1, 50];				//MG
	units_wheeled pushBack [format["%1CUP_O_UAZ_METIS_RU", _sid], 1, 50];			//Metris (ATGM)
	units_wheeled pushBack [format["%1CUP_O_BRDM2_RUS", _sid], 1, 50];				//MG + 2cm
	units_wheeled pushBack [format["%1CUP_O_BRDM2_ATGM_RUS", _sid], 1, 50];			//4x ATGM
	units_wheeled pushBack [format["%1CUP_O_BRDM2_HQ_RUS", _sid], 1, 50];			//MG		
};
if(CTI_RHS_ADDON > 0) then { _adds = 1; } else { _adds = 0; };
if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
	units_wheeled pushBack [format["%1CUP_O_Ural_RU", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		units_wheeled pushBack [format["%1CUP_O_BTR60_Winter_RU", _sid], 1, 50];	//2cm + MG	
	};
	units_wheeled pushBack [format["%1CUP_O_BTR60_RU", _sid], 1, 50];				//2cm + MG
	units_wheeled pushBack [format["%1CUP_O_BTR60_Green_RU", _sid], 1, 50];			//2cm + MG
	units_wheeled pushBack [format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid], 1, 50];		//MG front + rear
	units_wheeled pushBack [format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid], 1, 50];		//GMG + rear MG
	units_wheeled pushBack [format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid], 1, 50];		//3cm Cannon
	units_wheeled pushBack [format["%1CUP_O_GAZ_Vodnik_MedEvac_RU", _sid], 1, 50];	//Medic
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4+_adds) then {
	units_wheeled pushBack [format["%1CUP_O_BTR90_RU", _sid], 1, 50];
	units_wheeled pushBack [format["%1CUP_O_BTR90_HQ_RU", _sid], 1, 50];
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
		units_tracked pushBack [format["%1CUP_O_BMP2_RU", _sid], 1, 50];			//2cm + Metris(ATGM)
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		units_tracked pushBack [format["%1CUP_O_BMP_HQ_RU", _sid], 1, 50];			//Cannon		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		units_tracked pushBack [format["%1CUP_O_BMP3_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		units_tracked pushBack [format["%1CUP_O_T72_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		units_tracked pushBack [format["%1CUP_O_T90_RU", _sid], 1, 50];
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
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		units_antiair pushBack [format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		units_antiair pushBack [format["%1CUP_O_2S6_RU", _sid], 1, 50];
		units_antiair pushBack [format["%1CUP_O_2S6M_RU", _sid], 1, 50];
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
		units_air pushBack [format["%1CUP_O_Mi8_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		units_air pushBack [format["%1CUP_O_Mi24_P_Dynamic_RU", _sid], 1, 50];
		units_air pushBack [format["%1CUP_O_Mi24_V_Dynamic_RU", _sid], 1, 50];
		units_air pushBack [format["%1CUP_O_Su25_Dyn_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		units_air pushBack [format["%1CUP_O_Ka50_DL_RU", _sid], 1, 50];
		units_air pushBack [format["%1CUP_O_SU34_RU", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		units_air pushBack [format["%1CUP_O_Ka52_RU", _sid], 1, 50];
	};
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_CUP.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";