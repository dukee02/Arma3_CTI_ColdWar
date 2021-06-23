_side = _this;
_sid = "";

if(CTI_SOV_CUP_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_O_Ural_RU"];
};
if(CTI_US_CUP_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_LAV25_HQ_desert_USMC"];
	} else {
		missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_LAV25_HQ_USMC"];
	};
};
if(CTI_SOV_RHS_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhs_gaz66_r142_vdv"];
};
if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_MAIN_ADDON == 0) then {
		missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_m113a1g_command"];
	} else {
		missionNamespace setVariable [format["CTI_%1_HQ", _side], "BW_LKW_Geraet_Fleck"];
	};
};
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_gc_army_btr60pu12"];
};

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: Common\Config\Base\Base.sqf", format ["Set HQ Vehicle [%1] for side [%2]", missionNamespace getVariable format["CTI_%1_HQ", _side], _side]] call CTI_CO_FNC_Log };

missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 180, [-23,33]],
	[CTI_LIGHT, 180, [23,33]],
	[CTI_CONTROLCENTER, 0, [30,-40]],
	[CTI_HEAVY, 0, [-30,-40]],
	[CTI_AIR, 180, [-60,37]],
	[CTI_REPAIR, 180, [60,37]],
	[CTI_AMMO, 180, [80,37]]
]];

//--- Commander course of action ["Action", Parameter(s), Condition]
if(CTI_TOWNS_STARTING_MODE>0) then {
	missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
		["build-structures", CTI_CONTROLCENTER, {true}],
		["build-structures", CTI_BARRACKS, {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
		["build-structures", CTI_LIGHT, {true}],
		["build-structures", CTI_REPAIR, {true}],
		["build-structures", CTI_AMMO, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 1], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
		["build-structures", CTI_HEAVY, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 2], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 2], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 2], {true}],
		["build-structures", CTI_AIR, {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 4], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 3], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 2], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 4], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 5], {true}]
	]];
}else {
	missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
		["build-structures", CTI_BARRACKS, {true}],
		["build-structures", CTI_REPAIR, {true}],
		["build-structures", CTI_AMMO, {true}],
		["build-structures", CTI_CONTROLCENTER, {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 1], {true}],
		["build-structures", CTI_LIGHT, {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
		["build-structures", CTI_HEAVY, {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
		["upgrade", [CTI_UPGRADE_BARRACKS, 2], {true}],
		["upgrade", [CTI_UPGRADE_GEAR, 2], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 1], {true}],
		["build-structures", CTI_AIR, {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
		["upgrade", [CTI_UPGRADE_LIGHT, 4], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 3], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 2], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 2], {true}],
		["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
		["upgrade", [CTI_UPGRADE_HEAVY, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 3], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 4], {true}],
		["upgrade", [CTI_UPGRADE_SUPPLY, 4], {true}],
		["upgrade", [CTI_UPGRADE_AIR, 5], {true}]
	]];
};

/*if (CTI_Log_Level >= CTI_Log_Debug) then { //--- Information
	["DEBUG", "FILE: Base.sqf", format["AI Upgradelist with [%1] items", count _upgradelist]] call CTI_CO_FNC_Log;
	for "_i" from 0 to count _upgradelist do { 
		["DEBUG", "FILE: Base.sqf", format["upgrage No. [%1]: [%2]", _i, _upgradelist select _i]] call CTI_CO_FNC_Log;
	};
};*/

