private ["_side","_texture"];
_side = _this;


if(_side == "WEST_") then {
	_texture = "\A3\Data_F\Flags\Flag_blue_CO.paa";
} 
else {
	if(_side == "EAST_") then {
		_texture = "\A3\Data_F\Flags\Flag_red_CO.paa";
	} 
	else {
		_texture = "\A3\Data_F\Flags\Flag_green_CO.paa";
	};
};



switch (missionNamespace getVariable format["CTI_%1FLAG", _side]) do {
	case 1: {
		_texture = "\A3\Data_F\Flags\Flag_nato_CO.paa";
	};
	case 2: {
		_texture = "\A3\Data_F\Flags\Flag_us_CO.paa";
	};
	case 3: {
		_texture = "\A3\Data_F\Flags\Flag_uno_CO.paa";
	};
	case 4: {
		if(CTI_CUP_ADDON > 0) then {_texture = "ca\Ca_E\data\flag_ger_co.paa";};	//GER
	};
	case 5: {
		if(CTI_CUP_ADDON > 0) then {_texture = "\ca\data\flag_rus_co.paa";};		//RUS
	};
	case 6: {
		if(CTI_CUP_ADDON > 0) then {_texture = "\ca\data\flag_NAPA_co.paa";};		//NPoC
	};
	case 7: {
		if(CTI_CUP_ADDON > 0) then {_texture = "\ca\misc\data\jih_vlajka.paa";};	//RACS
	};
	case 8: {
		if(CTI_CUP_ADDON > 0) then {_texture = "\ca\misc\data\usa_vlajka.pac";};	//USA
	};
	case 9: {
		if(CTI_CUP_ADDON > 0) then {_texture = "ca\Ca_E\data\flag_usarmy_co.paa";};	//US Army
	};
	case 10: {
		if(CTI_CUP_ADDON > 0) then {_texture = "CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_unionjack_co";};		//UK
	};
	case 11: {
		if(CTI_GM_DLC > 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_GE_co.paa";};
	};
	case 12: {
		if(CTI_GM_DLC > 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_GC_co.paa";};
	};
	case 13: {
		if(CTI_GM_DLC > 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_DK_co.paa";};
	};
	case 14: {
		if(CTI_GM_DLC > 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_PL_co.paa";};
	};
	case 15: {
		if(CTI_GM_DLC > 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_UR_co.paa";};
	};
	case 16: {
		if(CTI_BW_ADDON > 0) then {_texture = "\bw_flags\data\flagge_bund_CO.paa";};	//GER BUND
	};
	case 17: {
		if(CTI_RHS_ADDON > 0) then {_texture = "\rhsafrf\addons\rhs_main\data\Flag_rus_CO.paa";};
	};
	case 18: {
		if(CTI_RHS_ADDON > 0) then {_texture = "\rhsafrf\addons\rhs_main\data\Flag_vdv_CO.paa";};
	};
	case 19: {
		if(CTI_RHS_ADDON > 0) then {_texture = "\rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa";};		//chdkz
	};
	/*case 11: {
		_texture = "";
	};*/
	default {
		if(_side == "WEST_") then {
			_texture = "\A3\Data_F\Flags\Flag_blue_CO.paa";
		} 
		else {
			if(_side == "EAST_") then {
				_texture = "\A3\Data_F\Flags\Flag_red_CO.paa";
			} 
			else {
				_texture = "\A3\Data_F\Flags\Flag_green_CO.paa";
			};
		};
	};
};

	
if(_side == "WEST_") then {
	missionNamespace setVariable ["CTI_WESTFLAG", _texture];
} else {
	if(_side == "EAST_") then {
		missionNamespace setVariable ["CTI_EASTFLAG", _texture];
	} 
	else {
		missionNamespace setVariable ["CTI_GUERFLAG", _texture];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SetTownFlag.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", missionNamespace getVariable format["CTI_%1FLAG", _side], _texture]] call CTI_CO_FNC_Log;
};