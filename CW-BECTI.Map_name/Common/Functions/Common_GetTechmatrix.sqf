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

_tech_matrix = missionNamespace getVariable ["CTI_TECHMATRIX", []];

_tech = [];
if(_mod >= 0) then {
	_tech = _tech_matrix select _factory select _nation select _mod;
} else {
	if(_nation >= 0) then {
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["With Nation: [%1,%2] <%3>", _factory, _nation, _tech]] call CTI_CO_FNC_Log;};
		_tech = _tech_matrix select _factory select _nation select 0;

		if(CTI_GM_DLC > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_GM_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SOG_DLC > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_PF_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		/*if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_IC_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_WS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};*/
		if(CTI_CUP_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CUP_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_RHS_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_RHS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_CWR3_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CWR3_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		/*if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_VME_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_GM_ID > 0) then {	//placeholder comming soon
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_UKR_ID] call CTI_CO_FNC_MergeMatrixArray;
		};*/
		if(CTI_BW_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_BWA3_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_BWADD_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_BWADD_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_REDD_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_REDD_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
	} else {
		//combine the tech tree
		{
			_nation_cnt = _forEachIndex; //if(_forEachIndex == 2 || _forEachIndex == 3) then {_forEachIndex + 2} else {_forEachIndex};
			if(_side == (_x) call CTI_CO_FNC_GetSideFromID) then {
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["No Nation: %1 [%2,%3] <%4>", (_x) call CTI_CO_FNC_GetSideFromID, _factory, _x, _tech]] call CTI_CO_FNC_Log;};
				if(CTI_GM_DLC > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_GM_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_SOG_DLC > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_PF_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				/*if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_IC_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_WS_ID] call CTI_CO_FNC_MergeMatrixArray;
				};*/
				if(CTI_CUP_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_CUP_ID] call CTI_CO_FNC_MergeMatrixArray;
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_CUP_ADDON: [%1,%2] <%3>", _factory, _nation_cnt, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_RHS_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_RHS_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_CWR3_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_CWR3_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				/*if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_VME_ID] call CTI_CO_FNC_MergeMatrixArray;
				};
				if(CTI_GM_ID > 0) then {	//placeholder comming soon
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_UKR_ID] call CTI_CO_FNC_MergeMatrixArray;
				};*/
				if(CTI_BW_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_BWA3_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_BW_ADDON: [%1,%2] <%3>", _factory, _nation_cnt, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_BWADD_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_BWADD_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_BWADD_ADDON: [%1,%2] <%3>", _factory, _nation_cnt, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_REDD_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _x select CTI_REDD_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_REDD_ADDON: [%1,%2] <%3>", _factory, _nation_cnt, _tech]] call CTI_CO_FNC_Log;};
				};
			};	
		} forEach [CTI_US_SIDE, CTI_SOV_SIDE, CTI_NPOC_SIDE, CTI_RACS_SIDE, CTI_FIA_SIDE, CTI_BW_SIDE, CTI_NVA_SIDE, CTI_CDF_SIDE, CTI_CHDKZ_SIDE, CTI_UKRAIN_SIDE];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["Techmatrix: [%1,%2,%3] <%4>", _factory, _nation, _mod, _tech]] call CTI_CO_FNC_Log;};

_tech
