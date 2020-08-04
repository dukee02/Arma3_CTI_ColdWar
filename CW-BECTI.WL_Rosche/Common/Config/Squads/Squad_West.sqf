_side = _this;

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2], ["InfantryAT", 1], ["InfantryPioneer", 1, 40, .10], ["InfantryRanged", 1, 60, .05]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["MotorizedLight", 2, 30], ["MotorizedHeavy", 2, 30], ["MechanizedLight", 2, 30], ["MechanizedMedium", 2, 30], ["AntiAir", 2, 30], ["MechanizedHeavy", 2, 30]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["ArmoredLight", 2, 25], ["ArmoredMedium", 2, 25], ["ArmoredMedium2", 2, 25], ["ArmoredHeavy1", 2, 25], ["ArmoredHeavy2", 2, 25], ["AntiAirHeavy", 2, 25]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Biplane", 3, 30],["LightFighter", 3, 30],["HeavyFighter", 1, 30], ["TacticLightBomber", 2, 30], ["Fighter", 2, 30], ["HeavyFighterBomb", 1, 20], ["TacticBomber", 1, 20], ["AirAttack", 1, 20], ["FighterBomber", 1, 20], ["HeavyFighterDo", 1, 20], ["StrateticBomber", 1, 20], ["JetAttack", 1, 5], ["JetAttack2", 1, 5]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["InfantryAT", "InfantryPioneer"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry", "InfantryAT", "InfantryPioneer", "InfantryRanged"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["MotorizedLight", "MotorizedHeavy", "MechanizedLight", "MechanizedMedium", "AntiAir", "MechanizedHeavy"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["ArmoredLight", "ArmoredMedium", "ArmoredMedium2", "ArmoredHeavy1", "ArmoredHeavy2", "AntiAirHeavy"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Biplane","LightFighter","HeavyFighter","TacticLightBomber","Fighter","HeavyFighterBomb","TacticBomber","AirAttack","FighterBomber","HeavyFighterDo","StrateticBomber","JetAttack","JetAttack2"]]; 


_v = _v		+ ["Infantry"];
_t = _t		+ ["Infantry"];
_p = _p		+ [[["LIB_GER_Soldier2", 5], ["LIB_GER_Soldier2", 2, 80], ["LIB_GER_medic", 1], ["LIB_GER_rifleman", 1, 70], ["LIB_GER_AT_grenadier", 1, 55]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [100];
_c = _c		+ ["Infantry"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryAT"];
_t = _t		+ ["Infantry - AT"];
_p = _p		+ [[["LIB_GER_AT_soldier", 5, 85], ["LIB_GER_medic", 1], ["LIB_GER_AT_soldier", 3, 75]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAT"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryPioneer"];
_t = _t		+ ["Infantry - Pioneer"];
_p = _p		+ [[["LIB_GER_sapper_gefr", 5, 85], ["LIB_GER_medic", 1], ["LIB_GER_sapper", 2, 60]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAA"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryRanged"];
_t = _t		+ ["Infantry - Snipers"];
_p = _p		+ [[["LIB_GER_scout_rifleman", 2], ["LIB_GER_scout_sniper", 1]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAdvanced"];
_s = _s		+ [[]];

// _v = _v		+ ["Motorized"];
// _t = _t		+ ["Motorized - Transport"];
// _p = _p		+ [[["B_Truck_01_transport_F", 1]]];
// _f = _f		+ [CTI_LIGHT];
// _m = _m		+ [1000];
// _c = _c		+ ["MotorizedTransport"];
// _s = _s		+ [[["Transport"], ["TransportFitCargo", 40]]];

_v = _v		+ ["MotorizedLight"];
_t = _t		+ ["Motorized - Kfz1"];
_p = _p		+ [[["LIB_Kfz1_MG42", 3], ["LIB_Kfz1_MG42", 2, 75]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [200];
_c = _c		+ ["Motorized"];
_s = _s		+ [[]];

_v = _v		+ ["MotorizedHeavy"];
_t = _t		+ ["Motorized - Ba10"];
_p = _p		+ [[["ifa3_Ba10_wm", 3], ["ifa3_Ba10_wm", 2, 75]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [400];
_c = _c		+ ["Motorized"];
_s = _s		+ [[]];

_v = _v		+ ["MechanizedLight"];
_t = _t		+ ["Mechanized - SdKfz222"];
_p = _p		+ [[["LIB_SdKfz222", 1], ["LIB_SdKfz222", 1, 50]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [300];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["MechanizedMedium"];
_t = _t		+ ["Mechanized - SdKfz251"];
_p = _p		+ [[["LIB_SdKfz251_FFV", 1], ["ifa3_sdkfz251T_2mg", 1, 50]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [300];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["AntiAir"];
_t = _t		+ ["Armored - SdKfz 7"];
_p = _p		+ [[["LIB_SdKfz_7_AA", 1]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [300];
_c = _c		+ ["AntiAir"];
_s = _s		+ [[]];

_v = _v		+ ["MechanizedHeavy"];
_t = _t		+ ["Mechanized - APC (Heavy)"];
_p = _p		+ [[["LIB_SdKfz234_2", 1], ["LIB_SdKfz234_2", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [300];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredLight"];
_t = _t		+ ["Armored - Light"];
_p = _p		+ [[["pz2f", 1], ["pz2f", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [300];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMedium"];
_t = _t		+ ["Armored - PzKpfwIII"];
_p = _p		+ [[["ifa3_pz3j", 1], ["ifa3_pz3N", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [400];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMedium2"];
_t = _t		+ ["Armored - PzKpfwIV"];
_p = _p		+ [[["LIB_PzKpfwIV_H", 1], ["LIB_PzKpfwIV_H", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [400];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredHeavy1"];
_t = _t		+ ["Armored - PzKpfwVI E"];
_p = _p		+ [[["LIB_PzKpfwVI_E", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredHeavy2"];
_t = _t		+ ["Armored - MBT PzKpfwVI B"];
_p = _p		+ [[["LIB_PzKpfwVI_B", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [600];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["AntiAirHeavy"];
_t = _t		+ ["Armored - Wirbelwind"];
_p = _p		+ [[["LIB_FlakPanzerIV_Wirbelwind", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["AntiAir"];
_s = _s		+ [[]];


_v = _v		+ ["Biplane"];
_t = _t		+ ["Air - avia"];
_p = _p		+ [[["VIOC_B_sab_avia", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["LightFighter"];
_t = _t		+ ["Air - Fiat G55"];
_p = _p		+ [[["VIOC_B_sab_fiatg55", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["HeavyFighter"];
_t = _t		+ ["Air - BF 110 noBombs"];
_p = _p		+ [[["VIOC_B_sab_bf110_2", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["TacticLightBomber"];
_t = _t		+ ["Air - Ju 87 4x50kg"];
_p = _p		+ [[["ifa3_ju87_4x50", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["Fighter"];
_t = _t		+ ["Air - FW 190 F8"];
_p = _p		+ [[["ifa3_FW190F8", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["HeavyFighterBomb"];
_t = _t		+ ["Air - BF 110 Bombs"];
_p = _p		+ [[["VIOC_B_sab_bf110", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["TacticBomber"];
_t = _t		+ ["Air - Ju 87"];
_p = _p		+ [[["LIB_Ju87", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["AirAttack"];
_t = _t		+ ["Air - Bv 141"];
_p = _p		+ [[["VIOC_B_sab_bv141", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["FighterBomber"];
_t = _t		+ ["Air - FW 190 F8 Bombs"];
_p = _p		+ [[["LIB_FW190F8", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["HeavyFighterDo"];
_t = _t		+ ["Air - Do 335"];
_p = _p		+ [[["VIOC_B_sab_do335", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["StrateticBomber"];
_t = _t		+ ["Air - He 111"];
_p = _p		+ [[["VIOC_B_sab_he111", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["JetAttack"];
_t = _t		+ ["Air - Me 262"];
_p = _p		+ [[["VIOC_B_sab_me262", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["JetAttack2"];
_t = _t		+ ["Air - Ho 229"];
_p = _p		+ [[["VIOC_B_sab_hix", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];


[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";