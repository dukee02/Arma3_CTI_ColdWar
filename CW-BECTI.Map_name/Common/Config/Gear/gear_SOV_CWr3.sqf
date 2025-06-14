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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_SOV_ID, CTI_CWR3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_HandGrenade_RGD5";
_c pushBack "CUP_HandGrenade_RGO";
_c pushBack "CUP_1Rnd_HE_GP25_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_IlumFlareWhite_GP25_M";
_c pushBack "CUP_IlumFlareRed_GP25_M";
_c pushBack "CUP_IlumFlareGreen_GP25_M";
_c pushBack "CUP_FlareWhite_GP25_M";
_c pushBack "CUP_FlareGreen_GP25_M";
_c pushBack "CUP_FlareRed_GP25_M";
_c pushBack "CUP_FlareYellow_GP25_M";
_c pushBack "CUP_1Rnd_SMOKE_GP25_M";
_c pushBack "CUP_1Rnd_SmokeRed_GP25_M";
_c pushBack "CUP_1Rnd_SmokeGreen_GP25_M";
_c pushBack "CUP_1Rnd_SmokeYellow_GP25_M";
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
//AK 47 main weapon, AKM slightly lighter
//AK 74 better precision
//AK 101 (90s)
//AK 105 (2k)
//AK 107 (2010)

