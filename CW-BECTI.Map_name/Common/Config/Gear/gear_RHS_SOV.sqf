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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_SOV_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "rhs_mine_msk40p_blue_mag";
_c pushBack "rhs_mine_msk40p_green_mag";
_c pushBack "rhs_mine_msk40p_red_mag";
_c pushBack "rhs_mine_msk40p_white_mag";
_c pushBack "rhs_mine_sm320_green_mag";
_c pushBack "rhs_mine_sm320_red_mag";
_c pushBack "rhs_mine_sm320_white_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mine_ozm72_a_mag";
_c pushBack "rhs_mine_ozm72_b_mag";
_c pushBack "rhs_mine_ozm72_c_mag";
_c pushBack "rhs_mag_mine_pfm1";
_c pushBack "rhs_mag_mine_ptm1";
_c pushBack "rhs_mine_pmn2_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_ec75_mag";
_c pushBack "rhs_ec75_sand_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mine_tm62m_mag";
_c pushBack "rhs_ec200_sand_mag";
_c pushBack "rhs_ec200_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_ec400_sand_mag";
_c pushBack "rhs_ec400_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_rgd5";
_c pushBack "rhs_mag_rgn";
_c pushBack "rhs_mag_rgo";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_rdg2_black";
_c pushBack "rhs_mag_rdg2_white";
_c pushBack "rhs_mag_plamyam";
_c pushBack "rhs_mag_nspn_yellow";
_c pushBack "rhs_mag_nspn_red";
_c pushBack "rhs_mag_nspn_green";
_c pushBack "rhs_mag_nspd";
_c pushBack "rhs_mag_fakels";
_c pushBack "rhs_mag_fakel";
_c pushBack "rhs_mag_zarya2";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_VOG25";
_c pushBack "rhs_VOG25P";
_c pushBack "rhs_VG40TB";
_c pushBack "rhs_VG40SZ";
_c pushBack "rhs_GDM40";
_c pushBack "rhs_VG40MD";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_VG40OP_white";
_c pushBack "rhs_VG40OP_green";
_c pushBack "rhs_VG40OP_red";
_c pushBack "rhs_GRD40_White";
_c pushBack "rhs_GRD40_Green";
_c pushBack "rhs_GRD40_Red";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Level 0																	//
//--------------------------------------------------------------------------------------------------------------------------//
//													Weapons																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_weap_makarov_pm";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.75] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_mag_9x18_8_57N181S";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "rhs_weap_rsp30_white";
_c pushBack "rhs_weap_rsp30_green";
_c pushBack "rhs_weap_rsp30_red";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhs_mag_rsp30_white";
_c pushBack "rhs_mag_rsp30_green";
_c pushBack "rhs_mag_rsp30_red";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Periscope
_c pushBack "rhs_weap_tr8";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_ak74";
_c pushBack "rhs_weap_ak74_3";
_c pushBack "rhs_weap_ak74_2";
_c pushBack "rhs_weap_ak74_gp25";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_30Rnd_545x39_7N6M_AK";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//muzzles
_c pushBack "rhs_acc_uuk";
_c pushBack "rhs_acc_ak5";
_c pushBack "rhs_acc_dtk4short";
_c pushBack "rhs_acc_dtk1983";
_c pushBack "rhs_acc_tgpa";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhs_weap_ak74m";
_c pushBack "rhs_weap_ak74m_camo";
_c pushBack "rhs_weap_ak74m_desert";
_c pushBack "rhs_weap_ak74m_gp25";
_c pushBack "rhs_weap_ak74m_fullplum_gp25";
_c pushBack "rhs_weap_ak74m_fullplum";
_c pushBack "rhs_weap_ak74m_zenitco01";
_c pushBack "rhs_weap_ak74m_npz";
_c pushBack "rhs_weap_ak74m_camo_npz";
_c pushBack "rhs_weap_ak74m_desert_npz";
_c pushBack "rhs_weap_ak74m_gp25_npz";
_c pushBack "rhs_weap_ak74m_fullplum_gp25_npz";
_c pushBack "rhs_weap_ak74m_fullplum_npz";
_c pushBack "rhs_weap_ak74m_zenitco01_b33";
_c pushBack "rhs_weap_ak74mr";
_c pushBack "rhs_weap_ak74mr_gp25";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_30Rnd_545x39_7N10_AK";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_ak74n";
_c pushBack "rhs_weap_ak74n_gp25";
_c pushBack "rhs_weap_ak74n_gp25_npz";
_c pushBack "rhs_weap_ak74n_npz";
_c pushBack "rhs_weap_ak74n_2";
_c pushBack "rhs_weap_ak74n_2_npz";
_c pushBack "rhs_weap_ak74n_2_gp25";
_c pushBack "rhs_weap_ak74n_2_gp25_npz";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_akm";
_c pushBack "rhs_weap_akm_gp25";
_c pushBack "rhs_weap_akm_zenitco01_b33";
_c pushBack "rhs_weap_akmn";
_c pushBack "rhs_weap_akmn_gp25";
_c pushBack "rhs_weap_akmn_gp25_npz";
_c pushBack "rhs_weap_akmn_npz";
_c pushBack "rhs_weap_akms";
_c pushBack "rhs_weap_akms_gp25";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.2] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_30Rnd_762x39mm_bakelite";
_c pushBack "rhs_30Rnd_762x39mm_bakelite_tracer";
_c pushBack "rhs_30Rnd_762x39mm_bakelite_89";
_c pushBack "rhs_30Rnd_762x39mm_bakelite_U";
_c pushBack "rhs_30Rnd_762x39mm";
_c pushBack "rhs_30Rnd_762x39mm_tracer";
_c pushBack "rhs_30Rnd_762x39mm_89";
_c pushBack "rhs_30Rnd_762x39mm_U";
_c pushBack "rhs_30Rnd_762x39mm_polymer";
_c pushBack "rhs_30Rnd_762x39mm_polymer_tracer";
_c pushBack "rhs_30Rnd_762x39mm_polymer_89";
_c pushBack "rhs_30Rnd_762x39mm_polymer_U";
_c pushBack "rhssaf_30Rnd_762x39mm_M67";
_c pushBack "rhssaf_30Rnd_762x39mm_M78_tracer";
_c pushBack "rhssaf_30Rnd_762x39_M82_api";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_10Rnd_762x39mm";
_c pushBack "rhs_10Rnd_762x39mm_tracer";
_c pushBack "rhs_10Rnd_762x39mm_89";
_c pushBack "rhs_10Rnd_762x39mm_U";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_75Rnd_762x39mm";
_c pushBack "rhs_75Rnd_762x39mm_tracer";
_c pushBack "rhs_75Rnd_762x39mm_89";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,75,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_acc_dtkakm";
_c pushBack "rhs_acc_dtk1l";
_c pushBack "rhs_acc_pbs1";


