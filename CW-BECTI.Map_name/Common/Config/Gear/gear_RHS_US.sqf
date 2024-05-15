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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "rhs_mag_m18_green";
_c pushBack "rhs_mag_m18_purple";
_c pushBack "rhs_mag_m18_red";
_c pushBack "rhs_mag_m18_yellow";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_an_m14_th3";
_c pushBack "rhs_mag_an_m8hc";
_c pushBack "rhs_mag_m67";
_c pushBack "rhs_mag_m69";
_c pushBack "rhs_mag_m7a3_cs";
_c pushBack "rhs_mag_mk84";
_c pushBack "rhs_mag_mk3a2";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhsusf_mine_m14_mag";
_c pushBack "rhsusf_mine_m49a1_10m_mag";
_c pushBack "rhsusf_mine_m49a1_3m_mag";
_c pushBack "rhsusf_mine_m49a1_6m_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_m112_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_m112x4_mag";
_c pushBack "rhs_mine_M19_mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Sidearmes																//
//--------------------------------------------------------------------------------------------------------------------------//


_c pushBack "rhsusf_weap_m1911a1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.75] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhsusf_mag_7x45acp_MHP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,7,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_weap_m32";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_mag_6Rnd_M441_HE";
_c pushBack "rhsusf_mag_6Rnd_M433_HEDP";
_c pushBack "rhsusf_mag_6Rnd_M397_HET";
_c pushBack "rhsusf_mag_6Rnd_M576_Buckshot";
_c pushBack "rhsusf_mag_6Rnd_m4009";
_c pushBack "rhsusf_mag_6Rnd_M583A1_white";
_c pushBack "rhsusf_mag_6Rnd_m661_green";
_c pushBack "rhsusf_mag_6Rnd_m662_red";
_c pushBack "rhsusf_mag_6Rnd_M713_red";
_c pushBack "rhsusf_mag_6Rnd_M714_white";
_c pushBack "rhsusf_mag_6Rnd_M715_green";
_c pushBack "rhsusf_mag_6Rnd_M716_yellow";
_c pushBack "rhsusf_mag_6Rnd_M781_Practice";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_M320";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhs_mag_M441_HE";
_c pushBack "rhs_mag_M433_HEDP";
_c pushBack "rhs_mag_M397_HET";
_c pushBack "rhs_mag_m576";
_c pushBack "rhs_mag_m4009";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_M583A1_white";
_c pushBack "rhs_mag_m661_green";
_c pushBack "rhs_mag_m662_red";
_c pushBack "rhs_mag_M585_white_cluster";
_c pushBack "rhs_mag_M663_green_cluster";
_c pushBack "rhs_mag_M664_red_cluster";
_c pushBack "rhs_mag_m713_Red";
_c pushBack "rhs_mag_m714_White";
_c pushBack "rhs_mag_m715_Green";
_c pushBack "rhs_mag_m716_yellow";
_c pushBack "rhs_mag_M781_Practice";
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
_c pushBack "rhs_weap_m16a4";
_c pushBack "rhs_weap_m16a4_carryhandle";
_c pushBack "rhs_weap_m16a4_carryhandle_M203";
_c pushBack "rhs_weap_m16a4_imod";
_c pushBack "rhs_weap_m16a4_imod_M203";

_c pushBack "rhs_weap_m4";
_c pushBack "rhs_weap_m4_carryhandle";
_c pushBack "rhs_weap_m4_carryhandle_m203";
_c pushBack "rhs_weap_m4_carryhandle_m203S";
_c pushBack "rhs_weap_m4_carryhandle_mstock";
_c pushBack "rhs_weap_m4_m203";
_c pushBack "rhs_weap_m4_m203S";
_c pushBack "rhs_weap_m4_m320";
_c pushBack "rhs_weap_m4_mstock";
_c pushBack "rhs_weap_m4a1_carryhandle";
_c pushBack "rhs_weap_m4a1_carryhandle_m203";
_c pushBack "rhs_weap_m4a1_carryhandle_m203S";
_c pushBack "rhs_weap_m4a1_carryhandle_mstock";
_c pushBack "rhs_weap_m4a1_blockII";
_c pushBack "rhs_weap_m4a1_blockII_bk";
_c pushBack "rhs_weap_m4a1_blockII_M203_bk";
_c pushBack "rhs_weap_m4a1_blockII_KAC_bk";
_c pushBack "rhs_weap_m4a1_blockII_d";
_c pushBack "rhs_weap_m4a1_blockII_M203_d";
_c pushBack "rhs_weap_m4a1_blockII_KAC_d";
_c pushBack "rhs_weap_m4a1_blockII_M203";
_c pushBack "rhs_weap_m4a1_blockII_KAC";
_c pushBack "rhs_weap_m4a1_blockII_wd";
_c pushBack "rhs_weap_m4a1_blockII_M203_wd";
_c pushBack "rhs_weap_m4a1_blockII_KAC_wd";
_c pushBack "rhs_weap_m4a1";
_c pushBack "rhs_weap_m4a1_d";
_c pushBack "rhs_weap_m4a1_m203s_d";
_c pushBack "rhs_weap_m4a1_d_mstock";
_c pushBack "rhs_weap_m4a1_m203";
_c pushBack "rhs_weap_m4a1_m203s";
_c pushBack "rhs_weap_m4a1_m320";
_c pushBack "rhs_weap_m4a1_mstock";
_c pushBack "rhs_weap_m4a1_wd";
_c pushBack "rhs_weap_m4a1_m203s_wd";
_c pushBack "rhs_weap_m4a1_wd_mstock";

