_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

_c pushBack "LIB_GrWr34";
_m pushBack ["LIB_8Rnd_81mmHE_GRWR34", "ARTY_LIB_8Rnd_81mmHE_GRWR34", "LIB_1rnd_81mmHE_GRWR34", "LIB_81mm_GRWR34_SmokeShell"];
_b pushBack [1, 2, 5];
_r pushBack [[100,1500], [100,1800], [100,2000], [100,2400]];

_c pushBack "LIB_GrWr34_g";
_m pushBack ["LIB_8Rnd_81mmHE_GRWR34", "ARTY_LIB_8Rnd_81mmHE_GRWR34", "LIB_1rnd_81mmHE_GRWR34", "LIB_81mm_GRWR34_SmokeShell"];
_b pushBack [1, 2, 5];
_r pushBack [[100,1500], [100,1800], [100,2000], [100,2400]];

_c pushBack "LIB_BM37";
_m pushBack ["LIB_8Rnd_82mmHE_BM37", "ARTY_LIB_8Rnd_82mmHE_BM37", "LIB_1rnd_82mmHE_BM37", "LIB_82mm_BM37_SmokeShell"];
_b pushBack [1, 2, 5];
_r pushBack [[100,1500], [100,1800], [100,2000], [100,2400]];

[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";