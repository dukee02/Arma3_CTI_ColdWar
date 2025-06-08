_side = _this;
_sid = "";

_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];

switch((_isThisMain select 0)) do {
	case CTI_BW_ID: {
		if(CTI_GM_DLC > 0) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_fuchsa0_command_win"];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_fuchsa0_command_des"];
			};
			if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_fuchsa0_command_trp"];
			};
			if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_fuchsa0_command_wdl"];	
			};
			if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 3 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_ge_army_fuchsa0_command"];
			};
		} else {
			if(CTI_REDD_ADDON > 0) then {
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
					missionNamespace setVariable [format["CTI_%1_HQ", _side], "Redd_Tank_Fuchs_1A4_Pi_Wintertarn"];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
					missionNamespace setVariable [format["CTI_%1_HQ", _side], "Redd_Tank_Fuchs_1A4_Pi_Tropentarn"];
				};
				if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
					missionNamespace setVariable [format["CTI_%1_HQ", _side], "Redd_Tank_Fuchs_1A4_Pi_Flecktarn"];
				};
			} else {
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
					missionNamespace setVariable [format["CTI_%1_HQ", _side], "BWA3_Multi_Tropen"];
				};
				if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
					missionNamespace setVariable [format["CTI_%1_HQ", _side], "BWA3_Multi_Fleck"];
				};
			};
		};
	};
	case CTI_NVA_ID: {
		if(CTI_GM_DLC > 0) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_gc_army_btr60pu12_win"];
			};
			if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_gc_army_btr60pu12_wdl"];
			};
			if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 1 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "gm_gc_army_btr60pu12"];	
			};
		};
		if(CTI_SOG_DLC > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "vn_o_wheeled_z157_03_nva65"];
		};
	};
	case CTI_SOV_ID: {
		if(CTI_CUP_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_O_BTR60_RU"];
		};
		if(CTI_CWR3_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "cwr3_o_btr60"];
		};
		if(CTI_RHS_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhs_btr60_vdv"];
		};
	};
	case CTI_US_ID: {
		if(CTI_SOG_DLC > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "vn_b_wheeled_m54_03"];
		};
		if(CTI_CUP_ADDON > 0) then {
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_LAV25_HQ_desert_USMC"];
			} else {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_LAV25_HQ_USMC"];
			};
		};
		if(CTI_CWR3_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "cwr3_b_m577_hq"];
		};
		if(CTI_RHS_ADDON > 0) then {
			if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsusf_m113d_usarmy_unarmed"];
			} else {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsusf_m113_usarmy_unarmed"];
			};
		};
	};
	case CTI_CHDKZ_ID: {
		if(CTI_RHS_ADDON > 0) then {
			if(_side == resistance) then {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsgref_ins_g_gaz66_r142"];
			} else {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsgref_ins_gaz66_r142"];
			};
		};
	};
	case CTI_CDF_ID: {
		if(CTI_RHS_ADDON > 0) then {
			if(_side == resistance) then {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsgref_cdf_gaz66_r142"];
			} else {
				missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsgref_cdf_b_gaz66_r142"];
			};
		};
	};
	case CTI_UKRAIN_ID: {
		if(CTI_CUP_ADDON > 0) then {
			missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_BRDM2_HQ_AFU"];
		};
	};
	//case CTI_BW_ID: {};
	default {
		if (CTI_Log_Level >= CTI_Log_ERROR) then { ["ERROR", "FILE: Common\Config\Base\Base.sqf", format ["Basic units setup failed <%1>", _isThisMain]] call CTI_CO_FNC_Log };	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Config\Base\Base.sqf", format ["Set HQ Vehicle [%1] for side [%2]", missionNamespace getVariable format["CTI_%1_HQ", _side], _side]] call CTI_CO_FNC_Log};

missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air","Naval"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 0, [-23,33]],
	[CTI_LIGHT, 0, [23,33]],
	[CTI_CONTROLCENTER, 180, [30,-40]],
	[CTI_HEAVY, 180, [-30,-40]],
	[CTI_AIR, 0, [-60,37]],
	[CTI_REPAIR, 0, [60,37]],
	[CTI_AMMO, 0, [80,37]]
]];

missionNamespace setVariable [format["CTI_%1_Defense_Template", _side], [
	[CTI_HEAVY, "AA", 270, 20],
	[CTI_AMMO, "SAM", 90, 30],
	[CTI_AIR, "RADAR", 90, 30],
	[CTI_LIGHT, "AT", 90, 20],
	[CTI_BARRACKS, "Defense", 90, 20],
	[CTI_CONTROLCENTER, "Defense", 270, 20],
	[CTI_REPAIR, "Defense", 90, 20]
]];

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
if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBBarracks")) then {
	_classes pushBack		["CDF_WarfareBBarracks", "Land_Scaffolding_New_F"];
} else {
	_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];					//Altis Military Buildings
};
_prices pushBack		2000;
_times pushBack			60;
_placements pushBack 	[0, 35];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_headers pushBack		[CTI_LIGHT, "Light Vehicle Factory", "Light"];
	if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBLightFactory")) then {
		_classes pushBack		["CDF_WarfareBLightFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];				//Altis Military Buildings
	};
	_prices pushBack 		4000;
	_times pushBack 		80;
	_placements pushBack 	[0, 30];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

_headers pushBack 		[CTI_CONTROLCENTER, "Control Center", "CC"];
if (isClass(configFile >> "CfgVehicles" >> "GUE_WarfareBUAVterminal")) then {
	_classes pushBack 		["GUE_WarfareBUAVterminal", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F"];					//Altis Military Buildings
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[0, 25];
_helper pushBack		[""];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];


if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_headers pushBack 		[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBHeavyFactory")) then {
		_classes pushBack 		["RU_WarfareBHeavyFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"];				//Altis Military Buildings
	};
	_prices pushBack 		6000;
	_times pushBack 		120;
	_placements pushBack 	[0, 25];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];
};

if(CTI_ECONOMY_LEVEL_AIR >= 0) then {
	_headers pushBack 		[CTI_AIR, "Aircraft Factory", "Air"];
	if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBAircraftFactory")) then {
		_classes pushBack 		["RU_WarfareBAircraftFactory", "Land_Scaffolding_New_F"];
	} else {
		_classes pushBack 		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];			//Altis Military Buildings
	};
	_prices pushBack 		8000;
	_times pushBack 		140;
	_placements pushBack 	[0, 40];
	_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
	_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]]; 
};

