private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_US_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_US_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2;
		case 4: {//desert/urban camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1vn_b_men_cidg_22", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1vn_b_men_cidg_14", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1vn_b_men_cidg_06", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1vn_b_men_army_28", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1vn_b_men_army_16", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1vn_b_men_army_15", _sid]];
			};
		};
	};
	missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1vn_b_men_army_13", _sid]];
	missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1vn_b_men_army_31", _sid]];
	missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1vn_o_men_nva_39", _sid]];
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1vn_o_men_aircrew_01", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1vn_b_wheeled_m151_01", _sid], []], 
		[format["%1vn_b_wheeled_m151_02", _sid], []]
	]];
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_US_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_US_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	switch(CTI_TOWN_CAMO) do {
		case 2: {};
		case 4: {//desert/urban camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1vn_b_men_cidg_22", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1vn_b_men_cidg_14", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1vn_b_men_army_28", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1vn_b_men_army_16", _sid]];
		};	
	};
	missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1vn_o_men_nva_39", _sid]];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_SOG.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