_c pushBack "rhs_weap_m27iar";
_c pushBack "rhs_weap_m27iar_grip";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_Mk262_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_M193_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M200_Stanag";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag_Pull_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855_Stanag_Ranger_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_SCAR";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_SCAR_Pull";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_SCAR_Ranger";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_PMAG";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855_PMAG";
_c pushBack "rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_PMAG";
_c pushBack "rhs_mag_30Rnd_556x45_Mk262_PMAG";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";
_c pushBack "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_M855_PMAG_Tan";
_c pushBack "rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red";
_c pushBack "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan";
_c pushBack "rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_weap_m14";
_c pushBack "rhs_weap_m14_d";
_c pushBack "rhs_weap_m14_fiberglass";
_c pushBack "rhs_weap_m14_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_M136";
_c pushBack "rhs_weap_M136_hedp";
_c pushBack "rhs_weap_M136_hp";

_c pushBack "rhs_weap_m72a7";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_uniform_abu";
_c pushBack "rhs_uniform_acu_ocp";
_c pushBack "rhs_uniform_acu_oefcp";
_c pushBack "rhs_uniform_acu_ucpd";
_c pushBack "rhs_uniform_acu_ucp";
_c pushBack "rhs_uniform_acu_ucp2";
_c pushBack "rhs_uniform_bdu_erdl";
_c pushBack "rhs_uniform_cu_ocp";
_c pushBack "rhs_uniform_cu_ocp_101st";
_c pushBack "rhs_uniform_cu_ocp_10th";
_c pushBack "rhs_uniform_cu_ocp_1stcav";
_c pushBack "rhs_uniform_cu_ocp_82nd";
_c pushBack "rhs_uniform_cu_ucp";
_c pushBack "rhs_uniform_cu_ucp_101st";
_c pushBack "rhs_uniform_cu_ucp_10th";
_c pushBack "rhs_uniform_cu_ucp_1stcav";
_c pushBack "rhs_uniform_cu_ucp_82nd";
_c pushBack "rhs_uniform_FROG01_d";
_c pushBack "rhs_uniform_FROG01_wd";
_c pushBack "rhs_uniform_g3_aor2";
_c pushBack "rhs_uniform_g3_blk";
_c pushBack "rhs_uniform_g3_m81";
_c pushBack "rhs_uniform_g3_mc";
_c pushBack "rhs_uniform_g3_rgr";
_c pushBack "rhs_uniform_g3_tan";
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

_c pushBack "rhsusf_plateframe_sapi";
_c pushBack "rhsusf_plateframe_grenadier";
_c pushBack "rhsusf_plateframe_light";
_c pushBack "rhsusf_plateframe_machinegunner";
_c pushBack "rhsusf_plateframe_marksman";
_c pushBack "rhsusf_plateframe_medic";
_c pushBack "rhsusf_plateframe_rifleman";
_c pushBack "rhsusf_plateframe_teamleader";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_iotv_ocp_Grenadier";
_c pushBack "rhsusf_iotv_ucp_Grenadier";
_c pushBack "rhsusf_iotv_ocp_Medic";
_c pushBack "rhsusf_iotv_ucp_Medic";
_c pushBack "rhsusf_iotv_ocp";
_c pushBack "rhsusf_iotv_ocp_Repair";
_c pushBack "rhsusf_iotv_ucp_Repair";
_c pushBack "rhsusf_iotv_ocp_Rifleman";
_c pushBack "rhsusf_iotv_ucp_Rifleman";
_c pushBack "rhsusf_iotv_ocp_SAW";
_c pushBack "rhsusf_iotv_ucp_SAW";
_c pushBack "rhsusf_iotv_ocp_Squadleader";
_c pushBack "rhsusf_iotv_ucp_Squadleader";
_c pushBack "rhsusf_iotv_ocp_Teamleader";
_c pushBack "rhsusf_iotv_ucp_Teamleader";
_c pushBack "rhsusf_iotv_ucp";
_c pushBack "rhsusf_mbav";
_c pushBack "rhsusf_mbav_grenadier";
_c pushBack "rhsusf_mbav_light";
_c pushBack "rhsusf_mbav_mg";
_c pushBack "rhsusf_mbav_medic";
_c pushBack "rhsusf_mbav_rifleman";
_c pushBack "rhsusf_spc";
_c pushBack "rhsusf_spc_corpsman";
_c pushBack "rhsusf_spc_crewman";
_c pushBack "rhsusf_spc_iar";
_c pushBack "rhsusf_spc_light";
_c pushBack "rhsusf_spc_mg";
_c pushBack "rhsusf_spc_marksman";
_c pushBack "rhsusf_spc_patchless";
_c pushBack "rhsusf_spc_patchless_radio";
_c pushBack "rhsusf_spc_rifleman";
_c pushBack "rhsusf_spc_sniper";
_c pushBack "rhsusf_spc_squadleader";
_c pushBack "rhsusf_spc_teamleader";
_c pushBack "rhsusf_spcs_ocp_crewman";
_c pushBack "rhsusf_spcs_ucp_crewman";
_c pushBack "rhsusf_spcs_ocp_grenadier";
_c pushBack "rhsusf_spcs_ucp_grenadier";
_c pushBack "rhsusf_spcs_ocp_machinegunner";
_c pushBack "rhsusf_spcs_ucp_machinegunner";
_c pushBack "rhsusf_spcs_ocp_medic";
_c pushBack "rhsusf_spcs_ucp_medic";
_c pushBack "rhsusf_spcs_ocp";
_c pushBack "rhsusf_spcs_ocp_rifleman_alt";
_c pushBack "rhsusf_spcs_ucp_rifleman_alt";
_c pushBack "rhsusf_spcs_ocp_rifleman";
_c pushBack "rhsusf_spcs_ucp_rifleman";
_c pushBack "rhsusf_spcs_ocp_saw";
_c pushBack "rhsusf_spcs_ucp_saw";
_c pushBack "rhsusf_spcs_ocp_sniper";
_c pushBack "rhsusf_spcs_ucp_sniper";
_c pushBack "rhsusf_spcs_ocp_squadleader";
_c pushBack "rhsusf_spcs_ucp_squadleader";
_c pushBack "rhsusf_spcs_ocp_teamleader_alt";
_c pushBack "rhsusf_spcs_ucp_teamleader_alt";
_c pushBack "rhsusf_spcs_ocp_teamleader";
_c pushBack "rhsusf_spcs_ucp_teamleader";
_c pushBack "rhsusf_spcs_ucp";
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

