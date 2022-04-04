private ["_bounty", "_created_units", "_created_vehicles", "_crew", "_crews", "_group", "_locked", "_net", "_position", "_side", "_sideID", "_unit", "_units", "_vehicle", "_vehicle_crew"];

_units = _this select 0;
_position = _this select 1;
_side = _this select 2;
_group = _this select 3;
_locked = if (count _this > 4) then {_this select 4} else {true};
_net = if (count _this > 5) then {_this select 5} else {false};
_bounty = if (count _this > 6) then {_this select 6} else {false};
_forTown = if (count _this > 7) then {_this select 7} else {false};

_sideID = (_side) call CTI_CO_FNC_GetSideID;
if (isNull _group) then {_group = createGroup _side};

_tag = "GUER_";
if(_side == west) then {_tag = "WEST_";} else {if(_side == east) then {_tag = "EAST_";} else {_tag = "GUER_";};};			//set the tag

_created_units = [];
_created_vehicles = [];
_crews = [];

{
	if (isNil "_x") then { 
		if (CTI_Log_Level >= CTI_Log_Error) then {["ERROR", "FILE: Common\Functions\Common_CreateTeam.sqf", format ["Unit is: <%1>",  _x]] call CTI_CO_FNC_Log;};
		_x = missionNamespace getVariable format["CTI_%1Soldier", _tag];
		if (CTI_Log_Level >= CTI_Log_Error) then {["ERROR", "FILE: Common\Functions\Common_CreateTeam.sqf", format ["Unit is NULL changed to: <%1>",  _x]] call CTI_CO_FNC_Log;};
	};
	if (_x isKindOf "Man") then {
		_unit = [_x, _group, [_position, 2, 15] call CTI_CO_FNC_GetRandomPosition, _sideID] call CTI_CO_FNC_CreateUnit;
		_created_units pushBack _unit;
	} else {
		//Check if the units are for towns and the camo are not the same
		_crew =  missionNamespace getVariable format["CTI_%1Soldier", _tag];			//setup a default
		if (CTI_TOWN_CAMO == CTI_CAMO_ACTIVATION && _forTown == false) then {
			_crew = switch (true) do {
				case (_x isKindOf "Tank"): { missionNamespace getVariable format["CTI_%1Crew", _tag] };
				case (_x isKindOf "Air"): { missionNamespace getVariable format["CTI_%1Pilot", _tag] };
				default { missionNamespace getVariable format["CTI_%1Soldier", _tag] };
			};
		} else {
			_crew = switch (true) do {
				case (_x isKindOf "Tank"): { missionNamespace getVariable format["CTI_%1TownCrew", _tag] };
				case (_x isKindOf "Air"): { missionNamespace getVariable format["CTI_%1Pilot", _tag] };
				default { missionNamespace getVariable format["CTI_%1TownSoldier", _tag] };
			};
		};
		if (typeName _crew == "ARRAY") then {_crew = _crew select 0};
		if (_x isKindOf "Air") then {
			_vehicle = [_x, [_position, 2, 15, 50] call CTI_CO_FNC_GetRandomPosition, random 360, _sideID, _locked, _net, _bounty, "FLY"] call CTI_CO_FNC_CreateVehicle;
		} else {
			_vehicle = [_x, [_position, 30] call CTI_CO_FNC_GetEmptyPosition, random 360, _sideID, _locked, _net, _bounty, "NONE"] call CTI_CO_FNC_CreateVehicle;
		};
		_created_vehicles pushBack _vehicle;
		_vehicle_crew = [_vehicle, _crew, _group, _sideID] call CTI_CO_FNC_ManVehicle;
		_crews = _crews + _vehicle_crew;
	};
	
} forEach _units;

{_group addVehicle _x} forEach _created_vehicles;

[_created_units, _created_vehicles, _crews, _group]
