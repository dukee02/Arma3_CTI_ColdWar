private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt", "_cntstart", "_cntend"];

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
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_full = [_side, CTI_UPGRADE_GEAR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_US_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_HandGrenade_M67";
_c pushBack "CUP_1Rnd_HE_M203";
_c pushBack "CUP_1Rnd_HEDP_M203";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_1Rnd_StarCluster_White_M203";
_c pushBack "CUP_1Rnd_StarCluster_Red_M203";
_c pushBack "CUP_1Rnd_StarCluster_Green_M203";
_c pushBack "CUP_1Rnd_StarFlare_White_M203";
_c pushBack "CUP_1Rnd_StarFlare_Red_M203";
_c pushBack "CUP_1Rnd_StarFlare_Green_M203";
_c pushBack "CUP_FlareWhite_M203";
_c pushBack "CUP_FlareGreen_M203";
_c pushBack "CUP_FlareRed_M203";
_c pushBack "CUP_FlareYellow_M203";
_c pushBack "CUP_1Rnd_Smoke_M203";
_c pushBack "CUP_1Rnd_SmokeRed_M203";
_c pushBack "CUP_1Rnd_SmokeGreen_M203";
_c pushBack "CUP_1Rnd_SmokeYellow_M203";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------------------------------------------------------------------------------------//
//															Weapons															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "CUP_hgun_M9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_hgun_M9A1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_15Rnd_9x19_M9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,15,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "cwr3_glaunch_mm1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cwr3_12rnd_mm1_m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_smg_M3A1_blk";
_c pushBack "CUP_smg_M3A1_grn";
_c pushBack "CUP_smg_M3A1";
_c pushBack "CUP_smg_M3A1_snd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_30Rnd_45ACP_M3A1_BLK_M";
_c pushBack "CUP_30Rnd_45ACP_M3A1_M";
_c pushBack "CUP_30Rnd_45ACP_Green_Tracer_M3A1_M";
_c pushBack "CUP_30Rnd_45ACP_Yellow_Tracer_M3A1_M";
_c pushBack "CUP_30Rnd_45ACP_Red_Tracer_M3A1_M";
_c pushBack "CUP_30Rnd_45ACP_Green_Tracer_M3A1_BLK_M";
_c pushBack "CUP_30Rnd_45ACP_Yellow_Tracer_M3A1_BLK_M";
_c pushBack "CUP_30Rnd_45ACP_Red_Tracer_M3A1_BLK_M";
_c pushBack "CUP_30Rnd_45ACP_M3A1_GRN_M";
_c pushBack "CUP_30Rnd_45ACP_Green_Tracer_M3A1_GRN_M";
_c pushBack "CUP_30Rnd_45ACP_Yellow_Tracer_M3A1_GRN_M";
_c pushBack "CUP_30Rnd_45ACP_Red_Tracer_M3A1_GRN_M";
_c pushBack "CUP_30Rnd_45ACP_M3A1_SND_M";
_c pushBack "CUP_30Rnd_45ACP_Green_Tracer_M3A1_SND_M";
_c pushBack "CUP_30Rnd_45ACP_Yellow_Tracer_M3A1_SND_M";
_c pushBack "CUP_30Rnd_45ACP_Red_Tracer_M3A1_SND_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_arifle_M16A1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M16A1GL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cup_30rnd_556x45_stanag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_srifle_M14";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_White_Tracer_762x51_DMR";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "cwr3_launch_m72a3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "cwr3_launch_m67_rcl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cwr3_m67_rcl_heat_m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//


//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_b_uniform_dcu";
_c pushBack "cwr3_b_uniform_dcu_rolled";
_c pushBack "cwr3_b_uniform_dcu_tee";
_c pushBack "cwr3_b_uniform_desert_6color";
_c pushBack "cwr3_b_uniform_desert_6color_rolled";
_c pushBack "cwr3_b_uniform_desert_6color_tee";
_c pushBack "cwr3_b_uniform_black_gloves";
_c pushBack "cwr3_b_uniform_black_gloves_noflag";
_c pushBack "cwr3_b_uniform_black_rolled_gloves";
_c pushBack "cwr3_b_uniform_ERDL";
_c pushBack "cwr3_b_uniform_ERDL_rolled";
_c pushBack "cwr3_b_uniform_ERDL_tee";
_c pushBack "cwr3_b_uniform_m81_woodland";
_c pushBack "cwr3_b_uniform_m81_woodland_early";
_c pushBack "cwr3_b_uniform_m81_woodland_gloves_early";
_c pushBack "cwr3_b_uniform_m81_woodland_gloves_sf_early";
_c pushBack "cwr3_b_uniform_m81_woodland_gloves";
_c pushBack "cwr3_b_uniform_m81_woodland_rolled";
_c pushBack "cwr3_b_uniform_m81_woodland_rolled_gloves";
_c pushBack "cwr3_b_uniform_m81_woodland_rolled_gloves_sf";
_c pushBack "cwr3_b_uniform_m81_woodland_tee";
_c pushBack "cwr3_b_uniform_m81_woodland_gloves_sf";
_c pushBack "cwr3_b_uniform_og107";
_c pushBack "cwr3_b_uniform_og107_noflag";
_c pushBack "cwr3_b_uniform_og107_rolled";
_c pushBack "cwr3_b_uniform_og107_rolled_gloves";
_c pushBack "cwr3_b_uniform_og107_tee";
_c pushBack "cwr3_b_uniform_winter";
_c pushBack "cwr3_b_uniform_tanksuit";
_c pushBack "cwr3_b_uniform_pilot_black";
_c pushBack "cwr3_b_uniform_pilot_sf";
_c pushBack "cwr3_b_uniform_pilot";
_c pushBack "cwr3_b_uniform_pilot_jet";
_c pushBack "cwr3_b_camel_pilot_uniform";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Helmets																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_b_headgear_boonie_dcu";
_c pushBack "cwr3_b_headgear_boonie_desert_6color";
_c pushBack "cwr3_b_headgear_boonie_m81_woodland";
_c pushBack "cwr3_b_headgear_boonie_m81_woodland_early";
_c pushBack "cwr3_b_headgear_boonie_m81_sf_woodland_early";
_c pushBack "cwr3_b_headgear_boonie_m81_sf_woodland";
_c pushBack "cwr3_b_headgear_boonie_og107";
_c pushBack "cwr3_b_headgear_cap_dcu";
_c pushBack "cwr3_b_headgear_cap_desert_6color";
_c pushBack "cwr3_b_headgear_cap_m81_woodland";
_c pushBack "cwr3_b_headgear_cap_m81_woodland_2lt";
_c pushBack "cwr3_b_headgear_cap_m81_woodland_early";
_c pushBack "cwr3_b_headgear_cap_m81_woodland_early_2lt";
_c pushBack "cwr3_b_headgear_cap_m81_woodland_early_majgen";
_c pushBack "cwr3_b_headgear_cap_m81_sf_woodland_early";
_c pushBack "cwr3_b_headgear_cap_m81_woodland_majgen";
_c pushBack "cwr3_b_headgear_cap_m81_sf_woodland";
_c pushBack "cwr3_b_headgear_cap_og107";
_c pushBack "cwr3_b_headgear_cvc";
_c pushBack "cwr3_b_headgear_cvc_goggles";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "cwr3_b_headgear_m1_desert_6color";
_c pushBack "cwr3_b_headgear_m1_cover_net";
_c pushBack "cwr3_b_headgear_m1_erdl";
_c pushBack "cwr3_b_headgear_m1_goggles_erdl";
_c pushBack "cwr3_b_headgear_m1_woodland_army_1985";
_c pushBack "cwr3_b_headgear_m1_woodland_army_early";
_c pushBack "cwr3_b_headgear_m1_goggles_woodland_army_early";
_c pushBack "cwr3_b_headgear_m1_goggles_woodland_army_1985";
_c pushBack "cwr3_b_headgear_m1_mitchell";
_c pushBack "cwr3_b_headgear_m1_goggles_mitchell";
_c pushBack "cwr3_b_headgear_m1_olive";
_c pushBack "cwr3_b_headgear_pasgt_dcu";
_c pushBack "cwr3_b_headgear_pasgt_dcu_goggles";
_c pushBack "cwr3_b_headgear_pasgt_dcu_rhino";
_c pushBack "cwr3_b_headgear_pasgt_dcu_rhino_goggles";
_c pushBack "cwr3_b_headgear_pasgt_desert_6color";
_c pushBack "cwr3_b_headgear_pasgt_desert_6color_goggles";
_c pushBack "cwr3_b_headgear_pasgt_desert_6color_rhino";
_c pushBack "cwr3_b_headgear_pasgt_desert_6color_rhino_goggles";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_2lt";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_camonet";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_early";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_goggles";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_goggles_early";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_majgen";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_net";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_rhino";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_rhino_goggles";
_c pushBack "cwr3_b_headgear_pasgt_m81_woodland_scrim";
_c pushBack "cwr3_b_headgear_pasgt_winter";
_c pushBack "cwr3_b_headgear_pasgt_winter_goggles";
_c pushBack "cwr3_b_headgear_protec_full";
_c pushBack "cwr3_b_headgear_protec_full_goggles";
_c pushBack "cwr3_b_headgear_protec_full_plain";
_c pushBack "cwr3_b_headgear_protec_half";
_c pushBack "cwr3_b_headgear_protec_half_goggles";
_c pushBack "cwr3_b_headgear_protec_half_headset";
_c pushBack "cwr3_b_headgear_protec_half_headset_goggles";
_c pushBack "cwr3_b_headgear_protec_half_plain";
_c pushBack "cwr3_i_headgear_cap_woodland";
_c pushBack "cwr3_i_headgear_cap_og107";
_c pushBack "cwr3_b_headgear_pilot";
_c pushBack "cwr3_b_headgear_pilot_visor_white";
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
_c pushBack "cwr3_b_vest_beltkit_officer";
_c pushBack "cwr3_b_vest_alice_ar";
_c pushBack "cwr3_b_vest_alice_crew";
_c pushBack "cwr3_b_vest_alice_etool";
_c pushBack "cwr3_b_vest_alice_gl";
_c pushBack "cwr3_b_vest_alice_light";
_c pushBack "cwr3_b_vest_alice_mg";
_c pushBack "cwr3_b_vest_alice_officer";
_c pushBack "cwr3_b_vest_alice";
_c pushBack "cwr3_b_vest_anite";
_c pushBack "cwr3_b_vest_lbv";
_c pushBack "cwr3_b_vest_lbv_alice";
_c pushBack "cwr3_b_vest_pilot";
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
_c pushBack "cwr3_b_backpack_alice_black";
_c pushBack "cwr3_b_backpack_alice";
_c pushBack "cwr3_b_backpack_alice_medic_empty";
_c pushBack "cwr3_b_backpack_radio";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "CUP_arifle_M16A1GL_FS";
_c pushBack "CUP_arifle_M16A1GL_USA";
_c pushBack "CUP_arifle_M16A1E1";
_c pushBack "CUP_arifle_M16A1E1GL";
_c pushBack "CUP_arifle_M16A2";
_c pushBack "CUP_arifle_Colt727";
_c pushBack "CUP_arifle_Colt727_M203";
_c pushBack "CUP_arifle_M16A2_GL";

_c pushBack "CUP_lmg_m249_SQuantoon";
_c pushBack "CUP_lmg_m249_pip1";
_c pushBack "CUP_lmg_m249_pip3";
_c pushBack "CUP_lmg_m249_pip4";
_c pushBack "CUP_lmg_M249_E1";
_c pushBack "CUP_lmg_M249_E2";
_c pushBack "CUP_lmg_m249_pip2";
_c pushBack "CUP_lmg_m249_para";
_c pushBack "CUP_lmg_m249_para_gl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_100Rnd_TE4_Green_Tracer_556x45_M249";
_c pushBack "CUP_100Rnd_TE4_Red_Tracer_556x45_M249";
_c pushBack "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
_c pushBack "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249";
_c pushBack "CUP_200Rnd_TE4_Green_Tracer_556x45_M249";
_c pushBack "CUP_200Rnd_TE1_Red_Tracer_556x45_M249";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "CUP_lmg_M60";
_c pushBack "CUP_lmg_M60E4_norail";
_c pushBack "CUP_lmg_M60E4_norail_desert";
_c pushBack "CUP_lmg_M60E4_norail_jungle";
_c pushBack "CUP_lmg_M60E4_norail_wood";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_c pushBack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
_c pushBack "CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M";
_c pushBack "CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "cwr3_launch_redeye";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//


//--------------------------------------------------------------------------------------------------------------------------//
//										Vests																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_b_vest_pasgt_6color_desert";
_c pushBack "cwr3_b_vest_pasgt_woodland";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_ar";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_etool";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_gl";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_light";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_mg";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert_officer";
_c pushBack "cwr3_b_vest_pasgt_alice_6color_desert";
_c pushBack "cwr3_b_vest_pasgt_alice_black";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_ar";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_etool";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_gl";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_light";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_mg";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland_officer";
_c pushBack "cwr3_b_vest_pasgt_alice_woodland";
_c pushBack "cwr3_b_vest_pasgt_alice_od_crew";
_c pushBack "cwr3_b_vest_pasgt_alice_anite_black";
_c pushBack "cwr3_b_vest_pasgt_alice_anite_m81";
_c pushBack "cwr3_b_vest_pasgt_alice_anite_od";
_c pushBack "cwr3_b_vest_pasgt_lbv_black";
_c pushBack "cwr3_b_vest_pasgt_lbv_woodland";
_c pushBack "cwr3_b_vest_pasgt_lbv_olive";
_c pushBack "cwr3_b_vest_pasgt_lbv_alice_black";
_c pushBack "cwr3_b_vest_pasgt_lbv_alice_woodland";
_c pushBack "cwr3_b_vest_pasgt_lbv_alice_olive";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "CUP_arifle_M16A4_Base";
_c pushBack "CUP_arifle_M16A4_Grip";
_c pushBack "CUP_arifle_M16A4_GL";
_c pushBack "CUP_arifle_M4A1";
_c pushBack "CUP_arifle_M4A1_GL_carryhandle";

_c pushBack "CUP_lmg_M60E4_jungle";
_c pushBack "CUP_lmg_M60E4";
_c pushBack "CUP_lmg_M60E4_desert";
_c pushBack "CUP_lmg_M60E4_wood";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "150Rnd_762x51_Box";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x51_Box_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "cwr3_launch_carlgustaf";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cwr3_carlgustaf_heat_m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cwr3_carlgustaf_hedp_m";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_srifle_M21";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M21_ris";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR";
_c pushBack "CUP_20Rnd_TE1_White_Tracer_762x51_DMR";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "cwr3_arifle_xms";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cwr3_arifle_xms_m203";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_launch_M47";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Dragon_EP1_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);



//FIM-92 Stinger Family		Surface-to-air missile launcher Guided
_c pushBack "CUP_launch_FIM92Stinger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Stinger_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_optic_MAAWS_Scope";
_c pushBack "CUP_optic_artel_m14";
_c pushBack "cwr3_optic_xms_dot";
_c pushBack "cwr3_optic_xms_cross";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Uniforms																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_b_vest_ghillie_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Vests																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_b_vest_tgfaust_black";
_c pushBack "cwr3_b_vest_tgfaust_od";
_c pushBack "cwr3_b_vest_tgfaust_alice_black";
_c pushBack "cwr3_b_vest_tgfaust_alice_od";
_c pushBack "cwr3_b_vest_tgfaust_anite_black";
_c pushBack "cwr3_b_vest_tgfaust_anite_od";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Other Items																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_NVG_PVS7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_NVG_PVS7_Hide";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_US_CWr3.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_US_CWr3.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