_c pushBack "rhsusf_assault_eagleaiii_coy";
_c pushBack "B_rhsusf_B_BACKPACK";
_c pushBack "rhsusf_assault_eagleaiii_ocp";
_c pushBack "rhsusf_assault_eagleaiii_ucp";
_c pushBack "rhsusf_eject_Parachute_backpack";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "RHS_M2_Gun_Bag";
_c pushBack "RHS_M2_Tripod_Bag";
_c pushBack "rhs_M252_Gun_Bag";
_c pushBack "rhs_M252_Bipod_Bag";
_c pushBack "RHS_M2_MiniTripod_Bag";
_c pushBack "RHS_Mk19_Gun_Bag";
_c pushBack "RHS_Mk19_Tripod_Bag";
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

_c pushBack "rhs_Booniehat_m81";
_c pushBack "rhs_booniehat2_marpatd";
_c pushBack "rhs_booniehat2_marpatwd";
_c pushBack "rhs_Booniehat_ocp";
_c pushBack "rhs_Booniehat_ucp";
_c pushBack "rhsusf_Bowman";
_c pushBack "rhsusf_bowman_cap";
_c pushBack "rhs_xmas_antlers";
_c pushBack "rhsusf_patrolcap_ocp";
_c pushBack "rhsusf_patrolcap_ucp";
_c pushBack "rhsusf_protech_helmet";
_c pushBack "rhsusf_protech_helmet_ess";
_c pushBack "rhsusf_protech_helmet_rhino";
_c pushBack "rhsusf_protech_helmet_rhino_ess";
_c pushBack "rhs_8point_marpatd";
_c pushBack "rhs_8point_marpatwd";
_c pushBack "RHS_jetpilot_usaf";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_ach_bare";
_c pushBack "rhsusf_ach_bare_des";
_c pushBack "rhsusf_ach_bare_des_ess";
_c pushBack "rhsusf_ach_bare_des_headset";
_c pushBack "rhsusf_ach_bare_des_headset_ess";
_c pushBack "rhsusf_ach_bare_ess";
_c pushBack "rhsusf_ach_bare_headset";
_c pushBack "rhsusf_ach_bare_headset_ess";
_c pushBack "rhsusf_ach_bare_semi";
_c pushBack "rhsusf_ach_bare_semi_ess";
_c pushBack "rhsusf_ach_bare_semi_headset";
_c pushBack "rhsusf_ach_bare_semi_headset_ess";
_c pushBack "rhsusf_ach_bare_tan";
_c pushBack "rhsusf_ach_bare_tan_ess";
_c pushBack "rhsusf_ach_bare_tan_headset";
_c pushBack "rhsusf_ach_bare_tan_headset_ess";
_c pushBack "rhsusf_ach_bare_wood";
_c pushBack "rhsusf_ach_bare_wood_ess";
_c pushBack "rhsusf_ach_bare_wood_headset";
_c pushBack "rhsusf_ach_bare_wood_headset_ess";
_c pushBack "rhsusf_ach_helmet_DCU";
_c pushBack "rhsusf_ach_helmet_DCU_early";
_c pushBack "rhsusf_ach_helmet_DCU_early_rhino";
_c pushBack "rhsusf_ach_helmet_M81";
_c pushBack "rhsusf_ach_helmet_ocp";
_c pushBack "rhsusf_ach_helmet_ocp_alt";
_c pushBack "rhsusf_ach_helmet_ESS_ocp";
_c pushBack "rhsusf_ach_helmet_ESS_ocp_alt";
_c pushBack "rhsusf_ach_helmet_headset_ocp";
_c pushBack "rhsusf_ach_helmet_headset_ocp_alt";
_c pushBack "rhsusf_ach_helmet_headset_ess_ocp";
_c pushBack "rhsusf_ach_helmet_headset_ess_ocp_alt";
_c pushBack "rhsusf_ach_helmet_camo_ocp";
_c pushBack "rhsusf_ach_helmet_ocp_norotos";
_c pushBack "rhsusf_ach_helmet_ucp";
_c pushBack "rhsusf_ach_helmet_ucp_alt";
_c pushBack "rhsusf_ach_helmet_ESS_ucp";
_c pushBack "rhsusf_ach_helmet_ESS_ucp_alt";
_c pushBack "rhsusf_ach_helmet_headset_ucp";
_c pushBack "rhsusf_ach_helmet_headset_ucp_alt";
_c pushBack "rhsusf_ach_helmet_headset_ess_ucp";
_c pushBack "rhsusf_ach_helmet_headset_ess_ucp_alt";
_c pushBack "rhsusf_ach_helmet_ucp_norotos";
_c pushBack "rhsusf_cvc_green_helmet";
_c pushBack "rhsusf_cvc_green_alt_helmet";
_c pushBack "rhsusf_cvc_green_ess";
_c pushBack "rhsusf_cvc_helmet";
_c pushBack "rhsusf_cvc_alt_helmet";
_c pushBack "rhsusf_cvc_ess";
_c pushBack "rhsusf_opscore_aor1";
_c pushBack "rhsusf_opscore_aor1_pelt";
_c pushBack "rhsusf_opscore_aor1_pelt_nsw";
_c pushBack "rhsusf_opscore_aor2";
_c pushBack "rhsusf_opscore_aor2_pelt";
_c pushBack "rhsusf_opscore_aor2_pelt_nsw";
_c pushBack "rhsusf_opscore_bk";
_c pushBack "rhsusf_opscore_bk_pelt";
_c pushBack "rhsusf_opscore_coy_cover";
_c pushBack "rhsusf_opscore_coy_cover_pelt";
_c pushBack "rhsusf_opscore_fg";
_c pushBack "rhsusf_opscore_fg_pelt";
_c pushBack "rhsusf_opscore_fg_pelt_cam";
_c pushBack "rhsusf_opscore_fg_pelt_nsw";
_c pushBack "rhsusf_opscore_mc_cover";
_c pushBack "rhsusf_opscore_mc_cover_pelt";
_c pushBack "rhsusf_opscore_mc_cover_pelt_nsw";
_c pushBack "rhsusf_opscore_mc_cover_pelt_cam";
_c pushBack "rhsusf_opscore_mc";
_c pushBack "rhsusf_opscore_mc_pelt";
_c pushBack "rhsusf_opscore_mc_pelt_nsw";
_c pushBack "rhsusf_opscore_paint";
_c pushBack "rhsusf_opscore_paint_pelt";
_c pushBack "rhsusf_opscore_paint_pelt_nsw";
_c pushBack "rhsusf_opscore_paint_pelt_nsw_cam";
_c pushBack "rhsusf_opscore_rg_cover";
_c pushBack "rhsusf_opscore_rg_cover_pelt";
_c pushBack "rhsusf_opscore_ut";
_c pushBack "rhsusf_opscore_ut_pelt";
_c pushBack "rhsusf_opscore_ut_pelt_cam";
_c pushBack "rhsusf_opscore_ut_pelt_nsw";
_c pushBack "rhsusf_opscore_ut_pelt_nsw_cam";
_c pushBack "rhsusf_opscore_mar_fg";
_c pushBack "rhsusf_opscore_mar_fg_pelt";
_c pushBack "rhsusf_opscore_mar_ut";
_c pushBack "rhsusf_opscore_mar_ut_pelt";
_c pushBack "rhsusf_hgu56p_black";
_c pushBack "rhsusf_hgu56p_mask_black";
_c pushBack "rhsusf_hgu56p_mask_black_skull";
_c pushBack "rhsusf_hgu56p_visor_black";
_c pushBack "rhsusf_hgu56p_visor_mask_black";
_c pushBack "rhsusf_hgu56p_visor_mask_Empire_black";
_c pushBack "rhsusf_hgu56p_visor_mask_black_skull";
_c pushBack "rhsusf_hgu56p_green";
_c pushBack "rhsusf_hgu56p_mask_green";
_c pushBack "rhsusf_hgu56p_mask_green_mo";
_c pushBack "rhsusf_hgu56p_visor_green";
_c pushBack "rhsusf_hgu56p_visor_mask_green";
_c pushBack "rhsusf_hgu56p_visor_mask_green_mo";
_c pushBack "rhsusf_hgu56p";
_c pushBack "rhsusf_hgu56p_mask";
_c pushBack "rhsusf_hgu56p_mask_mo";
_c pushBack "rhsusf_hgu56p_mask_skull";
_c pushBack "rhsusf_hgu56p_visor";
_c pushBack "rhsusf_hgu56p_visor_mask";
_c pushBack "rhsusf_hgu56p_visor_mask_mo";
_c pushBack "rhsusf_hgu56p_visor_mask_skull";
_c pushBack "rhsusf_hgu56p_pink";
_c pushBack "rhsusf_hgu56p_mask_pink";
_c pushBack "rhsusf_hgu56p_visor_pink";
_c pushBack "rhsusf_hgu56p_visor_mask_pink";
_c pushBack "rhsusf_hgu56p_saf";
_c pushBack "rhsusf_hgu56p_mask_saf";
_c pushBack "rhsusf_hgu56p_visor_saf";
_c pushBack "rhsusf_hgu56p_visor_mask_saf";
_c pushBack "rhsusf_hgu56p_mask_smiley";
_c pushBack "rhsusf_hgu56p_visor_mask_smiley";
_c pushBack "rhsusf_hgu56p_tan";
_c pushBack "rhsusf_hgu56p_mask_tan";
_c pushBack "rhsusf_hgu56p_visor_tan";
_c pushBack "rhsusf_hgu56p_visor_mask_tan";
_c pushBack "rhsusf_hgu56p_usa";
_c pushBack "rhsusf_hgu56p_visor_usa";
_c pushBack "rhsusf_hgu56p_white";
_c pushBack "rhsusf_hgu56p_visor_white";
_c pushBack "rhsusf_ihadss";
_c pushBack "rhsusf_lwh_helmet_M1942";
_c pushBack "rhsusf_lwh_helmet_marpatd";
_c pushBack "rhsusf_lwh_helmet_marpatd_ess";
_c pushBack "rhsusf_lwh_helmet_marpatd_headset";
_c pushBack "rhsusf_lwh_helmet_marpatwd";
_c pushBack "rhsusf_lwh_helmet_marpatwd_blk_ess";
_c pushBack "rhsusf_lwh_helmet_marpatwd_headset_blk2";
_c pushBack "rhsusf_lwh_helmet_marpatwd_headset_blk";
_c pushBack "rhsusf_lwh_helmet_marpatwd_headset";
_c pushBack "rhsusf_lwh_helmet_marpatwd_ess";
_c pushBack "rhsusf_mich_bare";
_c pushBack "rhsusf_mich_bare_alt";
_c pushBack "rhsusf_mich_bare_headset";
_c pushBack "rhsusf_mich_bare_norotos";
_c pushBack "rhsusf_mich_bare_norotos_alt";
_c pushBack "rhsusf_mich_bare_norotos_alt_headset";
_c pushBack "rhsusf_mich_bare_norotos_arc";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt_headset";
_c pushBack "rhsusf_mich_bare_norotos_arc_headset";
_c pushBack "rhsusf_mich_bare_norotos_headset";
_c pushBack "rhsusf_mich_bare_semi";
_c pushBack "rhsusf_mich_bare_alt_semi";
_c pushBack "rhsusf_mich_bare_semi_headset";
_c pushBack "rhsusf_mich_bare_norotos_semi";
_c pushBack "rhsusf_mich_bare_norotos_alt_semi";
_c pushBack "rhsusf_mich_bare_norotos_alt_semi_headset";
_c pushBack "rhsusf_mich_bare_norotos_arc_semi";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt_semi";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt_semi_headset";
_c pushBack "rhsusf_mich_bare_norotos_arc_semi_headset";
_c pushBack "rhsusf_mich_bare_norotos_semi_headset";
_c pushBack "rhsusf_mich_bare_tan";
_c pushBack "rhsusf_mich_bare_alt_tan";
_c pushBack "rhsusf_mich_bare_tan_headset";
_c pushBack "rhsusf_mich_bare_norotos_tan";
_c pushBack "rhsusf_mich_bare_norotos_alt_tan";
_c pushBack "rhsusf_mich_bare_norotos_alt_tan_headset";
_c pushBack "rhsusf_mich_bare_norotos_arc_tan";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt_tan";
_c pushBack "rhsusf_mich_bare_norotos_arc_alt_tan_headset";
_c pushBack "rhsusf_mich_bare_norotos_tan_headset";
_c pushBack "rhsusf_mich_helmet_marpatd";
_c pushBack "rhsusf_mich_helmet_marpatd_alt";
_c pushBack "rhsusf_mich_helmet_marpatd_alt_headset";
_c pushBack "rhsusf_mich_helmet_marpatd_headset";
_c pushBack "rhsusf_mich_helmet_marpatd_norotos";
_c pushBack "rhsusf_mich_helmet_marpatd_norotos_arc";
_c pushBack "rhsusf_mich_helmet_marpatd_norotos_arc_headset";
_c pushBack "rhsusf_mich_helmet_marpatd_norotos_headset";
_c pushBack "rhsusf_mich_helmet_marpatwd";
_c pushBack "rhsusf_mich_helmet_marpatwd_alt";
_c pushBack "rhsusf_mich_helmet_marpatwd_alt_headset";
_c pushBack "rhsusf_mich_helmet_marpatwd_headset";
_c pushBack "rhsusf_mich_helmet_marpatwd_norotos";
_c pushBack "rhsusf_mich_helmet_marpatwd_norotos_arc";
_c pushBack "rhsusf_mich_helmet_marpatwd_norotos_arc_headset";
_c pushBack "rhsusf_mich_helmet_marpatwd_norotos_headset";
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

