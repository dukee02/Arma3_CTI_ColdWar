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
_matrix_nation = [_side, CTI_UPGRADE_GEAR, CTI_BW_ID, CTI_BWADD_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

//--------------------------------------------------------------------------------------------------------------------------//
//													Items																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "dsk_nsv";
_u pushBack 0;
_p pushBack round 100;

//--------------------------------------------------------------------------------------------------------------------------//
//													Rifles																	//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "BWAdd_G36A1";
_c pushBack "BWAdd_G36A1_AG40";
_c pushBack "BWAdd_G36A2";
_c pushBack "BWAdd_G36A2_AG40";
_c pushBack "BWAdd_G36";
_c pushBack "BWAdd_G36_AG";
_c pushBack "BWAdd_G36KA0";
_c pushBack "BWAdd_G36KA1";
_c pushBack "BWAdd_G36KA2";
_c pushBack "BWAdd_G36K";
_c pushBack "BWAdd_G36KA4";
_c pushBack "BWAdd_G38";
_c pushBack "BWAdd_G38_AG";
_c pushBack "BWAdd_G38C";
_c pushBack "BWAdd_G38K";
_c pushBack "BWAdd_G38K_AG";

_c pushBack "BWAdd_MG4";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//--------------------------------------------------------------------------------------------------------------------------//
//													Uniforms																//
//--------------------------------------------------------------------------------------------------------------------------//
_c pushBack "PzBrig17_Ghillie_Snow";
_c pushBack "PzBrig17_Uniform_Snow";
_c pushBack "TBW_U_Kampfanzug_Schnee";
_c pushBack "TBW_U_Retter";
_c pushBack "TBW_U_Kampfschwimmer_Fleck";
_c pushBack "TBW_U_Kampfschwimmer_Multi";
_c pushBack "PzBrig17_Ghillie_idz_Snow";
_c pushBack "PzBrig17_Uniform_idz_Snow";
_c pushBack "TBW_U_Marine_Pullover";
_c pushBack "TBW_U_Marine_Hemd_blau";
_c pushBack "TBW_U_Marine_Hemd_tropen";
_c pushBack "TBW_U_Taucher";
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
_c pushBack "TBW_Weste_Multi";
_c pushBack "TBW_Weste_schnee";
_c pushBack "TBW_TacVest_Multi";
_c pushBack "TBW_TacVest_schnee";
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
_c pushBack "BW_Backpack_compact_Flecktarn";
_c pushBack "TBW_AssaultPack_Fleck";
_c pushBack "TBW_AssaultPack_Multi";
_c pushBack "TBW_AssaultPack_Schnee";
_c pushBack "BW_Backpack_compact_Tropentarn";
_c pushBack "TBW_AssaultPack_Tropen";
_c pushBack "BW_Backpack_Carryall_Flecktarn";
_c pushBack "BW_Backpack_Carryall_Tropentarn";
_c pushBack "TBW_Notfallrucksack";
_c pushBack "BW_Kitbag_Flecktarn";
_c pushBack "BW_Kitbag_Tropentarn";
//_c pushBack "jgkp_PatrolPack_schnee";				//Picture \bwa3_backpacks\ui\bwa3_backpack_fleck_ca.paa not found
_c pushBack "BW_Backpack_Flecktarn";
_c pushBack "BW_Backpack_Flecktarn_Med";
_c pushBack "BW_Backpack_Tropentarn";
_c pushBack "BW_Backpack_Tropentarn_Med";
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
_c pushBack "PzBrig17_M92_Snow";
_c pushBack "TBW_Helm_Multi";
_c pushBack "TBW_Helm_Schnee";
_c pushBack "TBW_Helm2_Multi";
_c pushBack "TBW_Helm2_Schnee";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_c pushBack "TBW_Marine_cap";
_c pushBack "TBW_Barett_Art";
_c pushBack "TBW_Barett_DeFranzB";
_c pushBack "TBW_Barett_EuCorp";
_c pushBack "TBW_Barett_Fjg";
_c pushBack "TBW_Barett_FernM";
_c pushBack "TBW_Barett_FernSp";
_c pushBack "TBW_Barett_HAufK";
_c pushBack "TBW_Barett_Inst";
_c pushBack "TBW_Barett_KpfSchwim";
_c pushBack "TBW_Barett_KSK";
_c pushBack "TBW_Barett_Log";
_c pushBack "TBW_Barett_LWSich";
_c pushBack "TBW_Barett_MSich";
_c pushBack "TBW_Barett_Pio";
_c pushBack "TBW_Barett_San";
_c pushBack "TBW_booniehat_Fleck";
_c pushBack "TBW_booniehat_Multi";
_c pushBack "TBW_booniehat_Tropen";
_c pushBack "TBW_booniehat_hs_Fleck";
_c pushBack "TBW_booniehat_hs_Multi";
_c pushBack "TBW_booniehat_hs_Tropen";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 1-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_c pushBack "BWAdd_G27";
_c pushBack "BWAdd_G27_AG";

_c pushBack "BWAdd_MG3";
//set all other vars in a slope
_cntstart = count _c;
_cntend = count _u;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-------------------------------------------------------------------------------------------Level 2-----------------------------------------------------------------------------------------------
_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_c pushBack "BWAdd_G82";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);


_c pushBack "BWAdd_MG5";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};
//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _c, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Gear\gear_BW_BWadd.sqf", format["Gear for faction %1: [%2|%3|%4] ", _faction, count _c, count _u, count _p]] call CTI_CO_FNC_Log};
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_BW_BWadd.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