_c pushBack "CUP_arifle_AKS74_Early";
_c pushBack "CUP_arifle_AKS74";
_c pushBack "CUP_arifle_AKS74_GL_Early";
_c pushBack "CUP_arifle_AKS74_GL";
_c pushBack "CUP_arifle_AK74_Early";
_c pushBack "CUP_arifle_AK74";
_c pushBack "CUP_arifle_AK74_GL_Early";
_c pushBack "CUP_arifle_AK74_GL";
_c pushBack "CUP_arifle_AKS74U";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_30Rnd_545x39_AK_M";
_c pushBack "CUP_30Rnd_Subsonic_545x39_AK_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M";
_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_glaunch_6G30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_RPG7V";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_PG7V_M";		//Monoblock-Hohlladung		R=300	P=280
_c pushBack "CUP_PG7VM_M";		//Monoblock-Hohlladung		R=500	P=300–330
_c pushBack "CUP_PG7VL_M";		//Monoblock-Hohlladung		R=300	P=500–550
_c pushBack "CUP_PG7VR_M";		//Tandemhohlladung			R=200	P=600–700
_c pushBack "CUP_OG7_M";		//Splitter					R=1000	P= -
_c pushBack "CUP_TBG7V_M";		//Thermobar					R=300	P= -
_c pushBack "RPG7_F";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_o_uniform_klmk_1954_birch_v3";
_c pushBack "cwr3_o_uniform_klmk_1957_birch_v3";
_c pushBack "cwr3_o_uniform_klmk_1954_birch_v2";
_c pushBack "cwr3_o_uniform_klmk_1954_birch_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_branches_v2";
_c pushBack "cwr3_o_uniform_klmk_1954_branches_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_desert_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_leaves_v2";
_c pushBack "cwr3_o_uniform_klmk_1954_leaves_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_palm_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_palm_v2";
_c pushBack "cwr3_o_uniform_klmk_1954_splats_v1";
_c pushBack "cwr3_o_uniform_klmk_1954_splats_v2";
_c pushBack "cwr3_o_uniform_klmk_1957_birch_v1";
_c pushBack "cwr3_o_uniform_klmk_1957_birch_v2";
_c pushBack "cwr3_o_uniform_klmk_1957_splats_v2";
_c pushBack "cwr3_o_uniform_klmk_1957_splats_v1";
_c pushBack "cwr3_o_uniform_kzs_v2";
_c pushBack "cwr3_o_uniform_kzs_v1";
_c pushBack "cwr3_o_uniform_klaksa_coverall";
_c pushBack "cwr3_o_uniform_klmk_1954_birch_spn";
_c pushBack "cwr3_o_uniform_klmk_1954_splats_night_spn";
_c pushBack "cwr3_o_uniform_klmk_1954_palm_spn";
_c pushBack "cwr3_o_uniform_klmk_1954_splats_spn";
_c pushBack "cwr3_o_uniform_klmk_1957_birch_spn";
_c pushBack "cwr3_o_uniform_klmk_1957_birch_night_spn";
_c pushBack "cwr3_o_uniform_klmk_1957_reddawn_spn";
_c pushBack "cwr3_o_uniform_klmk_1957_splats_spn";
_c pushBack "cwr3_o_uniform_kzs_spn";
_c pushBack "cwr3_o_uniform_m1969";
_c pushBack "cwr3_o_uniform_m1969_collar";
_c pushBack "cwr3_o_uniform_m1969_rolled";
_c pushBack "cwr3_o_uniform_m1982_lacers";
_c pushBack "cwr3_o_uniform_m1982_lacers_rolled_officer";
_c pushBack "cwr3_o_uniform_m1982_lacers_rolled";
_c pushBack "cwr3_o_uniform_m1982";
_c pushBack "cwr3_o_uniform_m1982_rolled_officer";
_c pushBack "cwr3_o_uniform_m1982_rolled";
_c pushBack "cwr3_o_uniform_m1983_ttsko";
_c pushBack "cwr3_o_uniform_m1983_rolled_ttsko";
_c pushBack "cwr3_o_uniform_m1983_rolled_ttsko_officer";
_c pushBack "cwr3_o_uniform_m1983_coverall_kzs";
_c pushBack "cwr3_o_uniform_m1972_apc";
_c pushBack "cwr3_o_uniform_m1982_apc";
_c pushBack "cwr3_o_uniform_m1972_tanker";
_c pushBack "cwr3_o_uniform_m1982_tanker";
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
_c pushBack "cwr3_o_bandanna_klmk";
_c pushBack "cwr3_o_bandanna_od";
_c pushBack "cwr3_o_beret_tank";
_c pushBack "cwr3_o_headgear_officer_cap";
_c pushBack "cwr3_o_headgear_officer_cap_field";
_c pushBack "cwr3_o_headgear_sidecap_m1973";
_c pushBack "cwr3_o_headgear_sidecap_m1973_field";
_c pushBack "cwr3_o_headgear_fieldcap_m1982_v2";
_c pushBack "cwr3_o_headgear_fieldcap_m1982";
_c pushBack "cwr3_o_headgear_fieldcap_ttsko";
_c pushBack "cwr3_o_headgear_fieldcap_ttsko_v2";
_c pushBack "cwr3_o_ushanka";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "cwr3_o_headgear_ssh68";
_c pushBack "cwr3_o_headgear_ssh68_camo";
_c pushBack "cwr3_o_headgear_ssh68_cover_klmk";
_c pushBack "cwr3_o_headgear_ssh68_cover";
_c pushBack "cwr3_o_headgear_ssh68_net";
_c pushBack "cwr3_o_headgear_ssh68_winter";
_c pushBack "cwr3_o_headgear_tsh3";
_c pushBack "cwr3_o_headgear_tsh4";
_c pushBack "cwr3_o_headgear_tsh4_tan";
_c pushBack "cwr3_o_headgear_zsh5";
_c pushBack "cwr3_o_headgear_zsh5_visor";
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
_c pushBack "cwr3_o_vest_harness_ak74";
_c pushBack "cwr3_o_vest_harness_mg";
_c pushBack "cwr3_o_vest_harness_svd";
_c pushBack "cwr3_o_vest_harness_medic";
_c pushBack "cwr3_o_vest_harness_officer";
_c pushBack "cwr3_o_vest_harness_sapper";
_c pushBack "cwr3_o_vest_harness_gl";
_c pushBack "cwr3_o_vest_beltkit_officer";
_c pushBack "cwr3_o_vest_beltkit_officer_bino";
_c pushBack "cwr3_o_vest_beltkit_ak74";
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
_c pushBack "cwr3_o_backpack_harness_roll";
_c pushBack "cwr3_o_backpack_rd54";
_c pushBack "cwr3_o_backpack_rd54_medic_empty";
_c pushBack "cwr3_o_backpack_rd54_r148";
_c pushBack "cwr3_o_backpack_rpg7";
_c pushBack "cwr3_o_backpack_gasmask";
_c pushBack "cwr3_o_backpack_veshmeshok";
_c pushBack "cwr3_o_backpack_veshmeshok_medic_empty";
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