_c pushBack "rhs_weap_aks74";
_c pushBack "rhs_weap_aks74_gp25";
_c pushBack "rhs_weap_aks74_2";
_c pushBack "rhs_weap_aks74n";
_c pushBack "rhs_weap_aks74n_gp25";
_c pushBack "rhs_weap_aks74n_gp25_npz";
_c pushBack "rhs_weap_aks74n_npz";
_c pushBack "rhs_weap_aks74n_2";
_c pushBack "rhs_weap_aks74n_2_npz";
_c pushBack "rhs_weap_aks74u";
_c pushBack "rhs_weap_aks74un";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG	 																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_rpk74m";
_c pushBack "rhs_weap_rpk74m_npz";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_45Rnd_545X39_7N6M_AK";
_c pushBack "rhs_45Rnd_545X39_7N6_AK";
_c pushBack "rhs_45Rnd_545X39_7N10_AK";
_c pushBack "rhs_45Rnd_545X39_7N22_AK";
_c pushBack "rhs_45Rnd_545X39_AK_Green";
_c pushBack "rhs_45Rnd_545X39_7U1_AK";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers 																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_rpg7";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhs_rpg7_PG7VL_mag";
_c pushBack "rhs_rpg7_PG7V_mag";
_c pushBack "rhs_rpg7_PG7VM_mag";
_c pushBack "rhs_rpg7_PG7VS_mag";
_c pushBack "rhs_rpg7_PG7VR_mag";
_c pushBack "rhs_rpg7_OG7V_mag";
_c pushBack "rhs_rpg7_TBG7V_mag";
_c pushBack "rhs_rpg7_type69_airburst_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