_headers pushBack 		[CTI_AMMO, "Ammo Depot", "Ammo"];
if (isClass(configFile >> "CfgVehicles" >> "RU_WarfareBVehicleServicePoint")) then {
	_classes pushBack 		["RU_WarfareBVehicleServicePoint", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack		["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"];				//Altis Military Buildings
};
_prices pushBack 		2000;
_times pushBack 		90;
_placements pushBack 	[0, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

_headers pushBack 		[CTI_REPAIR, "Repair Depot", "Repair"];
if (isClass(configFile >> "CfgVehicles" >> "TK_GUE_WarfareBContructionSite_Base_EP1")) then {
	_classes pushBack 		["TK_GUE_WarfareBContructionSite_Base_EP1", "Land_PowGen_Big_ruins"];
} else {
	_classes pushBack 		["Land_Cargo_House_V3_F", "Land_Cargo_House_V3_ruins_F"];				//Altis Military Buildings
};
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[0, 25];
_helper pushBack		["Sign_Arrow_Large_Blue_F", 0];
_specials pushBack 		[["DMG_Reduce", CTI_BASE_BUILDING_DMG_REDUCE]];

if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
	_headers pushBack 		[CTI_NAVAL, "Naval Yard", "Naval"];
	_classes pushBack 		["Land_Cargo_House_V2_F", "Land_Cargo_House_V2_ruins_F"];			//Altis Military Buildings
	_prices pushBack 		3000;
	_times pushBack 		80;
	_placements pushBack 	[0, 60];
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
_tiers = [];

//FOB
_headers pushBack 			["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"],["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
if (isClass(configFile >> "CfgVehicles" >> "INS_WarfareBFieldhHospital")) then {
	_classes pushBack 			"INS_WarfareBFieldhHospital";
} else {
	_classes pushBack 			"Land_Medevac_house_V1_F";										//Altis Military Buildings
};
_prices pushBack 			([CTI_ECONOMY_PRIZE_WHEELED,1,true,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_placements pushBack 		[180, 15];
_categories pushBack 		"All";
_tiers pushBack 			1;

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels_east") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};


//"Land_vn_wf_field_hospital_east",
//"Land_vn_wf_vehicle_service_point_east",

/********************************************************************************************************************************
 *														TECH 0																	*
 ********************************************************************************************************************************/
 _tech_level = 0;

_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,12] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SOG_DLC > 0) then {
		_headers pushBack 		"[SOG] m1919 high";
		_classes pushBack 		"vn_b_army_static_m1919a4_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m1919 low 1";
		_classes pushBack 		"vn_b_army_static_m1919a4_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m1919 low 2";
		_classes pushBack 		"vn_b_army_static_m1919a6";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m2 Mortar";
		_classes pushBack 		"vn_b_army_static_mortar_m2";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] l70mk2 (AA)";
		_classes pushBack 		"vn_b_navy_static_l70mk2";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] m101 AT";
		_classes pushBack 		"vn_b_army_static_m101_01";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_RHS_ADDON > 0) then {
		_headers pushBack 		"[RHS] Static MG (M2)";
		_classes pushBack 		"RHS_M2StaticMG_D";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] Static MG low (M2)";
		_classes pushBack 		"RHS_M2StaticMG_MiniTripod_D";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[RHS] Static GW (MK19)";
		_classes pushBack 		"RHS_MK19_TriPod_D";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] Mortar";
		_classes pushBack 		"RHS_M252_D";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] Static SearchLight";
		_classes pushBack 		"CUP_B_CUP_SearchLight_static_US";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[CUP] Static MG (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_US";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG low (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_MiniTripod_US";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[CUP] Static GW (MK19)";
		_classes pushBack 		"CUP_B_MK19_TriPod_US";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Mortar";
		_classes pushBack 		"CUP_B_M252_US";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;	
	};
	if(CTI_CWR3_ADDON > 0) then {
		_headers pushBack 		"[CWr3] Static SearchLight";
		_classes pushBack 		"cwr3_b_searchlight";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[CWr3] Static MG (M2 high)";
		_classes pushBack 		"cwr3_b_m2hb_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[CWr3] Static MG (M2 low)";
		_classes pushBack 		"cwr3_b_m2hb_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[CWr3] Static GW (MK19)";
		_classes pushBack 		"cwr3_b_mk19";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] Mortar M252";
		_classes pushBack 		"cwr3_b_m252";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};	
};
/********************************************************************************************************************************
 *											Russia																				*
 ********************************************************************************************************************************/
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[RHS] Static MG (KORD)";
		_classes pushBack 		"rhs_KORD_high_VDV";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] Static MG low (KORD)";
		_classes pushBack 		"rhs_KORD_VDV";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] Static GW (AGS)";
		_classes pushBack 		"RHS_AGS30_TriPod_VDV";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] Mortar";
		_classes pushBack 		"rhs_2b14_82mm_vdv";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] Static SearchLight";
		_classes pushBack 		"CUP_O_SearchLight_static_RU";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG (KORD)";
		_classes pushBack 		"CUP_O_KORD_high_RU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG low (KORD)";
		_classes pushBack 		"CUP_O_KORD_RU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static GW (AGS)";
		_classes pushBack 		"CUP_O_AGS_RU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Mortar";
		_classes pushBack 		"CUP_O_2b14_82mm_RU";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CWR3_ADDON > 0) then {
		_headers pushBack 		"[CWr3] Static SearchLight";
		_classes pushBack 		"cwr3_o_searchlight";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] Static MG (NSV)";
		_classes pushBack 		"cwr3_o_nsv_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] Static MG low (NSV)";
		_classes pushBack 		"cwr3_o_nsv_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] Static GW (AGS)";
		_classes pushBack 		"cwr3_o_ags30";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] Mortar 2b14";
		_classes pushBack 		"cwr3_o_2b14";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											Bundeswehr (West Germany)															*
 ********************************************************************************************************************************/