_c pushBack "rhs_googles_black";
_c pushBack "rhs_googles_clear";
_c pushBack "rhs_googles_orange";
_c pushBack "rhs_googles_yellow";
_c pushBack "rhs_ess_black";
_c pushBack "rhsusf_shemagh_grn";
_c pushBack "rhsusf_shemagh2_grn";
_c pushBack "rhsusf_shemagh_od";
_c pushBack "rhsusf_shemagh2_od";
_c pushBack "rhsusf_shemagh_tan";
_c pushBack "rhsusf_shemagh2_tan";
_c pushBack "rhsusf_shemagh_white";
_c pushBack "rhsusf_shemagh2_white";
_c pushBack "rhsusf_shemagh_gogg_grn";
_c pushBack "rhsusf_shemagh2_gogg_grn";
_c pushBack "rhsusf_shemagh_gogg_od";
_c pushBack "rhsusf_shemagh2_gogg_od";
_c pushBack "rhsusf_shemagh_gogg_tan";
_c pushBack "rhsusf_shemagh2_gogg_tan";
_c pushBack "rhsusf_shemagh_gogg_white";
_c pushBack "rhsusf_shemagh2_gogg_white";
_c pushBack "rhsusf_oakley_goggles_blk";
_c pushBack "rhsusf_oakley_goggles_clr";
_c pushBack "rhsusf_oakley_goggles_ylw";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_Rhino";

