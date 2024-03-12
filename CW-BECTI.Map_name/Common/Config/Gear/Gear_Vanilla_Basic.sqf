private ["_faction", "_c", "_p", "_side", "_u", "_tech_level", "_cost", "_upgrade_levels", "_matrix_full", "_matrix_nation", "_matrix_cnt", "_cntstart", "_cntend"];
//deprecated file, use and may change Gear_Basic.sqf instead!
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

//-------Weapons + Ammo------------


//--------MG-------------


//----------AT Guns-------------------------


//-------GL-Ammo-----------------------

_c pushBack "1Rnd_HE_Grenade_shell";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "UGL_FlareWhite_F";
_c pushBack "UGL_FlareGreen_F";
_c pushBack "UGL_FlareRed_F";
_c pushBack "UGL_FlareYellow_F";
_c pushBack "UGL_FlareCIR_F";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};

_c pushBack "1Rnd_Smoke_Grenade_shell";
_c pushBack "1Rnd_SmokeRed_Grenade_shell";
_c pushBack "1Rnd_SmokeGreen_Grenade_shell";
_c pushBack "1Rnd_SmokeYellow_Grenade_shell";
_c pushBack "1Rnd_SmokePurple_Grenade_shell";
_c pushBack "1Rnd_SmokeBlue_Grenade_shell";
_c pushBack "1Rnd_SmokeOrange_Grenade_shell";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};


//---------Grenades-----------------------------

_c pushBack "MiniGrenade";
_c pushBack "HandGrenade";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};

//---------Smoke/Flare-------------------------
_c pushBack "SmokeShell";
_c pushBack "SmokeShellRed";
_c pushBack "SmokeShellGreen";
_c pushBack "SmokeShellYellow";
_c pushBack "SmokeShellPurple";
_c pushBack "SmokeShellBlue";
_c pushBack "SmokeShellOrange";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,10] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};

_c pushBack "FlareWhite_F";
_c pushBack "FlareGreen_F";
_c pushBack "FlareRed_F";
_c pushBack "FlareYellow_F";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};



//--- Uniforms


//--- Vests


//--- Backpacks


/*
//--- Attachments
_c pushBack "optic_ACO_grn";
_c pushBack "optic_Aco";
_c pushBack "optic_ACO_grn_smg";
_c pushBack "optic_Aco_smg";
_c pushBack "optic_AMS";
_c pushBack "optic_AMS_khk";
_c pushBack "optic_AMS_snd";
_c pushBack "optic_Arco";
_c pushBack "optic_Arco_blk_F";
_c pushBack "optic_Arco_ghex_F";
_c pushBack "optic_DMS";
_c pushBack "optic_DMS_ghex_F";
_c pushBack "optic_ERCO_blk_F";
_c pushBack "optic_ERCO_khk_F";
_c pushBack "optic_ERCO_snd_F";
_c pushBack "optic_KHS_blk";
_c pushBack "optic_KHS_hex";
_c pushBack "optic_KHS_old";
_c pushBack "optic_KHS_tan";
_c pushBack "optic_LRPS";
_c pushBack "optic_LRPS_ghex_F";
_c pushBack "optic_LRPS_tna_F";
_c pushBack "optic_Holosight";
_c pushBack "optic_Holosight_blk_F";
_c pushBack "optic_Holosight_khk_F";
_c pushBack "optic_Holosight_smg";
_c pushBack "optic_Holosight_smg_blk_F";
_c pushBack "optic_Holosight_smg_khk_F";
_c pushBack "optic_SOS";
_c pushBack "optic_SOS_khk_F";
_c pushBack "optic_MRCO";
_c pushBack "optic_Nightstalker";
_c pushBack "optic_NVS";
_c pushBack "optic_Hamr";
_c pushBack "optic_Hamr_khk_F";
_c pushBack "optic_tws";
_c pushBack "optic_tws_mg";
_c pushBack "optic_Yorris";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};*/

/*
_c pushBack "acc_flashlight";
_c pushBack "acc_pointer_IR";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};


_c pushBack "muzzle_snds_338_black";
_c pushBack "muzzle_snds_338_green";
_c pushBack "muzzle_snds_338_sand";
_c pushBack "muzzle_snds_B_khk_F";
_c pushBack "muzzle_snds_B_snd_F";
_c pushBack "muzzle_snds_B";
_c pushBack "muzzle_snds_M";
_c pushBack "muzzle_snds_m_khk_F";
_c pushBack "muzzle_snds_m_snd_F";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.33] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};

_c pushBack "bipod_03_F_blk";
_c pushBack "bipod_02_F_blk";
_c pushBack "bipod_01_F_blk";
_c pushBack "bipod_02_F_hex";
_c pushBack "bipod_01_F_khk";
_c pushBack "bipod_01_F_mtp";
_c pushBack "bipod_03_F_oli";
_c pushBack "bipod_01_F_snd";
_c pushBack "bipod_02_F_tan";

//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
_cost = [CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack _cost;
};
*/
//--- Helms


//--- Glasses
_c pushBack "g_goggles_vr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.1] call CTI_CO_FNC_GetCalculatedItemPrize);

//--- Items
if(_side == west) then {
	_c pushBack "NVGoggles";
	_u pushBack 2;
	_p pushBack 500;
} else {
	_c pushBack "NVGoggles_OPFOR";
	_u pushBack 2;
	_p pushBack 500;
};

if(_side == west) then {
	_c pushBack "Laserdesignator";
	_u pushBack 3;
	_p pushBack 1000;
} else {
	_c pushBack "Laserdesignator_02";
	_u pushBack 3;
	_p pushBack 1000;
};

_c pushBack "Laserbatteries";
_u pushBack 3;
_p pushBack 50;

_c pushBack "ItemGPS";
_u pushBack 2;
_p pushBack 100;

if(_side == west) then {
	_c pushBack "B_UavTerminal";
	_u pushBack 3;
	_p pushBack 1500;
} else {
	_c pushBack "O_UavTerminal";
	_u pushBack 3;
	_p pushBack 1500;
};

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

_c pushBack "FirstAidKit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Toolkit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_c pushBack "Medikit";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
