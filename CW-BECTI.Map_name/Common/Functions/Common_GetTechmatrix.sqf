/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTechmatrix.sqf
	Alias:			CTI_CO_FNC_GetTechmatrix
	Description:	Gets the matrix (array) of the given factory
	Author: 		dukee
	Creation Date:	10-01-2022
	Revision Date:	10-01-2022
	
  # PARAMETERS #
    0	[Side]: The side
    1	[Integer]: The Factory
    2	[Integer]: The Nation
    2	[Integer]: The Mod
	
  # RETURNED VALUE #
	[Array]: Boolean Array 
	
  # SYNTAX #
	[SIDE, FACTORY_UPGRADE_ID, NATION_ID, MOD_ID] call CTI_CO_FNC_GetTechmatrix;
	
  # EXAMPLE #
    _matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
    _matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID] call CTI_CO_FNC_GetTechmatrix;
    _matrix_nation_mod = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;
*/

//techtree: 

private ["_side", "_factory", "_nation", "_mod", "_tech_matrix", "_tech"];

_side = _this select 0;
switch(count _this) do {
	case 2: {
		_factory = _this select 1;
		_nation = -1;
		_mod = -1;};
	case 3: {
		_factory = _this select 1;
		_nation = _this select 2;
		_mod = -1;};
	case 4: {
		_factory = _this select 1;
		_nation = _this select 2;
		_mod = _this select 3;};
	default {_factory = -1;};
};

_tech_matrix = 
[
	//CTI_UPGRADE_BARRACKS
	[
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,true,true,true,true],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,true,true,true,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_FIA_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		]
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	],
	//CTI_UPGRADE_LIGHT
	[
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,true,true,true,true,true,true,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,false,true,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,true,true,true,true,true,true,true,true,true],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,true,true,true,true,true,false,true,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,true,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false,false]
		],
		//CTI_FIA_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,true,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false,false]
		]
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	],
	//CTI_UPGRADE_HEAVY
	[
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,true,true,true,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,true,true,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,false,true,true,true,true,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,true,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,true,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false]
		],
		//CTI_FIA_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,true,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false]
		]
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	],
	//CTI_UPGRADE_AIR
	[
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,true,true,true,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,false,true,true,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,true,true,true,true,true,true],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,true,true,true,true,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,true,true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false]
		],
		//CTI_FIA_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[true,true,true,true,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false,false,false]
		]
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	],
	//CTI_UPGRADE_NAVAL
	[
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false],
			//CTI_RHS_ID
			[false,false,false,false],
			//CTI_CWR3_ID
			[true,false,false,false],
			//CTI_VME_ID
			[false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false],
			//CTI_CUP_ID
			[true,true,false,false],
			//CTI_RHS_ID
			[false,false,false,false],
			//CTI_CWR3_ID
			[true,false,false,false],
			//CTI_VME_ID
			[false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false],
			//CTI_RHS_ID
			[true,true,true,true],
			//CTI_CWR3_ID
			[false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false]
		],
		//CTI_FIA_ID
		[
			//CTI_GM_ID
			[false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false],
			//CTI_CUP_ID
			[false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false],
			//CTI_CWR3_ID
			[true,false,false,false],
			//CTI_VME_ID
			[false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false]
		]
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	],
	[],[],[],[],[],[],[],
	//CTI_UPGRADE_GEAR
	[
		
		//CTI_BW_ID
		[],
		//CTI_NVA_ID
		[],
		//CTI_DEN_ID
		[],
		//CTI_POL_ID
		[],
		//CTI_US_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,true,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_SOV_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_NPOC_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		],
		//CTI_RACS_ID
		[
			//CTI_GM_ID
			[false,false,false,false,false,false,false],
			//CTI_PF_ID
			[false,false,false,false,false,false,false],
			//CTI_IC_ID
			[false,false,false,false,false,false,false],
			//CTI_WS_ID
			[false,false,false,false,false,false,false],
			//CTI_CUP_ID
			[true,true,true,false,false,false,false],
			//CTI_RHS_ID
			[false,false,false,false,false,false,false],
			//CTI_CWR3_ID
			[false,false,false,false,false,false,false],
			//CTI_VME_ID
			[false,false,false,false,false,false,false],
			//CTI_UKR_ID
			[false,false,false,false,false,false,false],
			//CTI_BWA3_ID
			[false,false,false,false,false,false,false],
			//CTI_BWADD_ID
			[false,false,false,false,false,false,false],
			//CTI_REDD_ID
			[false,false,false,false,false,false,false]
		]
		//CTI_FIA_ID
		//CTI_TK_ID
		//CTI_CDF_B_ID
		//CTI_CDF_I_ID
		//CTI_CZ_ID
		//CTI_CHDKZ_ID
		//CTI_SLA_ID
		//CTI_TKA_ID
		//CTI_SAF_ID
		//CTI_SAF_I_ID
		//CTI_HIDF_ID
		//CTI_NAPA_ID
		//CTI_ION_ID
		//CTI_PLA_ID
		//CTI_UKRAIN_ID
	]
];

_tech = [];
if(_mod >= 0) then {
	_tech = _tech_matrix select _factory select _nation select _mod;
} else {
	if(_nation >= 0) then {
		_tech = _tech_matrix select _factory select _nation select 0;

		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_GM_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_PF_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_IC_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_WS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_CUP_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CUP_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_RHS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_CWR3_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CWR3_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_VME_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_UKR_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_BWA3_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_BWADD_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_REDD_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
	} else {
		//combine the tech tree
		{
			_nation_cnt = _forEachIndex +4;
			//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["No Addon: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
			if(_side == (_x) call CTI_CO_FNC_GetSideFromID) then {
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_GM_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_GM_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_PF_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_IC_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_WS_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_CUP_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_CUP_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_CUP_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_RHS_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_CWR3_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_CWR3_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_VME_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_UKR_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_BWA3_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_BWADD_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _nation_cnt select CTI_REDD_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
			};	
		} forEach [CTI_US_SIDE, CTI_SOV_SIDE, CTI_NPOC_SIDE, CTI_RACS_SIDE,CTI_FIA_SIDE];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["Techmatrix: [%1,%2,%3] <%4>", _factory, _nation, _mod, _tech]] call CTI_CO_FNC_Log;};

_tech