_c pushBack "rhsusf_radio_anprc152";

_c pushBack "rhsusf_bino_leopold_mk4";
_c pushBack "rhsusf_bino_m24";
_c pushBack "rhsusf_bino_m24_ARD";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhsusf_bino_lerca_1200_black";
_c pushBack "rhsusf_bino_lerca_1200_tan";
_c pushBack "rhsusf_bino_lrf_Vector21";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_ANPVS_14";
_c pushBack "rhsusf_ANPVS_15";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//scopes
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

//light/laser
_c pushBack "rhsusf_acc_M952V";						//Weapon mounted light
_c pushBack "rhsusf_acc_wmx";						//Weapon mounted light
_c pushBack "rhsusf_acc_wmx_bk";					//Weapon mounted light
_c pushBack "rhsusf_acc_anpeq15_top";				//IR Laser
_c pushBack "rhsusf_acc_anpeq15_bk_top";			//IR Laser

//bipod
_c pushBack "rhsusf_acc_grip2";
_c pushBack "rhsusf_acc_grip2_tan";
_c pushBack "rhsusf_acc_grip2_wd";
_c pushBack "rhsusf_acc_grip1";
_c pushBack "rhsusf_acc_harris_bipod";
_c pushBack "rhsusf_acc_kac_grip";
_c pushBack "rhsusf_acc_rvg_blk";
_c pushBack "rhsusf_acc_rvg_de";
_c pushBack "rhsusf_acc_tacsac_blk";
_c pushBack "rhsusf_acc_tacsac_blue";
_c pushBack "rhsusf_acc_tacsac_tan";
_c pushBack "rhsusf_acc_tdstubby_blk";
_c pushBack "rhsusf_acc_tdstubby_tan";
_c pushBack "rhsusf_acc_grip3";
_c pushBack "rhsusf_acc_grip3_tan";
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


