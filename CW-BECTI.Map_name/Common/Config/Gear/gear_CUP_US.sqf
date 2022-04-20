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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

if(CTI_CWR3_ADDON > 0) then {				//already defined in CWr3 mod
	_c pushBack "CUP_HandGrenade_M67";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_HE_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_HEDP_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarCluster_White_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarCluster_Red_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarCluster_Green_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarFlare_White_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarFlare_Red_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_StarFlare_Green_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_FlareWhite_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_FlareGreen_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_FlareRed_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_FlareYellow_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_Smoke_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_SmokeRed_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_SmokeGreen_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_1Rnd_SmokeYellow_M203";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------------------------------------------------------------------------------------//
//										Other Items																			//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON > 0) then {				//already defined in CWr3 mod
	_c pushBack "Binocular";
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
};

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



_c pushBack "CUP_NVG_PVS14";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "cup_vector21nite";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "B_UavTerminal";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//															Weapons															//
//--------------------------------------------------------------------------------------------------------------------------//
if(CTI_CWR3_ADDON > 0) then {				//already defined in CWr3 mod
	_c pushBack "CUP_hgun_M9";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_hgun_M9A1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_15Rnd_9x19_M9";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,15,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "CUP_sgun_M1014";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_sgun_M1014_vfg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_sgun_M1014_solidstock";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_sgun_M1014_Entry";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_sgun_M1014_Entry_vfg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No00_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No0_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No1_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No2_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No3_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No4_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Pellets_No4_Bird";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_Slug";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_8Rnd_12Gauge_HE";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No00_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No0_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No1_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No2_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No3_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No4_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Pellets_No4_Bird";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_Slug";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_6Rnd_12Gauge_HE";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,6] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No00_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No0_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No1_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No2_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No3_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No4_Buck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Pellets_No4_Bird";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_Slug";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_1Rnd_12Gauge_HE";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,1] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_smg_MP5A5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_smg_MP5A5_Rail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_smg_MP5A5_Rail_AFG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_smg_MP5A5_Rail_VFG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_smg_MP5SD6";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_9x19_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Green_Tracer_9x19_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Red_Tracer_9x19_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Yellow_Tracer_9x19_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_30Rnd_Subsonic_9x19_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);




_c pushBack "CUP_arifle_M4A1_desert_carryhandle";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_camo_carryhandle";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_GL_carryhandle_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_GL_carryhandle_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_short_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_BUIS_GL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

if(CTI_CWR3_ADDON > 0) then {				//already defined in CWr3 mod
	_c pushBack "cup_30rnd_556x45_stanag";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};
/* Vanilla ammo
_c pushBack "30Rnd_556x45_Stanag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_red";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Tracer_Red";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Tracer_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Tracer_Yellow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
*/


_c pushBack "CUP_launch_M136";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_acc_ANPEQ_2_Black_Top";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_M9";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_fh_MP5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "muzzle_snds_L";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_optic_CompM2_low";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//															Wearables														//
//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_U_B_USArmy_TwoKnee";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_Base";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_Soft";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_UBACS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Gloves_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Gloves_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Gloves_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_Rolled_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Kneepad_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_Gloves_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_Gloves_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_Gloves_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_Rolled_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USArmy_ACU_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_2_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_2_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_2_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_roll_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG1_DMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG1_WMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG2_DMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG2_WMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG3_DMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG3_WMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG4_DMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_FROG4_WMARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_2_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_2_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_2_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des_roll_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_2_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_2_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_2_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_pads";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_MCCUU_roll_pads_gloves";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													Helmets																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_H_LWHv2_MARPAT_des";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_des_comms";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_des_NVG_gog_cov2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_des_NVG_gog2_cov2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_des_cov_fr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_des_comms_cov_fr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_comms";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_NVG_gog_cov2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_NVG_gog2_cov2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_cov_fr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_LWHv2_MARPAT_comms_cov_fr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_Headset_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_Headset_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_Headset_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_Headset_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_GCOVERED_Headset_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_ESS_Headset_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_H_USArmy_HelmetACH_Headset_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													Vests																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_V_B_Eagle_SPC_AT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_AR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Corpsman";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Crew";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Empty";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_GL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_MG";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Officer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Patrol";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_RTO";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Rifleman";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_Scout";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_SL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_Eagle_SPC_TL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_Empty_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_Empty_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_Empty_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_Grenadier_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_Grenadier_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_Grenadier_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_MG_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_MG_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_MG_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_Medic_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_Medic_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_Medic_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_Rifleman_Deltoid_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_Rifleman_Deltoid_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_Rifleman_Deltoid_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_Rifleman_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_Rifleman_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_Rifleman_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_SAW_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_SAW_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_SAW_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_SL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_SL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_SL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OCP_TL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_OEFCP_TL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_V_B_IOTV_UCP_TL_USArmy";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//													Backpacks																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_B_USMC_AssaultPack";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_Assault_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_Assault_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_Assault_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------------------------------Level 1--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_arifle_M4A1_MOE_short_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_short_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_short_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_short_wdl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_short_dsrt";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_short_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_short_wdl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_MOE_wdl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_dsrt";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_winter";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_standard_wdl";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_BUIS_desert_GL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_BUIS_camo_GL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_ctrgt";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_ctrg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_hex";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_snow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_ctrgt";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_ctrg";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_tan";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_hex";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_snow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A1_SOMMOD_Grip_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand_red";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand_Tracer_Red";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand_Tracer_Green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "30Rnd_556x45_Stanag_Sand_Tracer_Yellow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,30,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);