_c pushBack "rhs_uniform_6sh122_v2";
_c pushBack "rhs_uniform_6sh122_gloves_v2";
_c pushBack "rhs_uniform_6sh122_v1";
_c pushBack "rhs_uniform_6sh122_gloves_v1";
_c pushBack "rhs_uniform_cossack";
_c pushBack "rhs_uniform_df15";
_c pushBack "rhs_uniform_df15_tan";
_c pushBack "rhs_uniform_emr_des_patchless";
_c pushBack "rhs_uniform_vdv_emr_des";
_c pushBack "rhs_uniform_emr_patchless";
_c pushBack "rhs_uniform_vdv_emr";
_c pushBack "rhs_uniform_flora_patchless";
_c pushBack "rhs_uniform_flora_patchless_alt";
_c pushBack "rhs_uniform_flora";
_c pushBack "rhs_uniform_rva_flora";
_c pushBack "rhs_uniform_vdv_flora";
_c pushBack "rhs_uniform_vmf_flora";
_c pushBack "rhs_uniform_vmf_flora_subdued";
_c pushBack "rhs_uniform_gorka_r_g";
_c pushBack "rhs_uniform_gorka_r_g_gloves";
_c pushBack "rhs_uniform_gorka_r_y";
_c pushBack "rhs_uniform_gorka_r_y_gloves";
_c pushBack "rhs_uniform_gorka_1_a";
_c pushBack "rhs_uniform_gorka_1_b";
_c pushBack "rhs_uniform_mvd_izlom";
_c pushBack "rhs_uniform_klmk_oversuit";
/*_c pushBack "rhs_uniform_afghanka";
_c pushBack "rhs_uniform_afghanka_grey";
_c pushBack "rhs_uniform_afghanka_klmk";
_c pushBack "rhs_uniform_afghanka_moldovan_ttsko_blue";
_c pushBack "rhs_uniform_afghanka_moldovan_ttsko_cold";
_c pushBack "rhs_uniform_afghanka_moldovan_ttsko_desat";
_c pushBack "rhs_uniform_afghanka_moldovan_ttsko_hot";
_c pushBack "rhs_uniform_afghanka_spetsodezhda";
_c pushBack "rhs_uniform_afghanka_ttsko";
_c pushBack "rhs_uniform_afghanka_ttsko_2";
_c pushBack "rhs_uniform_afghanka_vsr_1";
_c pushBack "rhs_uniform_afghanka_vsr_2";
_c pushBack "rhs_uniform_afghanka_vsr_3";
_c pushBack "rhs_uniform_afghanka_wdl";
_c pushBack "rhs_uniform_afghanka_boots";
_c pushBack "rhs_uniform_afghanka_boots_moldovan_ttsko_cold";
_c pushBack "rhs_uniform_afghanka_boots_moldovan_ttsko_desat";
_c pushBack "rhs_uniform_afghanka_boots_moldovan_ttsko_hot";
_c pushBack "rhs_uniform_afghanka_boots_spetsodezhda";
_c pushBack "rhs_uniform_afghanka_boots_ttsko";
_c pushBack "rhs_uniform_afghanka_para";
_c pushBack "rhs_uniform_afghanka_para_ttsko";
_c pushBack "rhs_uniform_afghanka_para_ttsko_2";
_c pushBack "rhs_uniform_afghanka_para_vsr";
_c pushBack "rhs_uniform_afghanka_para_vsr_2";
_c pushBack "rhs_uniform_afghanka_winter";
_c pushBack "rhs_uniform_afghanka_winter_moldovan_ttsko";
_c pushBack "rhs_uniform_afghanka_winter_spetsodezhda";
_c pushBack "rhs_uniform_afghanka_winter_ttsko";
_c pushBack "rhs_uniform_afghanka_winter_vsr";
_c pushBack "rhs_uniform_afghanka_winter_vsr_2";
_c pushBack "rhs_uniform_afghanka_winter_vsr_3";
_c pushBack "rhs_uniform_afghanka_winter_boots";
_c pushBack "rhs_uniform_afghanka_winter_boots_moldovan_ttsko";
_c pushBack "rhs_uniform_afghanka_winter_boots_spetsodezhda";
_c pushBack "rhs_uniform_afghanka_winter_boots_ttsko";
_c pushBack "rhs_uniform_afghanka_winter_boots_vsr";
_c pushBack "rhs_uniform_afghanka_winter_boots_vsr_2";*/
_c pushBack "rhs_uniform_mflora_patchless";
_c pushBack "rhs_uniform_vdv_mflora";
_c pushBack "rhs_uniform_omon";
_c pushBack "rhs_uniform_vkpo";
_c pushBack "rhs_uniform_vkpo_alt";
_c pushBack "rhs_uniform_vkpo_gloves";
_c pushBack "rhs_uniform_vkpo_gloves_alt";
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

_c pushBack "rhs_6sh117_mg";
_c pushBack "rhs_6sh117_rifleman";
_c pushBack "rhs_6sh117_ar";
_c pushBack "rhs_6sh117_nco";
_c pushBack "rhs_6sh117_nco_azart";
_c pushBack "rhs_6sh117_svd";
_c pushBack "rhs_6sh117_val";
_c pushBack "rhs_6sh117_grn";
_c pushBack "rhs_6sh46";
_c pushBack "rhs_6sh92";
_c pushBack "rhs_6sh92_headset";
_c pushBack "rhs_6sh92_radio";
_c pushBack "rhs_6sh92_vog";
_c pushBack "rhs_6sh92_vog_headset";
_c pushBack "rhs_6sh92_digi";
_c pushBack "rhs_6sh92_digi_headset";
_c pushBack "rhs_6sh92_digi_radio";
_c pushBack "rhs_6sh92_digi_vog";
_c pushBack "rhs_6sh92_digi_vog_headset";
_c pushBack "rhs_6sh92_vsr";
_c pushBack "rhs_6sh92_vsr_headset";
_c pushBack "rhs_6sh92_vsr_radio";
_c pushBack "rhs_6sh92_vsr_vog";
_c pushBack "rhs_6sh92_vsr_vog_headset";

_c pushBack "rhs_belt_sks";
_c pushBack "rhs_belt_AK4";
_c pushBack "rhs_belt_AK4_back";
_c pushBack "rhs_belt_RPK";
_c pushBack "rhs_belt_AK_GL";
_c pushBack "rhs_belt_holster";
_c pushBack "rhs_belt_AK";
_c pushBack "rhs_belt_AK_back";
_c pushBack "rhs_belt_svd";
_c pushBack "rhs_chicom";
_c pushBack "rhs_chicom_khk";
_c pushBack "rhs_lifchik_NCO";
_c pushBack "rhs_lifchik_vog";
_c pushBack "rhs_lifchik";
_c pushBack "rhs_lifchik_light";
_c pushBack "rhs_vest_commander";
_c pushBack "rhs_gear_OFF";
_c pushBack "rhs_vest_pistol_holster";
_c pushBack "rhs_suspender_AK8_chestrig";
_c pushBack "rhs_suspender_AK";
_c pushBack "rhs_suspender_AK4";
_c pushBack "rhs_suspender_SKS";
_c pushBack "rhs_vydra_3m";

