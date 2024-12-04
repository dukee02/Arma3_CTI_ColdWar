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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

//--- Items
_c pushBack "BWA3_Vector";
_u pushBack 0;
_p pushBack round 100;

_c pushBack "BWA3_ItemNaviPad";
_u pushBack 0;
_p pushBack round 100;

//--------------------------------------------------------------------------------------------------------------------------//
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_DM25";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_DM32_Blue";
_c pushBack "BWA3_DM32_Green";
_c pushBack "BWA3_DM32_Orange";
_c pushBack "BWA3_DM32_Purple";
_c pushBack "BWA3_DM32_Red";
_c pushBack "BWA3_DM32_Yellow";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Pistols																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_P8";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_15Rnd_9x19_P8";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,15,(9*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles 															//
//--------------------------------------------------------------------------------------------------------------------------//
//-------Weapons + Ammo------------
_c pushBack "BWA3_G36A1";
_c pushBack "BWA3_G36A1_tan";
_c pushBack "BWA3_G36A1_AG40";
_c pushBack "BWA3_G36A1_AG40_tan";
_c pushBack "BWA3_G36A2";
_c pushBack "BWA3_G36A2_tan";
_c pushBack "BWA3_G36A2_AG40";
_c pushBack "BWA3_G36A2_AG40_tan";
_c pushBack "BWA3_G36A3";
_c pushBack "BWA3_G36A3_tan";
_c pushBack "BWA3_G36A3_AG40";
_c pushBack "BWA3_G36A3_AG40_tan";
_c pushBack "BWA3_G36KA0";
_c pushBack "BWA3_G36KA0_tan";
_c pushBack "BWA3_G36KA1";
_c pushBack "BWA3_G36KA1_tan";
_c pushBack "BWA3_G36KA2";
_c pushBack "BWA3_G36KA2_tan";
_c pushBack "BWA3_G36KA3";
_c pushBack "BWA3_G36KA3_tan";
_c pushBack "BWA3_G36KA4";
_c pushBack "BWA3_G36KA4_tan";
_c pushBack "BWA3_G38";
_c pushBack "BWA3_G38_tan";
_c pushBack "BWA3_G38_AG40";
_c pushBack "BWA3_G38_AG40_tan";
_c pushBack "BWA3_G38C";
_c pushBack "BWA3_G38C_tan";
_c pushBack "BWA3_G38K";
_c pushBack "BWA3_G38K_tan";
_c pushBack "BWA3_G38K_AG40";
_c pushBack "BWA3_G38K_AG40_tan";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "BWA3_30Rnd_556x45_G36";
_c pushBack "BWA3_30Rnd_556x45_G36_Tracer";
_c pushBack "BWA3_30Rnd_556x45_G36_Tracer_Dim";
_c pushBack "BWA3_30Rnd_556x45_G36_SD";
_c pushBack "BWA3_30Rnd_556x45_G36_AP";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "BWA3_MG4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_200Rnd_556x45";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_200Rnd_556x45_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "BWA3_MP7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_40Rnd_46x30_MP7";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,40,(46*30)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_40Rnd_46x30_MP7_SD";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,40,(46*30)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "BWA3_P2A1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_1Rnd_Flare_Illum";
_c pushBack "BWA3_1Rnd_Flare_Singlestar_White";
_c pushBack "BWA3_1Rnd_Flare_Singlestar_Green";
_c pushBack "BWA3_1Rnd_Flare_Singlestar_Red";
_c pushBack "BWA3_1Rnd_Flare_Multistar_White";
_c pushBack "BWA3_1Rnd_Flare_Multistar_Green";
_c pushBack "BWA3_1Rnd_Flare_Multistar_Red";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns 																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_Bunkerfaust_Loaded";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav_Illum";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav_HE";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav_HEAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav_HEDP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_CarlGustav_Smoke";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//

if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active

} else {

};

