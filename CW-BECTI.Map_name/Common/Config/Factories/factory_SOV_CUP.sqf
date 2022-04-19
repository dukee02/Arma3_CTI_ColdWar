/*
format["%1<vanilla_cnitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid] - 4 copy paste

CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all
*/
private ["_side", "_c", "_sid", "_priorUnits", "_ai", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation"];
_side = _this;
_ai = -1;
_sid = "";

if(_side == west) then {
	//_sid = "VIOC_B_";
	_ai = CTI_WEST_AI;
} 
else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_ai = CTI_EAST_AI;
	} 
	else {
		//_sid = "VIOC_I_";
	};
};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
//_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
//if ((isNil "_priorUnits" || _ai == 4) && CTI_CUP_ADDON > 0) then { 
//Check if the based mod is set as main, or the nation is explicit set.
if ((CTI_CUP_ADDON > 1) || _ai == CTI_SOV_ID) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//winter camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Winter", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid]];
		};
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Desert", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid]];
		};
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_M_EMR_V2", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid]];
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Autumn", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid]];
		};
		case 6: {//special camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_BeigeDigital", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Summer", _sid]];

			missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid]];
		};	
	};
	//1 pilot for all camos
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1CUP_O_RU_Pilot_M_EMR", _sid]];
	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1CUP_O_UAZ_Unarmed_RU", _sid], []], 
		[format["%1CUP_O_UAZ_Open_RU", _sid], []]
	]];
		
	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Saiga_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Light_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Soldier_A_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Engineer_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Exp_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_GL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_LAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Repair_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Exp_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Medic_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_LAT_Ratnik_Summer", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AR_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Officer_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AAR_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AR_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_MG_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_Marksman_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_SL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Survivor_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_Marksman_Ratnik_Summer", _sid];
	};
	_c pushBack format["%1CUP_O_RU_Pilot_M_EMR", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
		_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Winter", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Winter", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Desert", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Desert", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_RU_Spotter_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Sniper_KSVK_M_EMR", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_M_EMR_V2", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_M_EMR_V2", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 4 || CTI_CAMO_ACTIVATION == 7) then {		//urban camo active
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Autumn", _sid];
	};
	//if(CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION == 7) then {		//maritim camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 6 || CTI_CAMO_ACTIVATION == 7) then {		//special camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_BeigeDigital", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 5 || CTI_CAMO_ACTIVATION > 6) then {		//main camo active
		_c pushBack format["%1CUP_O_RU_Recon_TL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AHAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_HAT_Ratnik_Summer", _sid];
		_c pushBack format["%1CUP_O_RU_Soldier_AA_Ratnik_Summer", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
	_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];
	_c pushBack format["%1CUP_O_UAZ_SPG9_RU", _sid];			//SPG (AT)
	_c pushBack format["%1CUP_O_UAZ_AGS30_RU", _sid];			//GMG
	_c pushBack format["%1CUP_O_UAZ_MG_RU", _sid];				//MG
	_c pushBack format["%1CUP_O_Ural_Open_RU", _sid];
	_c pushBack format["%1CUP_O_Ural_RU", _sid];
	_c pushBack format["%1CUP_O_Ural_Empty_RU", _sid];
	//_u pushBack "CUP_O_Ural_Reammo_RU";			//Ammotruck
	//_u pushBack "CUP_O_Ural_Refuel_RU";			//Fueltruck
	//_u pushBack "CUP_O_Ural_Repair_RU";			//Repairtruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Ural_ZU23_RU", _sid];			//Flak	
	_c pushBack format["%1CUP_O_UAZ_AMB_RU", _sid];				//Medic
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_UAZ_METIS_RU", _sid];			//Metris (ATGM)
	_c pushBack format["%1CUP_O_BRDM2_RUS", _sid];				//MG + 2cm
	_c pushBack format["%1CUP_O_BRDM2_HQ_RUS", _sid];			//MG	
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_BRDM2_ATGM_RUS", _sid];			//4x ATGM
	_c pushBack format["%1CUP_O_UAZ_AA_RU", _sid];				//2x AA
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_BTR60_Winter_RU", _sid];	//2cm + MG	
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_BTR60_Green_RU", _sid];			//2cm + MG
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_BTR60_RU", _sid];				//2cm + MG
	};
	_c pushBack format["%1CUP_O_BM21_RU", _sid];				//Artytruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Kamaz_RU", _sid];
	_c pushBack format["%1CUP_O_Kamaz_Open_RU", _sid];
	//_u pushBack "CUP_O_Kamaz_Reammo_RU";			//Ammotruck
	//_u pushBack "CUP_O_Kamaz_Refuel_RU";			//Fueltruck
	//_u pushBack "CUP_O_Kamaz_Repair_RU";			//Repairtruck
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_BTR80_WINTER_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_WINTER_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//desert camo active
		_c pushBack format["%1CUP_O_BTR80_DESERT_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_DESERT_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_BTR80_GREEN_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_GREEN_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_BTR80_CAMO_RU", _sid];
		_c pushBack format["%1CUP_O_BTR80A_CAMO_RU", _sid];
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_BTR90_RU", _sid];
	_c pushBack format["%1CUP_O_BTR90_HQ_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_GAZ_Vodnik_Unarmed_RU", _sid];
	_c pushBack format["%1CUP_O_GAZ_Vodnik_PK_RU", _sid];		//MG front + rear
	_c pushBack format["%1CUP_O_GAZ_Vodnik_AGS_RU", _sid];		//GMG + rear MG
	_c pushBack format["%1CUP_O_GAZ_Vodnik_BPPU_RU", _sid];		//3cm Cannon
	_c pushBack format["%1CUP_O_GAZ_Vodnik_KPVT_RU", _sid];
	_c pushBack format["%1CUP_O_GAZ_Vodnik_MedEvac_RU", _sid];	//Medic
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//Winter camo active
		_c pushBack format["%1CUP_O_MTLB_pk_Winter_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 3 || CTI_CAMO_ACTIVATION == 7) then {		//jungle camo active
		_c pushBack format["%1CUP_O_MTLB_pk_Green_RU", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION > 3) then {		//main camo active
		_c pushBack format["%1CUP_O_MTLB_pk_WDL_RU", _sid];
	};
	_c pushBack format["%1CUP_O_BMP_HQ_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_BMP2_RU", _sid];			//2cm + Metris(ATGM)
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_BMP2_AMB_RU", _sid];		//Medic	
	_c pushBack format["%1CUP_O_BMP3_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_T72_RU", _sid];
	_c pushBack format["%1CUP_O_2S6_RU", _sid];
	_c pushBack format["%1CUP_O_2S6M_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_T90_RU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_Mi8AMT_RU", _sid];
	_c pushBack format["%1CUP_O_Mi8_VIV_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_Mi8_RU", _sid];
	_c pushBack format["%1CUP_O_Mi8_medevac_RU", _sid];//Medic
	_c pushBack format["%1CUP_O_Mi24_P_Dynamic_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_Mi24_V_Dynamic_RU", _sid];
	_c pushBack format["%1CUP_O_MI6A_RU", _sid];
	_c pushBack format["%1CUP_O_MI6T_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_Ka50_DL_RU", _sid];
	_c pushBack format["%1CUP_O_Ka60_Grey_RU", _sid];
	_c pushBack format["%1CUP_O_Su25_Dyn_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_Ka52_RU", _sid];
	_c pushBack format["%1CUP_O_Pchela1T_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1CUP_O_SU34_RU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//Repairtruck
};
//if(CTI_MAIN_ADDON == 1 ) then {
	_c pushBack format["CTI_Salvager_%1", _side];
//};

_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Kamaz_Repair_RU", _sid];			//Repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//Ammotruck
	_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
};

