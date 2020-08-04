_side = _this;
_sid = "";
_adds = 0;

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
units_infantry = [];

units_infantry = [[format["%1gm_gc_army_medic_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_str", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_str", _sid],1]];
if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
	units_infantry = [[format["%1gm_gc_army_medic_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_rifleman_mpiak74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_demolition_mpiaks74n_80_win", _sid],1],[format["%1gm_gc_army_antitank_mpiak74n_rpg7_80_win", _sid],1]];
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

//Level start
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	units_wheeled pushBack [format["%1gm_gc_army_p601", _sid], 1, 50];
};
//Level 1 if RHS is not active, else Level 2
if(CTI_RHS_ADDON > 0) then { _adds = 1; } else { _adds = 0; };
if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
	units_wheeled pushBack [format["%1gm_gc_army_ural44202", _sid], 1, 50];
};	
//Level 1
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_wheeled pushBack [format["%1gm_gc_army_brdm2", _sid], 1, 50];//MG + 2cm		
};
//Level 2
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_wheeled pushBack [format["%1gm_gc_army_btr60pb", _sid], 1, 50];//MG + 2cm		
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

//Start
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	units_tracked pushBack [format["%1gm_gc_army_bmp1sp2", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	units_tracked pushBack [format["%1gm_gc_army_zsu234v1", _sid], 1, 50];
	units_tracked pushBack [format["%1gm_gc_army_pt76b", _sid], 1, 50];
	units_tracked pushBack [format["%1gm_gc_army_t55", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	units_tracked pushBack [format["%1gm_gc_army_t55a", _sid], 1, 50];
	units_tracked pushBack [format["%1gm_gc_army_t55ak", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	units_tracked pushBack [format["%1gm_gc_army_t55am2", _sid], 1, 50];
	units_tracked pushBack [format["%1gm_gc_army_t55am2b", _sid], 1, 50];
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

if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	units_antiair pushBack [format["%1gm_gc_army_zsu234v1", _sid], 1, 50];
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

if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
	units_air pushBack [format["%1gm_gc_airforce_mi2urn", _sid], 1, 50];
	units_air pushBack [format["%1gm_gc_airforce_mi2us", _sid], 1, 50];
};
if(CTI_LEN_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		units_air pushBack [format["%1len_l39_nva", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
		units_air pushBack [format["%1len_mi24d_AT_nva", _sid], 1, 50];
		units_air pushBack [format["%1len_mi24p_AT_nva", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		units_air pushBack [format["%1len_mig29a_01_nva", _sid], 1, 50];
	};
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_SOV.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";