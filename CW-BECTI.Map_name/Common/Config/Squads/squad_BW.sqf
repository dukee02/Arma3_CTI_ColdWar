_side = _this;
_sid = "";

/*if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};*/

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["Armored", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["AntiAir", "Armored"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["Air"]]; 

//Infantry setup for the AI groups
units_infantry = [];

if(CTI_MAIN_ADDON == 0) then {
	units_infantry = [[format["%1gm_ge_army_medic_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_grenadier_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1],[format["%1gm_ge_army_antitank_g3a3_pzf44_80_ols", _sid],1],[format["%1gm_ge_army_rifleman_g3a3_80_ols", _sid],1]];
} else {
	if(CTI_BW_ADDON > 0) then {
		units_infantry = [[format["%1BWA3_Medic_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Rifleman_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_Grenadier_Fleck", _sid],1],[format["%1BWA3_RiflemanAT_CG_Fleck", _sid],1]];
		
		if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
			units_infantry = [[format["%1PzBrig17_CombatLifeSaver_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_Rifleman_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_GrenadierG27_Snow", _sid],1],[format["%1PzBrig17_RiflemanAT_CG_Snow", _sid],1]];
		};
		if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
			units_infantry = [[format["%1BWA3_Medic_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Rifleman_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_Grenadier_Tropen", _sid],1],[format["%1BWA3_RiflemanAT_CG_Tropen", _sid],1]];
		};
	};	
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];


//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];
_adds = 0;
if(CTI_MAIN_ADDON == 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		mot_to_add = [[format["%1gm_ge_army_iltis_cargo", _sid], 1, 50]];
		mot_to_add pushBack [format["%1gm_ge_army_c1300l_cargo", _sid], 1, 50];
	};
	//Level 1
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		mot_to_add = [[format["%1gm_ge_army_iltis_mg3", _sid], 1, 50]];
		mot_to_add pushBack [format["%1gm_ge_army_iltis_milan", _sid], 1, 50];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_command", _sid], 1, 50];
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_engineer", _sid], 1, 50];	
	};
	//Level 2
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		mot_to_add pushBack [format["%1gm_ge_army_fuchsa0_reconnaissance", _sid], 1, 50];
	};
	//Level 3
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		mot_to_add pushBack [format["%1gm_ge_army_luchsa1", _sid], 1, 50];
		mot_to_add pushBack [format["%1gm_ge_army_luchsa2", _sid], 1, 50];
	};
	units_wheeled append mot_to_add;
};
if(CTI_BW_ADDON > 0) then {
	//Level start
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		mot_to_add = [[format["%1bw_unimog_cargo", _sid], 1, 50]];
	};
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+2; } else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {		//(2 || 4)
		mot_to_add = [[format["%1BWA3_Eagle_FLW100_Fleck", _sid], 1, 50]];
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1BWA3_Eagle_FLW100_Tropen", _sid], 1, 50]];
		};
	};
	units_wheeled append mot_to_add;
	_adds = _adds+1;
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {		//(3 || 5)
		mot_to_add = [[format["%1KGB_B_MRAP_03_gmg_F", _sid], 1, 50]];
		mot_to_add pushBack [format["%1KGB_B_MRAP_03_hmg_F", _sid], 1, 50];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1KGB_B_MRAP_03_gmg_F_WIN", _sid], 1, 50]];
			mot_to_add pushBack [format["%1KGB_B_MRAP_03_hmg_F_WIN", _sid], 1, 50];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1KGB_B_MRAP_03_gmg_F_DES", _sid], 1, 50]];
			mot_to_add pushBack [format["%1KGB_B_MRAP_03_hmg_F_DES", _sid], 1, 50];
		};
		units_wheeled append mot_to_add;
	};
	if(CTI_MAIN_ADDON == 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+1; }; // else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {			//(1 || 2 mit redd 2 || 3)
		mot_to_add = [[format["%1BW_Dingo_GL_Wdl", _sid], 1, 50]];
		mot_to_add pushBack [format["%1BW_Dingo_Wdl", _sid], 1, 50];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1BW_Dingo_GL_Win", _sid], 1, 50]];
			mot_to_add pushBack [format["%1BW_Dingo_Win", _sid], 1, 50];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1BW_Dingo_GL_Des", _sid], 1, 50]];
			mot_to_add pushBack [format["%1BW_Dingo_Des", _sid], 1, 50];
		};
		units_wheeled append mot_to_add;
	};
};

