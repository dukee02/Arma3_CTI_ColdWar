private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt", "_itemprise"];

_side = _this;
_upgrade_levels = [];
_tech_level = 0;

switch (_side) do {
	case west: {_faction = "West"};
	case east: {_faction = "East"};
	default {_faction = ""};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
};

_c = [];
_u = [];
_p = [];

//--------------------------------------------------------------------------------------------------------------------------//
//													Basic Stuff																//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_full = [_side, CTI_UPGRADE_GEAR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "gm_ferod16_des";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ferod16_oli";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ferod16_win";
_u pushBack 0;
_p pushBack 5;

_c pushBack "gm_ge_army_conat2";
_u pushBack 0;
_p pushBack 1;

_c pushBack "gm_watch_kosei_80";
_u pushBack 0;
_p pushBack 1;

//don't work corretly in CTI
/*_c pushBack "gm_repairkit_01";
_u pushBack 0;
_p pushBack 25;*/

_c pushBack "gm_ge_army_burnbandage";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_ge_army_gauzeBandage";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_ge_army_gauzeCompress";
_u pushBack 0;
_p pushBack 15;

_c pushBack "gm_lp7_oli";
_u pushBack 3;
_p pushBack 1000;

_c pushBack "gm_fero51_oli";
_u pushBack 2;
_p pushBack 500;

_c pushBack "gm_ferod51_oli";
_u pushBack 2;
_p pushBack 500;

//--------------------------------------------------------------------------------------------------------------------------//
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "gm_handgrenade_frag_dm51a1";
_c pushBack "gm_handgrenade_frag_dm51";
_c pushBack "gm_handgrenade_pracfrag_dm58";
_c pushBack "gm_handgrenade_conc_dm51";
_c pushBack "gm_handgrenade_conc_dm51a1";
_c pushBack "gm_handgrenade_pracconc_dm58";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_smokeshell_grn_dm21";
_c pushBack "gm_smokeshell_red_dm23";
_c pushBack "gm_smokeshell_yel_dm26";
_c pushBack "gm_smokeshell_org_dm32";
_c pushBack "gm_smokeshell_wht_dm25";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_mine_at_dm21";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_mine_ap_dm31";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_explosive_petn_charge";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_explosive_plnp_charge";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Pistols																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_p1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_p1sd_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_8rnd_9x19mm_b_dm11_p1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_8rnd_9x19mm_b_dm51_p1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_mp2a1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_32Rnd_9x19mm_b_DM51_mp2_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_32Rnd_9x19mm_b_DM11_mp2_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,32,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_p2a1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_265mm_flare_para_yel_DM16";
_c pushBack "gm_1Rnd_265mm_flare_single_wht_DM15";
_c pushBack "gm_1Rnd_265mm_flare_single_red_DM13";
_c pushBack "gm_1Rnd_265mm_flare_single_grn_DM11";
_c pushBack "gm_1Rnd_265mm_flare_single_yel_DM10";
_c pushBack "gm_1Rnd_265mm_flare_multi_wht_DM25";
_c pushBack "gm_1Rnd_265mm_flare_multi_red_DM23";
_c pushBack "gm_1Rnd_265mm_flare_multi_grn_DM21";
_c pushBack "gm_1Rnd_265mm_flare_multi_yel_DM20";
_c pushBack "gm_1Rnd_265mm_smoke_single_yel_DM19";
_c pushBack "gm_1Rnd_265mm_smoke_single_org_DM22";
_c pushBack "gm_1Rnd_265mm_smoke_single_vlt_DM24";
_c pushBack "gm_1Rnd_265mm_flare_multi_nbc_DM47";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Shotgun																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "gm_hk512_wud";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_hk512_ris_wud";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_7rnd_12ga_hk512_slug";
_c pushBack "gm_7rnd_12ga_hk512_pellet";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7] call CTI_CO_FNC_GetCalculatedItemPrize);
};


