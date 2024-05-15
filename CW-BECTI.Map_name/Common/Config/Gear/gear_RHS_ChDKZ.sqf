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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_CHDKZ_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

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

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

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
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};


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


_c pushBack "rhs_uniform_gorka_r_y";
_c pushBack "rhs_uniform_gorka_r_g";
_c pushBack "rhs_uniform_mvd_izlom";
_c pushBack "rhsgref_uniform_specter";
_c pushBack "rhsgref_uniform_reed";
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

_c pushBack "rhs_6sh46";
_c pushBack "rhs_6sh92_digi";
_c pushBack "V_TacVest_blk";
_c pushBack "rhs_6sh92_digi_vog";
_c pushBack "V_Chestrig_rgr";
_c pushBack "V_TacVest_oli";
_c pushBack "rhs_6sh92";
_c pushBack "rhs_6sh92_digi_radio";
_c pushBack "V_BandollierB_rgr";
_c pushBack "rhs_vest_pistol_holster";
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

_c pushBack "rhsgref_ins_pack_demo";
_c pushBack "rhsgref_ins_pack_saboteur";
_c pushBack "rhsgref_cdf_backpack_medic";
_c pushBack "rhs_sidorMG";
_c pushBack "rhs_rpg_vl";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Headgear																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "H_Booniehat_oli";
_c pushBack "rhs_ssh68";
_c pushBack "rhs_beanie";
_c pushBack "rhsgref_bcap_specter";
_c pushBack "rhs_beanie_green";
_c pushBack "H_Cap_headphones";
_c pushBack "rhsgref_patrolcap_specter";
_c pushBack "H_Booniehat_tan";
_c pushBack "H_Bandanna_gry";
_c pushBack "rhs_tsh4";
_c pushBack "H_Beret_blk";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Items																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "G_Aviator";
_c pushBack "G_Bandanna_blk";
_c pushBack "G_Sport_Greenblack";
_c pushBack "rhs_balaclava";
_c pushBack "rhs_balaclava1_olive";
_c pushBack "G_Bandanna_khk";
_c pushBack "G_Sport_Blackyellow";
_c pushBack "rhs_balaclava1_olive";
_c pushBack "G_Balaclava_blk";
_c pushBack "G_Squares";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

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

_c pushBack "rhsusf_acc_EOTECH";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_M2A1";						//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_eotech_552";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_eotech_552_d";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_eotech_552_wd";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_compm4";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_mrds";						//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_mrds_fwd";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_mrds_c";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_mrds_fwd_c";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RM05";						//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RM05_fwd";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RX01_NoFilter";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RX01";						//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RX01_NoFilter_tan";			//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_RX01_tan";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_T1_high";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_T1_low";					//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_T1_low_fwd";				//Collimator Sight<br />Magnification: 1x
_c pushBack "rhsusf_acc_eotech_xps3";				//Collimator Sight<br />Magnification: 1x
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

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_m38";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.75] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhsgref_5Rnd_762x54_m38";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													MG	 																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_pkm";

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

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments 															//
//--------------------------------------------------------------------------------------------------------------------------//
//Optics
//AK 
_c pushBack"rhs_acc_1p78";				//Optical Sight<br />Magnification: 2.8x
_c pushBack"rhs_acc_pgo7v";				//Optical Sight<br />Magnification: 2.7x
_c pushBack"rhs_acc_pgo7v2";			//Optical Sight<br />Magnification: 2.7x
_c pushBack"rhs_acc_pgo7v3";			//Optical Sight<br />Magnification: 2.7x