if(CTI_CUP_ADDON == 1) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 1; } else { _adds = 0; };
	if(CTI_REDD_ADDON == 1) then { _adds = _adds+1; }; // else {};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1+_adds) then {
		mot_to_add = [[format["%1CUP_B_Dingo_GL_GER_Wdl", _sid], 1, 50]];
		mot_to_add pushBack [format["%1CUP_B_Dingo_GER_Wdl", _sid], 1, 50];
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1CUP_B_Dingo_GL_GER_Des", _sid], 1, 50]];
			mot_to_add pushBack [format["%1CUP_B_Dingo_GER_Des", _sid], 1, 50];
		};
		units_wheeled append mot_to_add;
	};
};
if(CTI_REDD_ADDON == 1) then {

	if(CTI_MAIN_ADDON == 0) then { _adds = 2; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0+_adds) then {
		mot_to_add = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu", _sid], 1, 50]];
		mot_to_add pushBack [format["%1Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FJg", _sid], 1, 50];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FueFu", _sid], 1, 50]];
			mot_to_add pushBack [format["%1Redd_Tank_LKW_leicht_gl_Wolf_Wintertarn_FJg", _sid], 1, 50];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu", _sid], 1, 50]];
			mot_to_add pushBack [format["%1Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FJg", _sid], 1, 50];
		};
		units_wheeled append mot_to_add;
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Flecktarn", _sid], 1, 50]];
		mot_to_add pushBack [format["%1Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _sid], 1, 50];	
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Wintertarn", _sid], 1, 50]];
			mot_to_add pushBack [format["%1Redd_Tank_Fuchs_1A4_Jg_Wintertarn", _sid], 1, 50];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Pi_Tropentarn", _sid], 1, 50]];
			mot_to_add pushBack [format["%1Redd_Tank_Fuchs_1A4_Jg_Tropentarn", _sid], 1, 50];
		};
		units_wheeled append mot_to_add;
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 2) then {
		mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Wintertarn", _sid], 1, 50]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn", _sid], 1, 50]];
		};
		units_wheeled append mot_to_add;
	};
	if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		mot_to_add = [[format["%1rnt_sppz_2a2_luchs_flecktarn", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			mot_to_add = [[format["%1rnt_sppz_2a2_luchs_wintertarn", _sid], 1, 50]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			mot_to_add = [[format["%1rnt_sppz_2a2_luchs_tropentarn", _sid], 1, 50]];
		};
		units_wheeled append mot_to_add;
	};
};

_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];



//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];

if(CTI_MAIN_ADDON == 0) then {
	//Start
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
		arm_to_add = [[format["%1gm_ge_army_m113a1g_apc", _sid], 1, 50]];
		arm_to_add pushBack [format["%1gm_ge_army_m113a1g_apc_milan", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1", _sid], 1, 50];	
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a1", _sid], 1, 50];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a1a2", _sid], 1, 50];
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2) then {
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3", _sid], 1, 50];
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a3a1", _sid], 1, 50];
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 3) then {
		arm_to_add pushBack [format["%1gm_ge_army_Leopard1a5", _sid], 1, 50];
	};
	units_tracked append arm_to_add;
};

if(CTI_REDD_ADDON == 1) then {

	if(CTI_MAIN_ADDON == 0) then { _adds=1; } else { _adds = 0; };
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		arm_to_add = [[format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid], 1, 50]];	
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			arm_to_add = [[format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid], 1, 50]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			arm_to_add = [[format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid], 1, 50]];
		};	
		units_tracked append arm_to_add;
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1+_adds) then {
		arm_to_add = [[format["%1Redd_Marder_1A5_Flecktarn", _sid], 1, 50]];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			arm_to_add = [[format["%1Redd_Marder_1A5_Wintertarn", _sid], 1, 50]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			arm_to_add = [[format["%1Redd_Marder_1A5_Tropentarn", _sid], 1, 50]];
		};	
		units_tracked append arm_to_add;
	};
	
	if(CTI_ECONOMY_LEVEL_TRACKED >= 2+_adds) then {
		arm_to_add = [[format["%1Redd_Tank_Wiesel_1A2_TOW_Flecktarn", _sid], 1, 50]];
		arm_to_add pushBack [format["%1Redd_Tank_Wiesel_1A4_MK20_Flecktarn", _sid], 1, 50];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			arm_to_add = [[format["%1Redd_Tank_Wiesel_1A2_TOW_Wintertarn", _sid], 1, 50]];
			arm_to_add pushBack [format["%1Redd_Tank_Wiesel_1A4_MK20_Wintertarn", _sid], 1, 50];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			arm_to_add = [[format["%1Redd_Tank_Wiesel_1A2_TOW_Tropentarn", _sid], 1, 50]];
			arm_to_add pushBack [format["%1Redd_Tank_Wiesel_1A4_MK20_Tropentarn", _sid], 1, 50];
		};
		units_tracked append arm_to_add;
	};
};