//--------------------------------------------------------------------------------------------------------------------------//
//													Grenadelauncher															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_hk69a1_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "1Rnd_HE_Grenade_shell";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "UGL_FlareWhite_F";
_c pushBack "UGL_FlareGreen_F";
_c pushBack "UGL_FlareRed_F";
_c pushBack "UGL_FlareYellow_F";
_c pushBack "UGL_FlareCIR_F";
_c pushBack "1Rnd_Smoke_Grenade_shell";
_c pushBack "1Rnd_SmokeRed_Grenade_shell";
_c pushBack "1Rnd_SmokeGreen_Grenade_shell";
_c pushBack "1Rnd_SmokeYellow_Grenade_shell";
_c pushBack "1Rnd_SmokePurple_Grenade_shell";
_c pushBack "1Rnd_SmokeBlue_Grenade_shell";
_c pushBack "1Rnd_SmokeOrange_Grenade_shell";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_m16a1_blk";
_c pushBack "gm_m16a2_blk";
_c pushBack "gm_hk33a2_blk";
_c pushBack "gm_hk33a3_blk";
_c pushBack "gm_hk33ka2_blk";
_c pushBack "gm_hk33ka3_blk";
_c pushBack "gm_hk33sg1_blk";
_c pushBack "gm_hk53a2_blk";
_c pushBack "gm_hk53a3_blk";
//set all other vars in a slope
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize;
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//M16
_c pushBack "gm_20Rnd_556x45mm_B_M855_stanag_gry";
_c pushBack "gm_20Rnd_556x45mm_B_T_M856_stanag_gry";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//M16
_c pushBack "gm_30Rnd_556x45mm_B_M855_stanag_gry";
_c pushBack "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
_c pushBack "gm_30Rnd_556x45mm_B_DM11_hk33_blk";
_c pushBack "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};


_c pushBack "gm_40Rnd_556x45mm_B_DM11_hk33_blk";
_c pushBack "gm_40Rnd_556x45mm_B_T_DM21_hk33_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_60Rnd_556x45mm_B_DM11_hk33_blk";
_c pushBack "gm_60Rnd_556x45mm_B_T_DM21_hk33_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,60,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_pzf44_2_oli";
_c pushBack "gm_pzf44_2_des";
_c pushBack "gm_pzf44_2_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "gm_1Rnd_44x537mm_heat_DM32_pzf44_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_army_uniform_crew_80_oli";
_c pushBack "gm_ge_army_uniform_soldier_80_oli";
_c pushBack "gm_ge_army_uniform_soldier_80_ols";
_c pushBack "gm_ge_army_uniform_soldier_parka_80_oli";
_c pushBack "gm_ge_army_uniform_soldier_parka_80_ols";
_c pushBack "gm_ge_army_uniform_soldier_parka_80_win";
_c pushBack "gm_ge_bgs_uniform_soldier_80_smp";
_c pushBack "gm_ge_army_uniform_pilot_oli";
_c pushBack "gm_ge_army_uniform_pilot_rolled_oli";
_c pushBack "gm_ge_army_uniform_pilot_sar";
_c pushBack "gm_ge_army_uniform_pilot_rolled_sar";
_c pushBack "gm_ge_pol_uniform_pilot_rolled_grn";
_c pushBack "gm_ge_civ_uniform_blouse_80_gry";
_c pushBack "gm_ge_dbp_uniform_suit_80_blu";
_c pushBack "gm_ge_ff_uniform_man_80_orn";
_c pushBack "gm_ge_pol_uniform_blouse_80_blk";
_c pushBack "gm_ge_pol_uniform_suit_80_grn";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_army_vest_80_belt";
_c pushBack "gm_ge_army_vest_80_bag";
_c pushBack "gm_ge_bgs_vest_80_rifleman";
_c pushBack "gm_ge_army_vest_80_crew";
_c pushBack "gm_ge_army_vest_80_demolition";
_c pushBack "gm_ge_army_vest_80_leader";
_c pushBack "gm_ge_army_vest_80_machinegunner";
_c pushBack "gm_ge_army_vest_80_medic";
//_c pushBack "gm_ge_army_vest_80_mp_wht";
//_c pushBack "gm_ge_army_vest_80_officer";
_c pushBack "gm_ge_pol_vest_80_wht";
_c pushBack "gm_ge_army_vest_80_rifleman";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_army_backpack_80_oli";
_c pushBack "gm_ge_army_backpack_80_pzf44_oli";
_c pushBack "gm_ge_backpack_satchel_80_blk";
_c pushBack "gm_ge_backpack_satchel_80_san";
_c pushBack "B_Parachute";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
//light
_c pushBack "gm_streamlight_sl20_stanagClaw_blk";
_c pushBack "gm_streamlight_sl20_stanagClaw_brn";
_c pushBack "gm_maglite_3d_stanagClaw_blk";
_c pushBack "gm_zpp_stanagClaw_blk";

