private ["_side", "_sid", "_tag"];
//private ["_side", "_sid", "_tag", "INFANTRY", "INFANTRY_MG", "INFANTRY_AT", "WHEELED_LIGHT", "WHEELED_HEAVY", "WHEELED_LIGHT_ADDON", "WHEELED_HEAVY_ADDON", "TRACKED_LIGHT", "TRACKED_MEDIUM", "TRACKED_HEAVY", "TRACKED_LIGHT_ADDON", "TRACKED_MEDIUM_ADDON", "TRACKED_HEAVY_ADDON"];
_side = _this;
_sid = "";
_tag = "";

if(_side == west) then {
	//_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		//_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";


//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];

if(CTI_MAIN_ADDON == 0) then {
	INFANTRY = [[format["%1gm_ge_army_medic_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1]];
	INFANTRY_MG = [[format["%1gm_ge_army_medic_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1],[format["%1gm_ge_army_machinegunner_mg3_80_ols", _sid],1]];
	INFANTRY_AT = [[format["%1gm_ge_army_medic_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf84_80_ols", _sid],1]];
};
if(CTI_BW_ADDON > 0) then {
	if((CTI_MAIN_ADDON == 0 && CTI_ECONOMY_LEVEL_INFANTRY >= 3) || CTI_MAIN_ADDON == 1) then {
		INFANTRY = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1]];
		INFANTRY_MG = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG3_Fleck", _sid],1],[format["%1BWA3_MachineGunner_MG3_Fleck", _sid],1]];
		INFANTRY_AT = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1],[format["%1LIB_UK_AT_Soldier", _sid],1]];

		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			INFANTRY = [[format["%1PzBrig17_CombatLifeSaver_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_RiflemanAT_CG_Snow", _sid],1]];
			INFANTRY_MG = [[format["%1PzBrig17_CombatLifeSaver_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_AutoriflemanMG3_Snow", _sid],1],[format["%1PzBrig17_AutoriflemanMG3_Snow", _sid],1]];
			INFANTRY_AT = [[format["%1PzBrig17_CombatLifeSaver_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_RiflemanAT_CG_Snow", _sid],1],[format["%1PzBrig17_RiflemanAT_RGW90_Snow", _sid],1],[format["%1PzBrig17_RiflemanAT_Pzf3_Snow", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			INFANTRY = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1]];
			INFANTRY_MG = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG3_Tropen", _sid],1],[format["%1BWA3_MachineGunner_MG3_Tropen", _sid],1]];
			INFANTRY_AT = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_RGW90_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_PzF3_Tropen", _sid],1]];
		};
	};
};
if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];

if(CTI_MAIN_ADDON == 0) then {
	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
		case 1: {
			WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo", _sid],1],[format["%1gm_ge_army_iltis_milan", _sid],1]];
			WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command", _sid],1],[format["%1gm_ge_army_fuchsa0_engineer", _sid],1]];
		};
		case 2;
		case 3;
		case 4;
		case 5: {
			WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_milan", _sid],1],[format["%1gm_ge_army_fuchsa0_engineer", _sid],1]];
			WHEELED_HEAVY = [[format["%1gm_ge_army_fuchsa0_command", _sid],1],[format["%1gm_ge_army_fuchsa0_reconnaissance", _sid],1]];
		};
		default {
			WHEELED_LIGHT = [[format["%1gm_ge_army_iltis_cargo", _sid],1],[format["%1gm_ge_army_iltis_cargo", _sid],1]];
			WHEELED_HEAVY = [[format["%1gm_ge_army_c1300l_cargo", _sid],1],[format["%1gm_ge_army_c1300l_cargo", _sid],1]];
		};
	};
	
	if(CTI_BW_ADDON == 1) then {
		WHEELED_LIGHT_ADDON = [];
		WHEELED_HEAVY_ADDON = [];
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 3: {
				WHEELED_LIGHT_ADDON = [[format["%1BW_Dingo_Wdl", _sid],1],[format["%1BW_Dingo_Wdl", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1BW_Dingo_GL_Wdl", _sid],1],[format["%1BW_Dingo_GL_Wdl", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1BW_Dingo_Win", _sid],1],[format["%1BW_Dingo_Win", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1BW_Dingo_GL_Win", _sid],1],[format["%1BW_Dingo_GL_Win", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1BW_Dingo_Des", _sid],1],[format["%1BW_Dingo_Des", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1BW_Dingo_GL_Des", _sid],1],[format["%1BW_Dingo_GL_Des", _sid],1]];
				};
			};
			case 4: {};
			case 5: {
				WHEELED_LIGHT_ADDON = [[format["%1BWA3_Eagle_Fleck", _sid],1],[format["%1BWA3_Eagle_Fleck", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1BWA3_Eagle_FLW100_Fleck", _sid],1],[format["%1BWA3_Eagle_FLW100_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1BWA3_Eagle_Tropen", _sid],1],[format["%1BWA3_Eagle_Tropen", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1BWA3_Eagle_FLW100_Tropen", _sid],1],[format["%1BWA3_Eagle_FLW100_Tropen", _sid],1]];
				};
			};
			default {
				WHEELED_LIGHT_ADDON = [[format["%1bw_cnimog_cargo", _sid],1],[format["%1bw_cnimog_cargo", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1bw_cnimog_cargo_covered", _sid],1],[format["%1bw_cnimog_cargo_covered", _sid],1]];
			};
		};
		WHEELED_LIGHT = +WHEELED_LIGHT_ADDON;
		WHEELED_HEAVY = +WHEELED_HEAVY_ADDON;
	};
	
	if(CTI_REDD_ADDON == 1) then {
		WHEELED_LIGHT_ADDON = [];
		WHEELED_HEAVY_ADDON = [];
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 1: {
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			case 2: {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			case 3;
			case 4;
			case 5: {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			default {
			};
		};
		WHEELED_LIGHT = +WHEELED_LIGHT_ADDON;
		WHEELED_HEAVY = +WHEELED_HEAVY_ADDON;
	};
	if(CTI_CUP_ADDON == 1) then {
		WHEELED_LIGHT_ADDON = [];
		WHEELED_HEAVY_ADDON = [];
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 3;
			case 4;
			case 5: {
				WHEELED_LIGHT_ADDON = [[format["%1CUP_B_Dingo_GER_Wdl", _sid],1],[format["%1CUP_B_Dingo_GER_Wdl", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1CUP_B_Dingo_GL_GER_Wdl", _sid],1],[format["%1CUP_B_Dingo_GL_GER_Wdl", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1CUP_B_Dingo_GER_Des", _sid],1],[format["%1CUP_B_Dingo_GER_Des", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1CUP_B_Dingo_GL_GER_Des", _sid],1],[format["%1CUP_B_Dingo_GL_GER_Des", _sid],1]];
				};
				WHEELED_LIGHT = +WHEELED_LIGHT_ADDON;
				WHEELED_HEAVY = +WHEELED_HEAVY_ADDON;
			};
			default {};
		};
	};
	
} else {
	if(CTI_BW_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 1;
			case 2;
			case 3: {
				WHEELED_LIGHT = [[format["%1BW_Dingo_Wdl", _sid],1],[format["%1BW_Dingo_Wdl", _sid],1]];
				WHEELED_HEAVY = [[format["%1BW_Dingo_GL_Wdl", _sid],1],[format["%1BW_Dingo_GL_Wdl", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT = [[format["%1BW_Dingo_Win", _sid],1],[format["%1BW_Dingo_Win", _sid],1]];
					WHEELED_HEAVY = [[format["%1BW_Dingo_GL_Win", _sid],1],[format["%1BW_Dingo_GL_Win", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT = [[format["%1BW_Dingo_Des", _sid],1],[format["%1BW_Dingo_Des", _sid],1]];
					WHEELED_HEAVY = [[format["%1BW_Dingo_GL_Des", _sid],1],[format["%1BW_Dingo_GL_Des", _sid],1]];
				};
			};
			case 4: {};
			case 5: {
				WHEELED_LIGHT = [[format["%1BWA3_Eagle_Fleck", _sid],1],[format["%1BWA3_Eagle_Fleck", _sid],1]];
				WHEELED_HEAVY = [[format["%1BWA3_Eagle_FLW100_Fleck", _sid],1],[format["%1BWA3_Eagle_FLW100_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT = [[format["%1BWA3_Eagle_Tropen", _sid],1],[format["%1BWA3_Eagle_Tropen", _sid],1]];
					WHEELED_HEAVY = [[format["%1BWA3_Eagle_FLW100_Tropen", _sid],1],[format["%1BWA3_Eagle_FLW100_Tropen", _sid],1]];
				};
			};
			default {
				WHEELED_LIGHT = [[format["%1bw_cnimog_cargo", _sid],1],[format["%1bw_cnimog_cargo", _sid],1]];
				WHEELED_HEAVY = [[format["%1bw_cnimog_cargo_covered", _sid],1],[format["%1bw_cnimog_cargo_covered", _sid],1]];
			};
		};
	};
	
	if(CTI_REDD_ADDON == 1) then {
		WHEELED_LIGHT_ADDON = [];
		WHEELED_HEAVY_ADDON = [];
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 1: {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			case 2: {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			case 3;
			case 4;
			case 5: {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid],1],[format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid],1]];
				};
			};
			default {
				WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_Moerser", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FJg", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FJg", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_Moerser", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FJg", _sid],1],[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FJg", _sid],1]];
				};
			};
		};
		WHEELED_LIGHT = +WHEELED_LIGHT_ADDON;
		WHEELED_HEAVY = +WHEELED_HEAVY_ADDON;
	};
	if(CTI_CUP_ADDON == 1) then {
		WHEELED_LIGHT_ADDON = [];
		WHEELED_HEAVY_ADDON = [];
		switch (CTI_ECONOMY_LEVEL_WHEELED) do {
			case 3;
			case 4;
			case 5: {
				WHEELED_LIGHT_ADDON = [[format["%1CUP_B_Dingo_GER_Wdl", _sid],1],[format["%1CUP_B_Dingo_GER_Wdl", _sid],1]];
				WHEELED_HEAVY_ADDON = [[format["%1CUP_B_Dingo_GL_GER_Wdl", _sid],1],[format["%1CUP_B_Dingo_GL_GER_Wdl", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					WHEELED_LIGHT_ADDON = [[format["%1CUP_B_Dingo_GER_Des", _sid],1],[format["%1CUP_B_Dingo_GER_Des", _sid],1]];
					WHEELED_HEAVY_ADDON = [[format["%1CUP_B_Dingo_GL_GER_Des", _sid],1],[format["%1CUP_B_Dingo_GL_GER_Des", _sid],1]];
				};
				WHEELED_LIGHT = +WHEELED_LIGHT_ADDON;
				WHEELED_HEAVY = +WHEELED_HEAVY_ADDON;
			};
			default {};
		};
	};
};
if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
TRACKED_LIGHT_ADDON = [];
TRACKED_MEDIUM_ADDON = [];
TRACKED_HEAVY_ADDON = [];

if(CTI_MAIN_ADDON == 0) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
		case 1: {
			TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc", _sid],1],[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
			TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1],[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1]];
			TRACKED_HEAVY = [[format["%1gm_ge_army_Leopard1a1", _sid],1],[format["%1gm_ge_army_Leopard1a1", _sid],1]];
		};
		case 2: {
			TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc", _sid],1],[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
			TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1],[format["%1gm_ge_army_Leopard1a1", _sid],1]];
			TRACKED_HEAVY = [[format["%1gm_ge_army_Leopard1a1a1", _sid],1],[format["%1gm_ge_army_Leopard1a1a2", _sid],1]];
		};
		case 3;
		case 4;
		case 5: {
			TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc", _sid],1],[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
			TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1],[format["%1gm_ge_army_Leopard1a1", _sid],1]];
			TRACKED_HEAVY = [[format["%1gm_ge_army_Leopard1a3", _sid],1],[format["%1gm_ge_army_Leopard1a3a1", _sid],1]];
		};
		default {
			TRACKED_LIGHT = [[format["%1gm_ge_army_m113a1g_apc", _sid],1],[format["%1gm_ge_army_m113a1g_apc", _sid],1]];
			TRACKED_MEDIUM = [[format["%1gm_ge_army_m113a1g_apc", _sid],1],[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1]];
			TRACKED_HEAVY = [[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1],[format["%1gm_ge_army_m113a1g_apc_milan", _sid],1]];
		};
	};
	
	if(CTI_BW_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 4: {
				TRACKED_MEDIUM_ADDON = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_MEDIUM_ADDON = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
				};
				TRACKED_MEDIUM = +TRACKED_MEDIUM_ADDON;
			};
			case 5: {
				TRACKED_HEAVY_ADDON = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_HEAVY_ADDON = [[format["%1BWA3_Leopard2_Tropen", _sid],1],[format["%1BWA3_Leopard2_Tropen", _sid],1]];
				};
				TRACKED_HEAVY = +TRACKED_HEAVY_ADDON;
			};
			default {};
		};
	};
	if(CTI_REDD_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 2: {
				TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
				};
				TRACKED_LIGHT = +TRACKED_LIGHT_ADDON;
				TRACKED_MEDIUM = +TRACKED_MEDIUM_ADDON;
			};
			case 3;
			case 4;
			case 5: {
				TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid],1]];
				TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
				};
				TRACKED_LIGHT = +TRACKED_LIGHT_ADDON;
				TRACKED_MEDIUM = +TRACKED_MEDIUM_ADDON;
			};
			default {};
		};
	};
	if(CTI_CUP_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 5: {
				TRACKED_HEAVY_ADDON = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
				TRACKED_HEAVY = +TRACKED_HEAVY_ADDON;
			};
			default {};
		};
	};
	
} else {
	if(CTI_BW_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 1: {
				if(CTI_REDD_ADDON == 1) then {
				} else {
					TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
					TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
					TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
					if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
						TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
						TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Leopard2_Tropen", _sid],1]];
						TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Tropen", _sid],1],[format["%1BWA3_Leopard2_Tropen", _sid],1]];
					};
				};
			};
			case 2: {};
			case 3: {
				TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
				TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
				TRACKED_HEAVY = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
					TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
					TRACKED_HEAVY = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
				};
			};
			case 4: {};
			case 5: {
				TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
				TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
				TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
					TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Leopard2_Tropen", _sid],1]];
					TRACKED_HEAVY = [[format["%1BWA3_Leopard2_Tropen", _sid],1],[format["%1BWA3_Leopard2_Tropen", _sid],1]];
				};
			};
			default {
				if(CTI_REDD_ADDON == 1) then {
				} else {
					TRACKED_LIGHT = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
					TRACKED_MEDIUM = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
					TRACKED_HEAVY = [[format["%1BWA3_Puma_Fleck", _sid],1],[format["%1BWA3_Puma_Fleck", _sid],1]];
					if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
						TRACKED_LIGHT = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
						TRACKED_MEDIUM = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
						TRACKED_HEAVY = [[format["%1BWA3_Puma_Tropen", _sid],1],[format["%1BWA3_Puma_Tropen", _sid],1]];
					};
				};
			};
		};
	};
	if(CTI_REDD_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 1: {
				TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
				};
				TRACKED_LIGHT = +TRACKED_LIGHT_ADDON;
				TRACKED_MEDIUM = +TRACKED_MEDIUM_ADDON;
			};
			case 2;
			case 3;
			case 4;
			case 5: {
				TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid],1]];
				TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Flecktarn", _sid],1],[format["%1Redd_Marder_1A5_Flecktarn", _sid],1]];
				if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Wintertarn", _sid],1],[format["%1Redd_Marder_1A5_Wintertarn", _sid],1]];
				};
				if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
					TRACKED_LIGHT_ADDON = [[format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid],1],[format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid],1]];
					TRACKED_MEDIUM_ADDON = [[format["%1Redd_Marder_1A5_Tropentarn", _sid],1],[format["%1Redd_Marder_1A5_Tropentarn", _sid],1]];
				};
				TRACKED_LIGHT = +TRACKED_LIGHT_ADDON;
				TRACKED_MEDIUM = +TRACKED_MEDIUM_ADDON;
			};
			default {};
		};
	};
	if(CTI_CUP_ADDON == 1) then {
		switch (CTI_ECONOMY_LEVEL_TRACKED) do {
			case 1: {
				if(CTI_REDD_ADDON == 1) then {} 
				else {
					TRACKED_HEAVY_ADDON = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
					TRACKED_HEAVY = +TRACKED_HEAVY_ADDON;
				};
			};
			case 5: {
				TRACKED_HEAVY_ADDON = [[format["%1BWA3_Leopard2_Fleck", _sid],1],[format["%1BWA3_Leopard2_Fleck", _sid],1]];
				TRACKED_HEAVY = +TRACKED_HEAVY_ADDON;
			};
			default {};
		};
	};
};
if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY]] call CTI_CO_FNC_Log;
};

