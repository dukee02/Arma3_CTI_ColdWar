/*
  # HEADER #
	Script: 		Server\Functions\Server_StartUpgrade.sqf
	Alias:			CTI_SE_FNC_StartUpgrade
	Description:	Start upgrading an element, The server-side can spawn it straigh away.
					Use the PVF "CTI_PVF_Request_Upgrade" for a client-request
	Author: 		Benny
	Creation Date:	23-09-2013
	Revision Date:	22-04-2014 (Sari)
	Revision Date:	13-12-2022 (dukee)
	
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

private ["_level", "_side", "_upgrade", "_upgrade_time", "_evolve", "_upgrade_cur", "_upgrade_max", "_isThisMain", "_sid", "_tag"];

_side = _this select 0;
_upgrade = _this select 1;
_level = _this select 2;

if (CTI_DEBUG) then {_upgrade_time = 1} else {_upgrade_time = ((missionNamespace getVariable Format["CTI_%1_UPGRADES_TIMES", _side]) select _upgrade) select _level};

_logic = (_side) call CTI_CO_FNC_GetSideLogic;
_logic setVariable ["cti_upgrade_time", round (serverTime + _upgrade_time), true];

sleep _upgrade_time;

_upgrades = (_side) call CTI_CO_FNC_GetSideUpgrades;
_upgrades set [_upgrade, (_upgrades select _upgrade) + 1];

//town untis;
//_x = ["GUER_INFANTRY_SQ_LIGHT", 4, 20];
//_unit = _x select 0;
//if !(isNil {missionNamespace getVariable format["%1_%2",_side, _unit]}) then {
switch (_upgrade) do {
	case CTI_UPGRADE_BARRACKS: {[_side, _upgrade, "Infantry"] spawn CTI_SE_FNC_UpgradeSquads;};
	case CTI_UPGRADE_LIGHT: {[_side, _upgrade, "Motorized"] spawn CTI_SE_FNC_UpgradeSquads;};
	case CTI_UPGRADE_HEAVY: {[_side, _upgrade, "Armored"] spawn CTI_SE_FNC_UpgradeSquads;};
	case CTI_UPGRADE_AIR: {[_side, _upgrade, "Air"] spawn CTI_SE_FNC_UpgradeSquads;};
	/*case CTI_UPGRADE_NAVAL: { };
	case CTI_UPGRADE_SATELLITE: { };
	case CTI_UPGRADE_AIR_FFAR: { };
	case CTI_UPGRADE_AIR_AT: { };
	case CTI_UPGRADE_AIR_AA: { };
	case CTI_UPGRADE_AIR_CM: { };
	case CTI_UPGRADE_TOWNS: { };
	case CTI_UPGRADE_SUPPLY: { };
	case CTI_UPGRADE_GEAR: { };
	case CTI_UPGRADE_DEFENSE: { };*/
	default { };
};

//If we play with early and late units, after the half we switch the mainunits spawning.
_evolve = [];
{
	_upgrade_cur = _upgrades select _x;
	_upgrade_max_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
	_upgrade_max = ceil(_upgrade_max_levels select _x);

	switch(true) do {
		case (_upgrade_cur == (_upgrade_max/2)): {_evolve pushBackUnique 1};
		case (_upgrade_cur > (_upgrade_max/2)): {_evolve pushBackUnique 2};
		default {_evolve pushBackUnique 0};
	};
	
} forEach [CTI_UPGRADE_GEAR,CTI_UPGRADE_BARRACKS,CTI_UPGRADE_LIGHT,CTI_UPGRADE_HEAVY];

if!(0 in _evolve) then {
	if(1 in _evolve) then {
		_sid = "";
		_tag = "GUER_";
		switch (_side) do {
			case west: {_tag = "WEST_";};
			case east: {_tag = "EAST_";};
			case resistance: {_tag = "GUER_";};
			default {};
		};

		if(_side == west) then {
			if(CTI_BW_ADDON > 0) then {
				_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
				if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_BWA3_ID) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_BWA3.sqf";
				};
			};
			if(CTI_BWADD_ADDON > 0) then {
				if((_isThisMain select 0) == CTI_BW_ID && (_isThisMain select 1) == CTI_BWADD_ID) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_BW_BWadd.sqf";
				};
			};
		} else {
			//no later versions off NVA units because history
		};
		if(CTI_RHS_ADDON > 0) then {
			if(_side == west) then {
				if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_RHS_ID) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_RHS.sqf";
				};
			} else {
				if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_RHS_ID) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV_RHS.sqf";
				};
			};
		};
		if(CTI_CUP_ADDON > 0) then {
			if(_side == west) then {
				if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_CUP_ID) then {
				//if((_isThisMain select 0) == CTI_US_ID && ((_isThisMain select 1) == CTI_CUP_ID || (count ((_side) call CTI_CO_FNC_GetSideUpgrades) > 0))) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_CUP.sqf";
				};
			} else {
				if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_CUP_ID) then {
				//if((_isThisMain select 0) == CTI_SOV_ID && ((_isThisMain select 1) == CTI_CUP_ID || (count ((_side) call CTI_CO_FNC_GetSideUpgrades) > 0))) then {
					[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV_CUP.sqf";
				};
			};
		};
	};
};

_logic setVariable ["cti_upgrades", _upgrades, true];
_logic setVariable ["cti_upgrade", -1, true];

[["CLIENT", _side], "Client_OnMessageReceived", ["upgrade-ended", [_upgrade, _level+1]]] call CTI_CO_FNC_NetSend;