//other attachments
_c pushBack "gm_bayonet_g3_blk";
_c pushBack "gm_bayonet_g3_oli";
_c pushBack "gm_g3_bipod_blk";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_headgear_hat_80_gry";
_c pushBack "gm_ge_headgear_hat_80_m62_oli";
_c pushBack "gm_ge_headgear_hat_80_oli";
_c pushBack "gm_ge_headgear_hat_boonie_oli";
_c pushBack "gm_ge_headgear_beret_red_antiair";
_c pushBack "gm_ge_headgear_beret_blk_antitank";
_c pushBack "gm_ge_headgear_beret_blk_armor";
_c pushBack "gm_ge_headgear_beret_blk_armorrecon";
_c pushBack "gm_ge_headgear_beret_bdx_armyaviation";
_c pushBack "gm_ge_headgear_beret_red_artillery";
_c pushBack "gm_ge_headgear_beret_un";
_c pushBack "gm_ge_headgear_beret_mrb";
_c pushBack "gm_ge_headgear_beret_red_engineer";
_c pushBack "gm_ge_headgear_beret_grn_guardbtl";
_c pushBack "gm_ge_headgear_beret_grn_infantry";
_c pushBack "gm_ge_headgear_beret_bdx_lrrp";
_c pushBack "gm_ge_headgear_beret_red_maintenance";
_c pushBack "gm_ge_headgear_beret_grn_mechinf";
_c pushBack "gm_ge_headgear_beret_blu_medical";
_c pushBack "gm_ge_headgear_beret_red_militarypolice";
_c pushBack "gm_ge_headgear_beret_grn_music";
_c pushBack "gm_ge_headgear_beret_red_nbc";
_c pushBack "gm_ge_headgear_beret_red_opcom";
_c pushBack "gm_ge_headgear_beret_bdx_paratrooper";
_c pushBack "gm_ge_headgear_beret_blk_recon";
_c pushBack "gm_ge_headgear_beret_red_signals";
_c pushBack "gm_ge_headgear_beret_bdx_specop";
_c pushBack "gm_ge_headgear_beret_red_supply";
_c pushBack "gm_ge_headgear_beret_red_geoinfo";
_c pushBack "gm_ge_headgear_crewhat_80_blk";
_c pushBack "gm_ge_headgear_headset_crew_oli";
_c pushBack "gm_ge_headgear_beret_crew_red_antiair";
_c pushBack "gm_ge_headgear_beret_crew_blk_antitank";
_c pushBack "gm_ge_headgear_beret_crew_blk_armor";
_c pushBack "gm_ge_headgear_beret_crew_blk_armorrecon";
_c pushBack "gm_ge_headgear_beret_crew_red_artillery";
_c pushBack "gm_ge_headgear_beret_crew_red_engineer";
_c pushBack "gm_ge_headgear_beret_crew_red_maintenance";
_c pushBack "gm_ge_headgear_beret_crew_grn_mechinf";
_c pushBack "gm_ge_headgear_beret_crew_red_militarypolice";
_c pushBack "gm_ge_headgear_beret_crew_red_nbc";
_c pushBack "gm_ge_headgear_beret_crew_red_opcom";
_c pushBack "gm_ge_headgear_beret_crew_bdx_paratrooper";
_c pushBack "gm_ge_headgear_beret_crew_blk_recon";
_c pushBack "gm_ge_headgear_beret_crew_red_signals";
_c pushBack "gm_ge_headgear_beret_crew_red_supply";
_c pushBack "gm_ge_headgear_hat_80_gry";
_c pushBack "gm_ge_headgear_hat_80_oli";
_c pushBack "gm_ge_headgear_hat_80_m62_oli";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_ge_bgs_headgear_m35_53_blk";
_c pushBack "gm_ge_bgs_headgear_m35_53_net_blk";
_c pushBack "gm_ge_ff_headgear_m35_53_tan";
_c pushBack "gm_ge_headgear_m62";
_c pushBack "gm_ge_headgear_m62_cover_blu";
_c pushBack "gm_ge_headgear_m62_net";
_c pushBack "gm_ge_headgear_m62_win_pap_01";
_c pushBack "gm_ge_headgear_m62_cover_win";
_c pushBack "gm_ge_pol_headgear_cap_80_grn";
_c pushBack "gm_ge_pol_headgear_cap_80_wht";
_c pushBack "gm_ge_dbp_headgear_cap_80_blu";
_c pushBack "gm_ge_headgear_winterhat_80_oli";
_c pushBack "gm_ge_headgear_hat_beanie_blk";
_c pushBack "gm_ge_headgear_sph4_oli";
_c pushBack "gm_ge_facewear_m65";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Glasses																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_facewear_m65";
_c pushBack "gm_headgear_foliage_summer_forest_01";
_c pushBack "gm_headgear_foliage_summer_forest_02";
_c pushBack "gm_headgear_foliage_summer_forest_03";
_c pushBack "gm_headgear_foliage_summer_forest_04";
_c pushBack "gm_headgear_foliage_summer_grass_01";
_c pushBack "gm_headgear_foliage_summer_grass_02";
_c pushBack "gm_headgear_foliage_summer_grass_03";
_c pushBack "gm_headgear_foliage_summer_grass_04";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_g3a4_oli";
_c pushBack "gm_g3a4_blk";
_c pushBack "gm_g3a4_grn";
_c pushBack "gm_g3a4_des";
_c pushBack "gm_g3a3_oli";
_c pushBack "gm_g3a3_blk";
_c pushBack "gm_g3a3_grn";
_c pushBack "gm_g3a3_des";
_c pushBack "gm_g3a3a0_gold";
_c pushBack "gm_g3a3a0_blk";
_c pushBack "gm_g3a3a0_oli";
_c pushBack "gm_g3a3a1_ris_blk";
_c pushBack "gm_g3a3a1_ris_oli";
_c pushBack "gm_g3a4a0_blk";
_c pushBack "gm_g3a4a0_oli";
_c pushBack "gm_g3a4a1_ris_blk";
_c pushBack "gm_g3a4a1_ris_oli";
_c pushBack "gm_g3ka4_blk";
_c pushBack "gm_g3ka4_oli";
_c pushBack "gm_g3ka4a1_ris_blk";
_c pushBack "gm_g3sg1_blk";
_c pushBack "gm_g3sg1_oli";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_DM111_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_DM41_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A1_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_t_DM21A2_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_DM111_g3_des";
_c pushBack "gm_20Rnd_762x51mm_b_DM41_g3_des";
_c pushBack "gm_20Rnd_762x51mm_ap_DM151_g3_des";
_c pushBack "gm_1rnd_67mm_heat_dm22a1_g3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_pzf84_oli";
_c pushBack "gm_pzf84_des";
_c pushBack "gm_pzf84_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf";
_c pushBack "gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf";
_c pushBack "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf";
_c pushBack "gm_1Rnd_84x245mm_illum_DM16_carlgustaf";
_c pushBack "gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_fim43_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_70mm_he_m585_fim43";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//

