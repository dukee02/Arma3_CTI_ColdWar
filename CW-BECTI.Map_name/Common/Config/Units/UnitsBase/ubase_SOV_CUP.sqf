private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["setting up factory units for side %1, loading base units -> %2", _side, _setupBaseUnits]] call CTI_CO_FNC_Log;};

switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//winter camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid]];
		};
	};
	case 2: {//desert camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid]];
		};
	};
	case 3: {//jungle camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid]];
		};
	};
	case 4: {//urban camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid]];
		};
	};
	case 6: {//special camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid]];
		};
	};
	default {//main camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid]];
		missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1CUP_O_RU_Soldier_Unarmed_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid]];
		};
	};	
};
//1 pilot for all camos
missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1CUP_O_RU_Pilot_M_EMR", _sid]];

//Set starting vehicles
missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
	[format["%1CUP_O_UAZ_Unarmed_RU", _sid], []], 
	[format["%1CUP_O_UAZ_Open_RU", _sid], []]
]];

//needed for Tonw units because the camo can differ
switch(CTI_TOWN_CAMO) do {
	case 1: {//winter camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Winter", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Winter", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Winter", _sid]];
	};
	case 2: {//desert camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Desert", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Desert", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Desert", _sid]];
	};
	case 3: {//jungle camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_M_EMR_V2", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Lite_M_EMR_V2", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Crew_M_EMR_V2", _sid]];
	};
	case 4: {//urban camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Autumn", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Autumn", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Autumn", _sid]];
	};
	case 6: {//special camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_BeigeDigital", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_BeigeDigital", _sid]];
	};
	default {//main camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1CUP_O_RU_Soldier_TL_Ratnik_Summer", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1CUP_O_RU_Soldier_Ratnik_Summer", _sid]];
		missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1CUP_O_RU_Soldier_Lite_Ratnik_Summer", _sid]];
	};	
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CUP.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