_c pushBack "rhs_6b2";
_c pushBack "rhs_6b2_AK";
_c pushBack "rhs_6b2_chicom";
_c pushBack "rhs_6b2_holster";
_c pushBack "rhs_6b2_lifchik";
_c pushBack "rhs_6b2_RPK";
_c pushBack "rhs_6b2_SVD";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpack																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_rpg_2";
_c pushBack "rhs_rpg_empty";
_c pushBack "rhs_rpg_6b2";
_c pushBack "rhs_rpg_6b3";
_c pushBack "rhs_sidor";
_c pushBack "rhs_d6_Parachute_backpack";
_c pushBack "rhs_medic_bag";
_c pushBack "rhs_r148";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "RHS_DShkM_Gun_Bag";
_c pushBack "RHS_DShkM_TripodHigh_Bag";
_c pushBack "RHS_DShkM_TripodLow_Bag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Headgear																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_6m2";
_c pushBack "rhs_6m2_1";
_c pushBack "rhs_altyn_novisor";
_c pushBack "rhs_altyn_novisor_bala";
_c pushBack "rhs_altyn_novisor_ess";
_c pushBack "rhs_altyn_novisor_ess_bala";
_c pushBack "rhs_altyn_visordown";
_c pushBack "rhs_altyn";
_c pushBack "rhs_altyn_bala";
_c pushBack "rhs_beanie_green";
_c pushBack "rhs_beanie";
_c pushBack "rhs_beret_mp2";
_c pushBack "rhs_beret_mp1";
_c pushBack "rhs_beret_mvd";
_c pushBack "rhs_beret_omon";
_c pushBack "rhs_beret_vdv3";
_c pushBack "rhs_beret_vdv1";
_c pushBack "rhs_beret_vdv_early";
_c pushBack "rhs_beret_vdv2";
_c pushBack "rhs_beret_milp";
_c pushBack "rhs_Booniehat_digi";
_c pushBack "rhs_Booniehat_flora";
_c pushBack "rhs_cossack_visor_cap";
_c pushBack "rhs_cossack_visor_cap_tan";
_c pushBack "rhs_cossack_papakha";
_c pushBack "rhs_fieldcap";
_c pushBack "rhs_fieldcap_helm_digi";
_c pushBack "rhs_fieldcap_helm_ml";
_c pushBack "rhs_fieldcap_helm";
_c pushBack "rhs_fieldcap_digi";
_c pushBack "rhs_fieldcap_digi2";
_c pushBack "rhs_fieldcap_izlom";
_c pushBack "rhs_fieldcap_m88";
_c pushBack "rhs_fieldcap_m88_back";
_c pushBack "rhs_fieldcap_m88_grey";
_c pushBack "rhs_fieldcap_m88_grey_back";
_c pushBack "rhs_fieldcap_m88_klmk";
_c pushBack "rhs_fieldcap_m88_klmk_back";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_blue";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_blue_back";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_cold";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_cold_back";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_desat";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_desat_back";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_hot";
_c pushBack "rhs_fieldcap_m88_moldovan_ttsko_hot_back";
_c pushBack "rhs_fieldcap_m88_ttsko_alt";
_c pushBack "rhs_fieldcap_m88_ttsko_alt_back";
_c pushBack "rhs_fieldcap_m88_ttsko_vdv";
_c pushBack "rhs_fieldcap_m88_ttsko_vdv_back";
_c pushBack "rhs_fieldcap_m88_ttsko";
_c pushBack "rhs_fieldcap_m88_ttsko_back";
_c pushBack "rhs_fieldcap_m88_vsr_2";
_c pushBack "rhs_fieldcap_m88_vsr_2_back";
_c pushBack "rhs_fieldcap_m88_vsr";
_c pushBack "rhs_fieldcap_m88_vsr_back";
_c pushBack "rhs_fieldcap_m88_woodland";
_c pushBack "rhs_fieldcap_m88_woodland_back";
_c pushBack "rhs_fieldcap_ml";
_c pushBack "rhs_fieldcap_early";
_c pushBack "rhs_fieldcap_khk";
_c pushBack "rhs_fieldcap_vsr";
_c pushBack "rhs_gssh18";
_c pushBack "rhs_headband";
_c pushBack "rhs_omon_cap";
_c pushBack "rhs_pilotka";
_c pushBack "rhs_ssh60";
_c pushBack "rhs_ssh68_2";
_c pushBack "rhs_stsh81";
_c pushBack "rhs_stsh81_butan";
_c pushBack "rhs_tsh4";
_c pushBack "rhs_tsh4_bala";
_c pushBack "rhs_tsh4_ess";
_c pushBack "rhs_tsh4_ess_bala";
_c pushBack "rhs_ushanka";
_c pushBack "rhs_vkpo_cap";
_c pushBack "rhs_vkpo_cap_alt";
_c pushBack "rhs_zsh7a_mike";
_c pushBack "rhs_zsh7a_mike_alt";
_c pushBack "rhs_zsh7a_mike_green";
_c pushBack "rhs_zsh7a_mike_green_alt";
_c pushBack "rhs_zsh7a";
_c pushBack "rhs_zsh7a_alt";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_6b26_green";
_c pushBack "rhs_6b26_bala_green";
_c pushBack "rhs_6b26_ess_green";
_c pushBack "rhs_6b26_ess_bala_green";
_c pushBack "rhs_6b26_digi";
_c pushBack "rhs_6b26_digi_bala";
_c pushBack "rhs_6b26_digi_ess";
_c pushBack "rhs_6b26_digi_ess_bala";
_c pushBack "rhs_6b26";
_c pushBack "rhs_6b26_bala";
_c pushBack "rhs_6b26_ess";
_c pushBack "rhs_6b26_ess_bala";
_c pushBack "rhs_6b27m_green";
_c pushBack "rhs_6b27m_green_bala";
_c pushBack "rhs_6b27m_green_ess";
_c pushBack "rhs_6b27m_green_ess_bala";
_c pushBack "rhs_6b27m_digi";
_c pushBack "rhs_6b27m_digi_bala";
_c pushBack "rhs_6b27m_digi_ess";
_c pushBack "rhs_6b27m_digi_ess_bala";
_c pushBack "rhs_6b27m";
_c pushBack "rhs_6b27m_bala";
_c pushBack "rhs_6b27m_ess";
_c pushBack "rhs_6b27m_ess_bala";
_c pushBack "rhs_6b27m_ml";
_c pushBack "rhs_6b27m_ml_bala";
_c pushBack "rhs_6b27m_ml_ess";
_c pushBack "rhs_6b27m_ML_ess_bala";
_c pushBack "rhs_6b28_green";
_c pushBack "rhs_6b28_green_bala";
_c pushBack "rhs_6b28_green_ess";
_c pushBack "rhs_6b28_green_ess_bala";
_c pushBack "rhs_6b28";
_c pushBack "rhs_6b28_bala";
_c pushBack "rhs_6b28_ess";
_c pushBack "rhs_6b28_ess_bala";
_c pushBack "rhs_6b28_flora";
_c pushBack "rhs_6b28_flora_bala";
_c pushBack "rhs_6b28_flora_ess";
_c pushBack "rhs_6b28_flora_ess_bala";
_c pushBack "rhs_6b47";
_c pushBack "rhs_6b47_bare";
_c pushBack "rhs_6b47_6m2_1";
_c pushBack "rhs_6b47_6m2";
_c pushBack "rhs_6b47_bala";
_c pushBack "rhs_6b47_bare_d";
_c pushBack "rhs_6b47_emr_2";
_c pushBack "rhs_6b47_emr_1";
_c pushBack "rhs_6b47_emr";
_c pushBack "rhs_6b47_6B50";
_c pushBack "rhs_6b47_ess";
_c pushBack "rhs_6b47_ess_bala";
_c pushBack "rhs_6b48";
_c pushBack "rhs_6b7_1m";
_c pushBack "rhs_6b7_1m_bala2";
_c pushBack "rhs_6b7_1m_bala1";
_c pushBack "rhs_6b7_1m_emr";
_c pushBack "rhs_6b7_1m_bala2_emr";
_c pushBack "rhs_6b7_1m_bala1_emr";
_c pushBack "rhs_6b7_1m_emr_ess";
_c pushBack "rhs_6b7_1m_emr_ess_bala";
_c pushBack "rhs_6b7_1m_ess";
_c pushBack "rhs_6b7_1m_ess_bala";
_c pushBack "rhs_6b7_1m_flora";
_c pushBack "rhs_6b7_1m_bala1_flora";
_c pushBack "rhs_6b7_1m_bala2_flora";
_c pushBack "rhs_6b7_1m_flora_ns3";
_c pushBack "rhs_6b7_1m_olive";
_c pushBack "rhs_6b7_1m_bala2_olive";
_c pushBack "rhs_6b7_1m_bala1_olive";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Items																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_facewear_6m2";
_c pushBack "rhs_facewear_6m2_1";
_c pushBack "rhs_balaclava";
_c pushBack "rhs_balaclava1_olive";
_c pushBack "rhs_scarf";