//--- Structures
_headers = [];
_classes = [];
_prices = [];
_times = [];
_placements = [];
_helper = [];
_specials = [];
/*
	Specials:
		- DMG_Alternative: Need to be used in case of bisterious buildings usage 
				If a building is damaged, all the EH it had will bisteriously vanish... This "feature" will probably never get fixed so once again, we fix it ourself!
		- DMG_Reduce: Reduce the incoming damage on a building making it stronger if above 1.
*/
_headers pushBack 		[CTI_HQ_DEPLOYED, "HQ", "HQdeployed"];
_classes pushBack		["Land_Research_house_V1_F", "Land_Research_house_V1_ruins_F"];
_prices pushBack 		CTI_BASE_HQ_DEPLOY_COST;
_times pushBack			1;
_placements pushBack 	[0, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack		[CTI_BARRACKS, "Barracks", "Barracks"];
//_classes pushBack		["CDF_WarfareBBarracks", "Land_Scaffolding_New_F"];
_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];
_prices pushBack		2000;
_times pushBack			60;
_placements pushBack 	[270, 35];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack 		[CTI_CONTROLCENTER, "Control Center", "CC"];
//_classes pushBack 		["GUE_WarfareBUAVterminal", "Land_PowGen_Big_ruins"];	
_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F"];							  
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_headers pushBack		[CTI_LIGHT, "Light Vehicle Factory", "Light"];
	//_classes pushBack		["CDF_WarfareBLightFactory", "Land_Scaffolding_New_F"];
	//_classes pushBack		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];
	_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];
	_prices pushBack 		4000;
	_times pushBack 		80;
	_placements pushBack 	[180, 30];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_headers pushBack 		[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"];
	//_classes pushBack 		["RU_WarfareBHeavyFactory", "Land_Scaffolding_New_F"];
	_classes pushBack 		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"];
	_prices pushBack 		6000;
	_times pushBack 		120;
	_placements pushBack 	[90, 25];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_headers pushBack 		[CTI_AIR, "Aircraft Factory", "Air"];
	//_classes pushBack 		["RU_WarfareBAircraftFactory", "Land_Scaffolding_New_F"];
	//_classes pushBack 		["Land_Airport_Tower_F", "Land_Airport_Tower_ruins_F"];		//cant destroy ruins
	_classes pushBack 		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];
	_prices pushBack 		8000;
	_times pushBack 		140;
	_placements pushBack 	[180, 40];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]]; 
};

_headers pushBack 		[CTI_AMMO, "Ammo Depot", "Ammo"];
//_classes pushBack 		["RU_WarfareBVehicleServicePoint", "Land_PowGen_Big_ruins"];
//_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];
_classes pushBack		["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"];
_prices pushBack 		2000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack 		[CTI_REPAIR, "Repair Depot", "Repair"];
//_classes pushBack 		["TK_GUE_WarfareBContructionSite_Base_EP1", "Land_PowGen_Big_ruins"];
//_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];
_classes pushBack 		["Land_Cargo_House_V3_F", "Land_Cargo_House_V3_ruins_F"];
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_headers pushBack 		[CTI_NAVAL, "Naval Yard", "Naval"];
	//_classes pushBack 		["Land_Lighthouse_small_F", "Land_Lighthouse_small_ruins_F"];
	_classes pushBack 		["Land_Cargo_House_V2_F", "Land_Cargo_House_V2_ruins_F"];
	_prices pushBack 		3000;
	_times pushBack 		80;
	_placements pushBack 	[180, 60];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

[_side, _headers, _classes, _prices, _times, _placements, _helper, _specials] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Structures.sqf";

//--- Defenses
_headers = [];
_classes = [];
_prices = [];
_placements = [];  
_categories = [];

if(CTI_FOB_BUILD_EVERYONE == 0) then {
	_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
} else {
	_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB == 0))}]]];
	//_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX)}]]];
};
_classes pushBack 			"Land_Medevac_house_V1_F";
_prices pushBack 			5000;
_placements pushBack 		[180, 15];
_categories pushBack 		"Fortification";


