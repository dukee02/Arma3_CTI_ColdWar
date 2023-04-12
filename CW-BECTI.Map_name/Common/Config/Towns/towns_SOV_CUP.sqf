_side = _this;
_sid = "";
_tag = "";
_level = 0;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_tag = "WEST_";};
	case east: {/*_sid = "VIOC_O_";*/_tag = "EAST_";};
	case resistance: {/*_sid = "VIOC_I_";*/_tag = "GUER_";};
	default {};
};
//if(CTI_VIO_ADDON == 0) then {_sid = "";};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;};

(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 1: {//winter camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid],1]];
		};
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid],1]];
		};
		case 4: {//urban camo active
		INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid],1]];
		};
		case 6: {//special camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 1: {//winter camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Winter", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid],1]];
		};
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Desert", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_M_EMR_V2", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_AT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid],1]];
		};
		case 4: {//urban camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Autumn", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid],1]];
		};
		case 6: {//special camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Summer", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_AAT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_TOWN_CAMO) do {
		case 1: {//winter camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Winter", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Winter", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid],1]];
		};
		case 2: {//desert camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Desert", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Desert", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid],1]];
		};
		case 3: {//jungle camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_M_EMR_V2", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_AT_M_EMR_V2", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid],1]];
		};
		case 4: {//urban camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Autumn", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Autumn", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid],1]];
		};
		case 6: {//special camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid],1]];
		};
		default {//main camo active
			INFANTRY = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Summer", _sid],1]];
			INFANTRY_MG = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid],1]];
			INFANTRY_AT = [[format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_HAT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_AT_Ratnik_Summer", _sid],1],[format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_O_UAZ_MG_RU", _sid],1],[format["%1CUP_O_UAZ_AGS30_RU", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_O_UAZ_SPG9_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_O_UAZ_MG_RU", _sid],1],[format["%1CUP_O_UAZ_AGS30_RU", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_O_UAZ_SPG9_RU", _sid],1],[format["%1CUP_O_UAZ_SPG9_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1CUP_O_UAZ_MG_RU", _sid],1],[format["%1CUP_O_UAZ_AGS30_RU", _sid],1],[format["%1CUP_O_UAZ_SPG9_RU", _sid],1],[format["%1CUP_O_UAZ_METIS_RU", _sid],1]];
	WHEELED_HEAVY = [[format["%1CUP_O_BRDM2_RUS", _sid],1],[format["%1CUP_O_BRDM2_HQ_RUS", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_O_BRDM2_ATGM_RUS", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR60_Winter_RU", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR60_Green_RU", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR60_RU", _sid],1];
	};
	WHEELED_HEAVY pushBack [format["%1CUP_O_BM21_RU", _sid],1];
};

/*_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
	_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
};*/
_matrix_cnt = _matrix_cnt + 1;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80_WINTER_RU", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80A_WINTER_RU", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80_DESERT_RU", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80A_DESERT_RU", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80_GREEN_RU", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80A_GREEN_RU", _sid],1];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80_CAMO_RU", _sid],1];
		WHEELED_HEAVY pushBack [format["%1CUP_O_BTR80A_CAMO_RU", _sid],1];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_O_BTR90_RU", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_O_BTR90_HQ_RU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_HEAVY pushBack [format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid],1];
	WHEELED_HEAVY pushBack [format["%1CUP_O_GAZ_Vodnik_KPVT_RU", _sid],1];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		TRACKED_MEDIUM = [[format["%1CUP_O_MTLB_pk_Winter_RU", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_O_MTLB_pk_Winter_RU", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		TRACKED_MEDIUM = [[format["%1CUP_O_MTLB_pk_Green_RU", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_O_MTLB_pk_Green_RU", _sid],1]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		TRACKED_MEDIUM = [[format["%1CUP_O_MTLB_pk_WDL_RU", _sid],1]];
		TRACKED_HEAVY = [[format["%1CUP_O_MTLB_pk_WDL_RU", _sid],1]];
	};
	TRACKED_LIGHT = [[format["%1CUP_O_BMP_HQ_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_LIGHT = [[format["%1CUP_O_BMP2_RU", _sid],1]];
	TRACKED_MEDIUM = [[format["%1CUP_O_BMP2_RU", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_O_BMP2_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY = [[format["%1CUP_O_BMP3_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_MEDIUM = [[format["%1CUP_O_BMP3_RU", _sid],1]];
	TRACKED_HEAVY = [[format["%1CUP_O_T72_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	TRACKED_HEAVY = [[format["%1CUP_O_T72_RU", _sid],1],[format["%1CUP_O_T90_RU", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_O_Mi8AMT_RU", _sid],1],[format["%1CUP_O_Mi8_VIV_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER = [[format["%1CUP_O_Mi8_RU", _sid],1]];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_O_Mi24_P_Dynamic_RU", _sid],1];
	AIR_BOMBER pushBack [format["%1CUP_O_Mi24_V_Dynamic_RU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_O_Ka50_DL_RU", _sid],1];
	AIR_BOMBER pushBack [format["%1CUP_O_Ka60_Grey_RU", _sid],1];
	AIR_FIGHTER pushBack [format["%1CUP_O_Su25_Dyn_RU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_BOMBER pushBack [format["%1CUP_O_Ka52_RU", _sid],1];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER pushBack [format["%1CUP_O_SU34_RU", _sid],1];
};
if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
//Town Anti-Air setup
ANTI_AIR = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1CUP_O_Ural_ZU23_RU", _sid], 1, 40]];
};

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR = [[format["%1CUP_O_UAZ_AA_RU", _sid], 1, 40]];
};

_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	ANTI_AIR pushBack [format["%1CUP_O_2S6_RU", _sid], 1, 20];
	ANTI_AIR pushBack [format["%1CUP_O_2S6M_RU", _sid], 1, 20];
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]} || CTI_UPGRADE_MODE > 0) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_CUP.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};