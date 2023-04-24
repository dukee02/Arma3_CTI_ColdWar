_side = _this;
_sid = "";

_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_GM_ID) then {_setupBaseUnits = true;};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_GM.sqf";
};

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
	//case CTI_BW_ID: {};
	default {
		if (CTI_Log_Level >= CTI_Log_ERROR) then { ["ERROR", "FILE: Common\Config\Base\Base.sqf", format ["Basic units setup failed <%1>", _isThisMain] call CTI_CO_FNC_Log };
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: Common\Config\Base\Base.sqf", format ["Set HQ Vehicle [%1] for side [%2]", missionNamespace getVariable format["CTI_%1_HQ", _side], _side]] call CTI_CO_FNC_Log };

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
_placements pushBack 	[90, 35];
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
	_placements pushBack 	[90, 30];
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
_placements pushBack 	[90, 25];
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
	_placements pushBack 	[90, 25];
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
	_placements pushBack 	[90, 40];
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

/********************************************************************************************************************************
 *														TECH 0																	*
 ********************************************************************************************************************************/
 _tech_level = 0;

_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceMG = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,2.5] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceArty = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
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
		_headers pushBack 		"MG3 AA (GM)";
		_classes pushBack 		"gm_ge_army_mg3_aatripod";
		_prices pushBack 		_priceMG;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
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
		_headers pushBack 		"DShKM (GM)";
		_classes pushBack 		"gm_gc_army_dshkm_aatripod";
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
 *														TECH 1																	*
 ********************************************************************************************************************************/
 _tech_level = 1;

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
 *														TECH 2																	*
 ********************************************************************************************************************************/
 _tech_level = 2;

_priceGun = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,10] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,false,12] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
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
		_headers pushBack 		"AT Milan (GM)";
		_classes pushBack 		"gm_ge_army_milan_launcher_tripod";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
	if (CTI_REDD_ADDON > 0) then {
		_headers pushBack 		"AT Milan (REDD)";
		_classes pushBack 		"Redd_Milan_Static";
		_prices pushBack 		_priceGun;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AT";
		_tiers pushBack 		_tech_level;
	};
};
/********************************************************************************************************************************
 *											NVA (East Germany)																	*
 ********************************************************************************************************************************/
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_GM_DLC > 0) then {		
		_headers pushBack 		"AT Fagot (GM)";
		_classes pushBack 		"gm_gc_army_fagot_launcher_tripod";
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
 *														TECH 3																	*
 ********************************************************************************************************************************/
 _tech_level = 3;

_priceBase = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,8] call CTI_CO_FNC_GetCalculatedUnitsPrize;
_priceAA = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,true,16] call CTI_CO_FNC_GetCalculatedUnitsPrize;
/********************************************************************************************************************************
 *											Others																				*
 ********************************************************************************************************************************/
if(_side == west) then {
	if(CTI_BW_ADDON > 0) then {
		_headers pushBack 		"Radar System";
		_classes pushBack 		"TBW_MEADS_Radar_Fleck";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"SAM System";
		_classes pushBack 		"TBW_MEADS_Launcher_Fleck";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	} else {
		_headers pushBack 		"Radar System";
		_classes pushBack 		"B_Radar_System_01_F";
		_prices pushBack 		_priceBase;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
		
		_headers pushBack 		"SAM System";
		_classes pushBack 		"B_SAM_System_03_F";
		_prices pushBack 		_priceAA;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"AA";
		_tiers pushBack 		_tech_level;
	};
} else {
	_headers pushBack 		"Radar System";
	_classes pushBack 		"O_Radar_System_02_F";
	_prices pushBack 		_priceBase;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"AA";
	_tiers pushBack 		_tech_level;
	
	_headers pushBack 		"SAM System";
	_classes pushBack 		"O_SAM_System_04_F";
	_prices pushBack 		_priceAA;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"AA";
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

[_side, _headers, _classes, _prices, _placements, _categories, _tiers] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Base\Base.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
