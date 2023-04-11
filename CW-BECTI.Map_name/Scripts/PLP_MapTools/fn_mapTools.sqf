_this spawn {
	waitUntil {!isNull (findDisplay 12 displayCtrl 51)} ;
	_map = (findDisplay 12 displayCtrl 51) ;

	addMissionEventHandler ["Map",{
		_disp = (findDisplay 12) ;
		_map = (_disp displayCtrl 51) ;
		{
			if (ctrlIDC _x in [20001,20002,10001,10002]) then {_x ctrlShow false} ;
		} forEach allControls _disp ;
		for "_i" from 0 to 100 do {
			(_disp displayCtrl (30000 + _i)) ctrlShow false ;
			(_disp displayCtrl (40000 + _i)) ctrlShow false ;
		} ;
		if !(_this#0) then {
			{
				_map ctrlRemoveEventHandler ["Draw",_x] ;
			} forEach (uiNamespace getVariable ["PLP_MapTools_EHs",[]]) ;
			uiNamespace setVariable ["PLP_MapTools_EHs",[]] ;
			{
				ctrlDelete _x ;
			} forEach (uiNamespace getVariable ["PLP_MapTools_Height_GraphCtrls",[]]) ;
		} ;
	}] ;

	_map ctrlAddEventHandler ["MouseButtonClick",{
		_map = _this#0 ;
		if (_this#1 == 1) then {		
			{
				_map ctrlRemoveEventHandler ["Draw",_x] ;
			} forEach (uiNamespace getVariable ["PLP_MapTools_EHs",[]]) ;
			uiNamespace setVariable ["PLP_MapTools_EHs",[]] ;
			
			_disp = (findDisplay 12) ;
			{
				if (ctrlIDC _x in [20001,20002,10001,10002]) then {_x ctrlShow false} ;
			} forEach allControls _disp ;
			for "_i" from 0 to 100 do {
				(_disp displayCtrl (30000 + _i)) ctrlShow false ;
				(_disp displayCtrl (40000 + _i)) ctrlShow false ;
			} ;
			uiNamespace setVariable ["PLP_MapTools_Height_mode",false] ;
			
			if (_this#5) then {
				_disp = (findDisplay 12) createDisplay "PLP_MapTools_MainDisplay" ;
				_ctrl = _disp displayCtrl 999 ;
				_ctrl ctrlSetBackgroundColor [0,0,0,0.2] ;
				_pos = getMousePosition ;
				_posReal = _map ctrlMapScreenToWorld _pos ;
				uiNamespace setVariable ["PLP_MapTools_pos",_pos] ;
				uiNamespace setVariable ["PLP_MapTools_posReal",_posReal] ;

				_ctrl ctrlAddEventHandler ["MouseButtonDown",{
					ctrlParent (_this#0) closeDisplay 0 ;
				}] ;
				{
					_ctrlPos = [] + _pos ;
					_ctrl = _disp ctrlCreate ["RscButton",-1] ;
					_ctrlPos set [0,_pos#0 + pixelW*5] ;
					_ctrlPos set [1,_pos#1 + pixelH*5] ;
					_ctrl ctrlSetPosition (_ctrlPos + [0.15,0.05]) ;
					_ctrl ctrlCommit 0 ;
					
					_ctrlPos set [1,_ctrlPos#1 + (0.05 * _forEachIndex + pixelH*5*_forEachIndex)] ;
					_ctrl ctrlSetPosition (_ctrlPos) ;
					_ctrl ctrlCommit (_forEachIndex*0.075) ;
					_ctrl ctrlSetText _x#0 ;
					_ctrl ctrlAddEventHandler ["MouseButtonUp",_x#1] ;
				} forEach [
					/*["Distance",{
						ctrlParent (_this#0) closeDisplay 0 ;
						_map = (findDisplay 12 displayCtrl 51) ;
						_basePos = uiNamespace getVariable "PLP_MapTools_posReal" ;
						uiNamespace setVariable ["PLP_MapTools_distance_poses",[_basePos]] ;
						_EH = _map ctrlAddEventHandler ["Draw",{
							_map = _this#0 ;
							_basePos = uiNamespace getVariable "PLP_MapTools_posReal" ;
							_distTotal = 0 ;
								
							_zooms = ("true" configClasses (configFile >> "CfgWorlds" >> worldName >> "Grid")) ;
							_curZoom = ctrlMapScale _map ;
							_zoom = call {
								{
									if (
										abs getNumber (_x >> "zoomMax") > _curZoom
									) exitWith {
										abs getNumber (_x >> "stepX")
									} ;
								} forEach _zooms ;
							} ;
							#define poses (uiNamespace getVariable ["PLP_MapTools_distance_poses",[]])
							{
								_currentPos = _x ;
								_currentPos resize 2 ;
								_curPos = (if (_forEachIndex != count poses-1) then {
									poses#(_forEachIndex+1)
								} else {
									_map ctrlMapScreenToWorld getMousePosition
								}) ;
								_curPos resize 2 ;
								
								_dir = _currentPos getDir _curPos ;
								
								_dist = (_curPos distance2D _currentPos) ;
								_distTotal = _distTotal + _dist ;
								
								_map drawEllipse [
									_currentPos,_dist,_dist,0,[0,0,0,0.5],""
								] ;
								_map drawLine [
									_currentPos,_curPos,[0,0,0,1]
								] ;
								
								for "_i" from 0 to _distTotal step _zoom/10 do {
									if (_i > (_distTotal - _dist)) then {
										_pos = vectorLinearConversion [
											(_distTotal - _dist),_distTotal,_i,_currentPos+[0],_curPos+[0]
										] ;
										_leng = 50 ;
										if (_i mod (_zoom/2) == 0) then {_leng = 100} ;
										if (_i mod (_zoom*10) == 0) then {_leng = 200} ;
										_lastPos = [
											_pos#0 + (sin (_dir+90)*_curZoom*_leng),
											_pos#1 + (cos (_dir+90)*_curZoom*_leng)
										] ;
										_map drawLine [
											_pos,_lastPos,[0,0,0,1]
										] ;
										if (_i != 0 and _i mod (_zoom/1) == 0) then {
											_map drawEllipse [
												_currentPos,_i-(_distTotal - _dist),_i-(_distTotal - _dist),0,[1,0,0,([0.25,1] select (_i mod (_zoom*10) == 0))],""
											] ;
											_map drawIcon [
												"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_lastPos,0,0,0,str _i + " m",2,([0.04,0.06] select (_i mod (_zoom*10) == 0)),"PuristaMedium","center"
											] ;
										} ;
									} ;
								} ;
							} forEach (uiNamespace getVariable ["PLP_MapTools_distance_poses",[]]) ;
								
							_mPos = getMousePosition ;
							_mPos set [0,_mPos#0 - pixelW * 15] ;//getTextWidth
							_mPos set [1,_mPos#1 - pixelH * 15] ;
							_drawPos = _map ctrlMapScreenToWorld _mPos ;
							_map drawIcon [
								"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_drawPos,0,0,0,(_distTotal toFixed 2) + " m",2,0.08,"PuristaMedium","left"
							] ;
							
							_mPos set [1,_mPos#1 + pixelH * 20] ;
							_drawPos = _map ctrlMapScreenToWorld _mPos ;
							
							_map drawIcon [
								"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_drawPos,0,0,0,"Left Click to add point, Right Click to leave",2,0.06,"PuristaMedium","left"
							] ;
						}] ;
						_EHs = (uiNamespace getVariable ["PLP_MapTools_EHs",[]]) ;
						_EHs pushBack _EH ;
						uiNamespace setVariable ["PLP_MapTools_EHs",_EHs] ;
					}],*/
					["Compass",{
						ctrlParent (_this#0) closeDisplay 0 ;
						_map = (findDisplay 12 displayCtrl 51) ;
						_EH = _map ctrlAddEventHandler ["Draw",{
							_map = _this#0 ;
							_basePos = uiNamespace getVariable "PLP_MapTools_posReal" ;
							_curPos = _map ctrlMapScreenToWorld getMousePosition ;
							
							_dir = _basePos getDir _curPos ;
							
							_mPos = getMousePosition ;
							_mPos set [0,_mPos#0 - pixelW * 15] ;//getTextWidth
							_mPos set [1,_mPos#1 - pixelH * 15] ;
							_drawPos = _map ctrlMapScreenToWorld _mPos ;
							
							_curZoom = ctrlMapScale _map ;
							_dist = (_curPos distance2D _basePos) ;
							
							_map drawEllipse [
								_basePos,_dist,_dist,0,[0,0,0,1],""
							] ;
							_map drawEllipse [
								_basePos,_dist+_curZoom*150,_dist+_curZoom*150,0,[0,0,0,1],""
							] ;
							_map drawLine [
								_basePos,[_curPos#0 + ((sin _dir)*_curZoom*150),_curPos#1 + ((cos _dir)*_curZoom*150)],[1,0,0,1]
							] ;
							_map drawLine [
								[_basePos#0 + _dist,_basePos#1],[_basePos#0 - _dist,_basePos#1],[0,0,0,0.5]
							] ;
							_map drawLine [
								[_basePos#0,_basePos#1 + _dist],[_basePos#0,_basePos#1 - _dist],[0,0,0,0.5]
							] ;
							_map drawIcon [
								"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_drawPos,0,0,0,(_dir toFixed 2) + " ("+ (switch round (_dir/45) do {				//Mils added here
									case 1: {"NE"};
									case 2: {"E"};
									case 3: {"SE"};
									case 4: {"S"};
									case 5: {"SW"};
									case 6: {"W"};
									case 7: {"NW"};
									default {"N"};
								}) + ") / " + (_dir * 6400 / 360 toFixed -1) + " mil",2,0.08,"PuristaMedium","left"
							] ;
							_mPos set [0,_mPos#0 - pixelW * 15] ;
							_mPos set [1,_mPos#1 + pixelH * 20] ;
							_drawPos = _map ctrlMapScreenToWorld _mPos ;
							
							_map drawIcon [
								"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_drawPos,0,0,0,"Right Click to leave",2,0.06,"PuristaMedium","left"
							] ;
							
							for "_i" from 0 to 360-2 step 2 do {
								_pos = [
									_basePos#0 + sin (_i) * _dist,
									_basePos#1 + cos (_i) * _dist
								] ;
								_leng = 50 ;
								if (_i mod 10 == 0) then {_leng = 100} ;
								if (_i mod 90 == 0) then {_leng = 200} ;
								_pos2 = [
									_pos#0 - sin (_i) * _curZoom * _leng,
									_pos#1 - cos (_i) * _curZoom * _leng
								] ;
								_map drawLine [
									_pos2,_pos,[0,0,0,1]
								] ;
								if (_i mod 10 == 0) then {
									if (_i mod 90 != 0 and (_dist/_curZoom) < 2250) exitWith {} ;
									_map drawIcon [
										"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_pos2,0,0,0,str _i,2,([0.04,0.06] select (_i mod 90 == 0)),"PuristaMedium","center"
									] ;
								} ;
							} ;
							
							for "_i" from 0 to 360-(360/6400*20) step (360/6400*20) do {
								_pos = [
									_basePos#0 + sin (_i) * (_dist+_curZoom*150),
									_basePos#1 + cos (_i) * (_dist+_curZoom*150)
								] ;
								_leng = 50 ;
								if (_i mod ((360/6400*20)*10) == 0) then {_leng = 100} ;
								if (_i mod ((360/6400*20)*40) == 0) then {_leng = 150} ;
								_pos2 = [
									_pos#0 - sin (_i) * _curZoom * _leng,
									_pos#1 - cos (_i) * _curZoom * _leng
								] ;
								_map drawLine [
									_pos2,_pos,[0,0,0,1]
								] ;
								if (_i mod (360/6400*400) == 0) then {
									if ((_dist/_curZoom) < 2250) exitWith {} ;
									_map drawIcon [
										"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_pos,0,0,0,str (_i * 6400 / 360),2,0.04,"PuristaMedium","center"
									] ;
								} ;
							} ;
						}] ;
						_EHs = (uiNamespace getVariable ["PLP_MapTools_EHs",[]]) ;
						_EHs pushBack _EH ;
						uiNamespace setVariable ["PLP_MapTools_EHs",_EHs] ;
					}]/*,
					["Height",{
						ctrlParent (_this#0) closeDisplay 0 ;
						_map = (findDisplay 12 displayCtrl 51) ;
						uiNamespace setVariable ["PLP_MapTools_Height_curPos",nil] ;
						
						#define GraphFullX	(safeZoneX+safeZoneW*0.1)
						#define GraphFullW	(safeZoneW*0.8)
						#define GraphFullY	(safeZoneY+safeZoneH*0.6)
						#define GraphFullH	(safeZoneH*0.3)
						
						#define GraphInnerX	(GraphFullX+pixelW*15)
						#define GraphInnerW	(GraphFullW-pixelW*30)
						#define GraphInnerY	(GraphFullY+pixelH*15)
						#define GraphInnerH	(GraphFullH-pixelH*30)
						
						_EH = _map ctrlAddEventHandler ["Draw",{
							_map = _this#0 ;
							_basePos = uiNamespace getVariable "PLP_MapTools_posReal" ;
							_curPos = uiNamespace getVariable ["PLP_MapTools_Height_curPos",_map ctrlMapScreenToWorld getMousePosition] ;
							_curPos resize 2 ;
							
							_dir = _basePos getDir _curPos ;
							
							_map drawLine [
								_basePos,_curPos,[0,0,0,1]
							] ;
							_curZoom = ctrlMapScale _map ;
							for "_i" from 0 to 10 do {
								_pos = vectorLinearConversion [
									0,10,_i,_basePos+[0],_curPos+[0]
								] ;
								_leng = 50 ;
								if (_i mod 5 == 0) then {_leng = 100} ;
								_map drawLine [
									[_pos#0 + sin (_dir+90)*_curZoom*_leng,_pos#1 + cos (_dir+90)*_curZoom*_leng,0],
									[_pos#0 + sin (_dir-90)*_curZoom*_leng,_pos#1 + cos (_dir-90)*_curZoom*_leng,0],
									[0,0,0,1]
								] ;
							} ;
							
							_mPos = [getMousePosition#0 - (pixelH * 10),getMousePosition#1 + (pixelH * 10)] ;
							_drawPos = _map ctrlMapScreenToWorld _mPos ;
							
							_map drawIcon [
								"#(rgb,1,1,1)color(0,0,0,0)",[1,1,1,1],_drawPos,0,0,0,["Left Click to confirm, Right Click to leave","Right Click to leave"] select !isNil {uiNamespace getVariable ["PLP_MapTools_Height_curPos",nil]},
								2,0.06,"PuristaMedium","left"
							] ;
							if (
								!isNil {uiNamespace getVariable ["PLP_MapTools_Height_curPos",nil]} and
								getMousePosition#0 > GraphInnerX and
								getMousePosition#0 < (GraphInnerX+GraphInnerW) and
								getMousePosition#1 > GraphInnerY and
								getMousePosition#1 < (GraphInnerY+GraphInnerH)
							) then {
								private "_pos" ;
								if (_basePos#0 < _curPos#0) then {
									_pos = vectorLinearConversion [GraphInnerX,(GraphInnerX+GraphInnerW),getMousePosition#0,_basePos+[0],_curPos+[0]] ;
								} else {
									_pos = vectorLinearConversion [GraphInnerX,(GraphInnerX+GraphInnerW),getMousePosition#0,_curPos+[0],_basePos+[0]] ;
								} ;
								
								_ctrl = ((findDisplay 12) displayCtrl 10001) ;
								_ctrl ctrlSetPositionX (getMousePosition#0) ;
								_ctrl ctrlCommit 0 ;
								_ctrl ctrlShow true ;
								
								_ctrl = ((findDisplay 12) displayCtrl 10002) ;
								
								(uiNamespace getVariable "PLP_MapTools_Height_MinMax") params ["_min","_max"] ;
								
								_ctrl ctrlSetPositionY linearConversion [_max,_min,getTerrainHeightASL _pos,GraphInnerY+pixelH*15,GraphInnerY+GraphInnerH-pixelH*30] ;
								_ctrl ctrlSetText ((getTerrainHeightASL _pos) toFixed 2) + " m" ;
								_ctrl ctrlShow true ;
								
								_ctrl ctrlSetPositionX ([((getMousePosition#0) + pixelW * 15),(GraphInnerX+GraphInnerW - ctrlTextWidth _ctrl)] select (GraphInnerX + GraphInnerW - ctrlTextWidth _ctrl < (getMousePosition#0))) ;
								_ctrl ctrlCommit 0 ;
								
								_map drawIcon [
									"a3\ui_f\data\IGUI\Cfg\SquadRadar\SquadRadarOtherGroupUnit_ca.paa",[1,0,0,1],_pos,25,25,0,((getTerrainHeightASL _pos) toFixed 2) + " m",2,0.05,"PuristaMedium","left"
								] ;
							} else {
								((findDisplay 12) displayCtrl 10001) ctrlShow false ;
								((findDisplay 12) displayCtrl 10002) ctrlShow false ;
							} ;
						}] ;
						_EHs = (uiNamespace getVariable ["PLP_MapTools_EHs",[]]) ;
						_EHs pushBack _EH ;
						uiNamespace setVariable ["PLP_MapTools_EHs",_EHs] ;
						
						uiNamespace setVariable ["PLP_MapTools_Height_mode",true] ;
					}],
					["Search Grid",{
						_map = (findDisplay 12 displayCtrl 51) ;
						_disp = ctrlParent (_this#0) ;
						{
							if (ctrlIDC _x != 999) then {
								ctrlDelete _x ;
							} ;
						} forEach allControls _disp ;
						
						_pos = (uiNamespace getVariable "PLP_MapTools_pos") ;
						
						_ctrl = _disp ctrlCreate ["RscBackground",-1] ;
						_ctrl ctrlSetPosition (_pos + [0.3,0.1]) ;
						_ctrl ctrlSetBackgroundColor [0,0,0,0.5] ;
						_ctrl ctrlCommit 0 ;
						
						_pos set [0,_pos#0 + 0.01] ;
						_pos set [1,_pos#1 + 0.01] ;
						
						_ctrl = _disp ctrlCreate ["RscEdit",1] ;
						_ctrl ctrlSetPosition (_pos + [0.13,0.08]) ;
						_ctrl ctrlSetBackgroundColor [0,0,0,0.5] ;
						_ctrl ctrlSetFontHeight 0.07 ;
						_ctrl ctrlCommit 0 ;
						
						_pos set [0,_pos#0 + 0.14] ;
						
						_ctrl = _disp ctrlCreate ["RscEdit",2] ;
						_ctrl ctrlSetPosition (_pos + [0.13,0.08]) ;
						_ctrl ctrlSetBackgroundColor [0,0,0,0.5] ;
						_ctrl ctrlSetFontHeight 0.07 ;
						_ctrl ctrlCommit 0 ;
						
						_pos set [0,_pos#0 - 0.15] ;
						_pos set [1,_pos#1 + 0.105] ;
						
						_ctrl = _disp ctrlCreate ["RscButton",3] ;
						_ctrl ctrlSetPosition (_pos + [0.3,0.05]) ;
						_ctrl ctrlSetBackgroundColor [0,0,0,0.5] ;
						_ctrl ctrlSetFontHeight 0.07 ;
						_ctrl ctrlSetText "Find" ;
						_ctrl ctrlCommit 0 ;
						
						_ctrl ctrlAddEventHandler ["ButtonClick",{
							_disp = ctrlParent (_this#0) ;
							_map = (findDisplay 12 displayCtrl 51) ;
							
							_cfgGrid = configFile >> "CfgWorlds" >> worldName >> "Grid" ;
							_offsetX = getNumber (_cfgGrid >> "offsetX") ;
							_offsetY = getNumber (_cfgGrid >> "offsetY") ;

							_xx = ctrlText (_disp displayCtrl 1) ;
							_yy = ctrlText (_disp displayCtrl 2) ;
							
							if (_xx == "") then {_xx = "0"} ;
							if (_yy == "") then {_yy = "0"} ;
							
							_zooms = ("true" configClasses _cfgGrid) ;

							_posX = _offsetX ;
							_posY = worldSize - _offsetY ;
							
							_zoomLevel = 0.0001 ;

							_count = ((count _zooms)-1) - ((count _xx)-1) ;
							for "_i" from ((count _zooms)-1) to _count max 0 step -1 do {
								_currentZoom = (_zooms#_i) ;
								_posX = _posX + ((parseNumber (_xx select [((count _zooms)-1)-_i,1])) *
								getNumber (
									_currentZoom >> "stepX"
								)) ;
								if (_i == _count) then {
									_posX = _posX + (getNumber (_currentZoom >> "stepX")/2) ;
									_zoomLevel = _zoomLevel max ((getNumber (_currentZoom >> "stepX")/2)*0.0003) ;
								} ;
							} ;
							_count = ((count _zooms)-1) - ((count _yy)-1) ;
							for "_i" from ((count _zooms)-1) to _count max 0 step -1 do {
								_currentZoom = (_zooms#_i) ;
								_posY = _posY - ((parseNumber (_yy select [((count _zooms)-1)-_i,1])) *
								getNumber (
									_currentZoom >> "stepY"
								)) ;
								if (_i == _count) then {
									_posY = _posY - (getNumber (_currentZoom >> "stepY")/2) ;
									_zoomLevel = _zoomLevel max ((getNumber (_currentZoom >> "stepY")/2)*0.0003) ;
								} ;
							} ;
							_map ctrlMapAnimAdd [1,_zoomLevel min getNumber ((_zooms#(count _zooms-2)) >> "zoomMax"),[_posX,_posY]] ;
							ctrlMapAnimCommit _map ;
							_disp closeDisplay 0 ;
						}] ;
						
						_map = (findDisplay 12 displayCtrl 51) ;
					}]*/
				] ;
			} ;
		} else {
			_poses = poses ;
			_poses pushBack (_map ctrlMapScreenToWorld getMousePosition) ;
			uiNamespace setVariable ["PLP_MapTools_distance_poses",_poses] ;
			if (isNil {uiNamespace getVariable ["PLP_MapTools_Height_curPos",nil]} and uiNamespace getVariable ["PLP_MapTools_Height_mode",false]) then {
				uiNamespace setVariable ["PLP_MapTools_Height_curPos",(_map ctrlMapScreenToWorld getMousePosition)] ;
				
				_disp = findDisplay 12 ;
				
				_graphCtrls = [] ;
				
				{
					if (ctrlIDC _x in [20001,20002]) then {_x ctrlShow true} ;
				} forEach allControls _disp ;
							
				#define SepScale	100
				
				_return = [] ;
				_min = 9999 ;
				_max = -9999 ;
				_curPos = (_map ctrlMapScreenToWorld getMousePosition) ;
				_curPos resize 2 ;
				for "_i" from 0 to SepScale do {
					_pos = vectorLinearConversion [
						0,SepScale,_i,(uiNamespace getVariable "PLP_MapTools_posReal")+[0],_curPos+[0]
					] ;
					_height = getTerrainHeightASL _pos ;
					_min = _min min _height ;
					_max = _max max _height ;
					
					_return pushBack _i ;
					_return pushBack _height ;
				} ;
				_graph = [[0,SepScale,_min,_max,SepScale+1,0]] + _return ;
				uiNamespace setVariable ["PLP_MapTools_Height_MinMax",[_min,_max]] ;
				
				if (_min < 0) then {
					_ctrl = _disp displayCtrl 20002 ;
					_ctrl ctrlSetPositionY linearConversion [_min,_max,0,GraphInnerY+GraphInnerH-pixelH*30,GraphInnerY+pixelH*15] ;
					_ctrl ctrlCommit 0 ;
					_ctrl ctrlShow true ;
				} else {
					(_disp displayCtrl 20002) ctrlShow false ;
				} ;
				
				_last = ((getGraphValues _graph)#0) ;
				if ((uiNamespace getVariable "PLP_MapTools_posReal")#0 > _curPos#0) then {reverse _last} ;
				{
					if (_forEachIndex != 0) then {
						_height1 = linearConversion [1,0,_last#(_forEachIndex-1),GraphInnerY+pixelH*15,GraphInnerY+GraphInnerH-pixelH*30] ;
						_height2 = linearConversion [1,0,_x,GraphInnerY+pixelH*15,GraphInnerY+GraphInnerH-pixelH*30] ;
						if (abs (_height1 - _height2) > (pixelH)) then {
							_ctrl = _disp displayCtrl (30000 + _forEachIndex) ;
							_ctrl ctrlSetPositionY _height1 ;
							_ctrl ctrlSetPositionH (_height2 - _height1) ;
							_ctrl ctrlShow true ;
							_ctrl ctrlCommit 0 ;
						} else {
							_ctrl = _disp displayCtrl (40000 + _forEachIndex) ;
							_ctrl ctrlSetPositionY _height1 ;
							_ctrl ctrlSetPositionH pixelH ;
							_ctrl ctrlShow true ;
							_ctrl ctrlCommit 0 ;
						} ;
					} ;
				} forEach (_last) ;
			} ;
		} ;
	}] ;
} ;