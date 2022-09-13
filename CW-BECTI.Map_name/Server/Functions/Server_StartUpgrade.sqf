/*
  # HEADER #
	Script: 		Server\Functions\Server_StartUpgrade.sqf
	Alias:			CTI_SE_FNC_StartUpgrade
	Description:	Start upgrading an element, The server-side can spawn it straigh away.
					Use the PVF "CTI_PVF_Request_Upgrade" for a client-request
	Author: 		Benny
	Creation Date:	23-09-2013
	Revision Date:	22-04-2014 (Sari)
	Revision Date:	20-04-2022 dukee
	
  # PARAMETERS #
    0	[Side]: The side which requested the upgrade
    1	[Integer]: The upgrade element
    2	[Integer]: The upgrade current level
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[SIDE, UPGRADE, LEVEL] spawn CTI_SE_FNC_StartUpgrade
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideLogic
	Common Function: CTI_CO_FNC_GetSideUpgrades
	Common Function: CTI_CO_FNC_NetSend
	
  # EXAMPLE #
    [West, CTI_UPGRADE_BARRACKS, 0] spawn CTI_SE_FNC_StartUpgrade
	  -> Will bring the barracks on level 1 after the upgrade completion
*/

private ["_level", "_side", "_upgrade", "_upgrade_time"];

_side = _this select 0;
_upgrade = _this select 1;
_level = _this select 2;

if (CTI_DEBUG) then {_upgrade_time = 1} else {_upgrade_time = ((missionNamespace getVariable Format["CTI_%1_UPGRADES_TIMES", _side]) select _upgrade) select _level};

sleep _upgrade_time;

_logic = (_side) call CTI_CO_FNC_GetSideLogic;
_upgrades = (_side) call CTI_CO_FNC_GetSideUpgrades;
_upgrades set [_upgrade, (_upgrades select _upgrade) + 1];

_logic setVariable ["cti_upgrades", _upgrades, true];
_logic setVariable ["cti_upgrade", -1, true];

[["CLIENT", _side], "Client_OnMessageReceived", ["upgrade-ended", [_upgrade, _level+1]]] call CTI_CO_FNC_NetSend;

if(CTI_UPGRADE_MODE > 0) then {
	_evolve = false;
	_upgrade_max_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
		
	switch(_upgrade) do {
		case CTI_UPGRADE_BARRACKS: {
			//floor or ceil
			if((_upgrades select CTI_UPGRADE_BARRACKS) == ceil((_upgrade_max_levels select CTI_UPGRADE_BARRACKS) / 2)) then {
				if((_upgrades select CTI_UPGRADE_HEAVY) >= ceil((_upgrade_max_levels select CTI_UPGRADE_HEAVY) / 2) &&
					(_upgrades select CTI_UPGRADE_LIGHT) >= ceil((_upgrade_max_levels select CTI_UPGRADE_LIGHT) / 2) &&
					(_upgrades select CTI_UPGRADE_GEAR) >= ceil((_upgrade_max_levels select CTI_UPGRADE_GEAR) / 2)) then {
					_evolve = true;
				};
			};
		};
		case CTI_UPGRADE_HEAVY: {
			if((_upgrades select CTI_UPGRADE_HEAVY) == ceil((_upgrade_max_levels select CTI_UPGRADE_HEAVY) / 2)) then {
				if((_upgrades select CTI_UPGRADE_BARRACKS) >= ceil((_upgrade_max_levels select CTI_UPGRADE_BARRACKS) / 2) &&
					(_upgrades select CTI_UPGRADE_LIGHT) >= ceil((_upgrade_max_levels select CTI_UPGRADE_LIGHT) / 2) &&
					(_upgrades select CTI_UPGRADE_GEAR) >= ceil((_upgrade_max_levels select CTI_UPGRADE_GEAR) / 2)) then {
					_evolve = true;
				};
			};
		};
		case CTI_UPGRADE_LIGHT: {
			if((_upgrades select CTI_UPGRADE_LIGHT) == ceil((_upgrade_max_levels select CTI_UPGRADE_LIGHT) / 2)) then {
				if((_upgrades select CTI_UPGRADE_HEAVY) >= ceil((_upgrade_max_levels select CTI_UPGRADE_HEAVY) / 2) &&
					(_upgrades select CTI_UPGRADE_BARRACKS) >= ceil((_upgrade_max_levels select CTI_UPGRADE_BARRACKS) / 2) &&
					(_upgrades select CTI_UPGRADE_GEAR) >= ceil((_upgrade_max_levels select CTI_UPGRADE_GEAR) / 2)) then {
					_evolve = true;
				};
			};
		};
		case CTI_UPGRADE_GEAR: {
			if((_upgrades select CTI_UPGRADE_GEAR) == ceil((_upgrade_max_levels select CTI_UPGRADE_GEAR) / 2)) then {
				if((_upgrades select CTI_UPGRADE_HEAVY) >= ceil((_upgrade_max_levels select CTI_UPGRADE_HEAVY) / 2) &&
					(_upgrades select CTI_UPGRADE_LIGHT) >= ceil((_upgrade_max_levels select CTI_UPGRADE_LIGHT) / 2) &&
					(_upgrades select CTI_UPGRADE_BARRACKS) >= ceil((_upgrade_max_levels select CTI_UPGRADE_BARRACKS) / 2)) then {
					_evolve = true;
				};
			};
		};
		default {};
	};
		
	if(_evolve) then {
		if(CTI_CUP_ADDON > 0) then {
			if(_side == west) then {
				(_side) call compile preprocessFileLineNumbers "Common\Config\Squads\squad_US_CUP.sqf";
				(_side) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_US_CUP.sqf";
			} else {
				(_side) call compile preprocessFileLineNumbers "Common\Config\Squads\squad_SOV_CUP.sqf";
				(_side) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SOV_CUP.sqf";
			};
			//TODO: sent clients info
			//[["CLIENT", _side], "Client_OnMessageReceived", ["upgrade-ended", [_upgrade, _level+1]]] call CTI_CO_FNC_NetSend;
		};
	};
};