_c pushBack "BWA3_Uniform_Crew_Fleck";
_c pushBack "BWA3_Uniform_Helipilot";
_c pushBack "BWA3_Uniform_Crew_Tropen";
_c pushBack "BWA3_Uniform2_Ghillie_Fleck";
_c pushBack "BWA3_Uniform2_Ghillie_Tropen";
_c pushBack "BWA3_Uniform2_Fleck";
_c pushBack "BWA3_Uniform2_sleeves_Fleck";
_c pushBack "BWA3_Uniform2_Tropen";
_c pushBack "BWA3_Uniform2_sleeves_Tropen";
_c pushBack "BWA3_Uniform_Ghillie_Fleck";
_c pushBack "BWA3_Uniform_Ghillie_Tropen";
_c pushBack "BWA3_Uniform_Fleck";
_c pushBack "BWA3_Uniform_sleeves_Fleck";
_c pushBack "BWA3_Uniform_tee_Fleck";
_c pushBack "BWA3_Uniform_Tropen";
_c pushBack "BWA3_Uniform_sleeves_Tropen";
_c pushBack "BWA3_Uniform_tee_Tropen";
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
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active

} else {

};
_c pushBack "BWA3_Vest_Fleck";
_c pushBack "BWA3_Vest_Grenadier_Fleck";
_c pushBack "BWA3_Vest_MachineGunner_Fleck";
_c pushBack "BWA3_Vest_Marksman_Fleck";
_c pushBack "BWA3_Vest_Medic_Fleck";
_c pushBack "BWA3_Vest_Rifleman_Fleck";
_c pushBack "BWA3_Vest_Leader_Fleck";
_c pushBack "BWA3_Vest_Tropen";
_c pushBack "BWA3_Vest_Grenadier_Tropen";
_c pushBack "BWA3_Vest_MachineGunner_Tropen";
_c pushBack "BWA3_Vest_Marksman_Tropen";
_c pushBack "BWA3_Vest_Medic_Tropen";
_c pushBack "BWA3_Vest_Rifleman_Tropen";
_c pushBack "BWA3_Vest_Leader_Tropen";
_c pushBack "BWA3_Vest_JPC_Radioman_Fleck";
_c pushBack "BWA3_Vest_JPC_Rifleman_Fleck";
_c pushBack "BWA3_Vest_JPC_Leader_Fleck";
_c pushBack "BWA3_Vest_JPC_Radioman_Tropen";
_c pushBack "BWA3_Vest_JPC_Rifleman_Tropen";
_c pushBack "BWA3_Vest_JPC_Leader_Tropen";
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
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active
	_c pushBack "BWA3_AssaultPack_Tropen";
	_c pushBack "BWA3_Carryall_Tropen";
	_c pushBack "BWA3_FieldPack_Tropen";
	_c pushBack "BWA3_Kitbag_Tropen";
	_c pushBack "BWA3_Kitbag_Tropen_Medic";
	_c pushBack "BWA3_PatrolPack_Tropen";
	_c pushBack "BWA3_TacticalPack_Tropen";
	_c pushBack "BWA3_TacticalPack_Tropen_Medic";
} else {
	_c pushBack "BWA3_AssaultPack_Fleck";
	_c pushBack "BWA3_Carryall_Fleck";
	_c pushBack "BWA3_FieldPack_Fleck";
	_c pushBack "BWA3_Kitbag_Fleck";
	_c pushBack "BWA3_Kitbag_Fleck_Medic";
	_c pushBack "BWA3_PatrolPack_Fleck";
	_c pushBack "BWA3_TacticalPack_Fleck";
	_c pushBack "BWA3_TacticalPack_Fleck_Medic";
};
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Helms																	//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active
	_c pushBack "BWA3_CrewmanKSK_Tropen";
	_c pushBack "BWA3_CrewmanKSK_Tropen_Headset";
	_c pushBack "BWA3_M92_Tropen";
	_c pushBack "BWA3_OpsCore_Tropen";
	_c pushBack "BWA3_OpsCore_Tropen_Camera";
	_c pushBack "BWA3_OpsCore_Tropen_Patch";
} else {
	_c pushBack "BWA3_CrewmanKSK_Fleck";
	_c pushBack "BWA3_CrewmanKSK_Fleck_Headset";
	_c pushBack "BWA3_M92_Fleck";
	_c pushBack "BWA3_OpsCore_Fleck";
	_c pushBack "BWA3_OpsCore_Fleck_Camera";
	_c pushBack "BWA3_OpsCore_Fleck_Patch";
};
_c pushBack "BWA3_CrewmanKSK";
_c pushBack "BWA3_CrewmanKSK_Headset";
_c pushBack "BWA3_Knighthelm";
_c pushBack "BWA3_OpsCore";
_c pushBack "BWA3_OpsCore_Camera";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "BWA3_Beret_Falli";
_c pushBack "BWA3_Beret_HFlieger";
_c pushBack "BWA3_Beret_Jaeger";
_c pushBack "BWA3_Beret_PzAufkl";
_c pushBack "BWA3_Beret_PzGren";
_c pushBack "BWA3_Beret_Pz";
_c pushBack "BWA3_Beret_Wach_blue";
_c pushBack "BWA3_Beret_Wach_green";
if(CTI_CAMO_ACTIVATION == 2) then {//desert camo active
	_c pushBack "BWA3_Booniehat_Fleck";
} else {
	_c pushBack "BWA3_Booniehat_Tropen";
};
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
_c pushBack "BWA3_G_Combat_black";
_u pushBack 0;
_p pushBack round 50;