_c pushBack "CUP_arifle_AK74M";
_c pushBack "CUP_arifle_AK74M_desert";
_c pushBack "CUP_arifle_AK74M_camo";
_c pushBack "CUP_arifle_AK74M_GL";
_c pushBack "CUP_arifle_AKS_Gold";
_c pushBack "CUP_arifle_AK74M_GL_desert";
_c pushBack "CUP_arifle_AK74M_GL_camo";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_launch_RPG18";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_launch_9K32Strela";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_arifle_RPK74_45";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_RPK74M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK74_plum_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M";
_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M";
_c pushBack "CUP_30Rnd_Subsonic_545x39_AK74_plum_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74_plum_M";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M";
_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74_plum_M";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74_plum_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_lmg_PKM";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_PKMN";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "150Rnd_762x54_Box";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x54_Box_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_10Rnd_762x54_SVD_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_optic_PSO_1";
_c pushBack "CUP_optic_PSO_1_1_open";
_c pushBack "CUP_optic_PSO_1_1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_o_camel_pilot_uniform";
_c pushBack "cwr3_o_uniform_pilot";
_c pushBack "cwr3_o_uniform_pilot_ttsko";
_c pushBack "cwr3_o_uniform_pilot_jet";
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
_c pushBack "cwr3_o_vest_chicom_ak74";
_c pushBack "cwr3_o_vest_chicom_beltkit_ak74";
_c pushBack "cwr3_o_vest_chicom_beltkit_light_ak74";
_c pushBack "cwr3_o_vest_chicom_beltkit_mg";
_c pushBack "cwr3_o_vest_chicom_beltkit_medic";
_c pushBack "cwr3_o_vest_chicom_beltkit_sapper";
_c pushBack "cwr3_o_vest_chicom_beltkit_gl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "CUP_arifle_AK74M_top_rail";
_c pushBack "CUP_arifle_AK74M_top_rail_desert";
_c pushBack "CUP_arifle_AK74M_top_rail_camo";
_c pushBack "CUP_arifle_AK74M_railed";
_c pushBack "CUP_arifle_AK74M_railed_afg";
_c pushBack "CUP_arifle_AK74M_railed_afg_desert";
_c pushBack "CUP_arifle_AK74M_railed_afg_camo";
_c pushBack "CUP_arifle_AK74M_railed_desert";
_c pushBack "CUP_arifle_AK74M_railed_camo";
_c pushBack "CUP_arifle_AK74M_GL_top_rail";
_c pushBack "CUP_arifle_AK74M_GL_top_rail_desert";
_c pushBack "CUP_arifle_AK74M_GL_top_rail_camo";
_c pushBack "CUP_arifle_AK74M_GL_railed";
_c pushBack "CUP_arifle_AK74M_GL_railed_desert";
_c pushBack "CUP_arifle_AK74M_GL_railed_camo";
_c pushBack "CUP_arifle_AK74_top_rail";
_c pushBack "CUP_arifle_AK74_GL_top_rail";
_c pushBack "CUP_arifle_AKS74_top_rail";
_c pushBack "CUP_arifle_AKS74_GL_top_rail";
_c pushBack "CUP_arifle_AKS74U_top_rail";
_c pushBack "CUP_arifle_AKS_top_rail";

_c pushBack "CUP_arifle_RPK74_45_top_rail";
_c pushBack "CUP_arifle_RPK74M_top_rail";
_c pushBack "CUP_arifle_RPK74M_railed";

_c pushBack "CUP_lmg_PKM_B50_vfg";
_c pushBack "CUP_lmg_PKM_front_rail_B50_vfg";
_c pushBack "CUP_lmg_PKM_top_rail";
_c pushBack "CUP_lmg_PKM_top_rail_B50_vfg";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_Black";
_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_OD";
_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_Tan";
_c pushBack "CUP_muzzle_snds_KZRZP_PK";
_c pushBack "CUP_muzzle_snds_KZRZP_PK_desert";
_c pushBack "CUP_muzzle_snds_KZRZP_PK_woodland";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_srifle_SVD_des";
_c pushBack "CUP_srifle_SVD_des_top_rail";
_c pushBack "CUP_srifle_SVD_top_rail";
_c pushBack "CUP_srifle_SVD_wdl";
_c pushBack "CUP_srifle_SVD_wdl_top_rail";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_optic_PSO_1_AK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PSO_1_AK_open";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_Igla";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_o_vest_ghillie";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "cwr3_o_vest_6b2";
_c pushBack "cwr3_o_vest_6b2_ak74";
_c pushBack "cwr3_o_vest_6b2_chicom_ak74";
_c pushBack "cwr3_o_vest_6b2_chicom_light_ak74";
_c pushBack "cwr3_o_vest_6b2_mg";
_c pushBack "cwr3_o_vest_6b2_svd";
_c pushBack "cwr3_o_vest_6b2_medic";
_c pushBack "cwr3_o_vest_6b2_officer";
_c pushBack "cwr3_o_vest_6b2_sapper";
_c pushBack "cwr3_o_vest_6b2_gl";
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
_c pushBack "CUP_NVG_1PN138_hide";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_NVG_1PN138";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

/* //not in early
_c pushBack "Rangefinder";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Laserdesignator_02";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Laserbatteries";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "ItemGPS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "B_UavTerminal";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_SOV_CWr3.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_SOV_CWr3.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
