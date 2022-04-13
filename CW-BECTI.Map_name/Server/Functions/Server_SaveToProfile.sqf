/*
  # HEADER #
	Script: 		Server\Functions\Server_SaveTpProfile.sqf
	Alias:			CTI_SE_FNC_SAVE
	Description:	Saves the mission to the active profileNamespace and its file	
	Author: 		dukee
	Creation Date:	31-03-2022
	Revision Date:	-
	
  # PARAMETERS #
	0	[String]: The part to be loaded
			-> deleted ["all"]			load everything
			["towns"]		load only the towns
			["hq"]			load the HQ
			["upgrades"]	load the saved upgrades
			["buildings"]	load all buildings
			["funds"]		load all funds
	
  # RETURNED VALUE #
	-
	
  # SYNTAX #
	[String] call CTI_SE_FNC_SAVE
	
  # EXAMPLE #
    ["towns"] call CTI_SE_FNC_SAVE
*/
private ["_part", "_savemode", "_savename"];

_part = _this select 0;
_savemode = CTI_PERSISTANT;
_savename = "";

if(_savemode < 0) then {_savemode = (_savemode*-1)};
switch(_savemode) do {
	case 2: {_savename = format["%1", missionName]};
	case 3: {_savename = format["%1_%2", missionName,worldName]};
	default {_savename = "VIO-BECTI"};
};