_c pushBack "BWA3_G_Combat_clear";
_u pushBack 0;
_p pushBack round 50;

_c pushBack "BWA3_G_Combat_orange";
_u pushBack 0;
_p pushBack round 50;

//--------------------------------------------------------------------------------------------------------------------------//
//													Optics																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_optic_PMII_ShortdotCC";
_c pushBack "BWA3_optic_PMII_DMR";
_c pushBack "BWA3_optic_PMII_DMR_MicroT1_front";
_c pushBack "BWA3_optic_PMII_DMR_MicroT1_rear";
_c pushBack "BWA3_optic_M5Xi_MSR";
_c pushBack "BWA3_optic_M5Xi_MSR_MicroT2";
_c pushBack "BWA3_optic_M5Xi_Tremor3";
_c pushBack "BWA3_optic_M5Xi_Tremor3_MicroT2";
_c pushBack "BWA3_optic_Hensoldt";
_c pushBack "BWA3_optic_CompM2";
_c pushBack "BWA3_optic_CompM2_tan";
_c pushBack "BWA3_optic_MicroT1";
_c pushBack "BWA3_optic_MicroT2";
_c pushBack "BWA3_optic_EOTech552";
_c pushBack "BWA3_optic_EOTech552_tan";
_c pushBack "BWA3_optic_EOTech";
_c pushBack "BWA3_optic_EOTech_sand";
_c pushBack "BWA3_optic_EOTech_sand_Mag_Off";
_c pushBack "BWA3_optic_EOTech_Mag_Off";
_c pushBack "BWA3_optic_RSAS";
_c pushBack "BWA3_optic_RSAS_brown";
_c pushBack "BWA3_optic_RSAS_sand";
_c pushBack "BWA3_optic_RSAS_tan";
_c pushBack "BWA3_optic_ZO4x30";
_c pushBack "BWA3_optic_ZO4x30_brown";
_c pushBack "BWA3_optic_ZO4x30_rsas_brown_pip";
_c pushBack "BWA3_optic_ZO4x30_MicroT2";
_c pushBack "BWA3_optic_ZO4x30_MicroT2_brown";
_c pushBack "BWA3_optic_ZO4x30_RSAS";
_c pushBack "BWA3_optic_ZO4x30_RSAS_brown";
_c pushBack "BWA3_optic_ZO4x30i";
_c pushBack "BWA3_optic_ZO4x30i_MicroT2";
_c pushBack "BWA3_optic_ZO4x30i_MicroT2_sand";
_c pushBack "BWA3_optic_ZO4x30i_RSAS";
_c pushBack "BWA3_optic_ZO4x30i_RSAS_sand";
_c pushBack "BWA3_optic_ZO4x30i_sand";
_c pushBack "BWA3_optic_NSA80";
_c pushBack "BWA3_optic_CarlGustav";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Attachments																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_acc_VarioRay_irlaser_black";
_c pushBack "BWA3_acc_VarioRay_irlaser";
_c pushBack "BWA3_acc_LLM01_irlaser";
_c pushBack "BWA3_acc_LLM01_irlaser_tan";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Muzzle																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_muzzle_snds_Rotex_Monoblock";
_c pushBack "BWA3_muzzle_snds_Rotex_IIA";
_c pushBack "BWA3_muzzle_snds_QDSS";
_c pushBack "BWA3_muzzle_snds_QDSS_tan";
_c pushBack "BWA3_muzzle_snds_Rotex_IIIC";
_c pushBack "BWA3_muzzle_snds_Rotex_IIIC_tan";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Bipods																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_bipod_Harris";
_c pushBack "BWA3_bipod_Harris_tan";
_c pushBack "BWA3_bipod_Atlas";
_c pushBack "BWA3_bipod_MG3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Grenades																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_DM51A1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Assault Rifles															//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_G27";
_c pushBack "BWA3_G27_tan";
_c pushBack "BWA3_G27_AG40";
_c pushBack "BWA3_G27_AG40_tan";
_c pushBack "BWA3_G28";
_c pushBack "BWA3_G28_Patrol";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "BWA3_10Rnd_762x51_G28";
_c pushBack "BWA3_10Rnd_762x51_G28_Tracer";
_c pushBack "BWA3_10Rnd_762x51_G28_Tracer_Dim";
_c pushBack "BWA3_10Rnd_762x51_G28_SD";
_c pushBack "BWA3_10Rnd_762x51_G28_AP";
_c pushBack "BWA3_10Rnd_762x51_G28_LR";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "BWA3_20Rnd_762x51_G28";
_c pushBack "BWA3_20Rnd_762x51_G28_Tracer";
_c pushBack "BWA3_20Rnd_762x51_G28_Tracer_Dim";
_c pushBack "BWA3_20Rnd_762x51_G28_SD";
_c pushBack "BWA3_20Rnd_762x51_G28_AP";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG 																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_MG3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_120Rnd_762x51_soft";
_c pushBack "BWA3_120Rnd_762x51_Tracer_soft";
_c pushBack "BWA3_120Rnd_762x51";
_c pushBack "BWA3_120Rnd_762x51_Tracer";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,120,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns 																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_Fliegerfaust";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_Fliegerfaust_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_PzF3_Tandem_Loaded";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------//
//													Rifles 																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_G29";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_10Rnd_86x70_G29";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,10,(86*70)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_10Rnd_86x70_G29_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,10,(86*70)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "BWA3_G82";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_10Rnd_127x99_G82";
_c pushBack "BWA3_10Rnd_127x99_G82_Tracer";
_c pushBack "BWA3_10Rnd_127x99_G82_Tracer_Dim";
_c pushBack "BWA3_10Rnd_127x99_G82_SD";
_c pushBack "BWA3_10Rnd_127x99_G82_AP";
_c pushBack "BWA3_10Rnd_127x99_G82_AP_Tracer";
_c pushBack "BWA3_10Rnd_127x99_G82_Raufoss";
_c pushBack "BWA3_10Rnd_127x99_G82_Raufoss_Tracer";
_c pushBack "BWA3_10Rnd_127x99_G82_Raufoss_Tracer_Dim";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,10,(127*99)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													MG 																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_MG5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "BWA3_120Rnd_762x51_soft";
_c pushBack "BWA3_120Rnd_762x51_Tracer_soft";
_c pushBack "BWA3_120Rnd_762x51";
_c pushBack "BWA3_120Rnd_762x51_Tracer";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,120,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													AT Guns 																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_RGW90_Loaded";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Explosives 																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWA3_DM31AT_Mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,200] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_BW_BWA3.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_BW_BWA3.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
