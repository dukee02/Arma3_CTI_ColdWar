/*
  # HEADER #
	Script: 		Server\Functions\Server_LoadFromProfile.sqf
	Alias:			CTI_SE_FNC_LOAD
	Description:	Loads the data stored in the profileNamespace
	Author: 		dukee
	Creation Date:	31-03-2022
	Revision Date:	-
	
  # PARAMETERS #
	-
	
  # RETURNED VALUE #
	-
	
  # SYNTAX #
	0 call CTI_SE_FNC_LOAD
	
  # EXAMPLE #
    0 call CTI_SE_FNC_LOAD
*/

//get the informations about all towns and save them to the profileNamespace
//worldName and/or missionName for the prefix
if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Start loading :<SAVE_%1>", missionName]] call CTI_CO_FNC_Log;};

//Load the stored towns and set them via CTI_SE_FNC_OnTownCaptured
_towns = profileNamespace getVariable [Format ["SAVE_%1_TOWNS", missionName],[]];

//check if a save is there, if not, skip the loading
if(count _towns <= 0) then {
	if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", "No save found"] call CTI_CO_FNC_Log;};
} else {
	if (count _towns != count CTI_TOWNS) exitWith {
		if (CTI_Log_Level >= CTI_Log_Error) then {["VIOC_ERROR", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["ERROR on loading the towns, town count: <%1>", count _towns]] call CTI_CO_FNC_Log;};
	};
	{
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Town loaded from :<SAVE_%1> Town: <%2>", missionName, _foreachindex, _x]] call CTI_CO_FNC_Log;};
		_x setVariable ["cti_town_lastSideID", (_towns select _foreachindex) select 0, true];
		[_x, ((_towns select _foreachindex) select 1) call CTI_CO_FNC_GetSideFromID] call CTI_SE_FNC_OnTownCaptured;
	} foreach (CTI_TOWNS);

	{
		//profileNamespace setVariable [Format ["SAVE_%1_%2_", missionName, _side],_towns];
		_side = _x;			//only for a better readability
		_logic= (_side) call CTI_CO_FNC_GetSideLogic;
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Load the Side <%1> from the profile", _side]] call CTI_CO_FNC_Log;};
		
		//Load the HQ for the side
		_hq_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_HQ", missionName, _side],[]];
		if!(count _hq_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Error) then {["VIOC_ERROR", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["ERROR on loading the HQ, vars: <%1>", _hq_stored]] call CTI_CO_FNC_Log;};
		} else {
			//_positions = _hq_stored select 0;
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["HQ loaded from profile:<SAVE_%1_HQ> HQ pos: <%2,%3-%4>", missionName, _hq_stored select 0, _hq_stored select 1, _hq_stored select 2]] call CTI_CO_FNC_Log;};
			_hq=(_side) call CTI_CO_FNC_GetSideHQ;
			_hq setposATL (_hq_stored select 0);
			_hq setdir (_hq_stored select 1);
			if !(_hq_stored select 2) then {_hq setDamage 1};
		};
		
		//Load the Upgrades for the side
		_upgrades_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_UPGRADES", missionName, _side],[]];
		if!(count _upgrades_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Error) then {["VIOC_ERROR", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["ERROR on loading the Upgrades, vars: <%1>", _upgrades_stored]] call CTI_CO_FNC_Log;};
		} else {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Upgrades loaded from profile:<SAVE_%1_UPGRADES> Upgrades: <%2>", missionName, _upgrades_stored]] call CTI_CO_FNC_Log;};
			_logic setVariable ["cti_upgrades", _upgrades_stored, true];
		};
		
		//Load the fabrics and other main base buildings
		_fabrics_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_FABRICS", missionName, _side],[]];
		if!(count _fabrics_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["No Base buildings found, vars: <%1>", _fabrics_stored]] call CTI_CO_FNC_Log;};
		} else {
			{
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Building loaded from profile:<SAVE_%1_FABRICS> Building: <%2><%3,%4-%5>", missionName, _x select 0, _x select 1, _x select 2, _x select 3]] call CTI_CO_FNC_Log;};
			_build = objNull;
			switch(_x select 0) do {
				case "Barracks": {
					_build=[format ["CTI_%1_Barracks", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
					//["BARRACKS", _side] spawn CTI_SE_FNC_HandleStaticDefenses;
				};
				case "Light": {
					_build=[format ["CTI_%1_LIGHT", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "ControlCenter": {
					_build=[format ["CTI_%1_CONTROLCENTER", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "Naval": {
					_build=[format ["CTI_%1_NAVAL", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "Ammo": {
					_build=[format ["CTI_%1_AMMO", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "Repair": {
					_build=[format ["CTI_%1_REPAIR", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "Heavy": {
					_build=[format ["CTI_%1_HEAVY", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				case "Air": {
					_build=[format ["CTI_%1_AIR", _side], _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
				default {
					//_build=[CTI_BARRACKS, _side, _x select 1, _x select 2 ] call CTI_SE_FNC_BuildStructure;
				};
			};
			sleep 0.2;
			_build setvariable ["cti_completion",100,true];
			sleep 0.2;
			} forEach _fabrics_stored;
		};		
		
		//Load the Base Areas (what counts as the real bases)
		_areas_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_AREAS", missionName, _side],[]];
		if!(count _areas_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["No Base areas found, vars: <%1>", _areas_stored]] call CTI_CO_FNC_Log;};
		} else {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Base Areas loaded from profile:<SAVE_%1_AREAS> Areas: <%2>", missionName, _areas_stored]] call CTI_CO_FNC_Log;};
			_logic setVariable ["cti_structures_areas", _areas_stored, true];
		};
		
		//Load all FOBs they placed
		_fobs_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_FOBS", missionName, _side],[]];
		if!(count _fobs_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["No FOBs found, vars: <%1>", _fobs_stored]] call CTI_CO_FNC_Log;};
		} else {
			{	
				[_x select 0, _side, [( _x select 1) select 0,( _x select 1) select 1], _x select 2, VIOC_ZEUS, false] call CTI_SE_FNC_BuildDefense;				
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Defences loaded from profile:<SAVE_%1_DEFENSES> Defenses: <%2,%3,%4,%5>", missionName, _x select 0, _x select 1, _x select 2, _x select 3]] call CTI_CO_FNC_Log;};
			} forEach _fobs_stored;
		};
		
		//Load all defenses they placed
		_defences_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_DEFENSES", missionName, _side],[]];
		if!(count _defences_stored > 0) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["No defences found, vars: <%1>", _defences_stored]] call CTI_CO_FNC_Log;};
		} else {
			{	
				[_x select 0, _side, [( _x select 1) select 0,( _x select 1) select 1], _x select 2, VIOC_ZEUS, false,  _x select 3] call CTI_SE_FNC_BuildDefense;				
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Defences loaded from profile:<SAVE_%1_DEFENSES> Defenses: <%2,%3,%4,%5>", missionName, _x select 0, _x select 1, _x select 2, _x select 3]] call CTI_CO_FNC_Log;};
			} forEach _defences_stored;
		};

		//Load the supply value of the side
		_supply_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_SUPPLY", missionName, _side],0];
		if(_supply_stored <= 0) then {
			if (CTI_Log_Level >= CTI_Log_Error) then {["VIOC_ERROR", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["ERROR on loading the Side supply, value: <%1>", _supply_stored]] call CTI_CO_FNC_Log;};
		} else {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Side supply loaded from profile:<SAVE_%1_FUNDSCOM> Funds Com: <%2>", missionName, _supply_stored]] call CTI_CO_FNC_Log;};
			[_side, _supply_stored] call CTI_CO_FNC_ChangeSideSupply; 
		};
		
		//Load the funds of the commander
		_comfunds_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_FUNDSCOM", missionName, _side],0];
		if(_comfunds_stored <= 0) then {
			if (CTI_Log_Level >= CTI_Log_Error) then {["VIOC_ERROR", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["ERROR on loading the Commander funds, value: <%1>", _comfunds_stored]] call CTI_CO_FNC_Log;};
		} else {
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Commander funds loaded from profile:<SAVE_%1_FUNDSCOM> Funds Com: <%2>", missionName, _comfunds_stored]] call CTI_CO_FNC_Log;};
			_logic setvariable ["cti_commander_funds", _comfunds_stored, true];
		};
		
		//load the funds of all groups
		//_groups = (_side) call CTI_CO_FNC_GetSideGroups;			//only active players
		_groups = _logic getVariable "cti_teams";
		{
			_groupnamefull = format ["%1", _x];
			_groupnamecut = _groupnamefull splitString " ";
			_groupname = _groupnamecut select 1;
			_teamfunds_stored = profileNamespace getVariable [Format ["SAVE_%1_%2_FUNDS_%3", missionName, _side, _groupname],0];
			
			if(_teamfunds_stored <= 0) then {
				_default_funds = missionNamespace getVariable [Format ["CTI_ECONOMY_STARTUP_FUNDS_%1", _side],0];
				if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["No Team funds found, set to default: <%1>", _default_funds]] call CTI_CO_FNC_Log;};
			} else {
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveTpProfile.sqf", format["Team funds loaded from profile:<SAVE_%1_FUNDS_%2> Funds: <%3>", missionName, _groupname, (_x) call CTI_CO_FNC_GetFundsTeam]] call CTI_CO_FNC_Log;};
				[_x, _teamfunds_stored] call CTI_CO_FNC_ChangeFundsTeam;
			};
		} forEach (_groups);

	} forEach [east,west];
};

if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_LoadFromProfile.sqf", format["Loading finished:<SAVE_%1>", missionName]] call CTI_CO_FNC_Log;};