//Town Air setup
AIR_FIGHTER = [];				//in this case planes
AIR_BOMBER = [];				//in this case choppers armed

if(CTI_MAIN_ADDON == 0) then {
	switch (CTI_ECONOMY_LEVEL_AIR) do {
		case 1;
		case 2;
		case 3;
		case 4;
		case 5: {
			AIR_BOMBER = [[format["%1gm_ge_army_bo105p_pah1", _sid],1],[format["%1gm_ge_army_bo105p_pah1a1", _sid],1]];
		};
		default {};
	};
};
if(CTI_BW_ADDON > 0) then {
	switch (CTI_ECONOMY_LEVEL_AIR) do {
		case 1;
		case 2: {
			AIR_BOMBER = [[format["%1bw_bo105_pah1", _sid],1]];
		};
		case 3: {
			AIR_BOMBER = [[format["%1bw_ec135_fz_raketen", _sid],1],[format["%1BWA3_Tiger_Gunpod_Heavy", _sid],1]];
		};
		case 4;
		case 5: {
			AIR_BOMBER = [[format["%1BWA3_Tiger_RMK_PARS", _sid],1],[format["%1BWA3_Tiger_RMK_universal", _sid],1]];
		};
		default {};
	};
};
if(CTI_CUP_ADDON > 0) then {
	switch (CTI_ECONOMY_LEVEL_AIR) do {
		case 1;
		case 2;
		case 3;
		case 4;
		case 5: {
			AIR_BOMBER = [[format["%1CUP_B_UH1D_armed_GER_KSK", _sid],1],[format["%1CUP_B_UH1D_gunship_GER_KSK", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				AIR_BOMBER = [[format["%1CUP_B_UH1D_armed_GER_KSK_Des", _sid],1],[format["%1CUP_B_UH1D_gunship_GER_KSK_Des", _sid],1]];
			};
		};
		default {};
	};
};
if(CTI_EF_TORNADO_ADDON > 0) then {
	switch (CTI_ECONOMY_LEVEL_AIR) do {
		case 3: {
			AIR_FIGHTER = [[format["%1Tornado_AWS_GER", _sid],1]];
		};
		case 4;
		case 5: {
			AIR_FIGHTER = [[format["%1Tornado_AWS_GER", _sid],1],[format["%1EAWS_EF2000_GER_CAP", _sid],1]];
		};
		default {};
	};
};
if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER]] call CTI_CO_FNC_Log;
};

//Town Anti-Air setup
ANTI_AIR = [];

if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		ANTI_AIR = [[format["%1gm_ge_army_gepard1a1", _sid],1]];
	};
} else {
	if(CTI_REDD_ADDON == 1) then {
		if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid],1]];
			};
			ANTI_AIR = [[format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid],1]];
		};
	};
};
if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
	//["VIOC_DEBUG", "FILE: common\config\Towns_BW.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], ANTI_AIR]] call CTI_CO_FNC_Log;
};