if(_savemode > 0) then {
	if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Start saving :<SAVE_%1> mode(%2) Part: %3", _savename, _savemode, _part]] call CTI_CO_FNC_Log;};
	switch(_part) do {
		case "towns": {
			_towns=[];
			{
				_towns pushBack [_x getVariable "cti_town_lastSideID", _x getVariable "cti_town_sideID"];
			} forEach (CTI_Towns);
			profileNamespace setVariable [Format ["SAVE_%1_TOWNS", _savename],_towns];
			if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Towns saved to profile:<SAVE_%1_TOWNS> Towns: <%2>", _savename, _towns]] call CTI_CO_FNC_Log;};
		};
		case "hq": {
			{
				//save the HQ for the side
				_hq=(_x) call CTI_CO_FNC_GetSideHQ;
				profileNamespace setVariable [Format ["SAVE_%1_%2_HQ", _savename, _x], [getposATL _hq,getDir _hq,alive _hq]];
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["HQ saved to profile:<SAVE_%1_HQ> HQ pos: <%2,%3,%4>", _savename, getposATL _hq, getDir _hq, alive _hq]] call CTI_CO_FNC_Log;};
			} forEach [east,west];
		};
		case "upgrades": {
			{
				//save the sides upgrades done
				profileNamespace setVariable [Format ["SAVE_%1_%2_UPGRADES", _savename, _x], (_x) call CTI_CO_FNC_GetSideUpgrades];
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Upgrades saved to profile:<SAVE_%1_UPGRADES> Upgrades: <%2>", _savename, (_x) call CTI_CO_FNC_GetSideUpgrades]] call CTI_CO_FNC_Log;};
			} forEach [east,west];
		};
		case "buildings": {
			{
				//save Base Areas (what counts as the real bases)
				_side = _x;			//only for a better readability
				_logic= (_side) call CTI_CO_FNC_GetSideLogic;
				profileNamespace setVariable [Format ["SAVE_%1_%2_AREAS", _savename, _side], (_logic getVariable "cti_structures_areas")];
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Base Areas saved to profile:<SAVE_%1_AREAS> Areas: <%2>", _savename, _logic getVariable "cti_structures_areas"]] call CTI_CO_FNC_Log;};
				
				//save the fabrics and other main base buildings
				_structures_prepaired = [];
				_structures=(_side) call CTI_CO_FNC_GetSideStructures;
				{
					_structure_type = if (isNil{_x getVariable "cti_structure_type"}) then {""} else {_x getVariable "cti_structure_type"};
					//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", _savename, _side], [_structure_type, getPosATL _x, getDir _x, getDammage _x]];
					_structures_prepaired pushback [_structure_type, getPosATL _x, getDir _x, getDammage _x];
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Building saved to profile:<SAVE_%1_FABRICS> Building: <%2><%3,%4-%5>", _savename, _structure_type, getposATL _x, getDir _x, getDammage _x]] call CTI_CO_FNC_Log;};
				} forEach _structures;
				//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", _savename, _side], _structures_prepaired];		//not needed
				
				//maybe we will save the WIP structures too ^^
				//_structures_prepaired = [];																					//not needed
				{
					_structure_type = if (isNil{_x getVariable "cti_structure_type"}) then {""} else {_x getVariable "cti_structure_type"};
					_structures_prepaired pushback [_structure_type, getPosATL _x, getDir _x, getDammage _x];
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["WIP saved to profile:<SAVE_%1_FABRICSWIP> WIP: <%2><%3,%4-%5>", _savename, _structure_type, getposATL _x, getDir _x, getDammage _x]] call CTI_CO_FNC_Log;};
				} forEach (_logic getVariable "cti_structures_wip");
				//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICSWIP", _savename, _side], _structures_prepaired];
				profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", _savename, _side], _structures_prepaired];
				
				//save all FOBs they placed
				_fobs_prepaired = [];
				{
					_fob_name = _x getVariable "savename";
					_fobs_prepaired pushback [_x getVariable "savename", getPosATL _x, getDir _x];
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Defences saved to profile:<SAVE_%1_DEFENSES> Defenses: <%2><%3,%4,%5>", _savename, _fob_name, getposATL _x, getDir _x]] call CTI_CO_FNC_Log;};
				} forEach (_logic getVariable "cti_fobs");
				profileNamespace setVariable [Format ["SAVE_%1_%2_FOBS", _savename, _side], _fobs_prepaired];
				
				//save all defenses they placed
				_defences_prepaired = [];
				{
					_x = _x select 0;
					_defense_name = _x getVariable "savename";
					_defense_manned = _x getVariable "cti_aman_enabled";
					_defences_prepaired pushback [_x getVariable "savename", getPosATL _x, getDir _x, _x getVariable "cti_aman_enabled"];
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Defences saved to profile:<SAVE_%1_DEFENSES> Defenses: <%2><%3,%4,%5>", _savename, _defense_name, getposATL _x, getDir _x, _defense_manned]] call CTI_CO_FNC_Log;};
				} forEach (_logic getVariable "cti_defences");
				profileNamespace setVariable [Format ["SAVE_%1_%2_DEFENSES", _savename, _side], _defences_prepaired];
			} forEach [east,west];
		};
		case "funds": {
			{
				//profileNamespace setVariable [Format ["SAVE_%1_%2_", _savename, _side],_towns];
				_side = _x;			//only for a better readability
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Side get saved to profile: <%1>", _side]] call CTI_CO_FNC_Log;};
				
				//save the supply value of the side
				profileNamespace setVariable [Format ["SAVE_%1_%2_SUPPLY", _savename, _side], (_side) call CTI_CO_FNC_GetSideSupply];
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Side supply saved to profile:<SAVE_%1_SUPPLY> Supply: <%2>", _savename, (_side) call CTI_CO_FNC_GetSideSupply]] call CTI_CO_FNC_Log;};
				
				//save the funds of all teams and the commanders
				profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDSCOM", _savename, _side], (_side)call CTI_CO_FNC_GetFundsCommander];
				if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Commander funds saved to profile:<SAVE_%1_FUNDSCOM> Funds Com: <%2>", _savename, (_side)call CTI_CO_FNC_GetFundsCommander]] call CTI_CO_FNC_Log;};
				
				//_groups = (_side) call CTI_CO_FNC_GetSideGroups;			//only active players
				_logic= (_side) call CTI_CO_FNC_GetSideLogic;
				_groups = _logic getVariable "cti_teams";
				{
					_groupnamefull = format ["%1", _x];
					_groupnamecut = _groupnamefull splitString " ";
					_groupname = _groupnamecut select 1;
					profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDS_%3", _savename, _side, _groupname], (_x) call CTI_CO_FNC_GetFundsTeam];
					if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Team funds saved to profile:<SAVE_%1_FUNDS_%2> Funds: <%3>", _savename, _groupname, (_x) call CTI_CO_FNC_GetFundsTeam]] call CTI_CO_FNC_Log;};
				} forEach (_groups);
			} forEach [east,west];
		};
		case "delete": {
			profileNamespace setVariable [Format ["SAVE_%1_TOWNS", _savename], nil, true];
			{
				profileNamespace setVariable [Format ["SAVE_%1_%2_HQ", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_UPGRADES", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_AREAS", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_FOBS", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_DEFENSES", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_SUPPLY", _savename, _x], nil, true];
				profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDSCOM", _savename, _x], nil, true];
				
				_logic= (_x) call CTI_CO_FNC_GetSideLogic;
				_groups = _logic getVariable "cti_teams";
				{
					profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDS_%3", _savename, _x, _groupname], nil, true];
				} forEach (_groups);
			} forEach [east,west];
		};
		default {};
	};	
};
