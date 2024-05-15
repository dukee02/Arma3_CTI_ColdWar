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

private ["_side", "_nationID", "_modID", "_weapon", "_weapon_ammo", "_weapon_att_light", "_weapon_att_optic", "_uniform", "_vest", "_backpack", "_helmet", "_grenades", "_healing", "_bino", "_item_map", "_item_radio", "_item_compass", "_item_watch"];

_side = _this select 0;
_nationID = _this select 1;
_modID = _this select 2;
_defaultGearVar = "CTI_AI_WEST_DEFAULT_GEAR";

if(_side == east) then {
	_defaultGearVar = "CTI_AI_EAST_DEFAULT_GEAR";
};

_weapon = "";
_weapon_ammo = "";
_weapon_att_optic = "";
_weapon_att_light = "";
_uniform = "";
_vest = "";
_backpack = "";
_helmet = "";
_grenades = "";
_healing = "firstaidkit";
_bino = "binocular";
_item_map = "itemmap";
_item_radio = "itemradio";
_item_compass = "itemcompass";
_item_watch = "itemwatch";

/*
//--- National IDs
CTI_BW_ID = 0;
CTI_NVA_ID = 1;
CTI_US_ID = 2;
CTI_SOV_ID = 3;
CTI_NPOC_ID = 4;
CTI_RACS_ID = 5;
CTI_FIA_ID = 6;
CTI_DEN_ID = 7;
CTI_POL_ID = 8;
CTI_TK_ID = 9;
CTI_CDF_ID = 10;
CTI_CZ_ID = 11;
CTI_CHDKZ_ID = 12;
CTI_SLA_ID = 13;
CTI_TKA_ID = 14;
CTI_SAF_ID = 15;
CTI_HIDF_ID = 16;
CTI_NAPA_ID = 17;
CTI_ION_ID = 18;
CTI_PLA_ID = 19;
CTI_UKRAIN_ID = 20;

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
		switch (_modID) do {
			case CTI_GM_ID: {
				_weapon = "gm_hk33a2_blk";
				_weapon_ammo = "gm_30Rnd_556x45mm_B_DM11_hk33_blk";
				_grenades = "gm_handgrenade_frag_dm51a1";
				_healing = "gm_ge_army_gauzeBandage";
				_bino = "gm_ferod16_des";
				_item_compass = "gm_ge_army_conat2";
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
					_uniform = "gm_ge_army_uniform_soldier_parka_80_win";
					_vest = "gm_ge_army_vest_80_leader";
					_helmet = "gm_ge_headgear_m62_cover_win";
				};
				if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
					_uniform = "gm_ge_army_uniform_soldier_parka_80_ols";
					_vest = "gm_ge_army_vest_80_leader";
					_helmet = "gm_ge_headgear_m62_net";
				};
				if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3 || CTI_CAMO_ACTIVATION == 7) then {		//main camo active
					_uniform = "gm_ge_army_uniform_soldier_80_ols";
					_vest = "gm_ge_army_vest_80_leader";
					_helmet = "gm_ge_headgear_m62_net";
				};
			};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			//case CTI_CUP_ID: {};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			case CTI_BWA3_ID: {
				_weapon = "BWA3_G36A3";
				_weapon_ammo = "BWA3_30Rnd_556x45_G36";
				_weapon_att_optic = "BWA3_optic_ZO4x30_RSAS_brown_pip";
				_weapon_att_light = "BWA3_acc_VarioRay_irlaser";
				_grenades = "BWA3_DM25";
				switch(CTI_CAMO_ACTIVATION) do {
					case 2: {//Desert
						_uniform = "BWA3_Uniform_Tropen";
						_vest = "BWA3_Vest_Rifleman_Tropen";
						_helmet = "BWA3_OpsCore_FastMT_Tropen";
					};
					case 3: {//Jungle
						_uniform = "BWA3_Uniform_Fleck";
						_vest = "BWA3_Vest_Rifleman_Fleck";
						_helmet = "BWA3_OpsCore_FastMT_Fleck";
					};
					default {//multi dark
						_uniform = "BWA3_Uniform_Multi";
						_vest = "BWA3_Vest_Rifleman_Multi";
						_helmet = "BWA3_OpsCore_FastMT_Multi";
					};
				};
			};
			case CTI_BWADD_ID: {
				_weapon = "BWAdd_G36";
				_weapon_ammo = "BWA3_30Rnd_556x45_G36";
				_weapon_att_optic = "BWA3_optic_ZO4x30_RSAS_pip";
				_weapon_att_light = "BWA3_acc_VarioRay_irlaser";
				_uniform = "PzBrig17_Uniform_idz_Snow";
				_vest = "BWA3_Vest_Rifleman_Fleck";
				_helmet = "PzBrig17_M92_Snow";
				_grenades = "BWA3_DM25";
			};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	case CTI_NVA_ID: {
		switch _modID do	{
			case CTI_GM_ID: {
				_weapon = "gm_mpiak74n_brn";
				_weapon_ammo = "gm_30Rnd_545x39mm_B_7N6_ak74_org";
				_grenades = "gm_handgrenade_frag_rgd5";
				_healing = "gm_gc_army_gauzeBandage";
				_bino = "gm_df7x40_grn";
				_item_compass = "gm_gc_compass_f73";
				_item_watch = "gm_watch_kosei_80";
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					_uniform = "gm_gc_army_uniform_soldier_80_win";
					_vest = "gm_gc_army_vest_80_leader_str";
					_helmet = "gm_gc_army_headgear_m56_cover_win";
				};
				if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//default camo active
					_uniform = "gm_gc_army_uniform_soldier_80_str";
					_vest = "gm_gc_army_vest_80_rifleman_str";
					_helmet = "gm_gc_army_headgear_m56_net";
				};
			};
			case CTI_PF_ID: {
				_grenades = "vn_rdg2_mag";
				_healing = "vn_o_item_firstaidkit";
				//_item_map = "vn_o_item_map";
				//_item_radio = "vn_o_item_radio_m252";
				//_item_compass = "vn_b_item_compass";
				//_item_watch = "vn_b_item_watch";
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
					_weapon = "vn_type56";
					_weapon_ammo = "vn_type56_t_mag";
					_uniform = "vn_o_uniform_nva_army_04_01";
					_vest = "vn_o_vest_01";
					_backpack = "vn_o_pack_05_type56_pl";
					_helmet = "vn_o_helmet_nva_08";
				};
				if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
					_weapon = "vn_sks";
					_weapon_ammo = "vn_sks_t_mag";
					_uniform = "vn_o_uniform_nva_army_02_03";
					_vest = "vn_o_vest_02";
					_backpack = "vn_o_pack_02_sks_pl";
					_helmet = "vn_o_helmet_nva_02";
				};
			};
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
			case CTI_PF_ID: {
				_grenades = "vn_m61_grenade_mag";
				_healing = "vn_b_item_firstaidkit";
				//_item_map = "vn_b_item_map";
				//_item_radio = "vn_b_item_radio_urc10";
				//_item_compass = "vn_b_item_compass";
				//_item_watch = "vn_b_item_watch";
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//desert/urban camo active
					_weapon = "vn_xm16e1";
					_weapon_ammo = "vn_m16_40_t_mag";
					_uniform = "vn_b_uniform_macv_06_08";
					_vest = "vn_b_vest_usarmy_02";
					_backpack = "vn_b_pack_01_02_m16_pl";
					_helmet = "vn_b_boonie_01_07";
				};
				if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION > 4) then {		//main camo active
					_weapon = "vn_m16";
					_weapon_ammo = "vn_m16_20_t_mag";
					_uniform = "vn_b_uniform_macv_04_01";
					_vest = "vn_b_vest_usarmy_02";
					_backpack = "vn_b_pack_lw_01_m16_pl";
					_helmet = "vn_b_helmet_m1_07_01";
				};
			};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			case CTI_CUP_ID: {
				_weapon = "CUP_arifle_M4A3_black";
				_weapon_ammo = "CUP_30Rnd_556x45_Stanag";
				_weapon_att_optic = "CUP_optic_CompM2_low";
				_weapon_att_light = "CUP_acc_ANPEQ_2_Black_Top";
				_grenades = "CUP_HandGrenade_M67";
				_bino = "CUP_Vector21Nite";
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					//case 1: {};
					case 2: {//Desert
						_uniform = "CUP_U_B_USMC_MCCUU_des_gloves";
						_vest = "CUP_V_B_Eagle_SPC_Patrol";
						_helmet = "CUP_H_LWHv2_MARPAT_des_cov_fr";
					};
					case 3: {//Jungle
						_uniform = "CUP_U_B_USMC_MCCUU_gloves";
						_vest = "CUP_V_B_Eagle_SPC_Patrol";
						_helmet = "CUP_H_LWHv2_MARPAT_cov_fr";
					};
					case 4: {//Urban US
						_uniform = "CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP";
						_vest = "CUP_V_B_IOTV_UCP_Rifleman_USArmy";
						_helmet = "CUP_H_USArmy_HelmetACH_UCP";
					};
					//case 5: {};
					case 6: {//multi light
						_uniform = "CUP_U_B_USArmy_ACU_Gloves_OCP";
						_vest = "CUP_V_B_IOTV_OCP_Rifleman_Deltoid_USArmy";
						_helmet = "CUP_H_USArmy_HelmetACH_OCP";
					};
					default {//multi dark
						_uniform = "CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP";
						_vest = "CUP_V_B_IOTV_OEFCP_Rifleman_USArmy";
						_helmet = "CUP_H_USArmy_HelmetACH_OEFCP";
					};
				};
			};
			case CTI_RHS_ID: {
				_weapon = "rhs_weap_m16a4_carryhandle";
				_weapon_ammo = "rhs_mag_30Rnd_556x45_M855_Stanag";
				_weapon_att_optic = "rhsusf_acc_mrds";
				_weapon_att_light = "rhsusf_acc_M952V";
				_grenades = "rhs_mag_m67";
				_bino = "rhsusf_bino_m24";
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					//case 1: {};
					case 2: {//Desert
						_uniform = "rhs_uniform_FROG01_d";
						_vest = "rhsusf_spc_rifleman";
						_helmet = "rhsusf_lwh_helmet_marpatd";
					};
					case 3: {//Jungle
						_uniform = "rhs_uniform_FROG01_wd";
						_vest = "rhsusf_spc_rifleman";
						_helmet = "rhsusf_lwh_helmet_marpatwd";
					};
					case 4: {//Urban US
						_uniform = "rhs_uniform_acu_ucp";
						_vest = "rhsusf_iotv_ucp_Rifleman";
						_helmet = "rhsusf_ach_helmet_ucp";
					};
					default {//multi
						_uniform = "rhs_uniform_acu_oefcp";
						_vest = "rhsusf_iotv_ocp_Rifleman";
						_helmet = "rhsusf_ach_helmet_ocp";
					};
				};
			};
			case CTI_CWR3_ID: {
				_weapon = "CUP_arifle_M16A1";
				_weapon_ammo = "CUP_30Rnd_556x45_Stanag";
				_uniform = "cwr3_b_uniform_m81_woodland_early";
				_vest = "cwr3_b_vest_alice_etool";
				_helmet = "cwr3_b_headgear_m1_woodland_army_early";
				_grenades = "CUP_HandGrenade_M67";
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
				_weapon = "CUP_arifle_AK12_black";
				_weapon_ammo = "CUP_30Rnd_545x39_AK12_M";
				_weapon_att_optic = "CUP_optic_1P87_RIS";
				_grenades = "CUP_HandGrenade_RGD5";
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {
						_uniform = "CUP_U_O_RUS_Ratnik_Winter";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_Winter";
					};
					case 2: {
						_uniform = "CUP_U_O_RUS_Ratnik_Desert";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_Desert";
					};
					case 3: {
						_uniform = "CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_gloves_pads";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_Summer";
					};
					case 4: {
						_uniform = "CUP_U_O_RUS_Ratnik_Autumn";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_Summer";
					};
					//case 5: {};
					case 6: {
						_uniform = "CUP_U_O_RUS_Ratnik_BeigeDigital";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_BeigeDigital";
					};
					default {
						_uniform = "CUP_U_O_RUS_Ratnik_Summer";
						_vest = "CUP_V_O_SLA_Flak_Vest01";
						_helmet = "CUP_H_RUS_6B47_v2_GogglesUp_Summer";
					};
				};
			};
			case CTI_RHS_ID: {
				_weapon = "rhs_weap_ak74m";
				_weapon_ammo = "rhs_30Rnd_545x39_7N10_AK";
				_grenades = "rhs_mag_rgd5";
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					case 2: {
						_uniform = "rhs_uniform_vdv_emr_des";
						_vest = "rhs_6sh92_vsr";
						_helmet = "rhs_6b28";
					};
					case 3: {
						_uniform = "rhs_uniform_vkpo_gloves";
						_vest = "rhs_6sh92_digi";
						_helmet = "rhs_6b47_emr_1";
					};
					case 4: {
						_uniform = "rhs_uniform_vdv_mflora";
						_vest = "rhs_6sh92_vsr";
						_helmet = "rhs_6b27m_green_ess";
					};
					default {
						_uniform = "rhs_uniform_vdv_flora";
						_vest = "rhs_6sh92";
						_helmet = "rhs_6b28_flora";
					};
				};
			};
			case CTI_CWR3_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 2;
					case 4: {//desert/urban camo active
						_weapon = "CUP_arifle_AK74";
						_weapon_ammo = "CUP_30Rnd_545x39_AK_M";
						_uniform = "cwr3_o_uniform_m1969";
						_vest = "cwr3_o_vest_beltkit_ak74";
						_helmet = "cwr3_o_headgear_ssh68";
						_grenades = "CUP_HandGrenade_RGD5";
					};
					default {//main camo active
						_weapon = "CUP_arifle_AK74";
						_weapon_ammo = "CUP_30Rnd_545x39_AK_M";
						_uniform = "cwr3_o_uniform_klmk_1957_birch_v1";
						_vest = "cwr3_o_vest_6b2_ak74";
						_helmet = "cwr3_o_headgear_ssh68";
						_grenades = "CUP_HandGrenade_RGD5";
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
	case CTI_CDF_ID: {
		switch _modID do	{
			//case CTI_GM_ID: {};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			//case CTI_CUP_ID: {};
			case CTI_RHS_ID: {
				//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
				switch(CTI_CAMO_ACTIVATION) do {
					case 3: {
						_weapon = "rhs_weap_akm";
						_weapon_ammo = "rhs_30Rnd_762x39mm";
						_grenades = "rhs_mag_rgd5";
						_uniform = "rhsgref_uniform_ttsko_forest";
						_vest = "rhs_6b5_khaki";
						_helmet = "rhsgref_ssh68_ttsko_forest";
					};
					case 4: {
						_weapon = "rhs_weap_vhsd2";
						_weapon_ammo = "rhsgref_30rnd_556x45_vhs2";
						_grenades = "rhs_mag_rgn";
						_uniform = "rhsgref_uniform_para_ttsko_urban";
						_vest = "rhs_6b5_rifleman";
						_helmet = "rhsgref_6b27m_ttsko_digi";
					};
					default {
						_weapon = "rhs_weap_ak74";
						_weapon_ammo = "rhs_30Rnd_545x39_7N6M_AK";
						_grenades = "rhs_mag_rgd5";
						_uniform = "rhsgref_uniform_ttsko_mountain";
						_vest = "rhs_6b5_rifleman_ttsko";
						_helmet = "rhsgref_6b27m_ttsko_mountain";
					};
				};
			};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	//case CTI_CZ_ID: {};
	case CTI_CHDKZ_ID: {
		switch _modID do	{
			//case CTI_GM_ID: {};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			//case CTI_CUP_ID: {};
			case CTI_RHS_ID: {
				_weapon = "rhs_weap_akm";
				_weapon_ammo = "rhs_30Rnd_762x39mm_bakelite";
				_uniform = "rhsgref_uniform_reed";
				_vest = "V_TacVest_oli";
				_helmet = "rhs_beanie_green";
				_grenades = "rhs_mag_rgd5";
			};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	case CTI_UKRAIN_ID: {
		switch _modID do	{
			//case CTI_GM_ID: {};
			//case CTI_PF_ID: {};
			//case CTI_IC_ID: {};
			//case CTI_WS_ID: {};
			case CTI_CUP_ID: {
				_weapon = "CUP_arifle_AK12_black";
				_weapon_att_optic = "CUP_optic_1P87_RIS";
				_weapon_ammo = "CUP_30Rnd_545x39_AK12_M";
				_grenades = "CUP_HandGrenade_RGD5";
				switch(CTI_CAMO_ACTIVATION) do {
					case 2: {
						_uniform = "CUP_U_B_AFU_ACU_Kneepad_Gloves_M14";
						_vest = "CUP_V_B_IOTV_MM14_Rifleman_USArmy";
						_helmet = "CUP_H_AFU_HelmetACH_MM_14";
					};
					default {
						_uniform = "CUP_U_B_AFU_FATIGUES_M14";
						_vest = "CUP_V_PlateCarrier2_MM14";
						_helmet = "CUP_H_AFU_HelmetACH_MM_14";
					};
				};
			};
			//case CTI_RHS_ID: {};
			//case CTI_VME_ID: {};
			//case CTI_UKR_ID: {};
			//case CTI_BWA3_ID: {};
			//case CTI_BWADD_ID: {};
			//case CTI_REDD_ID: {};
			//default: {};
		};
	};
	//case CTI_SLA_ID: {};
	//case CTI_TKA_ID: {};
	//case CTI_SAF_ID: {};
	//case CTI_HIDF_ID: {};
	//case CTI_NAPA_ID: {};
	//case CTI_ION_ID: {};
	//case CTI_PLA_ID: {};
	default {};
};

missionNamespace setVariable [_defaultGearVar, [
	[[_weapon,[_weapon_att_optic,_weapon_att_light,"",""],[_weapon_ammo]],["",["","","",""],[""]],
	["",["","","",""],[""]]],
	[[_uniform,[_healing,_healing,_weapon_ammo,_weapon_ammo,_weapon_ammo]],
	[_vest,[_grenades,_grenades,_weapon_ammo,_weapon_ammo]],
	["",[]]],
	[_helmet,""],[["",_bino],[_item_map,"",_item_radio,_item_compass,_item_watch]]]];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Config\Gear\gear_start_config.sqf", format ["defaultGear: <%1>", missionNamespace getVariable format ["%1", _defaultGearVar]]] call CTI_CO_FNC_Log };
