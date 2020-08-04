_side = _this;
_sid = "";

if(_side == west) then {
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

units_infantry = [[format["%1LIB_SOV_rifleman", _sid], 1],[format["%1LIB_SOV_medic", _sid], 1, 40],[format["%1LIB_SOV_rifleman", _sid], 1, 60],[format["%1LIB_SOV_AT_grenadier", _sid], 1, 40],[format["%1LIB_SOV_scout_smgunner", _sid], 1, 40],[format["%1LIB_SOV_scout_mgunner", _sid], 1, 40],[format["%1LIB_SOV_AT_M1A1_soldier", _sid], 1, 60]];
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	units_infantry = [[format["%1LIB_SOV_Rifleman_w", _sid], 1],[format["%1LIB_SOV_Medic_w", _sid], 1, 40],[format["%1LIB_SOV_Rifleman_w", _sid], 1, 60],[format["%1LIB_SOV_AT_grenadier_w", _sid], 1, 40],[format["%1LIB_SOV_Smgunner_w", _sid], 1, 40],[format["%1LIB_SOV_Mgunner_w", _sid], 1, 40],[format["%1LIB_SOV_AT_M1A1_soldier_w", _sid], 1, 60]];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	units_infantry = [[format["%1LIB_SOV_LC_rifleman", _sid], 1],[format["%1LIB_SOV_medic", _sid], 1, 40],[format["%1LIB_SOV_LC_rifleman", _sid], 1, 60],[format["%1LIB_SOV_AT_grenadier", _sid], 1, 40],[format["%1LIB_SOV_smgunner", _sid], 1, 40],[format["%1LIB_SOV_mgunner", _sid], 1, 40],[format["%1LIB_SOV_AT_soldier", _sid], 1, 60]];
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
	units_wheeled pushBack [format["%1R71RusGreen", _sid], 1, 10];
	units_wheeled pushBack [format["%1R71RusDark", _sid], 1, 10];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_wheeled pushBack [format["%1ifa3_ba64B", _sid], 1, 40];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_to_add = [format["%1LIB_Scout_M3", _sid], 1, 50];
	units_to_add pushBack [format["%1LIB_SOV_M3_Halftrack", _sid], 1, 60];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_Scout_m3_w", _sid], 1, 50];
		units_to_add pushBack [format["%1LIB_SOV_M3_Halftrack_w", _sid], 1, 60];
	};
	units_wheeled pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	units_wheeled pushBack [format["%1ifa3_Ba10", _sid], 1, 50];
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

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	units_tracked pushBack [format["%1ifa3_t60", _sid], 1, 20];
	units_tracked pushBack [format["%1ifa3_t70m", _sid], 1, 20];
	units_to_add = [format["%1ifa3_t26", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1ifa3_t26_w", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	//units_tracked pushBack [format["%1ifa3_pz3J_sov", _sid], 1, 40];
	units_to_add = [format["%1ifa3_M4A2_SOV", _sid], 1, 30];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_M4A2_SOV_w", _sid], 1, 30];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	units_to_add = [format["%1ifa3_t34_76", _sid], 1, 80];
	units_to_add pushBack [format["%1LIB_SU85", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_T34_76_w", _sid], 1, 80];
		units_to_add pushBack [format["%1LIB_SU85_w", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	units_to_add = [format["%1LIB_T34_85", _sid], 1, 70];
	units_tracked pushBack [format["%1ifa3_kv1a", _sid], 1, 50];
	units_tracked pushBack [format["%1ifa3_kv2", _sid], 1, 20];
	units_tracked pushBack [format["%1ifa3_kv8", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_T34_85_w", _sid], 1, 70];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	units_to_add = [format["%1LIB_JS2_43", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_JS2_43_w", _sid], 1, 50];
	};
	units_tracked pushBack units_to_add;
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

if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_antiair pushBack [format["%1LIB_Zis5v_61K", _sid], 1];
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

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_i16", _sid], 1, 20];
	};
};
if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_la5", _sid], 1, 30];
	};
};
/*if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
	units_air pushBack [format["%1LIB_La7", _sid], 1, 50];
};*/
if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
	units_to_add = [format["%1LIB_P39", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_P39_w", _sid], 1, 50];
	};
	units_air pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
	units_to_add = [format["%1LIB_Pe2", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_Pe2_w", _sid], 1, 50];
	};
	units_air pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_AIR >= 5) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_il2", _sid], 1, 30];
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