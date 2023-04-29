private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_CDF_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_CDF_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["rhsgref_cdf%1_ngd_officer", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["rhsgref_cdf%1_ngd_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["rhsgref_cdf%1_ngd_crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["rhsgref_cdf%1_ngd_rifleman_lite", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["rhsgref_cdf%1_ngd_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["rhsgref_cdf%1_ngd_crew", _sid]];
			};
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["rhsgref_cdf%1_para_squadleader", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["rhsgref_cdf%1_para_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["rhsgref_cdf%1_para_crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["rhsgref_cdf%1_para_rifleman_lite", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["rhsgref_cdf%1_para_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["rhsgref_cdf%1_para_crew", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["rhsgref_cdf%1_reg_general", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["rhsgref_cdf%1_reg_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["rhsgref_cdf%1_reg_crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["rhsgref_cdf%1_reg_rifleman_lite", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["rhsgref_cdf%1_reg_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["rhsgref_cdf%1_reg_crew", _sid]];
			};
		};	
	};
	missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["rhsgref_cdf%1_air_pilot", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["rhsgref_cdf%1_reg_uaz", _sid], []], 
		[format["rhsgref_cdf%1_reg_uaz_open", _sid], []]
	]];
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_CDF_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_CDF_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["rhsgref_cdf%1_ngd_officer", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["rhsgref_cdf%1_ngd_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["rhsgref_cdf%1_ngd_crew", _sid]];
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["rhsgref_cdf%1_para_squadleader", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["rhsgref_cdf%1_para_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["rhsgref_cdf%1_para_crew", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["rhsgref_cdf%1_reg_general", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["rhsgref_cdf%1_reg_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["rhsgref_cdf%1_reg_crew", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_CDF_RHS.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
