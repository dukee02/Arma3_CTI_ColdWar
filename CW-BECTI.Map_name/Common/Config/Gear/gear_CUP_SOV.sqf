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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
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
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Other Items																			//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
	_c pushBack "CUP_NVG_1PN138_hide";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_NVG_1PN138";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//															Weapons															//
//--------------------------------------------------------------------------------------------------------------------------//
//handguns 
_c pushBack "CUP_hgun_Makarov";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "CUP_8Rnd_9x18_Makarov_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

//AK 47 main weapon, AKM slightly lighter
//AK 74 better precision
//AK 101 (90s)
//AK 105 (2k)
//AK 107 (2010)
_c pushBack "CUP_arifle_AK12_black";
_c pushBack "CUP_arifle_AK12_AFG_black";
_c pushBack "CUP_arifle_AK12_VG_black";
_c pushBack "CUP_arifle_AK12_GP34_black";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_30Rnd_545x39_AK12_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_M";
_c pushBack "CUP_30Rnd_545x39_AK12_Grey_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Grey_M";
_c pushBack "CUP_30Rnd_545x39_AK12_Green_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Green_M";
_c pushBack "CUP_30Rnd_545x39_AK12_Tan_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Tan_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
	_c pushBack "CUP_launch_RPG7V";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_PG7V_M";			//Monoblock-Hohlladung		R=300	P=280
	_c pushBack "CUP_PG7VM_M";			//Monoblock-Hohlladung		R=500	P=300–330
	_c pushBack "CUP_PG7VL_M";			//Monoblock-Hohlladung		R=300	P=500–550
	_c pushBack "CUP_PG7VR_M";			//Tandemhohlladung			R=200	P=600–700
	_c pushBack "CUP_OG7_M";			//Splitter					R=1000	P= -
	_c pushBack "CUP_TBG7V_M";			//Thermobar					R=300	P= -
	_c pushBack "RPG7_F";
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _u;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);
	};
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_optic_1P87_RIS";
_c pushBack "CUP_optic_OKP_7_rail";
_c pushBack "CUP_optic_PGO7V";
_c pushBack "CUP_optic_PGO7V2";
_c pushBack "CUP_optic_PGO7V3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
//uniforms used
_c pushBack "CUP_U_O_RUS_Ratnik_Autumn";
_c pushBack "CUP_U_O_RUS_Ratnik_BeigeDigital";
_c pushBack "CUP_U_O_RUS_Ratnik_Desert";
_c pushBack "CUP_U_O_RUS_Ratnik_Pink";
_c pushBack "CUP_U_O_RUS_Ratnik_Summer";
_c pushBack "CUP_U_O_RUS_Ratnik_Winter";
//other uniforms
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_BeigeDigital_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_BeigeDigital_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_Pink_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_Pink_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_BeigeDigital_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_BeigeDigital_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_Pink_gloves_pads";
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_Pink_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Commander";
_c pushBack "CUP_U_O_RUS_Ghillie";
_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_gloves_pads";
_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_rolled_up";
_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_EMR_1";
_c pushBack "CUP_U_O_RUS_EMR_gloves_pads";
_c pushBack "CUP_U_O_RUS_EMR_2";
_c pushBack "CUP_U_O_RUS_EMR_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Flora_1";
_c pushBack "CUP_U_O_RUS_Flora_2";
_c pushBack "CUP_U_O_RUS_VSR93_MSV";
_c pushBack "CUP_U_O_RUS_VSR93_MSV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR93_worn_MSV";
_c pushBack "CUP_U_O_RUS_VSR93_worn_gloves_MSV";
_c pushBack "CUP_U_O_RUS_VSR93_worn_MSV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR98_MSV";
_c pushBack "CUP_U_O_RUS_VSR98_MSV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR98_worn_MSV";
_c pushBack "CUP_U_O_RUS_VSR98_worn_gloves_MSV";
_c pushBack "CUP_U_O_RUS_VSR98_worn_MSV_rolled_up";
_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV";
_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_gloves_pads";
_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_EMR_1_VDV";
_c pushBack "CUP_U_O_RUS_EMR_VDV_gloves_pads";
_c pushBack "CUP_U_O_RUS_EMR_2_VDV";
_c pushBack "CUP_U_O_RUS_EMR_VDV_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_KSOR_VDV";
_c pushBack "CUP_U_O_RUS_KSOR_VDV_gloves_pads";
_c pushBack "CUP_U_O_RUS_KSOR_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_KSOR_VDV_rolled_up_gloves_pads";
_c pushBack "CUP_U_O_RUS_Flora_1_VDV";
_c pushBack "CUP_U_O_RUS_Flora_3";
_c pushBack "CUP_U_O_RUS_Flora_2_VDV";
_c pushBack "CUP_U_O_RUS_VSR93_VDV";
_c pushBack "CUP_U_O_RUS_VSR93_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR93_VDV_rolled_up_gloves2";
_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV";
_c pushBack "CUP_U_O_RUS_VSR93_worn_gloves_VDV";
_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV_rolled_up_gloves2";
_c pushBack "CUP_U_O_RUS_VSR98_VDV";
_c pushBack "CUP_U_O_RUS_VSR98_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR98_VDV_rolled_up_gloves2";
_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV";
_c pushBack "CUP_U_O_RUS_VSR98_worn_gloves_VDV";
_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV_rolled_up";
_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV_rolled_up_gloves2";
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
_c pushBack "CUP_H_RUS_6B47_v2_BeigeDigital";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_BeigeDigital";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_BeigeDigital";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_BeigeDigital";
_c pushBack "CUP_H_RUS_6B47_v2_Desert";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Desert";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Desert";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Desert";
_c pushBack "CUP_H_RUS_6B47_v2_Summer";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Summer";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Summer";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Summer";
_c pushBack "CUP_H_RUS_6B47_v2_Winter";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Winter";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Winter";
_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Winter";
//others
_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital";
_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_goggles";
_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_headset_goggles";
_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_headset";
_c pushBack "CUP_H_RUS_6B27_cover";
_c pushBack "CUP_H_RUS_6B46";
_c pushBack "CUP_H_RUS_6B27_cover_headset_goggles";
_c pushBack "CUP_H_RUS_6B27_cover_headset";
_c pushBack "CUP_H_RUS_6B27_olive";
_c pushBack "CUP_H_RUS_6B27_NVG_olive";
_c pushBack "CUP_H_RUS_6B27";
_c pushBack "CUP_H_RUS_6B27_goggles";
_c pushBack "CUP_H_RUS_6B27_headset_goggles";
_c pushBack "CUP_H_RUS_6B27_headset";
_c pushBack "CUP_H_RUS_6B27_NVG";
_c pushBack "CUP_H_RUS_6B47_desert";
_c pushBack "CUP_H_RUS_6B47_goggles_desert";
_c pushBack "CUP_H_RUS_6B47_headset_goggles_desert";
_c pushBack "CUP_H_RUS_6B47_headset_desert";
_c pushBack "CUP_H_RUS_6B47";
_c pushBack "CUP_H_RUS_6B47_headset_goggles";
_c pushBack "CUP_H_RUS_6B47_headset";
_c pushBack "CUP_H_RUS_6B47_SF_headset_goggles_black";
_c pushBack "CUP_H_RUS_6B47_SF_headset_black";
_c pushBack "CUP_H_RUS_6B47_SF_headset_goggles_desert";
_c pushBack "CUP_H_RUS_6B47_SF_headset_desert";
_c pushBack "CUP_H_RUS_6B47_SF";
_c pushBack "CUP_H_RUS_6B47_SF_headset";
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
_c pushBack "CUP_V_O_SLA_Flak_Vest03";
_c pushBack "CUP_V_O_SLA_Flak_Vest01";
_c pushBack "CUP_V_O_SLA_Flak_Vest02";
_c pushBack "CUP_V_O_SLA_6B3_1_DES";
_c pushBack "CUP_V_O_SLA_6B3_1_URB";
_c pushBack "CUP_V_O_SLA_6B3_1_WDL";
_c pushBack "CUP_V_RUS_6B3_1";
_c pushBack "CUP_V_RUS_6B3_Flora_1";
_c pushBack "CUP_V_RUS_6B3_2";
_c pushBack "CUP_V_RUS_6B3_Flora_2";
_c pushBack "CUP_V_RUS_6B3_4";
_c pushBack "CUP_V_RUS_6B3_Flora_4";
_c pushBack "CUP_V_O_SLA_6B3_4_URB";
_c pushBack "CUP_V_O_SLA_6B3_4_DES";
_c pushBack "CUP_V_O_SLA_6B3_4_WDL";
_c pushBack "CUP_V_O_SLA_6B3_3_DES";
_c pushBack "CUP_V_O_SLA_6B3_3_URB";
_c pushBack "CUP_V_O_SLA_6B3_3_WDL";
_c pushBack "CUP_V_RUS_6B3_3";
_c pushBack "CUP_V_RUS_6B3_Flora_3";
_c pushBack "CUP_V_O_SLA_6B3_5_DES";
_c pushBack "CUP_V_O_SLA_6B3_5_URB";
_c pushBack "CUP_V_O_SLA_6B3_5_WDL";
_c pushBack "CUP_V_O_SLA_6B3_2_DES";
_c pushBack "CUP_V_O_SLA_6B3_2_URB";
_c pushBack "CUP_V_O_SLA_6B3_2_WDL";
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
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel";
_c pushBack "CUP_O_RUS_Patrol_bag_Green";
_c pushBack "CUP_O_RUS_Patrol_bag_Green_Shovel";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Ammo";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Medic";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_AAR";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Engineer";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Exp";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_HAT";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_ReconExp";
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Repair";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Ammo";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Medic";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_AAR";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Engineer";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Exp";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_HAT";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_ReconExp";
_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Repair";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Ammo";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Medic";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_AAR";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Engineer";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Exp";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_HAT";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_ReconExp";
_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Repair";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AAR";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AAT";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Ammo";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AT";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Engineer";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Exp";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_HAT";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Medic";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_ReconExp";
_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Repair";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_B_AGS30_Gun_Bag";
_c pushBack "CUP_B_AGS30_Tripod_Bag";
_c pushBack "CUP_B_DShkM_Gun_Bag";
_c pushBack "CUP_B_DShkM_TripodHigh_Bag";
_c pushBack "CUP_B_DShkM_TripodLow_Bag";
_c pushBack "CUP_B_Kord_Gun_Bag";
_c pushBack "CUP_B_Kord_Tripod_Bag";
_c pushBack "CUP_B_Metis_Gun_Bag";
_c pushBack "CUP_B_Metis_Tripod_Bag";
_c pushBack "CUP_B_Podnos_Gun_Bag";
_c pushBack "CUP_B_Podnos_Bipod_Bag";
_c pushBack "CUP_B_SPG9_Gun_Bag";
_c pushBack "CUP_B_SPG9_Tripod_Bag";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//----------------------------------------------Level 1--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_hgun_TT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "CUP_8Rnd_762x25_TT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(762*25)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_wood";
_c pushBack "CUP_arifle_AK12_VG_wood";
_c pushBack "CUP_arifle_AK12_AFG_wood";
_c pushBack "CUP_arifle_AK12_AFG_arid";
_c pushBack "CUP_arifle_AK12_AFG_lush";
_c pushBack "CUP_arifle_AK12_AFG_tan";
_c pushBack "CUP_arifle_AK12_AFG_snowtiger";
_c pushBack "CUP_arifle_AK12_AFG_tiger";
_c pushBack "CUP_arifle_AK12_AFG_bicolor";
_c pushBack "CUP_arifle_AK12_AFG_winter";
_c pushBack "CUP_arifle_AK12_arid";
_c pushBack "CUP_arifle_AK12_VG_arid";
_c pushBack "CUP_arifle_AK12_VG_lush";
_c pushBack "CUP_arifle_AK12_VG_tan";
_c pushBack "CUP_arifle_AK12_VG_snowtiger";
_c pushBack "CUP_arifle_AK12_VG_tiger";
_c pushBack "CUP_arifle_AK12_VG_bicolor";
_c pushBack "CUP_arifle_AK12_VG_winter";
_c pushBack "CUP_arifle_AK12_lush";
_c pushBack "CUP_arifle_AK12_tan";
_c pushBack "CUP_arifle_AK12_snowtiger";
_c pushBack "CUP_arifle_AK12_tiger";
_c pushBack "CUP_arifle_AK12_bicolor";
_c pushBack "CUP_arifle_AK12_winter";
_c pushBack "CUP_arifle_AK12_GP34_wood";
_c pushBack "CUP_arifle_AK12_GP34_arid";
_c pushBack "CUP_arifle_AK12_GP34_lush";
_c pushBack "CUP_arifle_AK12_GP34_tan";
_c pushBack "CUP_arifle_AK12_GP34_snowtiger";
_c pushBack "CUP_arifle_AK12_GP34_tiger";
_c pushBack "CUP_arifle_AK12_GP34_bicolor";
_c pushBack "CUP_arifle_AK12_GP34_winter";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
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
};