if(CTI_CWR3_ADDON > 0) then {				//already defined in CWr3 mod
	_c pushBack "CUP_lmg_m249_SQuantoon";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_pip1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_pip3";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_pip4";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_M249_E1";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_M249_E2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_pip2";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_para";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_lmg_m249_para_gl";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_100Rnd_TE4_Green_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_100Rnd_TE4_Red_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_200Rnd_TE4_Green_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);

	_c pushBack "CUP_200Rnd_TE1_Red_Tracer_556x45_M249";
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,200,(556*45)] call CTI_CO_FNC_GetCalculatedItemPrize);
};


_c pushBack "CUP_lmg_M240_norail";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_M240_B";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_lmg_M240";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,100,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x51_Box";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,150,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "150Rnd_762x51_Box_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,150,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_srifle_M14";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M14_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_762x51_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_White_Tracer_762x51_DMR";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_launch_Mk153Mod0";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_launch_Mk153Mod0_blk";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_HEAA_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_HEDP_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_NE_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_SMAW_Spotting";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,30] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_launch_MAAWS";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_MAAWS_HEAT_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_MAAWS_HEDP_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_acc_ANPEQ_2_grey";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_bipod_Harris_1A2_L_BLK";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_muzzle_snds_M14";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_optic_MAAWS_Scope";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_ElcanM145";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_LeupoldMk4";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Backpacks																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_B_USPack_AT_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USPack_AT_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USMC_AssaultPack_SMAW";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USArmy_Engineer_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USPack_Black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USPack_Coyote";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_IIID_OCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_IIID_OEFCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_US_IIID_UCP";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USMC_MOLLE";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_B_USMC_MOLLE_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);


//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------------------------------Level 2--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_arifle_M4A3_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A3_desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_arifle_M4A3_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_srifle_M40A3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//_c pushBack "CUP_1Rnd_762x51_CZ584";
//_u pushBack _tech_level;
//_p pushBack round ((1*762*51)/100000)*((CTI_ECONOMY_PRIZE_WEAPONS*(_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/10000);

_c pushBack "CUP_5Rnd_762x51_M24";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,5,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);



_c pushBack "CUP_srifle_m110_kac_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M110_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M110_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_m110_kac";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_m110_kac_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_762x51_B_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Red_Tracer_762x51_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_Green_Tracer_762x51_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_TE1_White_Tracer_762x51_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_20Rnd_762x51_L129_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,20,(762*51)] call CTI_CO_FNC_GetCalculatedItemPrize);


//FGM-148 Javelin Family	Anti-tank missile launcher Guided
_c pushBack "CUP_launch_Javelin";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Javelin_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


//FIM-92 Stinger Family		Surface-to-air missile launcher Guided
_c pushBack "CUP_launch_FIM92Stinger";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Stinger_M";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,300] call CTI_CO_FNC_GetCalculatedItemPrize);


//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_Mxx_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_Mxx_camo_half";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_M110_black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_M110";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_snds_M110_woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_optic_AN_PVS_10";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_bipod_VLTOR_Modpod";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_U_B_USArmy_Ghillie";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_U_B_USMC_Ghillie_WDL";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------------------------------Level 3--------------------------------------------------------------//
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_c pushBack "CUP_srifle_M107_Base";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M107_Pristine";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M107_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M107_Snow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_srifle_M107_Woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_10Rnd_127x99_M107";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.5,10,(1270*99)] call CTI_CO_FNC_GetCalculatedItemPrize);

//--------------------------------------------------------------------------------------------------------------------------//
//										Attachments																			//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "CUP_acc_ANPEQ_2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_muzzle_mfsup_Suppressor_M107_Black";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Suppressor_M107_Desert";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Suppressor_M107_Grey";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Suppressor_M107_Snow";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_muzzle_mfsup_Suppressor_M107_Woodland";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "CUP_optic_LeupoldMk4_25x50_LRT";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_AN_PAS_13c2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "CUP_optic_AN_PAS_13c1";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

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
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_CUP_US.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
