private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 jungle camo | 4 urban camo | 5 maritim camo | 6 special | 7 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_US_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_US_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1rhsusf_usmc_marpat_d_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1rhsusf_usmc_marpat_d_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1rhsusf_usmc_marpat_d_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1rhsusf_usmc_marpat_d_helipilot", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1rhsusf_usmc_marpat_d_rifleman_light", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1rhsusf_usmc_marpat_d_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1rhsusf_usmc_marpat_d_crewman", _sid]];
			};
		};
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1rhsusf_usmc_marpat_wd_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1rhsusf_usmc_marpat_wd_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1rhsusf_usmc_marpat_wd_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1rhsusf_usmc_marpat_wd_helipilot", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1rhsusf_usmc_marpat_wd_rifleman_light", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1rhsusf_usmc_marpat_wd_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1rhsusf_usmc_marpat_wd_crewman", _sid]];
			};
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1rhsusf_army_ucp_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1rhsusf_army_ucp_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1rhsusf_army_ucp_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1rhsusf_army_ucp_helipilot", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1rhsusf_army_ucp_riflemanl", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1rhsusf_army_ucp_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1rhsusf_army_ucp_crewman", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1rhsusf_army_ocp_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1rhsusf_army_ocp_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1rhsusf_army_ocp_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1rhsusf_army_ocp_helipilot", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1rhsusf_army_ocp_riflemanl", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1rhsusf_army_ocp_rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1rhsusf_army_ocp_crewman", _sid]];
			};
		};	
	};

	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 7) then {		//Desert camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1rhsusf_m998_d_2dr", _sid], []], 
			[format["%1rhsusf_m998_d_4dr", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION < 2 || CTI_CAMO_ACTIVATION > 2) then {		//main camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1rhsusf_m998_w_2dr", _sid], []], 
			[format["%1rhsusf_m998_w_4dr", _sid], []]
		]];
	};
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_US_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_US_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 2: {//desert camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1rhsusf_usmc_marpat_d_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1rhsusf_usmc_marpat_d_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1rhsusf_usmc_marpat_d_crewman", _sid]];
		};
		case 3: {//jungle camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1rhsusf_usmc_marpat_wd_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1rhsusf_usmc_marpat_wd_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1rhsusf_usmc_marpat_wd_crewman", _sid]];
		};
		case 4: {//urban camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1rhsusf_army_ucp_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1rhsusf_army_ucp_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1rhsusf_army_ucp_crewman", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1rhsusf_army_ocp_teamleader", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1rhsusf_army_ocp_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1rhsusf_army_ocp_crewman", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_US_RHS.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