if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {
		_headers pushBack 		"[GM] MG3 AA";
		_classes pushBack 		"gm_ge_army_mg3_aatripod";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[GM] M120 Mortar";
		_classes pushBack 		"gm_ge_army_m120";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_REDD_ADDON > 0) then {
		_headers pushBack 		"Static MG (MG3)";
		_classes pushBack 		"rnt_mg3_static";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	
		_headers pushBack 		"Static MG low (MG3 ai)";
		_classes pushBack 		"rnt_mg3_static_ai";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	
		_headers pushBack 		"Static GW (GMW)";
		_classes pushBack 		"rnt_gmw_static";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"Mortar (REDD)";
		_classes pushBack 		"Redd_Tank_M120_Tampella";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											NVA (East Germany)																	*
 ********************************************************************************************************************************/
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {
		_headers pushBack 		"[GM] DShKM";
		_classes pushBack 		"gm_gc_army_dshkm_aatripod";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[GM] 2b11 mortar";
		_classes pushBack 		"gm_gc_army_2b11";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SOG_DLC > 0) then {
			_headers pushBack 		"[SOG] RPD (MG)";
			_classes pushBack 		"vn_o_nva_static_rpd_high";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] SMG";
			_classes pushBack 		"vn_o_nva_static_sgm_low_01";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] SMG (Shield)";
			_classes pushBack 		"vn_o_nva_static_sgm_low_02";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] SGM (AA MG)";
			_classes pushBack 		"vn_o_nva_static_sgm_high_01";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[SOG] Type 63 mortar";
			_classes pushBack 		"vn_o_nva_static_mortar_type63";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[SOG] D44 AT";
			_classes pushBack 		"vn_o_nva_static_d44";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] Spiderhole 1";
			_classes pushBack 		"vn_o_nva_spiderhole_01";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] Spiderhole 2";
			_classes pushBack 		"vn_o_nva_spiderhole_02";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[SOG] Spiderhole 3";
			_classes pushBack 		"vn_o_nva_spiderhole_03";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
	};
};

/********************************************************************************************************************************
 *											CDF (BLUFOR/GREEN)																	*
 ********************************************************************************************************************************/
if(CTI_CDF_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == west) then {
			_headers pushBack 		"[RHS] Static MG (DSHKM)";
			_classes pushBack 		"rhsgref_cdf_b_DSHKM";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] Static MG low (DSHKM)";
			_classes pushBack 		"rhsgref_cdf_b_DSHKM_Mini_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[RHS] Static GW (AGS30)";
			_classes pushBack 		"rhsgref_cdf_b_AGS30_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] M252 Mortar";
			_classes pushBack 		"rhsgref_cdf_b_reg_M252";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] Static MG (DSHKM)";
			_classes pushBack 		"rhsgref_cdf_DSHKM";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] Static MG low (DSHKM)";
			_classes pushBack 		"rhsgref_cdf_DSHKM_Mini_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[RHS] Static GW (AGS30)";
			_classes pushBack 		"rhsgref_cdf_AGS30_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] M252 Mortar";
			_classes pushBack 		"rhsgref_cdf_reg_M252";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
		};
	};
};

/********************************************************************************************************************************
 *											CHDKZ (BLUFOR/GREEN)																*
 ********************************************************************************************************************************/
if(CTI_CHDKZ_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == east) then {
			_headers pushBack 		"[RHS] Static MG (DSHKM)";
			_classes pushBack 		"rhsgref_ins_DSHKM";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] Static MG low (DSHKM)";
			_classes pushBack 		"rhsgref_ins_DSHKM_Mini_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[RHS] Static GW (AGS30)";
			_classes pushBack 		"rhsgref_ins_AGS30_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] 2b14 Mortar";
			_classes pushBack 		"rhsgref_ins_2b14";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] Static MG (DSHKM)";
			_classes pushBack 		"rhsgref_ins_g_DSHKM";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] Static MG low (DSHKM)";
			_classes pushBack 		"rhsgref_ins_g_DSHKM_Mini_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;

			_headers pushBack 		"[RHS] Static GW (AGS30)";
			_classes pushBack 		"rhsgref_ins_g_AGS30_TriPod";
			_prices pushBack 		_priceMG;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Defense";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] 2b14 Mortar";
			_classes pushBack 		"rhsgref_ins_g_2b14";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
		};
	};
};
/********************************************************************************************************************************
 *											Ukrainia																			*
 ********************************************************************************************************************************/
 if(CTI_UKRAIN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] Static MG (DSHKM)";
		_classes pushBack 		"CUP_B_DSHKM_AFU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG low (DSHKM)";
		_classes pushBack 		"CUP_B_DSHkM_MiniTriPod_AFU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_AFU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static MG low (M2)";
		_classes pushBack 		"CUP_B_M2StaticMG_MiniTripod_AFU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Static GW (AGS)";
		_classes pushBack 		"CUP_B_AGS_AFU";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] Mortar";
		_classes pushBack 		"CUP_B_2b14_82mm_AFU";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *														TECH 1																	*
 ********************************************************************************************************************************/
 _tech_level = 1;

_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArtyLight = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,20] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,6] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,12] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		_headers pushBack 		"[RHS] M119";
		_classes pushBack 		"RHS_M119_D";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] M119";
		_classes pushBack 		"CUP_B_M119_US";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CWR3_ADDON > 0) then {
		_headers pushBack 		"[CWr3] M119";
		_classes pushBack 		"cwr3_b_m119";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SOG_DLC > 0) then {
		_headers pushBack 		"[SOG] m2 MG high";
		_classes pushBack 		"vn_b_army_static_m2_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m2 MG low";
		_classes pushBack 		"vn_b_army_static_m2_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] mk18 GL";
		_classes pushBack 		"vn_b_army_static_mk18";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m29 Mortar";
		_classes pushBack 		"vn_b_army_static_mortar_m29";
		_prices pushBack 		_priceArtyLight;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m45 (Quad AA)";
		_classes pushBack 		"vn_b_army_static_m45";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] l60mk3 (AA)";
		_classes pushBack 		"vn_b_navy_static_l60mk3";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] m40a1rr AT-Launcher";
		_classes pushBack 		"vn_b_army_static_m40a1rr";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											Russia																				*
 ********************************************************************************************************************************/
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_RHS_ADDON > 0) then {
		_headers pushBack 		"[RHS] D30 Arty";
		_classes pushBack 		"rhs_D30_vdv";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] D30 AT";
		_classes pushBack 		"rhs_D30_at_vdv";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] SPG9M AT";
		_classes pushBack 		"rhs_SPG9M_VDV";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] NSV";
		_classes pushBack 		"RHS_NSV_TriPod_VDV";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] AA Defense (ZU23)";
		_classes pushBack 		"RHS_ZU23_VDV";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CUP_ADDON > 0) then {
		
		_headers pushBack 		"[CUP] D30 Arty";
		_classes pushBack 		"CUP_O_D30_RU";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] D30 AT";
		_classes pushBack 		"CUP_O_D30_AT_RU";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AA Defense (ZU23)";
		_classes pushBack 		"CUP_O_ZU23_RU";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
	};
	if(CTI_CWR3_ADDON > 0) then {
		
		_headers pushBack 		"[CWr3] D30 Arty";
		_classes pushBack 		"cwr3_o_d30";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] D30 AT";
		_classes pushBack 		"cwr3_o_d30_at";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] AT Defense (Spg9)";
		_classes pushBack 		"cwr3_o_spg9";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CWr3] AA Defense (ZU23)";
		_classes pushBack 		"cwr3_o_zu23";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											NVA (East Germany)																	*
 ********************************************************************************************************************************/
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {
		_headers pushBack 		"SPG 9 (GM)";
		_classes pushBack 		"gm_gc_army_spg9_tripod";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SOG_DLC > 0) then {
		_headers pushBack 		"[SOG] dshkm high";
		_classes pushBack 		"vn_o_nva_static_dshkm_high_01";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] dshkm low 2";
		_classes pushBack 		"vn_o_nva_static_dshkm_low_02";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] dshkm low 1";
		_classes pushBack 		"vn_o_nva_static_dshkm_low_01";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] dshkm AA";
		_classes pushBack 		"vn_o_nva_static_dshkm_high_02";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] AA Defense (zpu4)";
		_classes pushBack 		"vn_o_nva_static_zpu4";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] AA Defense (v11m)";
		_classes pushBack 		"vn_o_nva_navy_static_v11m";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] AA Defense (zgu1)";
		_classes pushBack 		"vn_o_nva_65_static_zgu1_01";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SOG] Type53 heavy Mortar";
		_classes pushBack 		"vn_o_nva_static_mortar_type53";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] type56rr AT";
		_classes pushBack 		"vn_o_nva_static_type56rr";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											CDF (BLUFOR/GREEN)																	*
 ********************************************************************************************************************************/