_c pushBack "CUP_30Rnd_545x39_AK74M_camo_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_camo_M";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_camo_M";
_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_camo_M";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_camo_M";
_c pushBack "CUP_30Rnd_545x39_AK74M_desert_M";
_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_desert_M";
_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_desert_M";
_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_desert_M";
_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_desert_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
	_c pushBack "CUP_arifle_RPK74_45";
	_c pushBack "CUP_arifle_RPK74_45_top_rail";
	_c pushBack "CUP_arifle_RPK74M";
	_c pushBack "CUP_arifle_RPK74M_top_rail";
	_c pushBack "CUP_arifle_RPK74M_railed";
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _u;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
	};

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
	_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
	_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M";
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _u;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
	};

	_c pushBack "CUP_srifle_SVD";
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

	_c pushBack "CUP_10Rnd_762x54_SVD_M";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
	_c pushBack "CUP_optic_PSO_1";
	_c pushBack "CUP_optic_PSO_1_1_open";
	_c pushBack "CUP_optic_PSO_1_1";
};
_c pushBack "CUP_optic_PSO_1_AK";
_c pushBack "CUP_optic_PSO_1_AK_open";
_c pushBack "CUP_optic_1P87_1P90_BLK";
_c pushBack "CUP_optic_PechenegScope";
_c pushBack "CUP_optic_NSPU_RPG";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_muzzle_snds_KZRZP_SVD";
_c pushBack "CUP_muzzle_snds_KZRZP_SVD_desert";
_c pushBack "CUP_muzzle_snds_KZRZP_SVD_woodland";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_SVD_camo_d";
_c pushBack "CUP_SVD_camo_g";
_c pushBack "CUP_SVD_camo_d_half";
_c pushBack "CUP_SVD_camo_g_half";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_lmg_Pecheneg";
_c pushBack "CUP_lmg_Pecheneg_B50_vfg";
_c pushBack "CUP_lmg_Pecheneg_desert";
_c pushBack "CUP_lmg_Pecheneg_top_rail";
_c pushBack "CUP_lmg_Pecheneg_top_rail_B50_vfg";
_c pushBack "CUP_lmg_Pecheneg_woodland";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
	_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
	_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
	_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M";
	_c pushBack "150Rnd_762x54_Box";
	_c pushBack "150Rnd_762x54_Box_Tracer";
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _u;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);
	};

	_c pushBack "CUP_optic_PechenegScope";
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
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_RPG26";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut_Green";
_c pushBack "CUP_V_RUS_6B45_4";
_c pushBack "CUP_V_RUS_6B45_4_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Green";
_c pushBack "CUP_V_RUS_6B45_2_BeigeDigital";
_c pushBack "CUP_V_RUS_6B45_2";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut";
_c pushBack "CUP_V_RUS_6B45_3_BeigeDigital";
_c pushBack "CUP_V_RUS_6B45_3";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117";
_c pushBack "CUP_V_RUS_6B45_1_BeigeDigital";
_c pushBack "CUP_V_RUS_6B45_1";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//----------------------------------------------Level 2--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_hgun_PB6P9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_c pushBack "CUP_8Rnd_9x18_MakarovSD_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_PB6P9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_arifle_AS_VAL";
_c pushBack "CUP_arifle_AS_VAL_flash";
_c pushBack "CUP_arifle_AS_VAL_VFG";
_c pushBack "CUP_arifle_AS_VAL_top_rail";
_c pushBack "CUP_arifle_AS_VAL_flash_top";
_c pushBack "CUP_arifle_AS_VAL_VFG_top_rail";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "CUP_10Rnd_9x39_SP5_VSS_M";
_c pushBack "CUP_20Rnd_9x39_SP5_VSS_M";
_c pushBack "CUP_30Rnd_9x39_SP5_VIKHR_M";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON < 1) then {				//already defined in CWr3 mod
	_c pushBack "CUP_launch_Igla";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "CUP_launch_Metis";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_AT13_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
//vests
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_full";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_BeigeDigital";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Green";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Desert";
_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_CUP_SOV.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _i, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_CUP_SOV.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
