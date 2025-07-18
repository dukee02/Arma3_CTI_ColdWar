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

//Defense Guns for Towns
_classes_town = [];
_categories_town = [];

/********************************************************************************************************************************
 *											USA																					*
 ********************************************************************************************************************************/
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_classes_town pushBack 		format["%1CUP_B_M2StaticMG_US", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CUP_B_M252_US", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CUP_B_CUP_Stinger_AA_pod_US", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1CUP_B_TOW_TriPod_US", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1CUP_B_M119_US", _sid];
		_categories_town pushBack 	"Artillery";

		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1CUP_B_M2StaticMG_US", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1CUP_B_M2StaticMG_US", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if(CTI_CWR3_ADDON > 0) then {
		_classes_town pushBack 		format["%1cwr3_b_m2hb_high", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1cwr3_b_m252", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1cwr3_b_m2hb_high", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1cwr3_b_tow", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1cwr3_b_m119", _sid];
		_categories_town pushBack 	"Artillery";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1cwr3_b_m2hb_high", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1cwr3_b_m2hb_high", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if(CTI_RHS_ADDON > 0) then {
		_classes_town pushBack 		format["%1RHS_M2StaticMG_D", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1RHS_M252_D", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1RHS_Stinger_AA_pod_D", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1RHS_TOW_TriPod_D", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1RHS_M119_D", _sid];
		_categories_town pushBack 	"Artillery";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1RHS_M2StaticMG_D", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1RHS_M2StaticMG_D", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
}; 

/********************************************************************************************************************************
 *											Russia																				*
 ********************************************************************************************************************************/
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_classes_town pushBack 		format["%1CUP_O_KORD_high_RU", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CUP_O_2b14_82mm_RU", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CUP_O_ZU23_RU", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1CUP_O_Metis_RU", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1CUP_O_D30_RU", _sid];
		_categories_town pushBack 	"Artillery";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1CUP_O_KORD_high_RU", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1CUP_O_KORD_high_RU", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if(CTI_CWR3_ADDON > 0) then {
		_classes_town pushBack 		format["%1cwr3_o_nsv_high", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1cwr3_o_2b14", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1cwr3_o_zu23", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1cwr3_o_konkurs_tripod", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1cwr3_o_d30_at", _sid];
		_categories_town pushBack 	"Artillery";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1cwr3_o_nsv_high", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1cwr3_o_nsv_high", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if(CTI_RHS_ADDON > 0) then {
		_classes_town pushBack 		format["%1rhs_KORD_high_VDV", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1rhs_2b14_82mm_vdv", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1rhs_Igla_AA_pod_vdv", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1rhs_Metis_9k115_2_vdv", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1rhs_D30_vdv", _sid];
		_categories_town pushBack 	"Artillery";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1rhs_KORD_high_VDV", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1rhs_KORD_high_VDV", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
}; 
/********************************************************************************************************************************
 *											Bundeswehr (West Germany)															*
 ********************************************************************************************************************************/

if(CTI_BW_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {	
	if(CTI_GM_DLC > 0) then {
		_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1gm_ge_army_milan_launcher_tripod", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
		_categories_town pushBack 	"AA";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1gm_ge_army_mg3_aatripod", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if (CTI_REDD_ADDON > 0) then {
		_classes_town pushBack 		format["%1rnt_mg3_static", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1Redd_Milan_Static", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1Redd_Tank_M120_Tampella", _sid];
		_categories_town pushBack 	"Mortar";
		
		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1rnt_mg3_static", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1rnt_mg3_static", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
};

/********************************************************************************************************************************
 *											NVA (East Germany)																	*
 ********************************************************************************************************************************/
if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {	
	if(CTI_GM_DLC > 0) then {
		_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1gm_gc_army_spg9_tripod", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1gm_gc_army_fagot_launcher_tripod", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
		_categories_town pushBack 	"AA";

		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1gm_gc_army_dshkm_aatripod", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
};

/********************************************************************************************************************************
 *											CDF (BLUFOR/GREEN)																	*
 ********************************************************************************************************************************/
if(CTI_CDF_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == west) then {
			_classes_town pushBack 		format["%1rhsgref_cdf_b_DSHKM", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_b_reg_M252", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_b_ZU23", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_b_SPG9M", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_b_reg_d30", _sid];
			_categories_town pushBack 	"Artillery";
			
			//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
			if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
				_classes_town pushBack 		format["%1rhsgref_cdf_b_DSHKM", _sid];
				_categories_town pushBack 	"RADAR";
				_classes_town pushBack 		format["%1rhsgref_cdf_b_DSHKM", _sid];
				_categories_town pushBack 	"SAM";
			};
		} else {
			_classes_town pushBack 		format["%1rhsgref_cdf_DSHKM", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_reg_M252", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_ZU23", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_SPG9M", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1rhsgref_cdf_reg_d30", _sid];
			_categories_town pushBack 	"Artillery";

			//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
			if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
				_classes_town pushBack 		format["%1rhsgref_cdf_DSHKM", _sid];
				_categories_town pushBack 	"RADAR";
				_classes_town pushBack 		format["%1rhsgref_cdf_DSHKM", _sid];
				_categories_town pushBack 	"SAM";
			};
		};
	};
};

/********************************************************************************************************************************
 *											CHDKZ (BLUFOR/GREEN)																*
 ********************************************************************************************************************************/
if(CTI_CHDKZ_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (CTI_RHS_ADDON > 0) then {
		if(_side == east) then {
			_classes_town pushBack 		format["%1rhsgref_ins_DSHKM", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1rhsgref_ins_2b14", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1rhsgref_ins_ZU23", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1rhsgref_ins_SPG9M", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1rhsgref_ins_d30", _sid];
			_categories_town pushBack 	"Artillery";

			//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
			if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
				_classes_town pushBack 		format["%1rhsgref_ins_DSHKM", _sid];
				_categories_town pushBack 	"RADAR";
				_classes_town pushBack 		format["%1rhsgref_ins_DSHKM", _sid];
				_categories_town pushBack 	"SAM";
			};
		} else {
			_classes_town pushBack 		format["%1rhsgref_ins_g_DSHKM", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1rhsgref_ins_g_2b14", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1rhsgref_ins_g_ZU23", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1rhsgref_ins_g_SPG9M", _sid];
			_categories_town pushBack 	"AT";
			
			_classes_town pushBack 		format["%1rhsgref_ins_g_d30", _sid];
			_categories_town pushBack 	"Artillery";

			//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
			if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
				_classes_town pushBack 		format["%1rhsgref_ins_g_DSHKM", _sid];
				_categories_town pushBack 	"RADAR";
				_classes_town pushBack 		format["%1rhsgref_ins_g_DSHKM", _sid];
				_categories_town pushBack 	"SAM";
			};
		};
	};
};