//laser
_c pushBack "gm_lsminiv_ir_stanagClaw_blk";
_c pushBack "gm_lsminiv_red_stanagClaw_blk";
_c pushBack "gm_ls1500_ir_stanagClaw_blk";
_c pushBack "gm_ls1500_red_stanagClaw_blk";
_c pushBack "gm_ls45_ir_stanagClaw_blk";
_c pushBack "gm_ls45_red_stanagClaw_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//scope
_c pushBack "gm_feroz24_stanagClaw_blk";
_c pushBack "gm_feroz24_stanagClaw_oli";
_c pushBack "gm_feroz2x17_pzf44_2_blk";
_c pushBack "gm_feroz2x17_pzf44_2_des";
_c pushBack "gm_feroz2x17_pzf44_2_win";
_c pushBack "gm_feroz2x17_pzf84_blk";
_c pushBack "gm_feroz2x17_pzf84_des";
_c pushBack "gm_feroz2x17_pzf84_win";

//muzzle
_c pushBack "gm_suppressor_atec150_556mm_blk";
_c pushBack "gm_suppressor_atec150_556mm_long_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniform																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_xx_uniform_soldier_bdu_nogloves_80_wdl";
_c pushBack "gm_xx_uniform_soldier_bdu_80_wdl";
_c pushBack "gm_xx_uniform_soldier_bdu_rolled_80_wdl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_army_vest_pilot_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_ge_army_vest_pilot_pads_oli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "gm_30Rnd_556x45mm_B_DM11_g36_blk";
_c pushBack "gm_30Rnd_556x45mm_B_T_DM21_g36_blk";
_c pushBack "gm_30Rnd_556x45mm_B_DM11_g36_des";
_c pushBack "gm_30Rnd_556x45mm_B_T_DM21_g36_des";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_1Rnd_milan_heat_dm82";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_milan_heat_dm92";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_pzf3_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_60mm_heat_dm12_pzf3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_60mm_heat_dm22_pzf3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,250] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_1Rnd_60mm_heat_dm32_pzf3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_feroz24_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_feroz24_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_army_backpack_90_flk";
_c pushBack "gm_ge_army_backpack_90_trp";
_c pushBack "gm_ge_army_backpack_90_cover_win";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_milan_launcher_weaponBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//-------------------------------------------------------------------------------------------Level 3-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_g36e_blk";
_c pushBack "gm_g36a1_blk";
_c pushBack "gm_g36a1_des";