_matrix_cnt = [5, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	_c pushBack format["%1CUP_O_Kamaz_Reammo_RU", _sid];			//Ammotruck
	_c pushBack format["%1CUP_O_Kamaz_Refuel_RU", _sid];			//Fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//*********************************************************************************************************************************************
//											 Town Depot units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//winter camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Winter", _sid];
			};
			case 2: {//desert camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital", _sid];
			};
			case 3: {//jungle camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_M_EMR_V2", _sid];
			};
			case 4: {//urban camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Autumn", _sid];
			};
			case 6: {//special camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Desert", _sid];
			};
			default {//main camo active
				_c pushBack format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid];
				_c pushBack format["%1CUP_O_RU_Soldier_Medic_Ratnik_Summer", _sid];
			};	
		};
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1CUP_O_UAZ_Open_RU", _sid];	
	_c pushBack format["%1CUP_O_UAZ_Unarmed_RU", _sid];
};	
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CUP_O_Ural_Repair_RU", _sid];				//repairtruck
		_c pushBack format["%1CUP_O_Ural_Reammo_RU", _sid];				//ammotruck
		_c pushBack format["%1CUP_O_Ural_Refuel_RU", _sid];				//Fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_O_PBX_RU", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1CUP_O_ZUBR_RU", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_CUP.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