if(CTI_CDF_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == west) then {
			_headers pushBack 		"[RHS] D30 Arty";
			_classes pushBack 		"rhsgref_cdf_b_reg_d30";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] D30 AT";
			_classes pushBack 		"rhsgref_cdf_b_reg_d30_at";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9 AT";
			_classes pushBack 		"rhsgref_cdf_b_SPG9";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9M AT";
			_classes pushBack 		"rhsgref_cdf_b_SPG9M";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] NSV";
			_classes pushBack 		"rhsgref_cdf_b_NSV_TriPod";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] AA Defense (ZU23)";
			_classes pushBack 		"rhsgref_cdf_b_ZU23";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] D30 Arty";
			_classes pushBack 		"rhsgref_cdf_reg_d30";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] D30 AT";
			_classes pushBack 		"rhsgref_cdf_reg_d30_at";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9 AT";
			_classes pushBack 		"rhsgref_cdf_SPG9";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9M AT";
			_classes pushBack 		"rhsgref_cdf_SPG9M";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] NSV";
			_classes pushBack 		"rhsgref_cdf_NSV_TriPod";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] AA Defense (ZU23)";
			_classes pushBack 		"RHSgref_cdf_ZU23";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
	};
};

/********************************************************************************************************************************
 *											CHDKZ (BLUFOR/GREEN)																*
 ********************************************************************************************************************************/
if(CTI_CHDKZ_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == east) then {
			_headers pushBack 		"[RHS] D30 Arty";
			_classes pushBack 		"rhsgref_ins_d30";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] D30 AT";
			_classes pushBack 		"rhsgref_ins_d30_at";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9 AT";
			_classes pushBack 		"rhsgref_ins_SPG9";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9M AT";
			_classes pushBack 		"rhsgref_ins_SPG9M";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] NSV";
			_classes pushBack 		"rhsgref_ins_NSV_TriPod";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] AA Defense (ZU23)";
			_classes pushBack 		"rhsgref_ins_ZU23";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] D30 Arty";
			_classes pushBack 		"rhsgref_ins_g_d30";
			_prices pushBack 		_priceArty;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"Arty";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] D30 AT";
			_classes pushBack 		"rhsgref_ins_g_d30_at";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9 AT";
			_classes pushBack 		"rhsgref_ins_g_SPG9";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] SPG9M AT";
			_classes pushBack 		"rhsgref_ins_g_SPG9M";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] NSV";
			_classes pushBack 		"rhsgref_ins_g_NSV_TriPod";
			_prices pushBack 		_priceGun;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AT";
			_tiers pushBack 		_tech_level;
			
			_headers pushBack 		"[RHS] AA Defense (ZU23)";
			_classes pushBack 		"rhsgref_ins_g_ZU23";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
	};
};
/********************************************************************************************************************************
 *											Ukrainia																			*
 ********************************************************************************************************************************/
 if(CTI_UKRAIN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] D30 Arty";
		_classes pushBack 		"CUP_B_D30_AFU";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] D30 AT";
		_classes pushBack 		"CUP_B_D30_AT_AFU";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[CUP] SPG9 AT";
		_classes pushBack 		"CUP_B_SPG9_AFU";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AA Defense (ZU23)";
		_classes pushBack 		"CUP_B_ZU23_AFU";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
 };
/********************************************************************************************************************************
 *														TECH 2																	*
 ********************************************************************************************************************************/
 _tech_level = 2;

