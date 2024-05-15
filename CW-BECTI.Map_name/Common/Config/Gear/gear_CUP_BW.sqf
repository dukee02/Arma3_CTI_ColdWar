private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt"];

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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_BW_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_Vector21Nite";
_u pushBack 0;
_p pushBack 500;

_c pushBack "CUP_NVG_PVS7";
_u pushBack 0;
_p pushBack 100;
//--------------------------------------------------------------------------------------------------------------------------//
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON < 1 && CTI_CUP_ADDON < 1) then {
	_c pushBack "CUP_HandGrenade_M67";
	_c pushBack "CUP_HandGrenade_RGO";

	_c pushBack "CUP_1Rnd_HE_M203";
	_c pushBack "CUP_1Rnd_HEDP_M203";
	//set all other vars in a slope
	_cntstart = count _i;
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
	_cntstart = count _i;
	_cntend = count _u;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
	};
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Pistols																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_hgun_Glock17";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_17Rnd_9x19_glock17";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,17,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Rifles																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_arifle_G36A";
_c pushBack "CUP_arifle_G36A_camo";
_c pushBack "CUP_arifle_G36A_RIS";
_c pushBack "CUP_arifle_G36A_RIS_camo";
_c pushBack "CUP_arifle_G36A_RIS_wdl";
_c pushBack "CUP_arifle_G36A_wdl";
_c pushBack "CUP_arifle_AG36";
_c pushBack "CUP_arifle_AG36_camo";
_c pushBack "CUP_arifle_G36A_AG36_RIS";
_c pushBack "CUP_arifle_G36A_AG36_RIS_camo";
_c pushBack "CUP_arifle_G36A_AG36_RIS_wdl";
_c pushBack "CUP_arifle_AG36_wdl";
_c pushBack "CUP_arifle_G36C";
_c pushBack "CUP_arifle_G36C_camo";
_c pushBack "CUP_arifle_G36C_VFG";
_c pushBack "CUP_arifle_G36C_VFG_Carry";
_c pushBack "CUP_arifle_G36C_VFG_camo";
_c pushBack "CUP_arifle_G36C_VFG_hex";
_c pushBack "CUP_arifle_G36C_VFG_wdl";
_c pushBack "CUP_arifle_G36C_hex";
_c pushBack "CUP_arifle_G36C_wdl";
_c pushBack "CUP_arifle_G36K";
_c pushBack "CUP_arifle_G36K_camo";
_c pushBack "CUP_arifle_G36K_VFG";
_c pushBack "CUP_arifle_G36K_VFG_camo";
_c pushBack "CUP_arifle_G36K_VFG_wdl";
_c pushBack "CUP_arifle_G36K_RIS";
_c pushBack "CUP_arifle_G36K_RIS_camo";
_c pushBack "CUP_arifle_G36K_RIS_hex";
_c pushBack "CUP_arifle_G36K_RIS_wdl";
_c pushBack "CUP_arifle_G36K_wdl";
_c pushBack "CUP_arifle_G36K_AG36";
_c pushBack "CUP_arifle_G36K_AG36_camo";
_c pushBack "CUP_arifle_G36K_RIS_AG36";
_c pushBack "CUP_arifle_G36K_RIS_AG36_camo";
_c pushBack "CUP_arifle_G36K_RIS_AG36_hex";
_c pushBack "CUP_arifle_G36K_RIS_AG36_wdl";
_c pushBack "CUP_arifle_G36K_AG36_wdl";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_30Rnd_556x45_G36";
_c pushBack "CUP_30Rnd_556x45_G36_camo";
_c pushBack "CUP_30Rnd_556x45_G36_wdl";
_c pushBack "CUP_30Rnd_556x45_G36_hex";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_G36";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_G36";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_G36_camo";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_G36_camo";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_camo";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_G36_wdl";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_wdl";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_G36_hex";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_G36_hex";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_hex";
_c pushBack "CUP_30Rnd_556x45_XM8";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_556x45_XM8";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_556x45_XM8";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_556x45_XM8";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_arifle_MG36";
_c pushBack "CUP_arifle_MG36_camo";
_c pushBack "CUP_arifle_MG36_hex";
_c pushBack "CUP_arifle_MG36_wdl";

