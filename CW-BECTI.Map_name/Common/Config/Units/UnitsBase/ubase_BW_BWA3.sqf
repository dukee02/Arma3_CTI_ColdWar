private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_BW_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_BW_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {};
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1BWA3_TL_Tropen", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1BWA3_Rifleman_Tropen", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1BWA3_Crew_Tropen", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1BWA3_Rifleman_unarmed_Tropen", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1BWA3_Rifleman_Tropen", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1BWA3_Crew_Tropen", _sid]];
			};
		};
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1BWA3_TL_Fleck", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1BWA3_Rifleman_Fleck", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1BWA3_Crew_Fleck", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1BWA3_Rifleman_unarmed_Fleck", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1BWA3_Rifleman_Fleck", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1BWA3_Crew_Fleck", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1BWA3_TL_Multi", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1BWA3_Rifleman_Multi", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1BWA3_Crew_Multi", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1BWA3_Rifleman_unarmed_Multi", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1BWA3_Rifleman_Multi", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1BWA3_Crew_Multi", _sid]];
			};
		};	
	};
	//1 pilot for all camos
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1BWA3_Helipilot", _sid]];

	if(CTI_BWADD_ID < 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 7) then {		//winter camo active
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1BW_LKW_Transport_offen_Winter", _sid], []], 
				[format["%1BW_LKW_Transport_Winter", _sid], []]
			]];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1BW_LKW_Transport_offen_Tropen", _sid], []], 
				[format["%1BW_LKW_Transport_Tropen", _sid], []]
			]];
		};
		if(CTI_CAMO_ACTIVATION < 1 || (CTI_CAMO_ACTIVATION > 2 && CTI_CAMO_ACTIVATION < 6) || CTI_CAMO_ACTIVATION == 7) then {		//all camo active
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1BW_LKW_Transport_offen_fleck", _sid], []], 
				[format["%1BW_LKW_Transport_Fleck", _sid], []]
			]];
		};
	} else {
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1bw_unimog_cargo", _sid], []], 
			[format["%1bw_unimog_cargo_covered", _sid], []]
		]];
	};
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_BW_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_BW_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 1: {};
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1BWA3_SL_Tropen", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1BWA3_Rifleman_Tropen", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1BWA3_Crew_Tropen", _sid]];
		};
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1BWA3_SL_Fleck", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1BWA3_Rifleman_Fleck", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1BWA3_Crew_Fleck", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1BWA3_SL_Multi", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1BWA3_Rifleman_Multi", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1BWA3_Crew_Multi", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_BW_BWA3.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
