private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["setting up factory units for side %1, loading base units -> %2", _side, _setupBaseUnits]] call CTI_CO_FNC_Log;};

switch(CTI_CAMO_ACTIVATION) do {
	case 2;
	case 4: {//desert/urban camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1cwr3_o_soldier82_tl", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1cwr3_o_soldier82", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1cwr3_o_soldier82_light", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1cwr3_o_soldier82", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1cwr3_o_soldier82_driver", _sid]];
		};
	};
	default {//main camo active
		missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1cwr3_o_soldier_tl", _sid]];
		missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1cwr3_o_soldier", _sid]];
		if!(_tag == "GUER_") then {
			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1cwr3_o_soldier_light", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1cwr3_o_soldier", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1cwr3_o_soldier", _sid]];
		};
	};
};
missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1cwr3_o_soldier_crew", _sid]];
missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1cwr3_o_camel_pilot", _sid]];

//Set starting vehicles
missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
	[format["%1cwr3_o_uaz_open", _sid], []], 
	[format["%1cwr3_o_uaz_open", _sid], []]
]];

//needed for Tonw units because the camo can differ
switch(CTI_TOWN_CAMO) do {
	case 2: {};
	case 4: {//desert/urban camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1cwr3_o_soldier82_tl", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1cwr3_o_soldier82", _sid]];
	};
	default {//main camo active
		missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1cwr3_o_soldier_tl", _sid]];
		missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1cwr3_o_soldier", _sid]];
	};	
};
missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1cwr3_o_soldier_crew", _sid]];

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_SOV_CWR3.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