_c pushBack "rhsusf_weap_glock17g4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhsusf_mag_17Rnd_9x19_JHP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,17,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhsusf_mag_17Rnd_9x19_FMJ";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,17,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "rhsusf_weap_MP7A2_folded";
_c pushBack "rhsusf_weap_MP7A2_folded_aor1";
_c pushBack "rhsusf_weap_MP7A2_folded_winter";
_c pushBack "rhsusf_weap_MP7A2_folded_desert";

_c pushBack "rhsusf_weap_MP7A2";
_c pushBack "rhsusf_weap_MP7A2_aor1";
_c pushBack "rhsusf_weap_MP7A2_desert";
_c pushBack "rhsusf_weap_MP7A2_winter";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_mag_40Rnd_46x30_FMJ";
_c pushBack "rhsusf_mag_40Rnd_46x30_JHP";
_c pushBack "rhsusf_mag_40Rnd_46x30_AP";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,40,(460*30)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_rotex_mp7_aor1";
_c pushBack "rhsusf_acc_rotex_mp7";
_c pushBack "rhsusf_acc_rotex_mp7_desert";
_c pushBack "rhsusf_acc_rotex_mp7_winter";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_hk416d10";
_c pushBack "rhs_weap_hk416d10_m320";
_c pushBack "rhs_weap_hk416d10_LMT";
_c pushBack "rhs_weap_hk416d10_LMT_d";
_c pushBack "rhs_weap_hk416d10_LMT_wd";
_c pushBack "rhs_weap_hk416d145";
_c pushBack "rhs_weap_hk416d145_d";
_c pushBack "rhs_weap_hk416d145_d_2";
_c pushBack "rhs_weap_hk416d145_m320";
_c pushBack "rhs_weap_hk416d145_wd";
_c pushBack "rhs_weap_hk416d145_wd_2";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_20Rnd_556x45_M193_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red";
_c pushBack "rhs_mag_20Rnd_556x45_M200_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_M855_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_M855A1_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_Mk262_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag";
_c pushBack "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_100Rnd_556x45_M855A1_cmag";
_c pushBack "rhs_mag_100Rnd_556x45_M855A1_cmag_mixed";
_c pushBack "rhs_mag_100Rnd_556x45_M855_cmag";
_c pushBack "rhs_mag_100Rnd_556x45_M855_cmag_mixed";
_c pushBack "rhs_mag_100Rnd_556x45_Mk318_cmag";
_c pushBack "rhs_mag_100Rnd_556x45_Mk262_cmag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//scopes
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

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhs_weap_m14_rail";
_c pushBack "rhs_weap_m14_rail_d";
_c pushBack "rhs_weap_m14_rail_fiberglass";
_c pushBack "rhs_weap_m14_rail_wd";
_c pushBack "rhs_weap_m14_ris";
_c pushBack "rhs_weap_m14_ris_d";
_c pushBack "rhs_weap_m14_ris_fiberglass";
_c pushBack "rhs_weap_m14_ris_wd";
_c pushBack "rhs_weap_m14ebrri";
_c pushBack "rhs_weap_m14_socom";
_c pushBack "rhs_weap_m14_socom_rail";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_20Rnd_762x51_m80_Mag";
_c pushBack "rhsusf_20Rnd_762x51_m118_special_Mag";
_c pushBack "rhsusf_20Rnd_762x51_m993_Mag";
_c pushBack "rhsusf_20Rnd_762x51_m62_Mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_aac_762sd_silencer";
_c pushBack "rhsusf_acc_aac_762sdn6_silencer";
_c pushBack "rhsusf_acc_aac_scarh_silencer";
_c pushBack "rhsusf_acc_aac_m14dcqd_silencer";
_c pushBack "rhsusf_acc_aac_m14dcqd_silencer_d";
_c pushBack "rhsusf_acc_aac_m14dcqd_silencer_wd";
_c pushBack "rhsusf_acc_m14_flashsuppresor";

