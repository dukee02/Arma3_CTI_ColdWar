private ["_faction", "_side"];

_side = _this;
_faction = "West";
if (_side isEqualTo east) then {
	_faction = "East";
};

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];

// Vanilla templates
//deactivated for the moment, maybe will come back later
//if (_side isEqualTo west) then {		//West Gear
//_t = _t 	+ [[[["arifle_SPAR_01_blk_F",[],["30Rnd_556x45_Stanag_Tracer_Yellow"]]],[["U_B_T_Soldier_F",["Medikit","Medikit"]],["V_BandollierB_rgr",["HandGrenade","HandGrenade"]],["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]],["H_HelmetB_light",""],[[],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
//} else {								//East Gear
//_t = _t 	+ [[[["arifle_CTAR_blk_F",[],["30Rnd_580x42_Mag_Tracer_F"]]],[["U_O_CombatUniform_ocamo",["Medikit","Medikit"]],["V_BandollierB_cbr", ["HandGrenade","HandGrenade"]],["B_AssaultPack_ocamo", ["30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_Tracer_F"]]],["H_HelmetO_ocamo",""],[[],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
//};

switch(CTI_MAIN_ADDON) do {
	case 0: {	//Global Mobilization - Cold War
		if (_side isEqualTo west) then {		//GM West Gear
			_t = _t 	+ [[[["gm_g3a4_oli",[],["gm_20Rnd_762x51mm_b_t_DM21_g3_blk"]]],[["gm_ge_army_uniform_soldier_80_ols",["gm_ge_army_gauzeBandage","gm_ge_army_gauzeCompress"]],["gm_ge_army_vest_80_demolition",["gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_dm51a1"]],["gm_ge_army_backpack_80_oli",["gm_20Rnd_762x51mm_b_t_DM21_g3_blk","gm_20Rnd_762x51mm_b_t_DM21_g3_blk","gm_20Rnd_762x51mm_b_t_DM21_g3_blk","gm_20Rnd_762x51mm_b_t_DM21_g3_blk"]]],["gm_ge_headgear_m62_net",""],[["", "gm_ferod16_des"],["itemmap","","itemradio","gm_ge_army_conat2","ItemWatch"]]]];
			_t = _t 	+ [[[["gm_mg3_blk",[],["gm_120Rnd_762x51mm_b_t_DM21_mg3_grn"]]],[["gm_ge_army_uniform_soldier_80_ols",["gm_ge_army_gauzeBandage","gm_ge_army_gauzeCompress"]],["gm_ge_army_vest_80_demolition",["gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_dm51a1"]],["gm_ge_army_backpack_80_oli",["gm_120Rnd_762x51mm_b_t_DM21_mg3_grn","gm_120Rnd_762x51mm_b_t_DM21_mg3_grn"]]],["gm_ge_headgear_m62_net",""],[["", "gm_ferod16_des"],["itemmap","","itemradio","gm_ge_army_conat2","ItemWatch"]]]];
		} else {								//GM East Gear
			_t = _t 	+ [[[["gm_mpiak74n_brn",[],["gm_45Rnd_545x39mm_b_7N6_ak74_org"]]],[["gm_gc_army_uniform_soldier_80_str",["gm_gc_army_gauzeBandage","gm_gc_army_medkit"]],["gm_gc_army_vest_80_rifleman_str", ["gm_handgrenade_frag_rgd5","gm_handgrenade_frag_rgd5"]],["gm_gc_army_backpack_80_assaultpack_str", ["gm_45Rnd_545x39mm_b_7N6_ak74_org","gm_45Rnd_545x39mm_b_7N6_ak74_org","gm_45Rnd_545x39mm_b_7N6_ak74_org","gm_45Rnd_545x39mm_b_7N6_ak74_org"]]],["gm_gc_army_headgear_m56_net",""],[["", "gm_df7x40_grn"],["itemmap","","itemradio","gm_gc_compass_f73","gm_watch_kosei_80"]]]];
			_t = _t 	+ [[[["gm_hmgpkm_prp",[],["gm_100Rnd_762x54mm_b_t_t46_pk_grn"]]],[["gm_gc_army_uniform_soldier_80_str",["gm_gc_army_gauzeBandage","gm_gc_army_medkit"]],["gm_gc_army_vest_80_rifleman_str", ["gm_handgrenade_frag_rgd5","gm_handgrenade_frag_rgd5"]],["gm_gc_army_backpack_80_assaultpack_str", ["gm_100Rnd_762x54mm_b_t_t46_pk_grn","gm_100Rnd_762x54mm_b_t_t46_pk_grn"]]],["gm_gc_army_headgear_m56_net",""],[["", "gm_df7x40_grn"],["itemmap","","itemradio","gm_gc_compass_f73","gm_watch_kosei_80"]]]];
		};
	};
	case 1: {	//BW-Mod & BW add vs. RUS (CUP and/or RHS)
		if (_side isEqualTo west) then {		//West Gear BW-Mod + BWadd
		} else {								//East Gear RUS (CUP and/or RHS)
			if(CTI_CUP_ADDON>0) then {
				
			} else {
				
			};
		};
	};
	default {	//Cold-War (CUP and/or RHS)
		if (_side isEqualTo west) then {		//West Gear
			if(CTI_CUP_ADDON>0) then {
				_t = _t 	+ [[[["CUP_arifle_M4A1",[],["CUP_30Rnd_556x45_Stanag"]]],[["CUP_U_B_BDUv2_dirty_base",["firstaidkit","firstaidkit"]],["CUP_V_B_Interceptor_Rifleman_M81",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]],["CUP_B_USMC_MOLLE",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"]]],["CUP_H_USMC_BOONIE_WDL",""],[["", "CUP_Vector21Nite"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
			} else {
				
			};
		} else {								//East Gear
			if(CTI_CUP_ADDON>0) then {
				_t = _t 	+ [[[["CUP_arifle_AK74_Early",[],["CUP_30Rnd_556x45_AK"]]],[["CUP_U_O_RUS_EMR_1",["firstaidkit","firstaidkit"]],["CUP_V_O_SLA_6B3_1_WDL",["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","CUP_30Rnd_556x45_AK","CUP_30Rnd_556x45_AK"]],["CUP_B_RUS_Backpack",["CUP_30Rnd_556x45_AK","CUP_30Rnd_556x45_AK","CUP_30Rnd_556x45_AK","CUP_30Rnd_556x45_AK"]]],["CUP_H_RUS_6B27",""],[["", "binocular"],["itemmap","","itemradio","ItemCompass","ItemWatch"]]]];
			} else {
				
			};
		};
	};
};

/*
_t = _t 	+ [
	[
		[
			["arifle_SPAR_01_blk_F",[],["30Rnd_556x45_Stanag_Tracer_Yellow"]],
			["",[],[""]],
			["",[],[""]]
		],
		[
			["U_B_T_Soldier_F",["firstaidkit","firstaidkit"]],
			["V_BandollierB_rgr",["MiniGrenade","HandGrenade"]],
			["B_AssaultPack_mcamo",["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"]]
		],
		["H_HelmetB_light",""],
		[
			["", "binocular"],
			["itemmap","","itemradio","ItemCompass","ItemWatch"]
		]
	]
];
*/

[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 	