_c pushBack "rhsusf_acc_ELCAN";						//M145 MGO
_c pushBack "rhsusf_acc_ELCAN_ard";					//M145 MGO
_c pushBack "rhsusf_acc_g33_T1";					//Magnifier<br />Magnification: 4x
_c pushBack "rhsusf_acc_g33_xps3";					//Magnifier<br />Magnification: 4x
_c pushBack "rhsusf_acc_g33_xps3_tan";				//Magnifier<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG2_USMC";				//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG3_USMC";				//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG_USMC";					//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG";						//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG2";						//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG3";						//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG_anpvs27";				//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG_RMR";					//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG_d";					//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_ACOG_wd";					//Rifle Combat Optics<br />Magnification: 4x
_c pushBack "rhsusf_acc_su230";						//5.56 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230_c";					//5.56 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230_mrds";				//5.56 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230_mrds_c";				//5.56 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230a";					//7.62 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230a_c";					//7.62 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230a_mrds";				//7.62 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_su230a_mrds_c";				//7.62 Dual role Combat Sight (4x/1x)
_c pushBack "rhsusf_acc_premier_low";				//Mk. 4 M3
_c pushBack "rhsusf_acc_premier_anpvs27";			//Mk. 4 M3
_c pushBack "rhsusf_acc_premier";					//Mk. 4 M3
_c pushBack "rhsusf_acc_premier_mrds";				//Mk. 4 M3
_c pushBack "rhsusf_acc_LEUPOLDMK4_2";				//Mk. 4 M3
_c pushBack "rhsusf_acc_LEUPOLDMK4_2_d";			//Mk. 4 M3
_c pushBack "rhsusf_acc_LEUPOLDMK4_2_mrds";			//Mk. 4 M3
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//light/laser
_c pushBack "rhsusf_acc_anpeq15_wmx";				//IR Laser. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq15_wmx_light";			//Weapon mounted light. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq15";					//IR Laser. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq15_light";				//Weapon mounted light. Press CTRL+C (next CM key) to change IR/Light mode>
_c pushBack "rhsusf_acc_anpeq15_bk";				//IR Laser. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq15_bk_light";			//Weapon mounted light. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq16a";					//IR Laser. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq16a_light";			//Weapon mounted light. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq16a_top";				//IR Laser. Press CTRL+C (next CM key) to change IR/Light mode
_c pushBack "rhsusf_acc_anpeq16a_light_top";		//Weapon mounted light. Press CTRL+C (next CM key) to change IR/Light mode
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Level 2																	//
//--------------------------------------------------------------------------------------------------------------------------//
//													Weapons																	//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

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

_c pushBack "rhsusf_acc_M8541";						//Magnification: 3-12x
_c pushBack "rhsusf_acc_M8541_d";					//Magnification: 3-12x
_c pushBack "rhsusf_acc_M8541_mrds";				//Magnification: 3-12x
_c pushBack "rhsusf_acc_M8541_wd";					//Magnification: 3-12x
_c pushBack "rhsusf_acc_nxs_3515x50_md";			//Reticle: Second focal plane mildot<br />Magnification: 3.5-15x
_c pushBack "rhsusf_acc_nxs_3515x50f1_h58";			//Reticle: First focal plane H58<br />Magnification: 3.5-15x
_c pushBack "rhsusf_acc_nxs_3515x50f1_md";			//Reticle: First focal plane mildot<br />Magnification: 3.5-15x
_c pushBack "rhsusf_acc_nxs_3515x50f1_h58_sun";		//Reticle: First focal plane H58<br />Magnification: 3.5-15x
_c pushBack "rhsusf_acc_nxs_3515x50f1_md_sun";		//Reticle: First focal plane mildot<br />Magnification: 3.5-15x
_c pushBack "rhsusf_acc_nxs_5522x56_md";			//Reticle: Second focal plane mildot<br />Magnification: 5.5-22x
_c pushBack "rhsusf_acc_nxs_5522x56_md_sun";		//Reticle: Second focal plane mildot<br />Magnification: 5.5-22x
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

_c pushBack "rhsusf_acc_nt4_black";
_c pushBack "rhsusf_acc_nt4_tan";
_c pushBack "rhsusf_acc_rotex5_grey";
_c pushBack "rhsusf_acc_rotex5_tan";
_c pushBack "rhsusf_acc_SF3P556";
_c pushBack "rhsusf_acc_SFMB556";
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

_c pushBack "rhs_weap_igla";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_mag_9k38_rocket";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

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