_c pushBack "CUP_lmg_MG3";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_c pushBack "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
_c pushBack "CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M";
_c pushBack "CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,120,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_M136";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_M136_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_launch_NLAW";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_NLAW_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active
	_c pushBack "CUP_U_B_GER_Tropentarn_1";
	_c pushBack "CUP_U_B_GER_Tropentarn_2";
	_c pushBack "CUP_U_B_GER_BDU_Tropentarn";
} else {
	_c pushBack "CUP_U_B_GER_Flecktarn_1";
	_c pushBack "CUP_U_B_GER_Flecktarn_2";
	_c pushBack "CUP_U_B_GER_BDU_Flecktarn";
	_c pushBack "CUP_U_B_GER_BDU_Flecktarn_ODBottom";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_V_B_GER_Carrier_Rig";
_c pushBack "CUP_V_B_GER_Carrier_Rig_2";
_c pushBack "CUP_V_B_GER_Carrier_Vest";
_c pushBack "CUP_V_B_GER_Carrier_Vest_2";
_c pushBack "CUP_V_B_GER_Carrier_Vest_3";
_c pushBack "CUP_V_B_GER_Vest_2";
_c pushBack "CUP_V_B_GER_Vest_1";
_c pushBack "CUP_V_B_GER_Carrier_Rig_3_Brown";
_c pushBack "CUP_V_B_GER_Carrier_Rig_2_Brown";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active
	_c pushBack "CUP_B_GER_Pack_Tropentarn";
} else {
	_c pushBack "CUP_B_GER_Pack_Flecktarn";
	_c pushBack "CUP_B_GER_Backpack_Medic_Fleck";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_B_M2_Gun_Bag";
_c pushBack "CUP_B_M2_MiniTripod_Bag";
_c pushBack "CUP_B_M2_Tripod_Bag";
_c pushBack "CUP_B_M252_Bipod_Bag";
_c pushBack "CUP_B_M252_Gun_Bag";
_c pushBack "CUP_B_Mk19_Gun_Bag";
_c pushBack "CUP_B_Mk19_Tripod_Bag";
_c pushBack "CUP_B_Tow_Gun_Bag";
_c pushBack "CUP_B_TOW_Tripod_Bag";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Optics																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_optic_MicroT1";
_c pushBack "CUP_optic_MicroT1_coyote";
_c pushBack "CUP_optic_MicroT1_low";
_c pushBack "CUP_optic_MicroT1_low_coyote";
_c pushBack "CUP_optic_MicroT1_low_OD";
_c pushBack "CUP_optic_MicroT1_OD";
_c pushBack "CUP_optic_CompM4";
_c pushBack "CUP_optic_AN_PVS_10";
_c pushBack "CUP_optic_AN_PVS_4";
_c pushBack "CUP_optic_CWS";
_c pushBack "CUP_optic_ElcanM145";
_c pushBack "CUP_optic_ELCAN_SpecterDR";
_c pushBack "CUP_optic_Elcan";
_c pushBack "CUP_optic_Elcan_Coyote";
_c pushBack "CUP_optic_Elcan_OD";
_c pushBack "CUP_optic_Elcan_reflex";
_c pushBack "CUP_optic_Elcan_reflex_Coyote";
_c pushBack "CUP_optic_Elcan_reflex_OD";
_c pushBack "CUP_optic_Eotech553_Black";
_c pushBack "CUP_optic_Eotech553_Coyote";
_c pushBack "CUP_optic_Eotech533Grey";
_c pushBack "CUP_optic_Eotech553_OD";
_c pushBack "CUP_optic_Eotech533";
_c pushBack "CUP_optic_HoloBlack";
_c pushBack "CUP_optic_HoloDesert";
_c pushBack "CUP_optic_HoloWdl";
_c pushBack "CUP_optic_LeupoldMk4";
_c pushBack "CUP_optic_LeupoldMk4_10x40_LRT_Desert";
_c pushBack "CUP_optic_LeupoldMk4_10x40_LRT_Woodland";
_c pushBack "CUP_optic_LeupoldM3LR";
_c pushBack "CUP_optic_LeupoldMk4_CQ_T";
_c pushBack "CUP_optic_LeupoldMk4_MRT_tan";
_c pushBack "CUP_optic_Leupold_VX3";
_c pushBack "CUP_optic_CompM2_low";
_c pushBack "CUP_optic_CompM2_low_coyote";
_c pushBack "CUP_optic_CompM2_low_OD";
_c pushBack "CUP_optic_CompM2_Black";
_c pushBack "CUP_optic_CompM2_Coyote";
_c pushBack "CUP_optic_CompM2_Desert";
_c pushBack "CUP_optic_CompM2_OD";
_c pushBack "CUP_optic_CompM2_Woodland2";
_c pushBack "CUP_optic_CompM2_Woodland";
_c pushBack "CUP_optic_MRad";
_c pushBack "CUP_optic_ZDDot";
_c pushBack "CUP_optic_SB_11_4x20_PM";
_c pushBack "CUP_optic_SB_3_12x50_PMII";
_c pushBack "CUP_optic_SUSAT";
_c pushBack "CUP_optic_RCO";
_c pushBack "CUP_optic_RCO_desert";
_c pushBack "CUP_optic_ACOG2";
_c pushBack "CUP_optic_ACOG";
_c pushBack "CUP_optic_ACOG_Reflex_Desert";
_c pushBack "CUP_optic_ACOG_Reflex_Wood";
_c pushBack "CUP_optic_TrijiconRx01_black";
_c pushBack "CUP_optic_TrijiconRx01_desert";
_c pushBack "CUP_optic_ZeissZPoint";
/*_c pushBack "CUP_optic_AN_PAS_13c2";							// TWS
_c pushBack "CUP_optic_AN_PAS_13c1";							// TWS
_c pushBack "CUP_optic_GOSHAWK_RIS";							// TWS*/
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Rail Attachments														//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_acc_ANPEQ_15_Black";
_c pushBack "CUP_acc_ANPEQ_15_Black_Top";
_c pushBack "CUP_acc_ANPEQ_15_OD";
_c pushBack "CUP_acc_ANPEQ_15_OD_Top";
_c pushBack "CUP_acc_ANPEQ_15";
_c pushBack "CUP_acc_ANPEQ_15_Tan_Top";
_c pushBack "CUP_acc_ANPEQ_15_Flashlight_Black_L";
_c pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L";
_c pushBack "CUP_acc_ANPEQ_15_Flashlight_OD_L";
_c pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_OD_L";
_c pushBack "CUP_acc_ANPEQ_15_Flashlight_Tan_L";
_c pushBack "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L";
_c pushBack "CUP_acc_ANPEQ_2";
_c pushBack "CUP_acc_ANPEQ_2_camo";
_c pushBack "CUP_acc_ANPEQ_2_desert";
_c pushBack "CUP_acc_ANPEQ_2_grey";
_c pushBack "CUP_acc_Flashlight";
_c pushBack "CUP_acc_Flashlight_desert";
_c pushBack "CUP_acc_Flashlight_wdl";
_c pushBack "CUP_acc_LLM";
_c pushBack "CUP_acc_XM8_light_module";
_c pushBack "CUP_acc_Glock17_Flashlight";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Muzzles																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_muzzle_mfsup_Flashhider_556x45_Black";
_c pushBack "CUP_muzzle_mfsup_Flashhider_556x45_OD";
_c pushBack "CUP_muzzle_mfsup_Flashhider_556x45_Tan";
_c pushBack "CUP_muzzle_snds_G36_black";
_c pushBack "CUP_muzzle_snds_G36_desert";
_c pushBack "CUP_muzzle_snds_G36_wood";
_c pushBack "CUP_muzzle_mfsup_SCAR_L";
_c pushBack "CUP_muzzle_snds_SCAR_L";
_c pushBack "CUP_muzzle_snds_M16";
_c pushBack "CUP_muzzle_snds_M16_desert";
_c pushBack "CUP_muzzle_snds_M16_camo";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Bipods																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_Bipod_G36";
_c pushBack "CUP_Bipod_G36_desert";
_c pushBack "CUP_Bipod_G36_wood";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_H_Ger_Boonie_Flecktarn";
_c pushBack "H_Shemag_olive_hs";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_H_GER_LWH_Flecktarn";
_c pushBack "CUP_H_GER_LWH_Tropentarn";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_c pushBack "CUP_100Rnd_556x45_BetaCMag";
_c pushBack "CUP_100Rnd_556x45_BetaCMag_camo";
_c pushBack "CUP_100Rnd_556x45_BetaCMag_wdl";
_c pushBack "CUP_100Rnd_556x45_BetaCMag_hex";
_c pushBack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag";
_c pushBack "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag";
_c pushBack "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag";
_c pushBack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_camo";
_c pushBack "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_camo";
_c pushBack "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_camo";
_c pushBack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_wdl";
_c pushBack "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_wdl";
_c pushBack "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_wdl";
_c pushBack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_hex";
_c pushBack "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_hex";
_c pushBack "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_hex";
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_MAAWS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_MAAWS_HEDP_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_MAAWS_HEAT_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_HEAA_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_HEDP_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_launch_Mk153Mod0";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "MRAWS_HE_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "MRAWS_HEAT_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_launch_FIM92Stinger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Stinger_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													AT-Guns																	//
//--------------------------------------------------------------------------------------------------------------------------//

_c pushBack "CUP_launch_Javelin";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Javelin_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_U_B_GER_Fleck_Ghillie";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_BW_CUP.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_BW_CUP.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
