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
		if(CTI_MAIN_ADDON == 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_GE_co.paa";};
	};
	case 2: {
		if(CTI_MAIN_ADDON == 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_GC_co.paa";};
	};
	case 3: {
		if(CTI_MAIN_ADDON == 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_DK_co.paa";};
	};
	case 4: {
		if(CTI_MAIN_ADDON == 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_PL_co.paa";};
	};
	case 5: {
		if(CTI_MAIN_ADDON == 0) then {_texture = "\gm\gm_core\data\flags\gm_flag_UR_co.paa";};
	};
	case 6: {
		if(CTI_CUP_ADDON > 0) then {_texture = "ca\Ca_E\data\flag_ger_co.paa";};
	};
	case 7: {
		if(CTI_CUP_ADDON > 0) then {_texture = "\ca\data\flag_rus_co.paa";};
	};
	case 8: {
		_texture = "\A3\Data_F\Flags\Flag_nato_CO.paa";
	};
	case 9: {
		_texture = "\A3\Data_F\Flags\Flag_us_CO.paa";
	};
	case 10: {
		_texture = "\A3\Data_F\Flags\Flag_uno_CO.paa";
	};
	/*case 11: {
		_texture = "";
	};*/
	default {
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