_c pushBack "gm_g8a1_blk";
_c pushBack "gm_g8a2_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_5Rnd_762x51mm_B_T_DM21_g3_blk";
_c pushBack "gm_5Rnd_762x51mm_B_T_DM21A1_g3_blk";
_c pushBack "gm_5Rnd_762x51mm_B_T_DM21A2_g3_blk";
_c pushBack "gm_5Rnd_762x51mm_B_DM111_g3_blk";
_c pushBack "gm_5Rnd_762x51mm_B_DM41_g3_blk";
_c pushBack "gm_5Rnd_762x51mm_AP_DM151_g3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_10Rnd_762x51mm_B_T_DM21_g3_blk";
_c pushBack "gm_10Rnd_762x51mm_B_T_DM21A1_g3_blk";
_c pushBack "gm_10Rnd_762x51mm_B_T_DM21A2_g3_blk";
_c pushBack "gm_10Rnd_762x51mm_B_DM111_g3_blk";
_c pushBack "gm_10Rnd_762x51mm_B_DM41_g3_blk";
_c pushBack "gm_10Rnd_762x51mm_AP_DM151_g3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_20Rnd_762x51mm_B_T_DM21_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_B_DM111_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_B_DM41_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_AP_DM151_g3_blk";
_c pushBack "gm_20Rnd_762x51mm_B_T_DM21_g3_gold";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_40Rnd_762x51mm_B_T_DM21_g3_blk";
_c pushBack "gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk";
_c pushBack "gm_40Rnd_762x51mm_B_T_DM21A2_g3_blk";
_c pushBack "gm_40Rnd_762x51mm_B_DM111_g3_blk";
_c pushBack "gm_40Rnd_762x51mm_B_DM41_g3_blk";
_c pushBack "gm_40Rnd_762x51mm_AP_DM151_g3_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

_c pushBack "gm_g11k2_blk";
_c pushBack "gm_g11k2_ris_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_50Rnd_473x33mm_B_DM11_g11_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(473*33)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_mg3_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_mg3_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "gm_120Rnd_762x51mm_b_t_DM21_mg3_grn";
_c pushBack "gm_120Rnd_762x51mm_b_t_DM21A1_mg3_grn";
_c pushBack "gm_120Rnd_762x51mm_b_t_DM21A2_mg3_grn";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,120,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_mg8a1_blk";
_c pushBack "gm_mg8a2_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli";
_c pushBack "gm_100Rnd_762x51mm_B_T_DM21A1_mg8_oli";
_c pushBack "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_itemprise = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _itemprise;
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Sniper																	//
//--------------------------------------------------------------------------------------------------------------------------//


