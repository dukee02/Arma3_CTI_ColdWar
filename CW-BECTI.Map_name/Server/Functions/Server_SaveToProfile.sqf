/*
  # HEADER #
	Script: 		Server\Functions\Server_SaveTpProfile.sqf
	Alias:			CTI_SE_FNC_SAVE
	Description:	Saves the mission to the active profileNamespace and its file	
	Author: 		dukee
	Creation Date:	31-03-2022
	Revision Date:	-
	
  # PARAMETERS #
	-
	
  # RETURNED VALUE #
	-
	
  # SYNTAX #
	0 call CTI_SE_FNC_SAVE
	
  # EXAMPLE #
    0 call CTI_SE_FNC_SAVE
*/

//get the informations about all towns and save them to the profileNamespace
//worldName and/or missionName for the prefix
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Start saving :<SAVE_%1>", missionName]] call CTI_CO_FNC_Log;};

_towns=[];
{
	_towns pushBack [_x getVariable "cti_town_lastSideID", _x getVariable "cti_town_sideID"];
} forEach (CTI_Towns);
profileNamespace setVariable [Format ["SAVE_%1_TOWNS", missionName],_towns];

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Towns saved to profile:<SAVE_%1_TOWNS> Towns: <%2>", missionName, _towns]] call CTI_CO_FNC_Log;};

{
	//profileNamespace setVariable [Format ["SAVE_%1_%2_", missionName, _side],_towns];
	_side = _x;			//only for a better readability
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Side get saved to profile: <%1>", _side]] call CTI_CO_FNC_Log;};
	
	//save the HQ for the side
	_hq=(_side) call CTI_CO_FNC_GetSideHQ;
	profileNamespace setVariable [Format ["SAVE_%1_%2_HQ", missionName, _side], [getposATL _hq,getDir _hq,alive _hq]];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["HQ saved to profile:<SAVE_%1_HQ> HQ pos: <%2,%3,%4>", missionName, getposATL _hq, getDir _hq, alive _hq]] call CTI_CO_FNC_Log;};
	
	//save the sides upgrades done
	profileNamespace setVariable [Format ["SAVE_%1_%2_UPGRADES", missionName, _side], (_side) call CTI_CO_FNC_GetSideUpgrades];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Upgrades saved to profile:<SAVE_%1_UPGRADES> Upgrades: <%2>", missionName, (_side) call CTI_CO_FNC_GetSideUpgrades]] call CTI_CO_FNC_Log;};
	
	//save Base Areas (what counts as the real bases)
	_logic= (_side) call CTI_CO_FNC_GetSideLogic;
	profileNamespace setVariable [Format ["SAVE_%1_%2_AREAS", missionName, _side], (_logic getVariable "cti_structures_areas")];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Base Areas saved to profile:<SAVE_%1_AREAS> Areas: <%2>", missionName, _logic getVariable "cti_structures_areas"]] call CTI_CO_FNC_Log;};
	
	//save the fabrics and other main base buildings
	_structures_prepaired = [];
	_structures=(_side) call CTI_CO_FNC_GetSideStructures;
	{
		_structure_type = if (isNil{_x getVariable "cti_structure_type"}) then {""} else {_x getVariable "cti_structure_type"};
		//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", missionName, _side], [_structure_type, getPosATL _x, getDir _x, getDammage _x]];
		_structures_prepaired pushback [_structure_type, getPosATL _x, getDir _x, getDammage _x];
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Building saved to profile:<SAVE_%1_FABRICS> Building: <%2><%3,%4-%5>", missionName, _structure_type, getposATL _x, getDir _x, getDammage _x]] call CTI_CO_FNC_Log;};
	} forEach _structures;
	//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", missionName, _side], _structures_prepaired];		//not needed, we set the WIP buildings to finished
	
	//maybe we will save the WIP structures too ^^
	//_structures_prepaired = [];																					//not needed, we set the WIP buildings to finished
	{
		_structure_type = if (isNil{_x getVariable "cti_structure_type"}) then {""} else {_x getVariable "cti_structure_type"};
		_structures_prepaired pushback [_structure_type, getPosATL _x, getDir _x, getDammage _x];
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["WIP saved to profile:<SAVE_%1_FABRICSWIP> WIP: <%2><%3,%4-%5>", missionName, _structure_type, getposATL _x, getDir _x, getDammage _x]] call CTI_CO_FNC_Log;};
	} forEach (_logic getVariable "cti_structures_wip");
	//profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICSWIP", missionName, _side], _structures_prepaired];
	profileNamespace setVariable [Format ["SAVE_%1_%2_FABRICS", missionName, _side], _structures_prepaired];
	
	//save all defenses the placed
	_defences_prepaired = [];
	{
		_x = _x select 0;
		_defense_name = _x getVariable "savename";
		_defense_manned = _x getVariable "cti_aman_enabled";
		_defences_prepaired pushback [_x getVariable "savename", getPosATL _x, getDir _x, _x getVariable "cti_aman_enabled"];
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Defences saved to profile:<SAVE_%1_DEFENSES> Defenses: <%2><%3,%4,%5>", missionName, _defense_name, getposATL _x, getDir _x, _defense_manned]] call CTI_CO_FNC_Log;};
	} forEach (_logic getVariable "cti_defences");
	profileNamespace setVariable [Format ["SAVE_%1_%2_DEFENSES", missionName, _side], _defences_prepaired];
	
	//save the supply value of the side
	profileNamespace setVariable [Format ["SAVE_%1_%2_SUPPLY", missionName, _side], (_side) call CTI_CO_FNC_GetSideSupply];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Side supply saved to profile:<SAVE_%1_SUPPLY> Supply: <%2>", missionName, (_side) call CTI_CO_FNC_GetSideSupply]] call CTI_CO_FNC_Log;};
    
	//save the funds of all teams and the commanders
	profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDSCOM", missionName, _side], (_side)call CTI_CO_FNC_GetFundsCommander];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Commander funds saved to profile:<SAVE_%1_FUNDSCOM> Funds Com: <%2>", missionName, (_side)call CTI_CO_FNC_GetFundsCommander]] call CTI_CO_FNC_Log;};
    
	_groups = (_side) call CTI_CO_FNC_GetSideGroups;
	{
		_groupnamefull = format ["%1", _x];
		_groupnamecut = _groupnamefull splitString " ";
		_groupname = _groupnamecut select 1;
		profileNamespace setVariable [Format ["SAVE_%1_%2_FUNDS_%3", missionName, _side, _groupname], (_x) call CTI_CO_FNC_GetFundsTeam];
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Server\Functions\Server_SaveToProfile.sqf", format["Team funds saved to profile:<SAVE_%1_FUNDS_%2> Funds: <%3>", missionName, _groupname, (_x) call CTI_CO_FNC_GetFundsTeam]] call CTI_CO_FNC_Log;};
	} forEach (_groups);
	

} forEach [east,west];