_c pushBack "rhs_6m2_nvg";
_c pushBack "rhs_6m2_1_nvg";

_c pushBack "rhs_tr8_periscope";
_c pushBack "rhs_tr8_periscope_pip";

_c pushBack "rhs_radio_R169P1";
_c pushBack "rhs_radio_R187P1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_pdu4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_1PN138";				//1PN138 Monocular Night Vision Device
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments 															//
//--------------------------------------------------------------------------------------------------------------------------//
//Optics
//AK 
_c pushBack"rhs_acc_rakursPM";			//1P76 Rakurs-PM RIS Collimator
_c pushBack"rhs_acc_1p63";				//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_ekp1";				//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_ekp8_02";			//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_nita";				//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_okp7_dovetail";		//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_pkas";				//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_1p87";				//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_ekp8_18";			//Collimator Sight<br />Magnification: 1x
_c pushBack"rhs_acc_okp7_picatinny";	//Collimator Sight<br />Magnification: 1x
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack"rhs_acc_2dpZenit";			//2DP Zenit LED Flashlight
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Level 1																	//
//--------------------------------------------------------------------------------------------------------------------------//
//													Weapons																	//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "rhs_weap_pb_6p9";

_c pushBack "rhs_weap_6p53";

_c pushBack "rhs_weap_pp2000_folded";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_18rnd_9x21mm_7N28";	//6p53
_c pushBack "rhs_18rnd_9x21mm_7N29";
_c pushBack "rhs_18rnd_9x21mm_7BT3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,18,(900*21)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_9x19mm_7n21_20";	//pp2000
_c pushBack "rhs_mag_9x19mm_7n31_20";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhs_mag_9x19mm_7n21_44";
_c pushBack "rhs_mag_9x19mm_7n31_44";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,44,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhs_acc_6p9_suppressor";	//6p9

