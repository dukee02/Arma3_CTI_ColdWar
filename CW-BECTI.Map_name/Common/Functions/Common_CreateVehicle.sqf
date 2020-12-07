/*
  # HEADER #
	Script: 		Common\Functions\Common_CreateVehicle.sqf
	Alias:			CTI_CO_FNC_CreateVehicle
	Description:	Create an empty vehicle
					Note that making a vehicle public with the _net variable will make it
					undergo the function CTI_CO_FNC_InitializeNetVehicle
					A public vehicle is initialized for all (+JIP) but the server
	Author: 		Benny
	Creation Date:	16-09-2013
	Revision Date:	04-06-2014 (sari)
	
  # PARAMETERS #
    0	[String]: The type of vehicle to create
    1	[Array/Object]: The 2D/3D position where the vehicle should be created at
    2	[Integer]: The Azimuth direction (0-360�) of the vehicle
    3	[Side/Integer]: The Side or Side ID of the vehicle
    4	{Optionnal} [Boolean]: Determine if the vehicle should be created locked or not
    5	{Optionnal} [Boolean]: Determine if the vehicle should be "public" or not
    6	{Optionnal} [Boolean]: Determine if the vehicle should be handled upon destruction or not (bounty...tk...)
    7	{Optionnal} [String]: Set a special spawn mode for the vehicle
	
  # RETURNED VALUE #
	[Object]: The created vehicle
	
  # SYNTAX #
	[CLASSNAME, POSITION, DIRECTION, SIDE] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC, HANDLED] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC, HANDLED, SPECIAL] call CTI_CO_FNC_CreateVehicle
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideFromID
	Common Function: CTI_CO_FNC_GetSideID
	Common Function: CTI_CO_FNC_OnUnitGetOut
	Common Function: CTI_CO_FNC_OnUnitHit
	Common Function: CTI_CO_FNC_OnUnitKilled
	
  # EXAMPLE #
	_vehicle = ["B_Quadbike_01_F", getPos player, 0, CTI_P_SideJoined] call CTI_CO_FNC_CreateVehicle; 
	  -> Create a "B_Quadbike_01_F" at the player's position facing North on the player's initial side
	_vehicle = ["B_Quadbike_01_F", getPos player, 180, CTI_P_SideJoined, true, true] call CTI_CO_FNC_CreateVehicle; 
	  -> Create a locked and handled "B_Quadbike_01_F" at the player's position facing South on the player's initial side
*/

private ["_direction", "_handle", "_locked", "_net", "_position", "_side", "_special", "_type", "_vehicle", "_save_pos"];

_type = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_side = _this select 3;
_locked = if (count _this > 4) then {_this select 4} else {false};
_net = if (count _this > 5) then {_this select 5} else {false};
_handle = if (count _this > 6) then {_this select 6} else {false};
_special = if (count _this > 7) then {_this select 7} else {"FORM"};

if (typeName _position == "OBJECT") then {_position = getPos _position};
if (typeName _side == "SIDE") then {_side = (_side) call CTI_CO_FNC_GetSideID};

_vehicle = createVehicle [_type, _position, [], 7, _special];
_vehicle setDir _direction;
clearMagazineCargo _vehicle;
clearWeaponCargo _vehicle;
//_truck addWeaponCargo ["M16", 5];
//_truck addMagazineCargo ["M16", 5];

