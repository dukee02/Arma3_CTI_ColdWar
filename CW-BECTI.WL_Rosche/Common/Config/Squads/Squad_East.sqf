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
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side],[["MotorizedMedium", 2, 25], ["MotorizedHeavy", 2, 25], ["MechanizedUS", 2, 25], ["MechanizedGER", 2, 25], ["MotorizedAA", 2, 25]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["ArmoredLight1", 1, 20],  ["ArmoredLight2", 1, 20], ["ArmoredLight3", 1, 20], ["ArmoredAT", 2, 20], ["ArmoredMediumGER", 1, 20], ["ArmoredMedium1", 2, 20], ["ArmoredMedium2", 2, 20], ["ArmoredMedium3", 2, 20], ["ArmoredHeavy1", 1, 20], ["ArmoredHeavy2", 1, 20], ["ArmoredHeavy3", 2, 20]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Biplane1", 3, 30], ["Biplane2", 3, 30], ["LightFighter", 2, 20], ["LightFighter2", 2, 30], ["Fighter", 2, 20], ["LightBomber1", 2, 30], ["LightBomber2", 1, 20], ["HeavyFighter1", 1, 20], ["HeavyFighter2", 1, 20], ["GroundAttack", 1, 20]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["InfantryAT", "InfantryPioneer"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry", "InfantryAT", "InfantryPioneer", "InfantryRanged"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["MotorizedMedium", "MotorizedHeavy", "MechanizedUS", "MechanizedGER", "MotorizedAA"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["ArmoredLight1", "ArmoredLight2", "ArmoredLight3", "ArmoredAT", "ArmoredMediumGER", "ArmoredMedium1", "ArmoredMedium2", "ArmoredMedium3", "ArmoredHeavy1", "ArmoredHeavy2", "ArmoredHeavy3", "AntiAir"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Biplane1", "Biplane2", "LightFighter", "LightFighter2", "Fighter", "LightBomber1", "LightBomber2", "HeavyFighter1", "HeavyFighter2", "GroundAttack"]];

_v = _v		+ ["Infantry"];
_t = _t		+ ["Infantry"];
_p = _p		+ [[["LIB_SOV_LC_rifleman", 5], ["LIB_SOV_LC_rifleman", 2, 80], ["LIB_SOV_medic", 1], ["LIB_SOV_LC_rifleman", 1, 70]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [100];
_c = _c		+ ["Infantry"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryAT"];
_t = _t		+ ["Infantry - AT"];
_p = _p		+ [[["LIB_SOV_AT_soldier", 5, 85], ["LIB_SOV_smgunner", 1], ["LIB_SOV_AT_soldier", 3, 75]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAT"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryPioneer"];
_t = _t		+ ["Infantry - AA"];
_p = _p		+ [[["LIB_SOV_sapper", 5, 85], ["LIB_SOV_medic", 1], ["LIB_SOV_sapper", 2, 60]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAA"];
_s = _s		+ [[]];

_v = _v		+ ["InfantryRanged"];
_t = _t		+ ["Infantry - Snipers"];
_p = _p		+ [[["LIB_SOV_scout_sniper", 2], ["LIB_SOV_scout_rifleman", 1]]];
_f = _f		+ [CTI_BARRACKS];
_m = _m		+ [200];
_c = _c		+ ["InfantryAdvanced"];
_s = _s		+ [[]];

// _v = _v		+ ["Motorized"];
// _t = _t		+ ["Motorized - Transport"];
// _p = _p		+ [[["O_Truck_02_transport_F", 1]]];
// _f = _f		+ [CTI_LIGHT];
// _m = _m		+ [1000];
// _c = _c		+ ["MotorizedTransport"];
// _s = _s		+ [[["Transport"], ["TransportFitCargo", 40]]];

_v = _v		+ ["MotorizedMedium"];
_t = _t		+ ["Motorized - ba64B"];
_p = _p		+ [[["ifa3_ba64B", 3], ["ifa3_ba64B", 2, 75]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [300];
_c = _c		+ ["Motorized"];
_s = _s		+ [[]];

_v = _v		+ ["MotorizedHeavy"];
_t = _t		+ ["Motorized - Ba10"];
_p = _p		+ [[["ifa3_Ba10", 3], ["ifa3_Ba10", 2, 75]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [300];
_c = _c		+ ["Motorized"];
_s = _s		+ [[]];

_v = _v		+ ["MechanizedUS"];
_t = _t		+ ["Mechanized - M3 Halftrack"];
_p = _p		+ [[["LIB_SOV_M3_Halftrack", 1], ["LIB_SOV_M3_Halftrack", 1, 50]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [400];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["MotorizedAA"];
_t = _t		+ ["Motorized - Anti Air"];
_p = _p		+ [[["LIB_Zis5v_61K", 1]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [400];
_c = _c		+ ["AntiAir"];
_s = _s		+ [[]];

_v = _v		+ ["MechanizedGER"];
_t = _t		+ ["Mechanized - SdKfz251"];
_p = _p		+ [[["LIB_SdKfz251_captured", 1], ["LIB_SdKfz251_captured_FFV", 1, 50]]];
_f = _f		+ [CTI_LIGHT];
_m = _m		+ [400];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredLight1"];
_t = _t		+ ["Armored - t26"];
_p = _p		+ [[["ifa3_t26", 1], ["ifa3_t26", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [400];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredLight2"];
_t = _t		+ ["Armored - t60"];
_p = _p		+ [[["ifa3_t60", 1], ["ifa3_t60", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [400];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredLight3"];
_t = _t		+ ["Armored - t70m"];
_p = _p		+ [[["ifa3_t70m", 1], ["ifa3_t70m", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Mechanized"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMedium1"];
_t = _t		+ ["Armored - M4A2"];
_p = _p		+ [[["LIB_M4A2_SOV", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredAT"];
_t = _t		+ ["Armored AT - SU85"];
_p = _p		+ [[["LIB_SU85", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMediumGER"];
_t = _t		+ ["Armored - pz3J"];
_p = _p		+ [[["ifa3_pz3J_sov", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMedium2"];
_t = _t		+ ["Armored - T34_76"];
_p = _p		+ [[["LIB_T34_76", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [500];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredMedium3"];
_t = _t		+ ["Armored - T34_85"];
_p = _p		+ [[["LIB_T34_85", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [600];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredHeavy1"];
_t = _t		+ ["Armored - KV1"];
_p = _p		+ [[["ifa3_kv1a", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [600];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredHeavy2"];
_t = _t		+ ["Armored - KV2"];
_p = _p		+ [[["ifa3_kv2", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [600];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];

_v = _v		+ ["ArmoredHeavy3"];
_t = _t		+ ["Armored - JS2"];
_p = _p		+ [[["LIB_JS2_43", 1]]];
_f = _f		+ [CTI_HEAVY];
_m = _m		+ [700];
_c = _c		+ ["Armored"];
_s = _s		+ [[]];



_v = _v		+ ["Biplane1"];
_t = _t		+ ["Air - D 510"];
_p = _p		+ [[["VIOC_O_sab_d510", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["Biplane2"];
_t = _t		+ ["Air - S 510"];
_p = _p		+ [[["VIOC_O_sab_s510", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["LightFighter"];
_t = _t		+ ["Air - I16"];
_p = _p		+ [[["VIOC_O_sab_i16", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["LightFighter2"];
_t = _t		+ ["Air - La5"];
_p = _p		+ [[["VIOC_O_sab_la5", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["Fighter"];
_t = _t		+ ["Air - La7"];
_p = _p		+ [[["LIB_La7", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["LightBomber1"];
_t = _t		+ ["Air - P39 2x50lib"];
_p = _p		+ [[["Ifa3_P39_2x50", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["LightBomber2"];
_t = _t		+ ["Air - P39 3Bombs"];
_p = _p		+ [[["LIB_P39", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["HeavyFighter1"];
_t = _t		+ ["Air - Pe2 500lib"];
_p = _p		+ [[["ifa3_Pe2_500", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["HeavyFighter2"];
_t = _t		+ ["Air - Pe2 Rocket"];
_p = _p		+ [[["ifa3_Pe3", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];

_v = _v		+ ["GroundAttack"];
_t = _t		+ ["Air - IL2"];
_p = _p		+ [[["VIOC_O_sab_il2", 1]]];
_f = _f		+ [CTI_AIR];
_m = _m		+ [1000];
_c = _c		+ ["Air"];
_s = _s		+ [[]];



[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";