_c pushBack "rhs_acc_rakursPM";			//pp2000
_c pushBack "rhs_acc_1p87";
_c pushBack "rhs_acc_dh520x56";
_c pushBack "rhs_acc_ekp8_18";
_c pushBack "rhs_acc_okp7_picatinny";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_pm63";

_c pushBack "rhs_weap_pp2000";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_30Rnd_762x39mm";			//pm63
_c pushBack "rhs_30Rnd_762x39mm_tracer";
_c pushBack "rhs_30Rnd_762x39mm_89";
_c pushBack "rhs_30Rnd_762x39mm_U";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG	 																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_pkm";

_c pushBack "rhs_weap_pkp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_100Rnd_762x54mmR";
_c pushBack "rhs_100Rnd_762x54mmR_green";
_c pushBack "rhs_100Rnd_762x54mmR_7N13";
_c pushBack "rhs_100Rnd_762x54mmR_7N26";
_c pushBack "rhs_100Rnd_762x54mmR_7BZ3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_svdp";
_c pushBack "rhs_weap_svdp_wd";
_c pushBack "rhs_weap_svdp_wd_npz";
_c pushBack "rhs_weap_svdp_npz";
_c pushBack "rhs_weap_svds";
_c pushBack "rhs_weap_svds_npz";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_10Rnd_762x54mmR_7N1";
_c pushBack "rhs_10Rnd_762x54mmR_7N14";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers 																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_rpg18";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_rpg18_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_6b23";
_c pushBack "rhs_6b23_6sh116_od";
_c pushBack "rhs_6b23_6sh116_vog_od";
_c pushBack "rhs_6b23_6sh92";
_c pushBack "rhs_6b23_6sh92_headset";
_c pushBack "rhs_6b23_6sh92_headset_mapcase";
_c pushBack "rhs_6b23_6sh92_radio";
_c pushBack "rhs_6b23_6sh92_vog";
_c pushBack "rhs_6b23_6sh92_vog_headset";
_c pushBack "rhs_6b23_crewofficer";
_c pushBack "rhs_6b23_crew";
_c pushBack "rhs_6b23_engineer";
_c pushBack "rhs_6b23_medic";
_c pushBack "rhs_6b23_rifleman";
_c pushBack "rhs_6b23_sniper";
_c pushBack "rhs_6b23_vydra_3m";
_c pushBack "rhs_6b23_digi";
_c pushBack "rhs_6b23_6sh116";
_c pushBack "rhs_6b23_6sh116_vog";
_c pushBack "rhs_6b23_digi_6sh92";
_c pushBack "rhs_6b23_digi_6sh92_spetsnaz2";
_c pushBack "rhs_6b23_digi_6sh92_headset";
_c pushBack "rhs_6b23_digi_6sh92_headset_spetsnaz";
_c pushBack "rhs_6b23_digi_6sh92_headset_mapcase";
_c pushBack "rhs_6b23_digi_6sh92_radio";
_c pushBack "rhs_6b23_digi_6sh92_Spetsnaz";
_c pushBack "rhs_6b23_digi_6sh92_vog";
_c pushBack "rhs_6b23_digi_6sh92_Vog_Spetsnaz";
_c pushBack "rhs_6b23_digi_6sh92_vog_headset";
_c pushBack "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz";
_c pushBack "rhs_6b23_digi_crewofficer";
_c pushBack "rhs_6b23_digi_crew";
_c pushBack "rhs_6b23_digi_engineer";
_c pushBack "rhs_6b23_digi_medic";
_c pushBack "rhs_6b23_digi_rifleman";
_c pushBack "rhs_6b23_digi_sniper";
_c pushBack "rhs_6b23_digi_vydra_3m";
_c pushBack "rhs_6b23_6sh116_flora";
_c pushBack "rhs_6b23_6sh116_vog_flora";
_c pushBack "rhs_6b23_6sh116_mixed";
_c pushBack "rhs_6b23_6sh116_vog_mixed";

_c pushBack "rhs_6b23_ML";
_c pushBack "rhs_6b23_ML_6sh92";
_c pushBack "rhs_6b23_ML_6sh92_headset";
_c pushBack "rhs_6b23_ML_6sh92_headset_mapcase";
_c pushBack "rhs_6b23_ML_6sh92_radio";
_c pushBack "rhs_6b23_ML_6sh92_vog";
_c pushBack "rhs_6b23_ML_6sh92_vog_headset";
_c pushBack "rhs_6b23_ML_crewofficer";
_c pushBack "rhs_6b23_ML_crew";
_c pushBack "rhs_6b23_ML_engineer";
_c pushBack "rhs_6b23_ML_medic";
_c pushBack "rhs_6b23_ML_rifleman";
_c pushBack "rhs_6b23_ML_sniper";
_c pushBack "rhs_6b23_ML_vydra_3m";

