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
if((CTI_MAIN_ADDON == 0 && CTI_ECONOMY_LEVEL_INFANTRY >= 3) || CTI_MAIN_ADDON == 1) then {
	units_infantry = [];

	units_infantry = [[format["%1rhs_vdv_medic", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_rifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_arifleman", _sid],1],[format["%1rhs_vdv_at", _sid],1]];
	//if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	//};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_infantry = [[format["%1rhs_vdv_des_medic", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_rifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_arifleman", _sid],1],[format["%1rhs_vdv_des_at", _sid],1]];
	};

	_v pushBack "Infantry";
	_t pushBack "Infantry";
	_p pushBack units_infantry;
	_f pushBack CTI_BARRACKS;
	_m pushBack 100;
	_c pushBack "Infantry";
	_s pushBack [];		
};

//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];

if(CTI_RHS_ADDON > 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		mot_to_add = [[format["%1rhs_uaz_vdv", _sid], 1, 50]];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		mot_to_add = [[format["%1rhs_gaz66o_vdv", _sid], 1, 50]];
		mot_to_add pushBack [format["%1rhs_zil131_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		mot_to_add pushBack [format["%1RHS_Ural_VDV_01", _sid], 1, 50];
		mot_to_add pushBack [format["%1rhs_btr60_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		mot_to_add pushBack [format["%1rhs_btr70_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
		mot_to_add pushBack [format["%1rhs_btr80_vdv", _sid], 1, 50];
		mot_to_add pushBack [format["%1rhs_btr80a_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 5) then {
		mot_to_add pushBack [format["%1rhs_tigr_sts_vdv", _sid], 1, 50];
		mot_to_add pushBack [format["%1rhs_tigr_sts_3camo_vdv", _sid], 1, 50];
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



//Tracked setup for the AI groups
units_tracked = [];

if(CTI_RHS_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		units_tracked pushBack [format["%1rhs_bmp2e_vdv", _sid], 1, 50];//2cm + Metris(ATGM) outside
		units_tracked pushBack [format["%1rhs_bmp2_vdv", _sid], 1, 50];//2cm + Metris(ATGM) outside
		units_tracked pushBack [format["%1rhs_bmp2d_vdv", _sid], 1, 50];//2cm + Metris(ATGM) outside
		units_tracked pushBack [format["%1rhs_bmp2k_vdv", _sid], 1, 50];//2cm + Metris(ATGM) outside
		units_tracked pushBack [format["%1rhs_prp3_vdv", _sid], 1, 50];//MG		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		units_tracked pushBack [format["%1rhs_bmp1p_vdv", _sid], 1, 50];//MG + Cannon + Metris(ATGM) outside
		units_tracked pushBack [format["%1rhs_bmp1_vdv", _sid], 1, 50];//MG + Cannon + ATGM
		units_tracked pushBack [format["%1rhs_bmp1d_vdv", _sid], 1, 50];//MG + Cannon + ATGM
		units_tracked pushBack [format["%1rhs_bmp1k_vdv", _sid], 1, 50];//MG + Cannon + ATGM
		units_tracked pushBack [format["%1rhs_brm1k_vdv", _sid], 1, 50];//MG + Cannon
		units_tracked pushBack [format["%1rhs_zsu234_aa", _sid], 1, 50];//4x 2cm AA		
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		units_tracked pushBack [format["%1rhs_sprut_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		units_tracked pushBack [format["%1rhs_t72ba_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t72bb_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t72bc_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd1", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd1k", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd1pk", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
		units_tracked pushBack [format["%1rhs_t80", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80b", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80bk", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd1p", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd1r", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd2", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd2k", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd2m", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 5) then {
		units_tracked pushBack [format["%1rhs_bmd4_vdv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd4m_vdv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_bmd4ma_vdv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t72bd_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t72be_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80a", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80bv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80bvk", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80u", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80u45m", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80ue1", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80uk", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t80um", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90a_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90am_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90saa_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90sab_tv", _sid], 1, 50];
		units_tracked pushBack [format["%1rhs_t90sm_tv", _sid], 1, 50];
		//units_tracked pushBack [format["%1rhs_t14_tv", _sid], 1, 50];		//activate or not?
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

if(CTI_RHS_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		units_antiair pushBack [format["%1rhs_gaz66_zu23_vdv", _sid], 1, 40];
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		units_antiair pushBack [format["%1RHS_Ural_Zu23_VDV_01", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		units_antiair pushBack [format["%1rhs_zsu234_aa", _sid], 1, 60];
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

if(CTI_RHS_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		//units_air pushBack [format["%1RHS_Mi8MTV3_vdv", _sid], 1, 50];
		//units_air pushBack [format["%1RHS_Mi8mtv3_Cargo_vdv", _sid], 1, 50];
		units_air pushBack [format["%1RHS_Mi8MTV3_heavy_vdv", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		units_air pushBack [format["%1RHS_Mi24P_vdv", _sid], 1, 50];
		units_air pushBack [format["%1RHS_Mi24V_vdv", _sid], 1, 50];
		units_air pushBack [format["%1rhs_mi28n_vvsc", _sid], 1, 50];
		units_air pushBack [format["%1rhs_mi28n_vvs", _sid], 1, 50];
		units_air pushBack [format["%1RHS_Su25SM_vvsc", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		units_air pushBack [format["%1RHS_Ka52_vvsc", _sid], 1, 50];
		units_air pushBack [format["%1rhs_mig29s_vvsc", _sid], 1, 50];
		units_air pushBack [format["%1rhs_mig29sm_vvsc", _sid], 1, 50];
	};
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV_RHS.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";