_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,12] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SOG_DLC > 0) then {
		
		_headers pushBack 		"[SOG] m2 scoped high";
		_classes pushBack 		"vn_b_army_static_m2_scoped_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m2 scoped low";
		_classes pushBack 		"vn_b_army_static_m2_scoped_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m60 high";
		_classes pushBack 		"vn_b_army_static_m60_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] m60 low";
		_classes pushBack 		"vn_b_army_static_m60_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;

		_headers pushBack 		"[SOG] m101 heavy Arty";
		_classes pushBack 		"vn_b_army_static_m101_02";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] tow AT";
		_classes pushBack 		"vn_b_army_static_tow";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_RHS_ADDON > 0) then {
		_headers pushBack 		"[RHS] AT Defense (TOW)";
		_classes pushBack 		"RHS_TOW_TriPod_D";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] AA Defense (Stinger)";
		_classes pushBack 		"RHS_Stinger_AA_pod_D";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] AT Defense (TOW)";
		_classes pushBack 		"CUP_B_TOW_TriPod_US";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AT Defense (TOW2)";
		_classes pushBack 		"CUP_B_TOW2_TriPod_US";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AA Defense (Stinger)";
		_classes pushBack 		"CUP_B_CUP_Stinger_AA_pod_US";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CWR3_ADDON > 0) then {
		_headers pushBack 		"[CWr3] AT Defense (TOW)";
		_classes pushBack 		"cwr3_b_tow";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};	
};
/********************************************************************************************************************************
 *											Russia																				*
 ********************************************************************************************************************************/
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_RHS_ADDON > 0) then {
		_headers pushBack 		"[RHS] AT Defense (Metis)";
		_classes pushBack 		"rhs_Metis_9k115_2_vdv";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] AT Defense (Kornet)";
		_classes pushBack 		"rhs_Kornet_9M133_2_vdv";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[RHS] AA Defense (Igla)";
		_classes pushBack 		"rhs_Igla_AA_pod_vdv";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] AT Defense (Metis)";
		_classes pushBack 		"CUP_O_Metis_RU";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AT Defense (Kornet)";
		_classes pushBack 		"CUP_O_Kornet_RU";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[CUP] AA Defense (Igla)";
		_classes pushBack 		"CUP_O_Igla_AA_pod_RU";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
	};
	if(CTI_CWR3_ADDON > 0) then {
		_headers pushBack 		"[CWr3] AT Defense (Konkurs)";
		_classes pushBack 		"cwr3_o_konkurs_tripod";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											Bundeswehr (West Germany)															*
 ********************************************************************************************************************************/
if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {
		_headers pushBack 		"[GM]AT Milan";
		_classes pushBack 		"gm_ge_army_milan_launcher_tripod";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_REDD_ADDON > 0) then {
		_headers pushBack 		"[REDD] AT Milan";
		_classes pushBack 		"Redd_Milan_Static";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											NVA (East Germany / Viet Cong)														*
 ********************************************************************************************************************************/
_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,8] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,16] call CTI_CO_FNC_GetCalculatedUnitsPrize;

if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {		
		_headers pushBack 		"[GM] AT Fagot";
		_classes pushBack 		"gm_gc_army_fagot_launcher_tripod";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
	if(CTI_SOG_DLC > 0) then {
		_headers pushBack 		"[SOG] pk high";
		_classes pushBack 		"vn_o_nva_static_pk_high";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] pk low";
		_classes pushBack 		"vn_o_nva_static_pk_low";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] d44 Arty";
		_classes pushBack 		"vn_o_nva_static_d44_01";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] h12 Rockets";
		_classes pushBack 		"vn_o_nva_static_h12";
		_prices pushBack 		_priceArty;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Arty";
		_tiers pushBack 		_tech_level;
			
		_headers pushBack 		"[SOG] at3 AT";
		_classes pushBack 		"vn_o_nva_static_at3";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;

		
		_headers pushBack 		"[SOG] rsna75 SAM Radar System";
		_classes pushBack 		"vn_o_static_rsna75";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"RADAR";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"[SOG] sa2 SAM System";
		_classes pushBack 		"vn_sa2";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"SAM";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											CDF (BLUFOR/GREEN)																	*
 ********************************************************************************************************************************/
if(CTI_CDF_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == west) then {
			_headers pushBack 		"[RHS] AA Defense (Igla)";
			_classes pushBack 		"rhsgref_cdf_b_Igla_AA_pod";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] AA Defense (Igla)";
			_classes pushBack 		"rhsgref_cdf_Igla_AA_pod";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
	};
};

/********************************************************************************************************************************
 *											CHDKZ (BLUFOR/GREEN)																*
 ********************************************************************************************************************************/
if(CTI_CHDKZ_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == west) then {
			_headers pushBack 		"[RHS] AA Defense (Igla)";
			_classes pushBack 		"rhsgref_ins_Igla_AA_pod";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		} else {
			_headers pushBack 		"[RHS] AA Defense (Igla)";
			_classes pushBack 		"rhsgref_ins_g_Igla_AA_pod";
			_prices pushBack 		_priceAA;
			_placements pushBack 	[180, 5];
			_categories pushBack 	"AA";
			_tiers pushBack 		_tech_level;
		};
	};
};

/********************************************************************************************************************************
 *											Ukrainia																			*
 ********************************************************************************************************************************/
 if(CTI_UKRAIN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_headers pushBack 		"[CUP] AA Defense (Igla)";
		_classes pushBack 		"CUP_B_Igla_AA_pod_AFU";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
	};
 };
/********************************************************************************************************************************
 *														TECH 3																	*
 ********************************************************************************************************************************/
 _tech_level = 3;

_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,8] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,16] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											Others		Surface to Air Missile													*
 ********************************************************************************************************************************/
if(_side == west) then {
	if(CTI_BW_ADDON > 0) then {
		_headers pushBack 		"SAM Radar System";
		_classes pushBack 		"TBW_MEADS_Radar_Fleck";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"RADAR";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"SAM System";
		_classes pushBack 		"TBW_MEADS_Launcher_Fleck";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"SAM";
		_tiers pushBack 		_tech_level;
	} else {
		_headers pushBack 		"SAM Radar System";
		_classes pushBack 		"B_Radar_System_01_F";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"RADAR";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"SAM System";
		_classes pushBack 		"B_SAM_System_03_F";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"SAM";
		_tiers pushBack 		_tech_level;
	};
} else {
	_headers pushBack 		"SAM Radar System";
	_classes pushBack 		"O_Radar_System_02_F";
	_prices pushBack 		_priceBase;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"RADAR";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"SAM System";
	_classes pushBack 		"O_SAM_System_04_F";
	_prices pushBack 		_priceAA;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"SAM";
	_tiers pushBack 		_tech_level;
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels select CTI_UPGRADE_DEFENSE) then {
	_upgrade_levels set [CTI_UPGRADE_DEFENSE, (_tech_level)];
};

//******************************BASE DEFENSE 0*******************************************************************************************************
 _tech_level = 0;

_priceBase = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceFence = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceWall = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,2] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceBunkerS = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,3] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceBunkerM = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceBunkerL = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,6] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceDummy = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,5] call CTI_CO_FNC_GetCalculatedUnitsPrize;

