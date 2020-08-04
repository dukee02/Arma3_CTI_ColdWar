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

units_infantry = [[format["%1LIB_UK_Rifleman", _sid], 1],[format["%1LIB_UK_Medic", _sid], 1, 40],[format["%1LIB_UK_Rifleman", _sid], 1, 60],[format["%1LIB_UK_Grenadier", _sid], 1, 40],[format["%1LIB_UK_Corporal", _sid], 1, 40],[format["%1LIB_UK_LanceCorporal", _sid], 1, 40],[format["%1LIB_UK_AT_Soldier", _sid], 1, 60]];
if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	units_infantry = [[format["%1LIB_UK_Rifleman_w", _sid], 1],[format["%1LIB_UK_Medic_w", _sid], 1, 40],[format["%1LIB_UK_Rifleman_w", _sid], 1, 60],[format["%1LIB_UK_Grenadier_w", _sid], 1, 40],[format["%1LIB_UK_Corporal_w", _sid], 1, 40],[format["%1LIB_UK_LanceCorporal_w", _sid], 1, 40],[format["%1LIB_UK_AT_Soldier_w", _sid], 1, 60]];
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	units_infantry = [[format["%1LIB_UK_DR_Rifleman", _sid], 1],[format["%1LIB_UK_DR_Medic", _sid], 1, 40],[format["%1LIB_UK_DR_Rifleman", _sid], 1, 60],[format["%1LIB_UK_DR_Grenadier", _sid], 1, 40],[format["%1LIB_UK_DR_Corporal", _sid], 1, 40],[format["%1LIB_UK_DR_LanceCorporal", _sid], 1, 40],[format["%1LIB_UK_DR_AT_Soldier", _sid], 1, 60]];
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
	units_to_add = [format["%1LIB_UniversalCarrier", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_UniversalCarrier_w", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_UniversalCarrier_desert", _sid], 1, 50];
	};
	units_wheeled pushBack units_to_add;
};

if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
	units_to_add = [format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 50];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 50];
	};
	units_wheeled pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
	units_to_add = [format["%1LIB_UK_M3_Halftrack", _sid], 1, 50];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_M3_Halftrack", _sid], 1, 50];
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

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	units_to_add = [format["%1LIB_Churchill_Mk7", _sid], 1, 40];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_Churchill_Mk7_w", _sid], 1, 40];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_Churchill_Mk7_desert", _sid], 1, 40];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
	units_to_add = [format["%1LIB_Churchill_Mk7", _sid], 1, 60];
	units_to_add pushBack [format["%1LIB_Churchill_Mk7_AVRE", _sid], 1, 30];
	units_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile", _sid], 1, 20];
	units_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_Churchill_Mk7_w", _sid], 1, 60];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_AVRE_w", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile_w", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer_w", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_Churchill_Mk7_desert", _sid], 1, 60];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_AVRE_desert", _sid], 1, 30];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_Crocodile_desert", _sid], 1, 20];
		units_to_add pushBack [format["%1LIB_Churchill_Mk7_Howitzer_desert", _sid], 1, 10];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
	units_to_add = [format["%1LIB_Cromwell_Mk4", _sid], 1, 60];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_to_add = [format["%1LIB_Cromwell_Mk4_w", _sid], 1, 60];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
	units_to_add = [format["%1LIB_UK_Italy_M4A3_75", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_to_add = [format["%1LIB_UK_DR_M4A3_75", _sid], 1, 20];
	};
	units_tracked pushBack units_to_add;
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 4) then {
	units_tracked pushBack [format["%1LIB_M4A4_FIREFLY", _sid], 1, 50];
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

//if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//units_antiair = [[format["%1LIB_Crusader_Mk1AA", _sid], 1]];
	//if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
	//	units_antiair = [[format["%1LIB_Crusader_Mk1AA_desert", _sid], 1]];
	//};
//};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_antiair = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_antiair = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_antiair = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1]];
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

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_gladiator", _sid], 1, 20];
	};
};
if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_ca12bo", _sid], 1, 30];
	};
};
if(CTI_ECONOMY_LEVEL_AIR >= 2) then {
	units_air pushBack [format["%1LIB_RAF_P39", _sid], 1, 50];
};
if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_mb5", _sid], 1, 30];
	};
};
if(CTI_ECONOMY_LEVEL_AIR >= 5) then {
	if(CTI_SAB_ADDON == 1) then {
		units_air pushBack [format["%1sab_meteor", _sid], 1, 30];
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