_c pushBack "rhs_6b3";
_c pushBack "rhs_6b3_holster";
_c pushBack "rhs_6b3_off";
_c pushBack "rhs_6b3_R148";
_c pushBack "rhs_6b3_AK";
_c pushBack "rhs_6b3_AK_2";
_c pushBack "rhs_6b3_AK_3";
_c pushBack "rhs_6b3_RPK";
_c pushBack "rhs_6b3_VOG";
_c pushBack "rhs_6b3_VOG_2";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpack																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_rd54";
_c pushBack "rhs_rd54_emr1";
_c pushBack "rhs_rd54_flora2";
_c pushBack "rhs_rd54_flora1";
_c pushBack "rhs_rd54_vest";
_c pushBack "rhs_rd54_vest_emr1";
_c pushBack "rhs_rd54_vest_flora2";
_c pushBack "rhs_rd54_vest_flora1";
_c pushBack "rhs_rk_sht_30_emr";
_c pushBack "rhs_rk_sht_30_emr_engineer_empty";
_c pushBack "rhs_rk_sht_30_olive";
_c pushBack "rhs_rk_sht_30_olive_engineer_empty";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "RHS_Kord_Tripod_Bag";
_c pushBack "RHS_Kord_Gun_Bag";
_c pushBack "RHS_Podnos_Bipod_Bag";
_c pushBack "RHS_Podnos_Gun_Bag";
_c pushBack "RHS_AGS30_Tripod_Bag";
_c pushBack "RHS_AGS30_Gun_Bag";
_c pushBack "RHS_SPG9_Gun_Bag";
_c pushBack "RHS_SPG9_Tripod_Bag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments 															//
//--------------------------------------------------------------------------------------------------------------------------//
//Optics
//AK 
_c pushBack"rhs_acc_1p78";				//Optical Sight<br />Magnification: 2.8x
_c pushBack"rhs_acc_pgo7v";				//Optical Sight<br />Magnification: 2.7x
_c pushBack"rhs_acc_pgo7v2";			//Optical Sight<br />Magnification: 2.7x
_c pushBack"rhs_acc_pgo7v3";			//Optical Sight<br />Magnification: 2.7x
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Level 2																	//
//--------------------------------------------------------------------------------------------------------------------------//
//													Weapons																	//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "rhs_weap_pya";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_mag_9x19_17";
_c pushBack "rhs_mag_9x19_7n31_17";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,17,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_weap_ak103";
_c pushBack "rhs_weap_ak103_1";
_c pushBack "rhs_weap_ak103_2";
_c pushBack "rhs_weap_ak103_gp25";
_c pushBack "rhs_weap_ak103_zenitco01";
_c pushBack "rhs_weap_ak103_1_npz";
_c pushBack "rhs_weap_ak103_2_npz";
_c pushBack "rhs_weap_ak103_npz";
_c pushBack "rhs_weap_ak103_gp25_npz";
_c pushBack "rhs_weap_ak103_zenitco01_b33";
_c pushBack "rhs_weap_ak104";
_c pushBack "rhs_weap_ak104_npz";
_c pushBack "rhs_weap_ak104_zenitco01";
_c pushBack "rhs_weap_ak104_zenitco01_b33";
_c pushBack "rhs_weap_ak105_npz";
_c pushBack "rhs_weap_ak105_zenitco01_b33";
_c pushBack "rhs_weap_ak105";
_c pushBack "rhs_weap_ak105_zenitco01";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_30Rnd_545x39_7N10_plum_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_desert_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_camo_AK";
_c pushBack "rhs_30Rnd_545x39_7N6_AK";
_c pushBack "rhs_30Rnd_545x39_7N6_green_AK";
_c pushBack "rhs_30Rnd_545x39_AK_green";
_c pushBack "rhs_30Rnd_545x39_AK_plum_green";
_c pushBack "rhs_30Rnd_545x39_7U1_AK";
_c pushBack "rhs_30Rnd_545x39_7N6M_green_AK";
_c pushBack "rhs_30Rnd_545x39_7N6M_plum_AK";
_c pushBack "rhs_30Rnd_545x39_7N22_AK";
_c pushBack "rhs_30Rnd_545x39_7N22_plum_AK";
_c pushBack "rhs_30Rnd_545x39_7N22_camo_AK";
_c pushBack "rhs_30Rnd_545x39_7N22_desert_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_2mag_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_2mag_plum_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_2mag_camo_AK";
_c pushBack "rhs_30Rnd_545x39_7N10_2mag_desert_AK";
_c pushBack "rhs_60Rnd_545X39_7N10_AK";
_c pushBack "rhs_60Rnd_545X39_7N22_AK";
_c pushBack "rhs_60Rnd_545X39_AK_Green";
_c pushBack "rhs_60Rnd_545X39_7U1_AK";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_asval";
_c pushBack "rhs_weap_asval_grip";
_c pushBack "rhs_weap_asval_grip_npz";
_c pushBack "rhs_weap_asval_npz";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_vss";
_c pushBack "rhs_weap_vss_grip";
_c pushBack "rhs_weap_vss_grip_npz";
_c pushBack "rhs_weap_vss_npz";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_10rnd_9x39mm_SP5";
_c pushBack "rhs_10rnd_9x39mm_SP6";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhs_20rnd_9x39mm_SP5";
_c pushBack "rhs_20rnd_9x39mm_SP6";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_t5000";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_5Rnd_338lapua_t5000";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments 															//
//--------------------------------------------------------------------------------------------------------------------------//
//Optics
//AK 
_c pushBack"rhs_acc_1pn93_2";			//Optical Night Sight<br />Magnification: 2.7x
_c pushBack"rhs_acc_1pn34";				//Night vision scope<br />Magnification: 3.5x
_c pushBack"rhs_acc_1pn93_1";			//Optical Night Sight<br />Magnification: 4x
_c pushBack"rhs_acc_1p29";				//Optical Sight<br />Magnification: 4x
_c pushBack"rhs_acc_pso1m2";			//Optical Sniper Sight<br />Magnification: 4x
_c pushBack"rhs_acc_pso1m21";			//Optical Sniper Sight<br />Magnification: 4x
_c pushBack"rhs_acc_dh520x56";			//Russian sniper scope<br />Magnification: 5-20x
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};