//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_CreateVehicle.sqf", format ["type: <%1> special: <%2>",  _type, _special]] call CTI_CO_FNC_Log;};
if (_special != "FLY") then {
	
	//_save_pos = [getPos player, 2000, 5000, 1, 0, 0.7, 0, [], [getPos player, getPos player]] call BIS_fnc_findSafePos;
	//_save_pos = [center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
	
	if(_type isKindOf "ship") then {
		
		_tmp_ship_is = "not sab";
		//_vehicle setDirection (direction _vehicle + 90);
		
		if(CTI_SAB_ADDON > 0) then {
			if(_type == "VIOC_B_sab_item_carrier_2" || _type == "VIOC_B_sab_boat_cruiser" || _type == "VIOC_B_sab_boat_cruiser_rn" || _type == "VIOC_B_sab_boat_cruiser_i" || _type == "VIOC_B_sab_boat_cruiser_o" || 
			_type == "VIOC_B_sab_boat_battleship" || _type == "VIOC_B_sab_boat_battleship_rn" || _type == "VIOC_B_sab_boat_battleship_i" || _type == "VIOC_B_sab_boat_battleship_o" || 
			_type == "VIOC_O_sab_item_carrier_2" || _type == "VIOC_O_sab_boat_cruiser" || _type == "VIOC_O_sab_boat_cruiser_rn" || _type == "VIOC_O_sab_boat_cruiser_i" || _type == "VIOC_O_sab_boat_cruiser_o" || 
			_type == "VIOC_O_sab_boat_battleship" || _type == "VIOC_O_sab_boat_battleship_rn" || _type == "VIOC_O_sab_boat_battleship_i" || _type == "VIOC_O_sab_boat_battleship_o") then {
				
				_save_pos = [_position, 0, 200, 1, 2, 0.7, 0, [], [_position, _position]] call BIS_fnc_findSafePos;
				_vehicle setPos [_save_pos select 0, _save_pos select 1, 1];
				_tmp_ship_is = "large (spwan + 200m)";
			} else {
				if(_type == "VIOC_B_sab_boat_freighter_o" || _type == "VIOC_B_sab_boat_freighter" || _type == "VIOC_B_sab_boat_freighter_i" || _type == "VIOC_B_sab_boat_liberty" ||
				_type == "VIOC_B_sab_boat_liberty_rn" || _type == "VIOC_B_sab_boat_liberty_i" || _type == "VIOC_B_sab_boat_destroyer" || _type == "VIOC_B_sab_boat_destroyer_rn" ||
				_type == "VIOC_B_sab_boat_destroyer_i" || _type == "VIOC_B_sab_boat_destroyer_o" || _type == "VIOC_B_sab_boat_u7_o" || _type == "VIOC_B_sab_boat_u7_i" || _type == "VIOC_B_sab_boat_u7" ||
				_type == "VIOC_O_sab_boat_freighter_o" || _type == "VIOC_O_sab_boat_freighter" || _type == "VIOC_O_sab_boat_freighter_i" || _type == "VIOC_O_sab_boat_liberty" ||
				_type == "VIOC_O_sab_boat_liberty_rn" || _type == "VIOC_O_sab_boat_liberty_i" || _type == "VIOC_O_sab_boat_destroyer" || _type == "VIOC_O_sab_boat_destroyer_rn" ||
				_type == "VIOC_O_sab_boat_destroyer_i" || _type == "VIOC_O_sab_boat_destroyer_o" || _type == "VIOC_O_sab_boat_u7_o" || _type == "VIOC_O_sab_boat_u7_i" || _type == "VIOC_O_sab_boat_u7") then {
					
					_save_pos = [_position, 0, 100, 1, 2, 0.7, 0, [], [_position, _position]] call BIS_fnc_findSafePos;
					_vehicle setPos [_save_pos select 0, _save_pos select 1, 1];
					_tmp_ship_is = "medium (spwan + 100m)";
				} else {
					_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1];
					_tmp_ship_is = "small no spawn change";
				};
			};
		} else {
			_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1];
			_tmp_ship_is = "small no spawn change";
		};
		if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_CreateVehicle.sqf", format["Ship is:[%1] type: [%2]", _tmp_ship_is, _type]] call CTI_CO_FNC_Log;};
		
		//placeing onto the water
		//_save_pos = [_position, 0, 200, 1, 2, 0.7, 0, [], [_position, _position]] call BIS_fnc_findSafePos;
		//_vehicle setPos [_save_pos select 0, _save_pos select 1, 1];
	} else {
		//place on a save Pos on the ground
		_save_pos = [_position, 0, 50, 1, 0, 0.7, 0, [], [_position, _position]] call BIS_fnc_findSafePos;
		_vehicle setPos [_save_pos select 0, _save_pos select 1, 1];
		//_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1]; //--- Make the vehicle spawn above the ground level to prevent any bisteries
	};
	//_vehicle setPos _save_pos;
	//_vehicle setPos [_save_pos select 0, _save_pos select 1, 1];
	
	//_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1]; //--- Make the vehicle spawn above the ground level to prevent any bisteries
	_vehicle setVelocity [0,0,1];
} else {
	_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 200]; //--- Make the vehicle spawn in the sky
	_vehicle setVelocity [50 * (sin _direction), 50 * (cos _direction), 0];
};

{player reveal _vehicle} forEach allUnits; // unit sometimes a long time unrecognised -> force revealing units with reveal command usually solves the problem

if (_locked) then {_vehicle lock 2} else {_vehicle lock 0};
if (_net) then {_vehicle setVariable ["cti_net", _side, true]};
if (_handle) then {
	_vehicle addEventHandler ["killed", format["[_this select 0, _this select 1, %1] spawn CTI_CO_FNC_OnUnitKilled", _side]]; //--- Called on destruction
	_vehicle addEventHandler ["hit", {_this spawn CTI_CO_FNC_OnUnitHit}]; //--- Register importants hits
	//--- Track who get in or out of the vehicle so that we may determine the death more easily
	_vehicle addEventHandler ["getIn", {_this spawn CTI_CO_FNC_OnUnitGetOut}]; 
	_vehicle addEventHandler ["getOut", {_this spawn CTI_CO_FNC_OnUnitGetOut}]; 
	_vehicle setVariable ["cti_occupant", _side call CTI_CO_FNC_GetSideFromID];
};

_vehicle