/*_headers pushBack 		"Bunker (Small)";
_classes pushBack 		"Land_BagBunker_Small_F";
_prices pushBack 		150;
_placements pushBack 	[0, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

//Tall Roof
_headers pushBack  		"Shed (Roof)";
_classes pushBack  		"Land_Shed_Big_F";
_prices pushBack 		2000;
_placements pushBack 	[0, 15];
_categories pushBack 	"Sheds";
_tiers pushBack 		_tech_level;

// Short roof with one wall side
_headers pushBack 		"Shed (Land)";
_classes pushBack 		"Land_Shed_Small_F";
_prices pushBack 		2000;
_placements pushBack 	[90, 15];
_categories pushBack 	"Sheds";
_tiers pushBack 		_tech_level;
	
_headers pushBack 		"Heli Pad";
_classes pushBack 		"Land_HelipadSquare_F";
_prices pushBack 		100;
_placements pushBack 	[0, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Lamp";
_classes pushBack 		"Land_LampHalogen_F";
_prices pushBack 		5;
_placements pushBack 	[90, 15];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Warning Sign- Mines";
_classes pushBack 		"Land_Sign_Mines_F";
_prices pushBack 		1;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Campfire";
_classes pushBack 		"FirePlace_burning_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Camp Chair";
_classes pushBack 		"Land_CampingChair_V1_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Camp Table";
_classes pushBack 		"Land_CampingTable_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;*/

_headers pushBack 		"Latrine";
_classes pushBack 		"Land_ToiletBox_F";
_prices pushBack 		_priceBase;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

/*_headers pushBack 		"Tent";
_classes pushBack 		"Land_TentDome_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Double Portable Light";
_classes pushBack 		"Land_PortableLight_double_F";
_prices pushBack 		50;
_placements pushBack 	[90, 7];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;
	
_headers pushBack 		"Map";
_classes pushBack 		"MapBoard_altis_F";
_prices pushBack 		1;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Runway Light (Blue)";
_classes pushBack 		"Land_runway_edgelight_blue_F";
_prices pushBack 		1;
_placements pushBack 	[0, 5];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"WindSock";
_classes pushBack 		"Windsock_01_F";
_prices pushBack 		1;
_placements pushBack 	[0, 5];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;*/

_headers pushBack 		"Dirt ramp";
_classes pushBack 		"Land_Rampart_F";
_prices pushBack 		_priceBase;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Concrete ramp";
_classes pushBack 		"Land_RampConcrete_F";
_prices pushBack 		_priceDummy;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Wooden pier";
_classes pushBack 		"Land_PierWooden_02_16m_F";
_prices pushBack 		_priceDummy;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Concrete pier";
_classes pushBack 		"Land_PierConcrete_01_16m_F";
_prices pushBack 		_priceDummy;
_placements pushBack 	[180, 10];
_categories pushBack 	"Misc";
_tiers pushBack 		_tech_level;

/*_headers pushBack 		"Camo net";
_classes pushBack 		"CamoNet_BLUFOR_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Camo net open";
_classes pushBack 		"CamoNet_BLUFOR_open_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;

_headers pushBack 		"Camo net vehicle";
_classes pushBack 		"CamoNet_BLUFOR_big_F";
_prices pushBack 		50;
_placements pushBack 	[0, 15];
_categories pushBack 	"Camo";
_tiers pushBack 		_tech_level;*/