_c pushBack "rhsusf_acc_harris_swivel";
_c pushBack "rhsusf_acc_m14_bipod";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhs_weap_mk17_CQC";
_c pushBack "rhs_weap_mk17_LB";
_c pushBack "rhs_weap_mk17_STD";
_c pushBack "rhs_weap_SCARH_USA_CQC";
_c pushBack "rhs_weap_SCARH_USA_LB";
_c pushBack "rhs_weap_SCARH_USA_STD";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_20Rnd_SCAR_762x51_m80_ball";
_c pushBack "rhs_mag_20Rnd_SCAR_762x51_m61_ap";
_c pushBack "rhs_mag_20Rnd_SCAR_762x51_m62_tracer";
_c pushBack "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr";
_c pushBack "rhs_mag_20Rnd_SCAR_762x51_m118_special";
_c pushBack "rhs_mag_20Rnd_SCAR_762x51_mk316_special";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_aac_762sd_silencer";
_c pushBack "rhsusf_acc_aac_762sdn6_silencer";
_c pushBack "rhsusf_acc_aac_scarh_silencer";



_c pushBack "rhs_weap_m24sws";
_c pushBack "rhs_weap_m24sws_d";
_c pushBack "rhs_weap_m24sws_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_5Rnd_762x51_m118_special_Mag";
_c pushBack "rhsusf_5Rnd_762x51_m993_Mag";
_c pushBack "rhsusf_5Rnd_762x51_m62_Mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_acc_m24_muzzlehider_black";
_c pushBack "rhsusf_acc_m24_muzzlehider_d";
_c pushBack "rhsusf_acc_m24_muzzlehider_wd";
_c pushBack "rhsusf_acc_m24_silencer_black";
_c pushBack "rhsusf_acc_m24_silencer_d";
_c pushBack "rhsusf_acc_m24_silencer_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_M590_8RD";
_c pushBack "rhs_weap_M590_5RD";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_8Rnd_00Buck";
_c pushBack "rhsusf_8Rnd_Slug";
_c pushBack "rhsusf_8Rnd_HE";
_c pushBack "rhsusf_8Rnd_FRAG";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_5Rnd_00Buck";
_c pushBack "rhsusf_5Rnd_Slug";
_c pushBack "rhsusf_5Rnd_HE";
_c pushBack "rhsusf_5Rnd_FRAG";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsgref_1Rnd_00Buck";
_c pushBack "rhsgref_1Rnd_Slug";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//


_c pushBack "rhs_weap_m240B";
_c pushBack "rhs_weap_m240G";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_50Rnd_762x51";
_c pushBack "rhsusf_50Rnd_762x51_m61_ap";
_c pushBack "rhsusf_50Rnd_762x51_m62_tracer";
_c pushBack "rhsusf_50Rnd_762x51_m80a1epr";
_c pushBack "rhsusf_50Rnd_762x51_m82_blank";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_100Rnd_762x51";
_c pushBack "rhsusf_100Rnd_762x51_m61_ap";
_c pushBack "rhsusf_100Rnd_762x51_m62_tracer";
_c pushBack "rhsusf_100Rnd_762x51_m80a1epr";
_c pushBack "rhsusf_100Rnd_762x51_m82_blank";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_ARDEC_M240";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_maaws";

_c pushBack "rhs_weap_smaw";
_c pushBack "rhs_weap_smaw_green";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_mag_maaws_HEAT";
_c pushBack "rhs_mag_maaws_HEDP";
_c pushBack "rhs_mag_maaws_HE";

_c pushBack "rhs_mag_smaw_HEAA";
_c pushBack "rhs_mag_smaw_SR";
_c pushBack "rhs_mag_smaw_HEDP";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_ACOG2_USMC";
_c pushBack "rhsusf_acc_ACOG3_USMC";
_c pushBack "rhsusf_acc_ACOG_USMC";
_c pushBack "rhsusf_acc_ACOG";
_c pushBack "rhsusf_acc_ACOG2";
_c pushBack "rhsusf_acc_ACOG3";
_c pushBack "rhsusf_acc_eotech_552";
_c pushBack "rhs_weap_optic_smaw";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "rhsusf_falconii_coy";
_c pushBack "rhsusf_falconii_mc";
_c pushBack "rhsusf_falconii";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_Tow_Gun_Bag";
_c pushBack "rhs_TOW_Tripod_Bag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Level 2																	//
//--------------------------------------------------------------------------------------------------------------------------//
//													Weapons																	//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "rhsusf_weap_m9";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_mag_15Rnd_9x19_JHP";
_c pushBack "rhsusf_mag_15Rnd_9x19_FMJ";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,15,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_mk18";
_c pushBack "rhs_weap_mk18_bk";
_c pushBack "rhs_weap_mk18_KAC_bk";
_c pushBack "rhs_weap_mk18_d";
_c pushBack "rhs_weap_mk18_KAC_d";
_c pushBack "rhs_weap_mk18_m320";
_c pushBack "rhs_weap_mk18_KAC";
_c pushBack "rhs_weap_mk18_wd";
_c pushBack "rhs_weap_mk18_KAC_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Other Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_XM2010";
_c pushBack "rhs_weap_XM2010_wd";
_c pushBack "rhs_weap_XM2010_d";
_c pushBack "rhs_weap_XM2010_sa";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_5Rnd_300winmag_xm2010";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "rhsusf_acc_M2010S";
_c pushBack "rhsusf_acc_M2010S_d";
_c pushBack "rhsusf_acc_M2010S_sa";
_c pushBack "rhsusf_acc_M2010S_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "rhs_weap_sr25";
_c pushBack "rhs_weap_sr25_d";
_c pushBack "rhs_weap_sr25_ec";
_c pushBack "rhs_weap_sr25_ec_d";
_c pushBack "rhs_weap_sr25_ec_wd";
_c pushBack "rhs_weap_sr25_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
_c pushBack "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag";
_c pushBack "rhsusf_20Rnd_762x51_SR25_m993_Mag";
_c pushBack "rhsusf_20Rnd_762x51_SR25_m62_Mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_SR25S";
_c pushBack "rhsusf_acc_SR25S_d";
_c pushBack "rhsusf_acc_SR25S_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};