//attatchments
//AK
_c pushBack"rhs_acc_perst1ik";			//Emits light visible in the image intensification mode (night vision).

//muzzles
//AK
_c pushBack "rhs_acc_ak5";
_c pushBack "rhs_acc_dtk";
_c pushBack "rhs_acc_dtk1";
_c pushBack "rhs_acc_dtk2";
_c pushBack "rhs_acc_dtk3";
_c pushBack "rhs_acc_dtk4long";
_c pushBack "rhs_acc_dtk4screws";
_c pushBack "rhs_acc_pbs1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers 																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_rpg26";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_rpg26_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_weap_rshg2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_rshg2_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "rhs_weap_igla";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_mag_9k38_rocket";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_6b13_Flora";
_c pushBack "rhs_6b13_Flora_6sh92";
_c pushBack "rhs_6b13_Flora_6sh92_headset_mapcase";
_c pushBack "rhs_6b13_Flora_6sh92_radio";
_c pushBack "rhs_6b13_Flora_6sh92_vog";
_c pushBack "rhs_6b13_Flora_crewofficer";
_c pushBack "rhs_6b13_EMR";
_c pushBack "rhs_6b13_EMR_6sh92";
_c pushBack "rhs_6b13_EMR_6sh92_radio";
_c pushBack "rhs_6b13_EMR_6sh92_vog";
_c pushBack "rhs_6b13_EMR_6sh92_headset_mapcase";
_c pushBack "rhs_6b13";
_c pushBack "rhs_6b13_6sh92";
_c pushBack "rhs_6b13_6sh92_headset_mapcase";
_c pushBack "rhs_6b13_6sh92_radio";
_c pushBack "rhs_6b13_6sh92_vog";
_c pushBack "rhs_6b13_crewofficer";

_c pushBack "rhs_6b43";
_c pushBack "rhs_6b45";
_c pushBack "rhs_6b45_desert";
_c pushBack "rhs_6b45_holster";
_c pushBack "rhs_6b45_light";
_c pushBack "rhs_6b45_mg";
_c pushBack "rhs_6b45_off";
_c pushBack "rhs_6b45_rifleman";
_c pushBack "rhs_6b45_rifleman_2";
_c pushBack "rhs_6b45_grn";

_c pushBack "rhs_6b5_khaki";
_c pushBack "rhs_6b5_rifleman_khaki";
_c pushBack "rhs_6b5_medic_khaki";
_c pushBack "rhs_6b5_officer_khaki";
_c pushBack "rhs_6b5_sniper_khaki";
_c pushBack "rhs_6b5_spetsodezhda";
_c pushBack "rhs_6b5_rifleman_spetsodezhda";
_c pushBack "rhs_6b5_medic_spetsodezhda";
_c pushBack "rhs_6b5_officer_spetsodezhda";
_c pushBack "rhs_6b5_sniper_spetsodezhda";
_c pushBack "rhs_6b5";
_c pushBack "rhs_6b5_rifleman";
_c pushBack "rhs_6b5_medic";
_c pushBack "rhs_6b5_officer";
_c pushBack "rhs_6b5_sniper";
_c pushBack "rhs_6b5_ttsko";
_c pushBack "rhs_6b5_rifleman_ttsko";
_c pushBack "rhs_6b5_medic_ttsko";
_c pushBack "rhs_6b5_officer_ttsko";
_c pushBack "rhs_6b5_sniper_ttsko";
_c pushBack "rhs_6b5_vsr";
_c pushBack "rhs_6b5_rifleman_vsr";
_c pushBack "rhs_6b5_medic_vsr";
_c pushBack "rhs_6b5_officer_vsr";
_c pushBack "rhs_6b5_sniper_vsr";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpack																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_tortila_black";
_c pushBack "rhs_tortila_emr";
_c pushBack "rhs_tortila_grey";
_c pushBack "rhs_tortila_khaki";
_c pushBack "rhs_tortila_olive";
_c pushBack "rhs_assault_umbts";
_c pushBack "rhs_assault_umbts_engineer_empty";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "RHS_Metis_Gun_Bag";
_c pushBack "RHS_Metis_Tripod_Bag";
_c pushBack "RHS_Kornet_Gun_Bag";
_c pushBack "RHS_Kornet_Tripod_Bag";
_c pushBack "RHS_NSV_Tripod_Bag";
_c pushBack "RHS_NSV_Gun_Bag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_CUP_SOV.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_CUP_SOV.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