_c pushBack "gm_psg1_blk";
_c pushBack "gm_msg90_blk";
_c pushBack "gm_msg90a1_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_20Rnd_762x51mm_B_T_DM21_g3_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniform																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_uniform_soldier_90_flk";
_c pushBack "gm_ge_uniform_soldier_rolled_90_flk";
_c pushBack "gm_ge_uniform_soldier_tshirt_90_flk";
_c pushBack "gm_ge_army_uniform_crew_90_flk";
_c pushBack "gm_ge_uniform_soldier_90_trp";
_c pushBack "gm_ge_uniform_soldier_tshirt_90_trp";
_c pushBack "gm_ge_uniform_soldier_rolled_90_trp";
_c pushBack "gm_ge_army_uniform_crew_90_trp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_vest_armor_90_flk";
_c pushBack "gm_ge_vest_armor_90_crew_flk";
_c pushBack "gm_ge_vest_armor_90_demolition_flk";
_c pushBack "gm_ge_vest_armor_90_leader_flk";
_c pushBack "gm_ge_vest_armor_90_machinegunner_flk";
_c pushBack "gm_ge_vest_armor_90_medic_flk";
_c pushBack "gm_ge_vest_armor_90_officer_flk";
_c pushBack "gm_ge_vest_armor_90_rifleman_flk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "gm_ge_headgear_m92_flk";
_c pushBack "gm_ge_headgear_m92_trp";
_c pushBack "gm_ge_headgear_m92_glasses_trp";
_c pushBack "gm_ge_headgear_m92_glasses_flk";
_c pushBack "gm_ge_headgear_m92_cover_win";
_c pushBack "gm_ge_headgear_m92_cover_glasses_win";
_c pushBack "gm_ge_headgear_sph4_oli";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_ge_headgear_hat_90_trp";
_c pushBack "gm_ge_headgear_hat_90_flk";
_c pushBack "gm_ge_headgear_hat_boonie_trp";
_c pushBack "gm_ge_headgear_hat_boonie_flk";
_c pushBack "gm_dk_headgear_hat_boonie_m84";
_c pushBack "gm_ge_headgear_hat_boonie_wdl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//

//scope
_c pushBack "gm_blits_stanagClaw_blk";
_c pushBack "gm_blits_stanagClaw_oli";
_c pushBack "gm_colt4x20_stanagClaw_blk";
_c pushBack "gm_diavari_da_stanagClaw_blk";//1.5-6x
_c pushBack "gm_diavari_da_stanagClaw_oli";//1.5-6x

_c pushBack "gm_rv_stanagClaw_blk";
_c pushBack "gm_rv_stanagClaw_oli";

_c pushBack "gm_zf10x42_stanagClaw_blk";//10x
_c pushBack "gm_zf10x42_stanagClaw_oli";//10x
_c pushBack "gm_feroz51_stanagClaw_oli";
_c pushBack "gm_g11_lps_prism11mm_blk";
_c pushBack "gm_g11_mps_prism11mm_blk";
_c pushBack "gm_zf6x42_psg1_stanag_blk";

//muzzle
_c pushBack "gm_suppressor_atec150_556mm_blk";
_c pushBack "gm_suppressor_atec150_556mm_long_blk";
_c pushBack "gm_suppressor_atec150_762mm_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "gm_surefire_l60_wht_bayonetg11_blk";
_c pushBack "gm_surefire_l60_ir_bayonetg11_blk";
_c pushBack "gm_surefire_l60_red_bayonetg11_blk";
_c pushBack "gm_surefire_l72_grn_bayonetg11_blk";
_c pushBack "gm_surefire_l72_red_bayonetg11_blk";
_c pushBack "gm_surefire_l75_ir_bayonetg11_blk";
_c pushBack "gm_g8_bipod_blk";
_c pushBack "gm_bayonet_g11_blk";
_c pushBack "gm_bayonet_g11_oli";
_c pushBack "gm_msg90_bipod_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_GM_BW.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_GM_BW.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
