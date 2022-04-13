private ["_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt"];

_side = _this;
_upgrade_levels = [];
_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,1,1,1,1,3,4,CTI_ECONOMY_LEVEL_GEAR]; 
};

_c = [];
_u = [];
_p = [];

//(CTI_ECONOMY_PRIZE_WEAPONS*_level_start)
//100*1 -> $100 weapon
//((rnds*caliber)/1000)*((CTI_ECONOMY_PRIZE_WEAPONS*_level_start)/100)
//((30*545)/1000)*(100*1/100) = $16,35 -> ammo
/*
_c pushBack "";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "";
_u pushBack _tech_level;
_p pushBack round ((rnds*caliber)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);
*/
//--------------------------------------------------------------------------------------------------------------------------//
//													Basic Stuff																//
//--------------------------------------------------------------------------------------------------------------------------//
//													Grenade and Mines														//
//--------------------------------------------------------------------------------------------------------------------------//
_matrix_full = [_side, CTI_UPGRADE_GEAR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_HandGrenade_RGD5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_HandGrenade_RGO";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_HE_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_IlumFlareWhite_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_IlumFlareRed_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_IlumFlareGreen_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_FlareWhite_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_FlareGreen_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_FlareRed_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_FlareYellow_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_SMOKE_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_SmokeRed_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_SmokeGreen_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_SmokeYellow_GP25_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Other Items																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_NVG_1PN138";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Binocular";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

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

_c pushBack "O_UavTerminal";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "MineDetector";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "ItemMap";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "itemradio";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "itemcompass";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "itemwatch";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "FirstAidKit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Toolkit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Medikit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//															Weapons															//
//--------------------------------------------------------------------------------------------------------------------------//
//AK 47 main weapon, AKM slightly lighter
//AK 74 better precision
//AK 101 (90s)
//AK 105 (2k)
//AK 107 (2010)
_c pushBack "CUP_arifle_AK12_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK12_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK12_Grey_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Grey_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK12_Green_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Green_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK12_Tan_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK12_Tan_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_RPG7V";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_PG7V_M";//Monoblock-Hohlladung		R=300	P=280
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_PG7VM_M";//Monoblock-Hohlladung		R=500	P=300–330
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_PG7VL_M";//Monoblock-Hohlladung		R=300	P=500–550
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_PG7VR_M";//Tandemhohlladung			R=200	P=600–700
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_OG7_M";//Splitter					R=1000	P= -
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_TBG7V_M";//Thermobar					R=300	P= -
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "RPG7_F";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_optic_1P87_RIS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_OKP_7_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PGO7V";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PGO7V2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PGO7V3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
//uniforms used
_c pushBack "CUP_U_O_RUS_Ratnik_Autumn";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ratnik_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ratnik_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ratnik_Pink";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ratnik_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ratnik_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
//other uniforms
_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_BeigeDigital_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_BeigeDigital_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_EMR_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_Pink_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_MSV_Pink_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_BeigeDigital_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_BeigeDigital_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_Pink_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Soldier_VKPO_VDV_Pink_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Commander";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Ghillie";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_MSV_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Flora_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Flora_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_MSV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_gloves_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_MSV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_MSV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_gloves_MSV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_MSV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_BeigeDigital_VDV_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_1_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_VDV_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_2_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_EMR_VDV_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_KSOR_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_KSOR_VDV_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_KSOR_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_KSOR_VDV_rolled_up_gloves_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Flora_1_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Flora_3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_Flora_2_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_VDV_rolled_up_gloves2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_gloves_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR93_worn_VDV_rolled_up_gloves2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_VDV_rolled_up_gloves2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_gloves_VDV";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV_rolled_up";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_O_RUS_VSR98_worn_VDV_rolled_up_gloves2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													Helmets																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_H_RUS_6B47_v2_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesClosed_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesDown_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_v2_GogglesUp_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
//others
_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_headset_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover_BeigeDigital_headset";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B46";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover_headset_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_cover_headset";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_olive";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_NVG_olive";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_headset_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_headset";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B27_NVG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_goggles_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_headset_goggles_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_headset_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_headset_goggles";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_headset";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF_headset_goggles_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF_headset_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF_headset_goggles_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF_headset_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_RUS_6B47_SF_headset";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_V_O_SLA_Flak_Vest03";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_Flak_Vest01";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_Flak_Vest02";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_1_DES";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_1_URB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_1_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_Flora_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_Flora_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_Flora_4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_4_URB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_4_DES";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_4_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_3_DES";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_3_URB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_3_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B3_Flora_3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_5_DES";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_5_URB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_5_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_2_DES";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_2_URB";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_O_SLA_6B3_2_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Green_Shovel";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
//other
_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Ammo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_AAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Engineer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Exp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_HAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_ReconExp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_BeigeDigital_Shovel_Repair";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Ammo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_AAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Engineer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Exp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_HAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_ReconExp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Desert_Shovel_Repair";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Ammo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_AAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Engineer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Exp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_HAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_ReconExp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Summer_Shovel_Repair";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AAR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Ammo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Engineer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Exp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_HAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Medic";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_ReconExp";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_O_RUS_Patrol_bag_Winter_Repair";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_B_AGS30_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_AGS30_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_DShkM_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_DShkM_TripodHigh_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_DShkM_TripodLow_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Kord_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Kord_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Metis_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Metis_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Podnos_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_Podnos_Bipod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_SPG9_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_SPG9_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,5.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------------------------------Level 1--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_arifle_AK12_wood";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_wood";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_wood";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_arid";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_lush";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_snowtiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_tiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_bicolor";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_AFG_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_arid";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_arid";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_lush";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_snowtiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_tiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_bicolor";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_VG_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_lush";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_snowtiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_tiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_bicolor";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_wood";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_arid";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_lush";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_snowtiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_tiger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_bicolor";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AK12_GP34_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Subsonic_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK74M_camo_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_camo_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_camo_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_camo_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_camo_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK74M_desert_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_desert_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_desert_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK_desert_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_desert_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_arifle_RPK74_45";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_RPK74_45_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_RPK74M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_RPK74M_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_RPK74M_railed";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Subsonic_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_White_Tracer_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74_plum_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,45,(545*39)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_srifle_SVD";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD_des_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD_wdl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_SVD_wdl_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_10Rnd_762x54_SVD_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_optic_1P87_1P90_BLK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PechenegScope";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PSO_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PSO_1_1_open";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_PSO_1_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_NSPU_RPG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_muzzle_snds_KZRZP_SVD";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_KZRZP_SVD_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_KZRZP_SVD_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_SVD_camo_d";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SVD_camo_g";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SVD_camo_d_half";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SVD_camo_g_half";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													MG																		//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_lmg_Pecheneg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_Pecheneg_B50_vfg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_Pecheneg_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_Pecheneg_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_Pecheneg_top_rail_B50_vfg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_Pecheneg_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x54_Box";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x54_Box_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100,(762*54)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_Black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_OD";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Flashhider_PK_Tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_KZRZP_PK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_KZRZP_PK_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_KZRZP_PK_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

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
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_4_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Full_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_2_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Del";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_3_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_1_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_RUS_6B45_1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);


//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------------------------------Level 2--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_hgun_PB6P9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_9x18_Makarov_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_9x18_MakarovSD_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*18)] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_muzzle_PB6P9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_arifle_AS_VAL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AS_VAL_flash";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AS_VAL_VFG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AS_VAL_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AS_VAL_flash_top";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_AS_VAL_VFG_top_rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_10Rnd_9x39_SP5_VSS_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_9x39_SP5_VSS_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_9x39_SP5_VIKHR_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30,(900*39)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//													AA+AT-Guns																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_launch_Igla";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);



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
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_full";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Full_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Del_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_VOG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Full";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Del_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Nut";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_BeigeDigital";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Vest_RUS_6B45_Sh117_PKP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);


//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_CUP_SOV.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