_c pushBack "rhs_weap_m40a5";
_c pushBack "rhs_weap_m40a5_d";
_c pushBack "rhs_weap_m40a5_wd";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_5Rnd_762x51_AICS_m118_special_Mag";
_c pushBack "rhsusf_5Rnd_762x51_AICS_m993_Mag";
_c pushBack "rhsusf_5Rnd_762x51_AICS_m62_Mag";
_c pushBack "rhsusf_5Rnd_762x51_m118_special_Mag";
_c pushBack "rhsusf_5Rnd_762x51_m993_Mag";
_c pushBack "rhsusf_5Rnd_762x51_m62_Mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_10Rnd_762x51_m118_special_Mag";
_c pushBack "rhsusf_10Rnd_762x51_m993_Mag";
_c pushBack "rhsusf_10Rnd_762x51_m62_Mag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhs_weap_M107";
_c pushBack "rhs_weap_M107_d";
_c pushBack "rhs_weap_M107_w";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_mag_10Rnd_STD_50BMG_M33";		//12,7 × 99 mm NATO
_c pushBack "rhsusf_mag_10Rnd_STD_50BMG_mk211";	
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(1270*99)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_m249";
_c pushBack "rhs_weap_m249_pip";
_c pushBack "rhs_weap_m249_light_L";
_c pushBack "rhs_weap_m249_pip_L_para";
_c pushBack "rhs_weap_m249_pip_L";
_c pushBack "rhs_weap_m249_pip_ris";
_c pushBack "rhs_weap_m249_light_S";
_c pushBack "rhs_weap_m249_pip_S_para";
_c pushBack "rhs_weap_m249_pip_S";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_100Rnd_556x45_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_mixed_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_mixed_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_soft_pouch_coyote";
_c pushBack "rhsusf_100Rnd_556x45_mixed_soft_pouch_coyote";
_c pushBack "rhsusf_100Rnd_556x45_M855_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_M855_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_M855_soft_pouch_coyote";
_c pushBack "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_coyote";
_c pushBack "rhsusf_100Rnd_556x45_M995_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_M995_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_M995_soft_pouch_coyote";
_c pushBack "rhsusf_100Rnd_556x45_M200_soft_pouch";
_c pushBack "rhsusf_100Rnd_556x45_M200_soft_pouch_ucp";
_c pushBack "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
_c pushBack "rhsusf_200Rnd_556x45_box";
_c pushBack "rhsusf_200rnd_556x45_mixed_box";
_c pushBack "rhsusf_200rnd_556x45_M855_box";
_c pushBack "rhsusf_200rnd_556x45_M855_mixed_box";
_c pushBack "rhsusf_200Rnd_556x45_soft_pouch";
_c pushBack "rhsusf_200Rnd_556x45_mixed_soft_pouch";
_c pushBack "rhsusf_200Rnd_556x45_soft_pouch_ucp";
_c pushBack "rhsusf_200Rnd_556x45_mixed_soft_pouch_ucp";
_c pushBack "rhsusf_200Rnd_556x45_soft_pouch_coyote";
_c pushBack "rhsusf_200rnd_556x45_M855_box";
_c pushBack "rhsusf_200Rnd_556x45_soft_pouch_coyote";
_c pushBack "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
_c pushBack "rhsusf_200Rnd_556x45_M855_soft_pouch";
_c pushBack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch";
_c pushBack "rhsusf_200Rnd_556x45_M855_soft_pouch_ucp";
_c pushBack "rhsusf_200rnd_556x45_M855_box";
_c pushBack "rhsusf_200Rnd_556x45_M855_soft_pouch_coyote";
_c pushBack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";
_c pushBack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_ucp";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "rhsusf_acc_saw_bipod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Launchers																//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "rhs_weap_fgm148";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_fgm148_magazine_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "rhs_weap_fim92";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "rhs_fim92_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//scopes
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
_c pushBack "rhsusf_acc_ACOG_MDO";					//Machine Gun Day Optic<br />ACOG TA648MDO<br />Magnification: 6x<br />RMR<br />Magnification: 1x
_c pushBack "rhsusf_acc_anpvs27";					//Night vision scope<br />Magnification: 1x
_c pushBack "rhsusf_acc_anpas13gv1";				//Light Weapon Thermal Sight (LWTS)
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//light/laser
_c pushBack "rhsusf_acc_anpeq15side";				//Emits light visible in the image intensification mode (night vision).
_c pushBack "rhsusf_acc_anpeq15side_bk";			//Emits light visible in the image intensification mode (night vision).
_c pushBack "rhsusf_acc_anpeq15A";					//Emits light visible in the image intensification mode (night vision).
//muzzles
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_CUP_US.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_CUP_US.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
