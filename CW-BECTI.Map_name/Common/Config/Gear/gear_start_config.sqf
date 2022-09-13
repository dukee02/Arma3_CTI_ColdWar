/*
  # HEADER #
	Script: 		Common\Config\Gear\gear_start_config.sqf
	Alias:			-
	Description:	Get the funds of a group. 0 by default
					Note that if the group is the commander's then
					we retrieve the commander funds
	Author: 		dukee
	Creation Date:	08-09-2022
	Revision Date:	
	
  # PARAMETERS #
    0	[Side]: The side
    1	[Nation]: The selected Nation
    1	[Mod]: The active main Mod
	
  # RETURNED VALUE #
	none
	
  # SYNTAX #
	[SIDE, NATION, MOD] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
	
  # DEPENDENCIES #
  none
	
  # EXAMPLE #
	[west, CTI_BW_ID, CTI_GM_ID] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
*/

private ["_side", "_nationID", "_modID"];

_side = _this select 0;
_nationID = _this select 1;
_modID = _this select 2;
_defaultGearVar = "CTI_AI_WEST_DEFAULT_GEAR";

if(_side == east) then {
	_defaultGearVar = "CTI_AI_EAST_DEFAULT_GEAR";
};

/*
//--- National IDs
CTI_BW_ID = 0;
CTI_NVA_ID = 1;
CTI_DEN_ID = 2;
CTI_POL_ID = 3;
CTI_US_ID = 4;
CTI_SOV_ID = 5;
CTI_NPOC_ID = 6;
CTI_RACS_ID = 7;
CTI_FIA_ID = 8;
CTI_TK_ID = 9;
CTI_CDF_B_ID = 10;
CTI_CDF_I_ID = 11;
CTI_CZ_ID = 12;
CTI_CHDKZ_ID = 13;
CTI_SLA_ID = 14;
CTI_TKA_ID = 15;
CTI_SAF_ID = 16;
CTI_SAF_I_ID = 17;
CTI_HIDF_ID = 18;
CTI_NAPA_ID = 19;
CTI_ION_ID = 20;
CTI_PLA_ID = 21;
CTI_UKRAIN_ID = 22;

//--- Mod IDs
CTI_GM_ID = 0;		//Global Mobilization - Cold War Germany
CTI_PF_ID = 1;		//Prairie Fire
CTI_IC_ID = 2;		//CSLA Iron Curtain
CTI_WS_ID = 3;		//Western Sahara
CTI_CUP_ID = 4;
CTI_RHS_ID = 5;
CTI_CWR3_ID = 6;
CTI_VME_ID = 7;
CTI_UKR_ID = 8;
CTI_BWA3_ID = 9;
CTI_BWADD_ID = 10;
CTI_REDD_ID = 11;
*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Config\Gear\gear_start_config.sqf", format ["_side <%1> _nationID <%2> _modID <%3> _defaultGearVar<%4>", _side, _nationID, _modID, _defaultGearVar]] call CTI_CO_FNC_Log };

switch(_nationID) do {
	case CTI_BW_ID: {
		switch _modID do	{
			case CTI_GM_ID: {
				missionNamespace setVariable ["CTI_AI_WEST_DEFAULT_GEAR", [
					[["gm_m16a1_blk",["","","",""],["gm_30Rnd_556x45mm_B_T_M856_stanag_gry"]],["",["","","",""],[""]],
					["",["","","",""],[""]]],
					[["gm_ge_army_uniform_soldier_80_ols",["gm_ge_army_gauzeBandage","gm_ge_army_burnBandage","gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_dm51a1"]],
					["gm_ge_army_vest_80_demolition",["gm_30Rnd_556x45mm_B_T_M856_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry"]],
					["gm_ge_army_backpack_80_oli",[]]],
					["gm_ge_headgear_m62_net",""],[["","gm_ferod16_des"],["itemmap","","itemradio","gm_ge_army_conat2","itemwatch"]]]];
			};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			//case CTI_CUP_ID: {};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	case CTI_NVA_ID: {
		switch _modID do	{
			case CTI_GM_ID: {
				missionNamespace setVariable ["CTI_AI_EAST_DEFAULT_GEAR", [
					[["gm_mpiak74n_brn",["","","",""],["gm_30Rnd_545x39mm_B_7N6_ak74_org"]],["",["","","",""],[""]],
					["",["","","",""],[""]]],
					[["gm_gc_army_uniform_soldier_80_str",["gm_gc_army_gauzeBandage","gm_gc_army_medkit","gm_handgrenade_frag_rgd5","gm_handgrenade_frag_rgd5"]],
					["gm_gc_army_vest_80_rifleman_str",["gm_30Rnd_545x39mm_B_7N6_ak74_org","gm_30Rnd_545x39mm_B_7N6_ak74_org","gm_30Rnd_545x39mm_B_7N6_ak74_org","gm_30Rnd_545x39mm_B_7N6_ak74_org"]],
					["gm_gc_army_backpack_80_at_str",[]]],
					["gm_gc_army_headgear_m56_net",""],[["","gm_df7x40_grn"],["itemmap","","itemradio","gm_gc_compass_f73","gm_watch_kosei_80"]]]];	
			};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			//case CTI_CUP_ID: {};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	//case CTI_DEN_ID: {};
	//case CTI_POL_ID: {};
	case CTI_US_ID: {
		switch _modID do	{
			//case CTI_GM_ID: {};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			case CTI_CUP_ID: {
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					//case 1: {};
					case 2: {//Desert
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_M4A3_black",["CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_B_USMC_MCCUU_des_gloves",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["CUP_V_B_Eagle_SPC_Patrol",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["",[]]],
							["CUP_H_LWHv2_MARPAT_des_cov_fr",""],[["","CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					case 3: {//Jungle
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_M4A3_black",["CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_B_USMC_MCCUU_gloves",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["CUP_V_B_Eagle_SPC_Patrol",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["",[]]],
							["CUP_H_LWHv2_MARPAT_cov_fr",""],[["","CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					case 4: {//Urban US
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_M4A3_black",["CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["CUP_V_B_IOTV_UCP_Rifleman_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["",[]]],
							["CUP_H_USArmy_HelmetACH_UCP",""],[["","CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					//case 5: {};
					case 6: {//multi light
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_M4A3_black",["CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_B_USArmy_ACU_Gloves_OCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["CUP_V_B_IOTV_OCP_Rifleman_Deltoid_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["",[]]],
							["CUP_H_USArmy_HelmetACH_OCP",""],[["","CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					default {//multi dark
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_M4A3_black",["CUP_optic_CompM2_low","CUP_acc_ANPEQ_2_Black_Top","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["CUP_V_B_IOTV_OEFCP_Rifleman_USArmy",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
							["",[]]],
							["CUP_H_USArmy_HelmetACH_OEFCP",""],[["","CUP_Vector21Nite"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
				};
			};
			//case CTI_RHS_ID: {};
			case CTI_CWR3_ID: {
				missionNamespace setVariable ["CTI_AI_WEST_DEFAULT_GEAR", [
					[["CUP_arifle_M16A1",["","","",""],["CUP_30Rnd_556x45_Stanag"]],["",["","","",""],[""]],
					["",["","","",""],[""]]],
					[["cwr3_b_uniform_m81_woodland_early",["firstaidkit","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
					["cwr3_b_vest_alice_etool",["CUP_HandGrenade_M67","CUP_HandGrenade_M67","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],
					["",[]]],
					["cwr3_b_headgear_m1_woodland_army_early",""],[["",""],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
			};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			default {};
		};
	};
	case CTI_SOV_ID: {
		switch _modID do	{
			//case CTI_GM_ID: {};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			case CTI_CUP_ID: {
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Ratnik_Winter",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_Winter",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					case 2: {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Ratnik_Desert",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_Desert",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					case 3: {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_gloves_pads",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					case 4: {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Ratnik_Autumn",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					//case 5: {};
					case 6: {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Ratnik_BeigeDigital",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_BeigeDigital",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					default {
						missionNamespace setVariable [_defaultGearVar, [
							[["CUP_arifle_AK12_black",["CUP_optic_1P87_RIS","","",""],["CUP_30Rnd_545x39_AK12_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["CUP_U_O_RUS_Ratnik_Summer",["firstaidkit","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["CUP_V_O_SLA_Flak_Vest01",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK12_M","CUP_30Rnd_545x39_AK12_M"]],
							["",[]]],
							["CUP_H_RUS_6B47_v2_GogglesUp_Summer",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
				};
			};
			//case CTI_RHS_ID: {};
			case CTI_CWR3_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 2;
					case 4: {//desert/urban camo active
						missionNamespace setVariable ["CTI_AI_EAST_DEFAULT_GEAR", [
							[["CUP_arifle_AK74",["","","",""],["CUP_30Rnd_545x39_AK_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["cwr3_o_uniform_m1969",["firstaidkit","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],
							["cwr3_o_vest_beltkit_ak74",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],
							["",[]]],
							["cwr3_o_headgear_ssh68",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
					default {//main camo active
						missionNamespace setVariable ["CTI_AI_EAST_DEFAULT_GEAR", [
							[["CUP_arifle_AK74",["","","",""],["CUP_30Rnd_545x39_AK_M"]],["",["","","",""],[""]],
							["",["","","",""],[""]]],
							[["cwr3_o_uniform_klmk_1957_birch_v1",["firstaidkit","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],
							["cwr3_o_vest_6b2_ak74",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],
							["",[]]],
							["cwr3_o_headgear_ssh68",""],[["","binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]]];
					};
				};
			};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			default {};
		};
	};
	//case CTI_NPOC_ID: {};
	//case CTI_RACS_ID: {};
	//case CTI_FIA_ID: {};
	//case CTI_TK_ID: {};
	//case CTI_CDF_B_ID: {};
	//case CTI_CDF_I_ID: {};
	//case CTI_CZ_ID: {};
	//case CTI_CHDKZ_ID: {};
	//case CTI_SLA_ID: {};
	//case CTI_TKA_ID: {};
	//case CTI_SAF_ID: {};
	//case CTI_SAF_I_ID: {};
	//case CTI_HIDF_ID: {};
	//case CTI_NAPA_ID: {};
	//case CTI_ION_ID: {};
	//case CTI_PLA_ID: {};
	//case CTI_UKRAIN_ID: {};
	default {};
};