_headers pushBack 		["Wall IndCnc 2deco",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_IndCnc_2deco_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Wall_IndCnc 4 D",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_IndCnc_4_D_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Wall IndCnc 4",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_IndCnc_4_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WiredFence 01 16m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_WiredFence_01_16m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WiredFence 01 4m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_WiredFence_01_4m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WiredFence 01 8m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_WiredFence_01_8m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WiredFence 01 pole",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_WiredFence_01_pole_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["TinWall_02 4m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_TinWall_02_l_4m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["TinWall 02 8m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_TinWall_02_l_8m_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["TinWall 02 pole",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_TinWall_02_l_pole_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Wall Tin Pole",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_Tin_Pole";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Wall Tin 4",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_Tin_4";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Wall Tin 4 2",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Wall_Tin_4_2";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Bar Gate",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_BarGate_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Bar Gate open",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_BarGate_01_open_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["Road Barrier",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_RoadBarrier_01_F";
_prices pushBack 		_priceFence;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["CamoConcreteWall 01 4m d v1",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_CamoConcreteWall_01_l_4m_d_v1_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fence";
_tiers pushBack 		_tech_level;

_headers pushBack 		["CamoConcreteWall 01 4m d v2",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_CamoConcreteWall_01_l_4m_d_v2_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["CamoConcreteWall 01 4m v1",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_CamoConcreteWall_01_l_4m_v1_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["CamoConcreteWall 01 4m v2",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_CamoConcreteWall_01_l_4m_v2_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["CamoConcreteWall 01 pole",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_CamoConcreteWall_01_pole_v1_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WallBig 4m",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Mil_WallBig_4m_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WallBig 4m battered",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Mil_WallBig_4m_battered_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WallBig Corner",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Mil_WallBig_Corner_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;

_headers pushBack 		["WallBig corner battered",[["CanAutoAlign", 3.8, 0]]];
_classes pushBack 		"Land_Mil_WallBig_corner_battered_F";
_prices pushBack 		_priceWall;
_placements pushBack 	[0, 7];
_categories pushBack 	"Walls";
_tiers pushBack 		_tech_level;


if(CTI_SOG_DLC > 0) then {

//"Land_vn_b_prop_mapstand_01",
//"vn_camonet_blufor_f",
//"vn_camonet_blufor_big_f",
//"vn_camonet_blufor_open_f",
//"Land_vn_camonet_east",
//"Land_vn_camonet_nato",
//"Land_vn_camonetb_east",
//"Land_vn_camonetb_nato",
//"Land_vn_camonet_support",

//"Land_vn_bunker_big_01",
//"Land_vn_bunker_big_02",
//"Land_vn_bunker_small_01",
	
	_headers pushBack 		["razorwire",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_razorwire_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		["fence 4m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_net_fence_4m_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		["fence gate",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_net_fence_gate_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence 8m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_net_fence_8m_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["barricade 01 4m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_barricade_01_4m_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		["sandbagbarricade 01 half",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_sandbagbarricade_01_half_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["sandbagbarricade 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_sandbagbarricade_01_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["sandbagbarricade 01 hole",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_sandbagbarricade_01_hole_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence corner",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_corner_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence 01 corner green",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_01_corner_green_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence end",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_end_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence 01 end green",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_01_end_green_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence 01 long green",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_01_long_green_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence round",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_round_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence 01 round green",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_01_round_green_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence short",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_short_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bagfence 01 short green",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bagfence_01_short_green_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bagfence";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		["bamboofence 01 4m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bamboofence_01_s_4m_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bamboofence 01 8m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bamboofence_01_s_8m_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["bamboofence pole",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_bamboofence_01_s_pole_f";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 01 10",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_01_10";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 01 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_01_03";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 01 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_01_05";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_02";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 01 10",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_01_10";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 01 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_01_03";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 01 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_01_05";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 02 10",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_02_10";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 02 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_02_03";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence punji 02 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_punji_02_05";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 02 gate",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_02_gate";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["fence bamboo 01 gate",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_fence_bamboo_01_gate";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Bamboo";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		["trench bunker 05 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_05_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 05 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_05_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 06 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_06_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 06 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_06_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["foxhole 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_foxhole_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["mortarpit 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_mortarpit_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 05 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_05_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 05 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_05_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 05 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_05_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench corner 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_corner_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench end 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_end_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench stair 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_stair_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench stair 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_stair_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench revetment 05 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_revetment_05_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench revetment tall 09",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_revetment_tall_09";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 01 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_01_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 01 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_01_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 01 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_01_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 03 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_03_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 03 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_03_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 03 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_03_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bunker 02";
	_classes pushBack 		"Land_vn_o_bunker_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bunker 04";
	_classes pushBack 		"Land_vn_o_bunker_04";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bunker 03";
	_classes pushBack 		"Land_vn_o_bunker_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bunker 01";
	_classes pushBack 		"Land_vn_o_bunker_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"shelter 05";
	_classes pushBack 		"Land_vn_o_shelter_05";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 04";
	_classes pushBack 		"Land_vn_o_platform_04";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 02";
	_classes pushBack 		"Land_vn_o_platform_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 03";
	_classes pushBack 		"Land_vn_o_platform_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 01";
	_classes pushBack 		"Land_vn_o_platform_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 06";
	_classes pushBack 		"Land_vn_o_platform_06";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"platform 05";
	_classes pushBack 		"Land_vn_o_platform_05";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["shelter 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_shelter_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["shelter 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_shelter_04";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["shelter 06",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_shelter_06";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["shelter 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_shelter_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["shelter 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_shelter_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["wallfoliage 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_wallfoliage_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"snipertree 01";
	_classes pushBack 		"Land_vn_o_snipertree_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"snipertree 01 2";
	_classes pushBack 		"vn_o_snipertree_01";//unit active?
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tower 01",;
	_classes pushBack 		"Land_vn_o_tower_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tower 02",;
	_classes pushBack 		"Land_vn_o_tower_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tower 03";
	_classes pushBack 		"Land_vn_o_tower_03";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trapdoor 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_trapdoor_01";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trapdoor 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_trapdoor_02";
	_prices pushBack 		_priceBunkerS;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;

//"Land_vn_czechhedgehog_01_f",

	_headers pushBack 		["trench bunker 01 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_01_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 01 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_01_02";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 01 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_01_03";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 02 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_02_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 02 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_02_02";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 02 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_02_03";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 02 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_02_04";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"Tower 01";
	_classes pushBack 		"Land_vn_b_tower_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["barricade 01 10m",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_barricade_01_10m_f";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 45 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_45_02";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 45 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_45_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 90 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_90_02";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 90 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_90_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_firing_04";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_firing_05";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_firing_03";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench revetment tall 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_revetment_tall_03";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench revetment 90 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_revetment_90_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 05 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_05_01";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 05 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_05_03";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 05 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_05_02";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_snipertree_04";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 04 2",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"vn_o_snipertree_04";
	_prices pushBack 		_priceBunkerM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;


	_headers pushBack 		["trench bunker 03 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_03_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 03 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_03_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 03 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_03_03";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 03 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_03_04";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench bunker 04 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_bunker_04_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["gunpit 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_gunpit_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 20 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_20_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench 20 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_20_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench cross 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_cross_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench cross 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_cross_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench tee 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_tee_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_firing_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_firing_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 10 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_10_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench wall 10 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_10_03";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_b_trench_wall_10_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_snipertree_03";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 03 2",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"vn_o_snipertree_03";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_snipertree_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["snipertree 02 2",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"vn_o_snipertree_02";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["trench firing 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_o_trench_firing_01";
	_prices pushBack 		_priceBunkerL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_tiers pushBack 		_tech_level;

//******************************BASE DEFENSE 1*******************************************************************************************************
 _tech_level = 1;

_priceWall = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,2] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceWallM = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,3] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceWallL = [CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,false,4] call CTI_CO_FNC_GetCalculatedUnitsPrize;

	_headers pushBack 		["revetment 1 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_01";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_02";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_03";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_04";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_05";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 06",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_06";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 07",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_07";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 08",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_08";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 09",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_09";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1 10",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1_10";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment low 2",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_low_2";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment low 3",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_low_3";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_01";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_02";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_03";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_04";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 1",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_1";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 2",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_2";
	_prices pushBack 		_priceWall;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		["revetment low 8",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_low_8";
	_prices pushBack 		_priceWallM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment 3",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_3";
	_prices pushBack 		_priceWallM;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;

	
	_headers pushBack 		["revetment comp 01",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_01";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 02",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_02";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 03",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_03";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 04",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_04";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 05",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_05";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 06",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_06";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 07",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_07";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 08",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_08";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 09",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_09";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp 10",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_10";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["revetment comp solo",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_comp_solo_01";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		["Revetment 8",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_vn_usaf_revetment_8";
	_prices pushBack 		_priceWallL;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Revetment";
	_tiers pushBack 		_tech_level;
};

//buildings gets declared twice if we try it like that - pause to find another solution -.-
/*
_headers pushBack 		"HQ Dummy";
_classes pushBack 		"Land_Research_house_V1_F";
_prices pushBack 		_priceDummy;
_placements pushBack 	[180, 5];
_categories pushBack 	"Dummy";
_tiers pushBack 		_tech_level;

if (isClass(configFile >> "CfgVehicles" >> "CDF_WarfareBBarracks")) then {
	_headers pushBack 		"Repair Depot Dummy";
	_classes pushBack 		"TK_GUE_WarfareBContructionSite_Base_EP1";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Ammo Depot Dummy";
	_classes pushBack 		"RU_WarfareBVehicleServicePoint";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"FOB Dummy";
	_classes pushBack 		"INS_WarfareBFieldhHospital";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Light Factory Dummy";
	_classes pushBack 		"CDF_WarfareBLightFactory";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Heavy Factory Dummy";
	_classes pushBack 		"RU_WarfareBHeavyFactory";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Aircraft Factory Dummy";
	_classes pushBack 		"RU_WarfareBAircraftFactory";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Barracks Dummy";
	_classes pushBack 		"CDF_WarfareBBarracks";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Control Center Dummy";
	_classes pushBack 		"GUE_WarfareBUAVterminal";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;
} else {
	_headers pushBack 		"Repair Depot Dummy";
	_classes pushBack 		"Land_Cargo_House_V3_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Ammo Depot Dummy";
	_classes pushBack 		"Land_Cargo_House_V1_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"FOB Dummy";
	_classes pushBack 		"Land_Medevac_house_V1_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Light Factory Dummy";
	_classes pushBack 		"Land_Cargo_HQ_V3_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Heavy Factory Dummy";
	_classes pushBack 		"Land_Cargo_HQ_V1_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Aircraft Factory Dummy";
	_classes pushBack 		"Land_Medevac_HQ_V1_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Barracks Dummy";
	_classes pushBack 		"Land_Cargo_HQ_V2_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"Control Center Dummy";
	_classes pushBack 		"Land_Research_HQ_F";
	_prices pushBack 		_priceDummy;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Dummy";
	_tiers pushBack 		_tech_level;
};

_headers pushBack 		"Naval Yard Dummy";
_classes pushBack 		"Land_Cargo_House_V2_F";
_prices pushBack 		_priceDummy;
_placements pushBack 	[180, 5];
_categories pushBack 	"Dummy";
_tiers pushBack 		_tech_level;*/

//--------------------------------------------------------------------------------------------------------
//										Mines
//--------------------------------------------------------------------------------------------------------
_tech_level = 0;

_priceAP = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize;
_priceAT = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize;

_headers pushBack 		"Training Mine";
_classes pushBack 		"TrainingMine_01_F";
_prices pushBack 		_priceAP;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

_headers pushBack 		"APERS Bounding Mine";
_classes pushBack 		"APERSBoundingMine";
_prices pushBack 		_priceAP;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

_headers pushBack 		"APERS Mine";
_classes pushBack 		"APERSMine";
_prices pushBack 		_priceAP;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

_headers pushBack 		"APERS Trip Mine";
_classes pushBack 		"APERSTripMine";
_prices pushBack 		_priceAP;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

_headers pushBack 		"M6 SLAM Mine";
_classes pushBack 		"SLAMDirectionalMine";
_prices pushBack 		_priceAP;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

_headers pushBack 		"AT Mine";
_classes pushBack 		"ATMine";
_prices pushBack 		_priceAT;
_placements pushBack 	[0, 0];
_categories pushBack 	"Mine";
_tiers pushBack 		_tech_level;

if(CTI_CUP_ADDON > 0) then {
	_headers pushBack 		"AT-15 Mine";
	_classes pushBack 		"CUP_Mine";
	_prices pushBack 		_priceAT;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;

	_headers pushBack 		"TM46 AT Mine";
	_classes pushBack 		"CUP_MineE";
	_prices pushBack 		_priceAT;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
};

if(CTI_SOG_DLC > 0) then {
	_headers pushBack 		"m112 remote";
	_classes pushBack 		"vn_mine_m112_remote";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bangalore";
	_classes pushBack 		"vn_mine_bangalore";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"dh10 range";
	_classes pushBack 		"vn_mine_dh10_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"dh10";
	_classes pushBack 		"vn_mine_dh10";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m14";
	_classes pushBack 		"vn_mine_m14";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m15";
	_classes pushBack 		"vn_mine_m15";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m16";
	_classes pushBack 		"vn_mine_m16";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m18 range";
	_classes pushBack 		"vn_mine_m18_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m18";
	_classes pushBack 		"vn_mine_m18";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m18 x3 range";
	_classes pushBack 		"vn_mine_m18_x3_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"m18 x3";
	_classes pushBack 		"vn_mine_m18_x3";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"mk36 destructor";
	_classes pushBack 		"vn_mine_mk36_destructor";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"mk36";
	_classes pushBack 		"vn_mine_mk36";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	
	_headers pushBack 		"ammobox range";
	_classes pushBack 		"vn_mine_ammobox_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bike range";
	_classes pushBack 		"vn_mine_bike_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"bike";
	_classes pushBack 		"vn_mine_bike";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"cartridge range";
	_classes pushBack 		"vn_mine_cartridge_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"jerrycan range";
	_classes pushBack 		"vn_mine_jerrycan_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"jerrycan";
	_classes pushBack 		"vn_mine_jerrycan";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"lighter";
	_classes pushBack 		"vn_mine_lighter";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"limpet 02";
	_classes pushBack 		"vn_mine_limpet_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"limpet 01";
	_classes pushBack 		"vn_mine_limpet_01";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire m49 02";
	_classes pushBack 		"vn_mine_tripwire_m49_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire m49 04";
	_classes pushBack 		"vn_mine_tripwire_m49_04";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire mortar";
	_classes pushBack 		"vn_mine_tripwire_mortar";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"chicom no8";
	_classes pushBack 		"vn_mine_chicom_no8";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"pot range";
	_classes pushBack 		"vn_mine_pot_range";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"pot";
	_classes pushBack 		"vn_mine_pot";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tm57";
	_classes pushBack 		"vn_mine_tm57";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"punji 04";
	_classes pushBack 		"vn_mine_punji_04";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"punji 01";
	_classes pushBack 		"vn_mine_punji_01";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"punji 05";
	_classes pushBack 		"vn_mine_punji_05";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"punji 02";
	_classes pushBack 		"vn_mine_punji_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"punji 03";
	_classes pushBack 		"vn_mine_punji_03";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"satchel remote 02";
	_classes pushBack 		"vn_mine_satchel_remote_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"satchelcharge 02";
	_classes pushBack 		"vn_mine_satchelcharge_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire f1 02";
	_classes pushBack 		"vn_mine_tripwire_f1_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire f1 04";
	_classes pushBack 		"vn_mine_tripwire_f1_04";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire m16 02";
	_classes pushBack 		"vn_mine_tripwire_m16_02";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire m16 04";
	_classes pushBack 		"vn_mine_tripwire_m16_04";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"gboard";
	_classes pushBack 		"vn_mine_gboard";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"tripwire arty";
	_classes pushBack 		"vn_mine_tripwire_arty";
	_prices pushBack 		_priceAP;
	_placements pushBack 	[0, 0];
	_categories pushBack 	"Mine";
	_tiers pushBack 		_tech_level;
};

[_side, _headers, _classes, _prices, _placements, _categories, _tiers] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Base\Base.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