if(CTI_BW_ADDON > 0) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 4; } else { _adds = 0; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		arm_to_add = [[format["%1BWA3_Puma_Fleck", _sid], 1, 50]];
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			arm_to_add = [[format["%1BWA3_Puma_Tropen", _sid], 1, 50]];
		};
		units_tracked append arm_to_add;
	};
	
	if(CTI_MAIN_ADDON == 0) then { _adds = 5; } else { _adds = 1; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		arm_to_add = [[format["%1BWA3_Leopard2_Fleck", _sid], 1, 50]];
		//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1BWA3_Leopard2_Tropen", _sid], 1, 50]];
		};
		units_tracked append arm_to_add;
	};
};

if(CTI_CUP_ADDON > 0) then {
	if(CTI_MAIN_ADDON == 0) then { _adds = 5; } else { _adds = 1; if(CTI_REDD_ADDON == 1) then { _adds = _adds+3; };};
	if(CTI_ECONOMY_LEVEL_TRACKED >= 0+_adds) then {
		units_tracked pushBack [format["%1CUP_B_Leopard2A6_GER", _sid], 1, 50];
	};
};

_v pushBack "ArmoredMBT";
_t pushBack "Tanks";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];


//AntiAir setup for the AI groups
units_antiair = [];

if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
		units_antiair = [[format["%1gm_ge_army_gepard1a1", _sid],1]];
	};
} else {
	if(CTI_REDD_ADDON == 1) then {
		if(CTI_ECONOMY_LEVEL_TRACKED >= 1) then {
			units_antiair = [[format["%1Redd_Tank_Gepard_1A2_Flecktarn", _sid],1]];
			if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				units_antiair = [[format["%1Redd_Tank_Gepard_1A2_Wintertarn", _sid],1]];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				units_antiair = [[format["%1Redd_Tank_Gepard_1A2_Tropentarn", _sid],1]];
			};
		};
	};
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];


//Air setup for the AI groups
units_air = [];
air_to_add = [];

if(CTI_MAIN_ADDON == 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		air_to_add = [[format["%1gm_ge_army_bo105p_pah1", _sid], 1, 50]];
		air_to_add pushBack [format["%1gm_ge_army_bo105p_pah1a1", _sid], 1, 50];
		units_air append air_to_add;
	};
};

if(CTI_BW_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		units_air pushBack [format["%1bw_bo105_pah1", _sid], 1, 50];
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		air_to_add = [[format["%1bw_ec135_fz_raketen", _sid], 1, 50]];
		air_to_add pushBack [format["%1bw_ec135_pars", _sid], 1, 50];
		air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_FZ", _sid], 1, 50];
		air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_Heavy", _sid], 1, 50];
		air_to_add pushBack [format["%1BWA3_Tiger_Gunpod_PARS", _sid], 1, 50];
		units_air append air_to_add;
	};

	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		air_to_add = [[format["%1BWA3_Tiger_RMK_Heavy", _sid], 1, 50]];
		air_to_add pushBack [format["%1BWA3_Tiger_RMK_PARS", _sid], 1, 50];
		air_to_add pushBack [format["%1BWA3_Tiger_RMK_universal", _sid], 1, 50];
		units_air append air_to_add;
	};
};

if(CTI_CUP_ADDON > 0) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 1) then {
		air_to_add = [[format["%1CUP_B_UH1D_armed_GER_KSK", _sid], 1, 50]];
		air_to_add pushBack [format["%1CUP_B_UH1D_gunship_GER_KSK", _sid], 1, 50];
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			air_to_add = [[format["%1CUP_B_UH1D_armed_GER_KSK_Des", _sid], 1, 50]];
			air_to_add pushBack [format["%1CUP_B_UH1D_gunship_GER_KSK_Des", _sid], 1, 50];
		};	
		units_air append air_to_add;
	};
};
if(CTI_EF_TORNADO_ADDON == 1) then {
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		units_air pushBack [format["%1Tornado_AWS_GER", _sid], 1, 50];	
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		units_air pushBack [format["%1EAWS_EF2000_GER_CAP", _sid], 1, 50];	
	};
};

_v pushBack "Air";
_t pushBack "Air";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_BW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";