/********************************************************************************************************************************
 *											Ukrainian																			*
 ********************************************************************************************************************************/
if(CTI_UKRAIN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_CUP_ADDON > 0) then {
		_classes_town pushBack 		format["%1CUP_B_M2StaticMG_AFU", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CUP_B_2b14_82mm_AFU", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CUP_B_ZU23_AFU", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1CUP_B_SPG9_AFU", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1CUP_B_D30_AFU", _sid];
		_categories_town pushBack 	"Artillery";

		//we must declare some RADAR and SAM if we want to spawn them on the map, if we deactivate them we need an alternative unit
		if(CTI_ECONOMY_LEVEL_DEFENSE < 3) then {
			_classes_town pushBack 		format["%1CUP_B_M2StaticMG_AFU", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1CUP_B_M2StaticMG_AFU", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
};

/********************************************************************************************************************************
 *											RADAR and SAMs																		*
 ********************************************************************************************************************************/
if(CTI_ECONOMY_LEVEL_DEFENSE >= 3) then {
	if(CTI_NVA_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		if(CTI_SOG_DLC > 0) then {
			_classes_town pushBack 		format["%1vn_o_static_rsna75", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1vn_sa2", _sid];
			_categories_town pushBack 	"SAM";
		};
	};
	if(_side == west) then {
		if(CTI_BW_ADDON > 0) then {
			_classes_town pushBack 		format["%1TBW_MEADS_Radar_Fleck", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1TBW_MEADS_Launcher_Fleck", _sid];
			_categories_town pushBack 	"SAM";
		} else {
			_classes_town pushBack 		format["%1B_Radar_System_01_F", _sid];
			_categories_town pushBack 	"RADAR";
			_classes_town pushBack 		format["%1B_SAM_System_03_F", _sid];
			_categories_town pushBack 	"SAM";
		};
	} else {
		_classes_town pushBack 		format["%1O_Radar_System_02_F", _sid];
		_categories_town pushBack 	"RADAR";
		_classes_town pushBack 		format["%1O_SAM_System_04_F", _sid];
		_categories_town pushBack 	"SAM";
	};
};

//--- Defenses management for towns.
if (isServer) then {[_side, _classes_town, _categories_town] Call Compile preprocessFileLineNumbers "Common\Config\Config_Defenses_Towns.sqf"};