//******************************BASE GUN DEFENSE 1******************************
if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
	
	if(CTI_MAIN_ADDON == 0) then {
		_headers pushBack 		"MG3 AA (GM)";
		_classes pushBack 		"gm_ge_army_mg3_aatripod";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"AT Milan (GM)";
		_classes pushBack 		"gm_ge_army_milan_launcher_tripod";
		_prices pushBack 		7000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if (CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"Static MG (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_US";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Static MG low (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_MiniTripod_US";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Arty";
		_classes pushBack 		"CUP_B_M119_US";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Mortar";
		_classes pushBack 		"CUP_B_M252_US";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AT Defense (TOW)";
		_classes pushBack 		"CUP_B_TOW_TriPod_US";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if (CTI_REDD_ADDON > 0) then {
		_headers pushBack 		"Static MG (MG3)";
		_classes pushBack 		"rnt_mg3_static";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Static MG low (MG3 ai)";
		_classes pushBack 		"rnt_mg3_static_ai";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Static GW (GMW)";
		_classes pushBack 		"rnt_gmw_static";
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Mortar (REDD)";
		_classes pushBack 		"Redd_Tank_M120_Tampella";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AT Milan (REDD)";
		_classes pushBack 		"Redd_Milan_Static";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if (CTI_CUP_ADDON > 0 && CTI_US_CUP_SIDE != CTI_BW_SIDE) then {
		_headers pushBack 		"Static SearchLight";
		_classes pushBack 		"CUP_B_CUP_SearchLight_static_US";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";

		_headers pushBack 		"Static MG (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_US";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Static MG low (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_MiniTripod_US";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";

		_headers pushBack 		"Static GW (MK19)";
		_classes pushBack 		"CUP_B_MK19_TriPod_US";
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";

		_headers pushBack 		"M119";
		_classes pushBack 		"CUP_B_M119_US";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Mortar";
		_classes pushBack 		"CUP_B_M252_US";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";

		_headers pushBack 		"AT Defense (TOW)";
		_classes pushBack 		"CUP_B_TOW_TriPod_US";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"AT Defense (TOW2)";
		_classes pushBack 		"CUP_B_TOW2_TriPod_US";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"AA Defense (Stinger)";
		_classes pushBack 		"CUP_B_CUP_Stinger_AA_pod_US";
		_prices pushBack 		12000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};

if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"AT Fagot (GM)";
	_classes pushBack 		"gm_gc_army_fagot_launcher_tripod";
	_prices pushBack 		7000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	if (CTI_CUP_ADDON > 0 && CTI_SOV_CUP_SIDE != CTI_NVA_SIDE) then {
		_headers pushBack 		"Static MG (KORD)";
		_classes pushBack 		"CUP_O_KORD_high_RU";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Static MG low (KORD)";
		_classes pushBack 		"CUP_O_KORD_RU";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Static GW (AGS)";
		_classes pushBack 		"CUP_O_AGS_RU";
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"D30 Arty";
		_classes pushBack 		"CUP_O_D30_RU";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"D30 AT";
		_classes pushBack 		"CUP_O_D30_AT_RU";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Mortar";
		_classes pushBack 		"CUP_O_2b14_82mm_RU";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AT Defense (Metis)";
		_classes pushBack 		"CUP_O_Metis_RU";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AA Defense (ZU23)";
		_classes pushBack 		"CUP_O_ZU23_RU";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
	if (CTI_RHS_ADDON > 0 && CTI_SOV_RHS_SIDE != CTI_NVA_SIDE) then {
	
		_headers pushBack 		"Static MG (KORD)";
		_classes pushBack 		"rhs_KORD_high_VDV";
		_prices pushBack 		1500;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Static MG low (KORD)";
		_classes pushBack 		"rhs_KORD_VDV";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		
		_headers pushBack 		"Static MG low (NSV)";
		_classes pushBack 		"RHS_NSV_TriPod_VDV";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Static AT (SPG9)";
		_classes pushBack 		"rhs_SPG9M_VDV";
		_prices pushBack 		4000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Static GW (AGS)";
		_classes pushBack 		"RHS_AGS30_TriPod_VDV";
		_prices pushBack 		3000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"D30 Arty";
		_classes pushBack 		"rhs_D30_vdv";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"D30 AT";
		_classes pushBack 		"rhs_D30_at_vdv";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"Mortar";
		_classes pushBack 		"rhs_2b14_82mm_vdv";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AT Defense (Metis)";
		_classes pushBack 		"rhs_Metis_9k115_2_vdv";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AT Defense (Kornet)";
		_classes pushBack 		"rhs_Kornet_9M133_2_vdv";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AA Defense (ZU23)";
		_classes pushBack 		"RHS_ZU23_VDV";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	
		_headers pushBack 		"AA Defense (Igla)";
		_classes pushBack 		"rhs_Igla_AA_pod_vdv";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
	};
};
if(CTI_US_CUP_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	
	_headers pushBack 		"Static SearchLight";
	_classes pushBack 		"CUP_B_CUP_SearchLight_static_US";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";

	_headers pushBack 		"Static MG (M2)";
	_classes pushBack 		"CUP_B_M2StaticMG_US";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static MG low (M2)";
	_classes pushBack 		"CUP_B_M2StaticMG_MiniTripod_US";
	_prices pushBack 		1000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";

	_headers pushBack 		"Static GW (MK19)";
	_classes pushBack 		"CUP_B_MK19_TriPod_US";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";

	_headers pushBack 		"M119";
	_classes pushBack 		"CUP_B_M119_US";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Mortar";
	_classes pushBack 		"CUP_B_M252_US";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";

	_headers pushBack 		"AT Defense (TOW)";
	_classes pushBack 		"CUP_B_TOW_TriPod_US";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AT Defense (TOW2)";
	_classes pushBack 		"CUP_B_TOW2_TriPod_US";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AA Defense (Stinger)";
	_classes pushBack 		"CUP_B_CUP_Stinger_AA_pod_US";
	_prices pushBack 		12000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";

};	
if(CTI_SOV_CUP_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"Static MG (KORD)";
	_classes pushBack 		"CUP_O_KORD_high_RU";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static MG low (KORD)";
	_classes pushBack 		"CUP_O_KORD_RU";
	_prices pushBack 		1000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static GW (AGS)";
	_classes pushBack 		"CUP_O_AGS_RU";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"D30 Arty";
	_classes pushBack 		"CUP_O_D30_RU";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"D30 AT";
	_classes pushBack 		"CUP_O_D30_AT_RU";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Mortar";
	_classes pushBack 		"CUP_O_2b14_82mm_RU";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AT Defense (Metis)";
	_classes pushBack 		"CUP_O_Metis_RU";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AA Defense (ZU23)";
	_classes pushBack 		"CUP_O_ZU23_RU";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};
if(CTI_SOV_RHS_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"Static MG (KORD)";
	_classes pushBack 		"rhs_KORD_high_VDV";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static MG low (KORD)";
	_classes pushBack 		"rhs_KORD_VDV";
	_prices pushBack 		1000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static MG low (NSV)";
	_classes pushBack 		"RHS_NSV_TriPod_VDV";
	_prices pushBack 		1000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static AT (SPG9)";
	_classes pushBack 		"rhs_SPG9M_VDV";
	_prices pushBack 		4000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Static GW (AGS)";
	_classes pushBack 		"RHS_AGS30_TriPod_VDV";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"D30 Arty";
	_classes pushBack 		"rhs_D30_vdv";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"D30 AT";
	_classes pushBack 		"rhs_D30_at_vdv";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"Mortar";
	_classes pushBack 		"rhs_2b14_82mm_vdv";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AT Defense (Metis)";
	_classes pushBack 		"rhs_Metis_9k115_2_vdv";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AT Defense (Kornet)";
	_classes pushBack 		"rhs_Kornet_9M133_2_vdv";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AA Defense (ZU23)";
	_classes pushBack 		"RHS_ZU23_VDV";
	_prices pushBack 		8000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	
	_headers pushBack 		"AA Defense (Igla)";
	_classes pushBack 		"rhs_Igla_AA_pod_vdv";
	_prices pushBack 		12000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
};

//******************************Ammoboxes*******************************************************************************************************
/*if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"81mm Ammo HE";
	_classes pushBack 		"LIB_Box_81mm_Mo_HE";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"82mm Smoke";
	_classes pushBack 		"LIB_Box_82mm_Mo_Smoke";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	_headers pushBack 		"60mm Ammo HE";
	_classes pushBack 		"LIB_Box_60mm_Mo_HE";
	_prices pushBack 		100;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
};*/

//******************************BASE DEFENSE 0*******************************************************************************************************

_headers pushBack 		"Bunker (Small)";
_classes pushBack 		"Land_BagBunker_Small_F";
_prices pushBack 		150;
_placements pushBack 	[0, 7];
_categories pushBack 	"Misc";
//Tall Roof
_headers pushBack  		"Shed (Roof)";
_classes pushBack  		"Land_Shed_Big_F";
_prices pushBack 		2000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Sheds";
// Short roof with one wall side
_headers pushBack 		"Shed (Land)";
_classes pushBack 		"Land_Shed_Small_F";
_prices pushBack 		2000;
_placements pushBack 	[90, 15];
_categories pushBack 	"Sheds";
	
_headers pushBack 		"Heli Pad";
_classes pushBack 		"Land_HelipadSquare_F";
_prices pushBack 		100;
_placements pushBack 	[0, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Lamp";
_classes pushBack 		"Land_LampHalogen_F";
_prices pushBack 		5;
_placements pushBack 	[90, 15];
_categories pushBack 	"Misc";

_headers pushBack 		"Warning Sign- Mines";
_classes pushBack 		"Land_Sign_Mines_F";
_prices pushBack 		1;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Campfire";
_classes pushBack 		"FirePlace_burning_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Camp Chair";
_classes pushBack 		"Land_CampingChair_V1_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Camp Table";
_classes pushBack 		"Land_CampingTable_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Latrine";
_classes pushBack 		"Land_ToiletBox_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Tent";
_classes pushBack 		"Land_TentDome_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";

_headers pushBack 		"Double Portable Light";
_classes pushBack 		"Land_PortableLight_double_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
	
_headers pushBack 		"Map";
_classes pushBack 		"MapBoard_altis_F";
_prices pushBack 		1;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";

_headers pushBack 		"Runway Light (Blue)";
_classes pushBack 		"Land_runway_edgelight_blue_F";
_prices pushBack 		1;
_placements pushBack 	[0, 5];
_categories pushBack 	"Misc";

_headers pushBack 		"WindSock";
_classes pushBack 		"Windsock_01_F";
_prices pushBack 		1;
_placements pushBack 	[0, 5];
_categories pushBack 	"Misc";

_headers pushBack 		"Dirt ramp";
_classes pushBack 		"Land_Rampart_F";
_prices pushBack 		500;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";

_headers pushBack 		"Concrete ramp";
_classes pushBack 		"Land_RampConcrete_F";
_prices pushBack 		2000;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";

_headers pushBack 		"Wooden pier";
_classes pushBack 		"Land_PierWooden_02_16m_F";
_prices pushBack 		1000;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";

_headers pushBack 		"Concrete pier";
_classes pushBack 		"Land_PierConcrete_01_16m_F";
_prices pushBack 		5000;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";

_headers pushBack 		["High Wall (Mil)",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Mil_WallBig_4m_F";
_prices pushBack 		20;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";

/*_headers pushBack 		"Camo net";
_classes pushBack 		"CamoNet_BLUFOR_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"Camo net open";
_classes pushBack 		"CamoNet_BLUFOR_open_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";

_headers pushBack 		"Camo net vehicle";
_classes pushBack 		"CamoNet_BLUFOR_big_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";*/


[_side, _headers, _classes, _prices, _placements, _categories] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";

//Defense Guns for Towns
_classes_town = [];
_categories_town = [];

if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
	//_classes_town pushBack 		format["%1", _sid];
	//_categories_town pushBack 	"View";
	
	if(CTI_MAIN_ADDON == 0) then {
		_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1gm_ge_army_milan_launcher_tripod", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
		_categories_town pushBack 	"AA";
	};
	if (CTI_CUP_ADDON > 0) then {
		_classes_town pushBack 		format["%1CUP_B_M2StaticMG_US", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CUP_B_M119_US", _sid];
		_categories_town pushBack 	"Artillery";
	
		_classes_town pushBack 		format["%1CUP_B_M252_US", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CUP_B_TOW_TriPod_US", _sid];
		_categories_town pushBack 	"AT";
	};
	if (CTI_REDD_ADDON > 0) then {
		_classes_town pushBack 		format["%1rnt_mg3_static", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1Redd_Milan_Static", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1Redd_Tank_M120_Tampella", _sid];
		_categories_town pushBack 	"Mortar";
	};
	
	//_classes_town pushBack 		format["%1", _sid];
	//_categories_town pushBack 	"AA";	
};
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//_classes_town pushBack 		format["%1", _sid];
	//_categories_town pushBack 	"View";
	
	if(CTI_MAIN_ADDON == 0) then {
		_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1gm_gc_army_spg9_tripod", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1gm_gc_army_fagot_launcher_tripod", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
		_categories_town pushBack 	"AA";
	};
	if (CTI_CUP_ADDON > 0 && CTI_SOV_CUP_SIDE != CTI_NVA_SIDE) then {
		_classes_town pushBack 		format["%1CUP_O_KORD_high_RU", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CUP_O_2b14_82mm_RU", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CUP_O_ZU23_RU", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1CUP_O_D30_RU", _sid];
		_categories_town pushBack 	"Artillery";
	};
	if (CTI_RHS_ADDON > 0 && CTI_SOV_RHS_SIDE != CTI_NVA_SIDE) then {
		_classes_town pushBack 		format["%1rhs_KORD_high_VDV", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1rhs_2b14_82mm_vdv", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1rhs_Igla_AA_pod_vdv", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1rhs_D30_vdv", _sid];
		_categories_town pushBack 	"Artillery";
	};
	
	/*_classes_town pushBack 		format["%1", _sid];
	_categories_town pushBack 	"Mortar";
	
	_classes_town pushBack 		format["%1", _sid];
	_categories_town pushBack 	"AA";
	
	_classes_town pushBack 		format["%1", _sid];
	_categories_town pushBack 	"Artillery";*/
};
if(CTI_SOV_CUP_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//_classes_town pushBack 		format["%1", _sid];
	//_categories_town pushBack 	"View";
	
	_classes_town pushBack 		format["%1CUP_O_KORD_high_RU", _sid];
	_categories_town pushBack 	"MG";
	
	_classes_town pushBack 		format["%1CUP_O_2b14_82mm_RU", _sid];
	_categories_town pushBack 	"Mortar";
	
	_classes_town pushBack 		format["%1CUP_O_ZU23_RU", _sid];
	_categories_town pushBack 	"AA";
	
	_classes_town pushBack 		format["%1CUP_O_Metis_RU", _sid];
	_categories_town pushBack 	"AT";
	
	_classes_town pushBack 		format["%1CUP_O_D30_RU", _sid];
	_categories_town pushBack 	"Artillery";
	
};
if(CTI_SOV_RHS_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	//_classes_town pushBack 		format["%1", _sid];
	//_categories_town pushBack 	"View";
	
	_classes_town pushBack 		format["%1rhs_KORD_high_VDV", _sid];
	_categories_town pushBack 	"MG";
	
	_classes_town pushBack 		format["%1rhs_2b14_82mm_vdv", _sid];
	_categories_town pushBack 	"Mortar";
	
	_classes_town pushBack 		format["%1rhs_Igla_AA_pod_vdv", _sid];
	_categories_town pushBack 	"AA";
	
	_classes_town pushBack 		format["%1rhs_Metis_9k115_2_vdv", _sid];
	_categories_town pushBack 	"AT";
	
	_classes_town pushBack 		format["%1rhs_D30_vdv", _sid];
	_categories_town pushBack 	"Artillery";
	
};
//--- Defenses management for towns.
if (isServer) then {[_side, _classes_town, _categories_town] Call Compile preprocessFileLineNumbers "Common\Config\Config_Defenses_Towns.sqf"};