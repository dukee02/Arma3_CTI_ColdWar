_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

//mortars:
_c pushBack "B_Mortar_01_F";
_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
_b pushBack [1, 2, 4, 8];
_r pushBack [[100,2500], [100,3000], [100,3500], [100,4000]];

_c pushBack "O_Mortar_01_F";
_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
_b pushBack [1, 2, 4, 8];
_r pushBack [[100,2500], [100,3000], [100,3500], [100,4000]];

if(CTI_GM_DLC > 0) then {
	
	_c pushBack "gm_ge_army_m109g";
	_m pushBack ["gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602","gm_20Rnd_155mm_smoke_dm105","gm_20Rnd_155mm_illum_dm106","gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795","gm_20Rnd_155mm_smoke_m116","gm_20Rnd_155mm_smoke_m110","gm_20Rnd_155mm_illum_m485"];
	_b pushBack [1, 2, 5, 10];
	_r pushBack [[3000,6000], [3360,10700], [9350,18600], [9350,18600]];
	
	_c pushBack "gm_gc_army_2s1";
	_m pushBack ["gm_28Rnd_122x447mm_he_of462","gm_28Rnd_122x447mm_he_3of56","gm_28Rnd_122x447mm_smoke_d462","gm_28Rnd_122x447mm_illum_s463","gm_28Rnd_122x447mm_heat_bk6m","gm_28Rnd_122x447mm_heat_t_bk13"];
	_b pushBack [1, 2, 4, 8, 14, 28];
	_r pushBack [[3250,5000], [4920,7600], [7300,11300], [10010,15500]];
	
	_c pushBack "gm_ge_army_kat1_463_mlrs";
	_m pushBack ["gm_36Rnd_mlrs_110mm_he_dm21"];
	_b pushBack [1, 2, 5, 10, 18, 36];
	_r pushBack [[5900,7900], [7850,10500], [10500,14000], [10500,14000]];
	
	_c pushBack "gm_gc_army_ural375d_mlrs";
	_m pushBack ["gm_40Rnd_mlrs_122mm_he_9m22u"];
	_b pushBack [1, 2, 5, 10, 20, 40];
	_r pushBack [[5900,7900], [7850,10500], [10500,14000], [10500,14000]];
	
	_c pushBack "gm_gc_army_2p16";
	_m pushBack ["gm_1Rnd_luna_he_3r9"];
	_b pushBack [1];
	_r pushBack [[10150,13600], [13500,18100], [17600,23600], [22300,29900]];
};

//no real config for M120 in REDD, only manuel fire atm
//if(CTI_REDD_ADDON == 1) then {
//	_c pushBack "Redd_Tank_M120_Tampella";
//	_m pushBack ["Redd_8Rnd_120mm_Mo_shells", "Redd_8Rnd_120mm_Mo_annz_shells", "Redd_8Rnd_120mm_Mo_Flare_white", "Redd_8Rnd_120mm_Mo_Smoke_white", "Redd_1Rnd_120mm_Mo_shells", "Redd_1Rnd_120mm_Mo_annz_shells", "Redd_1Rnd_120mm_Mo_Flare_white", "Redd_1Rnd_120mm_Mo_Smoke_white"];
//	_b pushBack [1, 2, 4, 8];
//	_r pushBack [[90,500], [350,2000], [800,4000], [800,4000]];
//};

if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_O_2b14_82mm_RU";
	_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[90,500], [350,2000], [800,4000], [800,4000]];

	_c pushBack "CUP_B_M252_US";
	_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[90,500], [350,2000], [800,4000], [800,4000]];
	
	_c pushBack "CUP_B_M1129_MC_MK19_Desert";
	_m pushBack ["CUP_32Rnd_120mm_HE_M934", "CUP_6Rnd_120mm_Smoke_M929"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[90,500], [350,2000], [800,4000], [800,4000]];

	_c pushBack "CUP_B_M1129_MC_MK19_Woodland";
	_m pushBack ["CUP_32Rnd_120mm_HE_M934", "CUP_6Rnd_120mm_Smoke_M929"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[90,500], [350,2000], [800,4000], [800,4000]];
};
if(CTI_CWR3_ADDON > 0) then {
	_c pushBack "cwr3_b_m252";
	_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_guided","8Rnd_82mm_Mo_LG"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[83,499], [333,1998], [680,4078], [680,4078]];
	
	_c pushBack "cwr3_o_2b14";
	_m pushBack ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_guided","8Rnd_82mm_Mo_LG"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[86,499], [347,1998], [708,4078], [708,4078]];
};

/*if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_2b14_82mm_vdv";
	_m pushBack ["rhs_mag_3vo18_10", "rhs_mag_3vs25m_10", "rhs_mag_53_va_832a_10", "rhs_mag_d832du_10"];
	_b pushBack [1, 2, 4, 8];
	_r pushBack [[90,550], [380,2200], [780,4500], [780,4500]];
};*/

//static Artillery guns:
if(CTI_CUP_ADDON > 0) then {
	//CUP_I_M119_AAF,CUP_B_M119_USMC,CUP_B_M119_US,CUP_I_M119_RACS
	_c pushBack "CUP_B_M119_US";
	_m pushBack ["CUP_30Rnd_105mmHE_M119_M", "CUP_30Rnd_105mmWP_M119_M", "CUP_30Rnd_105mmLASER_M119_M", "CUP_30Rnd_105mmSMOKE_M119_M", "CUP_30Rnd_105mmILLUM_M119_M"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[830,4400], [2060,6000], [5300,15400], [5300,15400]];
	
	//CUP_I_D30_AAF,CUP_B_D30_CDF,CUP_O_D30_ChDKZ,CUP_O_D30_RU,CUP_O_D30_TK,CUP_O_D30_TK_INS,CUP_I_D30_TK_GUE,CUP_O_D30_SLA
	_c pushBack "CUP_O_D30_RU";
	_m pushBack ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmWP_D30_M", "CUP_30Rnd_122mmLASER_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[830,4400], [2060,6000], [5300,15400], [5300,15400]];
};
if(CTI_CWR3_ADDON > 0) then {
	_c pushBack "cwr3_b_m119";
	_m pushBack ["CUP_30Rnd_105mmHE_M119_M", "CUP_30Rnd_105mmWP_M119_M", "CUP_30Rnd_105mmLASER_M119_M", "CUP_30Rnd_105mmSMOKE_M119_M", "CUP_30Rnd_105mmILLUM_M119_M"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[826,2415], [2059,6021], [5272,15414], [5272,15414]];
	
	_c pushBack "cwr3_o_d30";
	_m pushBack ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmWP_D30_M", "CUP_30Rnd_122mmLASER_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[826,2415], [2059,6021], [5272,15414], [5272,15414]];
};

/*if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_D30_vdv";
	_m pushBack ["rhs_mag_of462", "rhs_mag_of462_10", "rhs_mag_3of56", "rhs_mag_3of56_10", "rhs_mag_3of56_5", "rhs_mag_bk6m", "rhs_mag_bk6m_26", "rhs_mag_bk6m_5", "rhs_mag_bk13", "rhs_mag_bk13_26", "rhs_mag_bk13_5", "rhs_mag_d462", "rhs_mag_d462_2", "rhs_mag_s463", "rhs_mag_s463_2", "rhs_mag_3of69m", "rhs_mag_3of69m_2"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[820,2400], [2050,6000], [5300,15400], [5300,15400]];
};*/

//SPGs
//_c = _c + ["B_MBT_01_arty_F"];
//_c = _c + ["O_MBT_02_arty_F"];
/*if(CTI_RHS_ADDON > 0) then {
	_c pushBack "rhs_2s3_tv";
	_m pushBack ["rhs_mag_HE_2a33", "rhs_mag_WP_2a33", "rhs_mag_Atomic_2a33", "rhs_mag_LASER_2a33", "rhs_mag_SMOKE_2a33", "rhs_mag_ILLUM_2a33", "rhs_mag_HE_2a33_26", "rhs_mag_WP_2a33_26", "rhs_mag_Atomic_2a_2633_26", "rhs_mag_LASER_2a33_26", "rhs_mag_SMOKE_2a33_26", "rhs_mag_ILLUM_2a33_26"];
	_b pushBack [2, 4, 8, 12];
	_r pushBack [[1035,2400], [2570,6000], [6550,15400], [6550,15400]];
};*/

//Arty Rocket launcher:
//_c = _c + ["B_MBT_01_mlrs_F"];
//_c = _c + ["I_Truck_02_MRL_F"];
if(CTI_CUP_ADDON > 0) then {
	_c pushBack "CUP_O_BM21_RU";
	_m pushBack ["CUP_40Rnd_GRAD_HE"];
	_b pushBack [1, 2, 5, 10, 20, 40];
	_r pushBack [[1500,8500], [1710,9800], [2110,12000], [2750,15500]];
	
	_c pushBack "CUP_B_M270_HE_USMC";
	_m pushBack ["CUP_12Rnd_MLRS_HE"];
	_b pushBack [1, 2, 3, 6, 12];
	_r pushBack [[1500,8500], [1710,9800], [2110,12000], [2750,15500]];
	
	_c pushBack "CUP_B_M270_DPICM_USMC";
	_m pushBack ["CUP_12Rnd_MLRS_DPICM"];
	_b pushBack [1, 2, 3, 6, 12];
	_r pushBack [[1500,8500], [1710,9800], [2110,12000], [2750,15500]];
	
	_c pushBack "CUP_B_M270_HE_USA";
	_m pushBack ["CUP_12Rnd_MLRS_HE"];
	_b pushBack [1, 2, 3, 6, 12];
	//_r pushBack [[233,1342], [299,1724], [391,2256], [511,2946], [665,3829], [871,5018], [1151,6630], [1487,8566], [1925,11091], [2476,14263], [3134,18052], [4012,23104], [5223,30083], [7005,40344], [9070,52232], [11790,67898]];
	//_r pushBack [[1500,8500], [1710,9800], [2110,12000], [2750,15500]];
	_r pushBack [[1487,8566], [1925,11091], [2476,14263], [3134,18052]];
	
	_c pushBack "CUP_B_M270_DPICM_USA";
	_m pushBack ["CUP_12Rnd_MLRS_DPICM"];
	_b pushBack [1, 2, 3, 6, 12];
	//_r pushBack [[233,1342], [299,1724], [391,2256], [511,2946], [665,3829], [871,5018], [1151,6630], [1487,8566], [1925,11091], [2476,14263], [3134,18052], [4012,23104], [5223,30083], [7005,40344], [9070,52232], [11790,67898]];
	_r pushBack [[1487,8566], [1925,11091], [2476,14263], [3134,18052]];
	
};
if(CTI_CWR3_ADDON > 0) then {
	//Scud only lauches the missile, no real Arty :(
	//_c pushBack "cwr3_o_scud";
	//_m pushBack ["cwr3_1rnd_scud_m"];
	//_b pushBack [1];
	//_r pushBack [[1500,8500], [1710,9800], [2110,12000], [2750,15500]];
	
	_c pushBack "cwr3_o_bm21";
	_m pushBack ["CUP_40Rnd_GRAD_HE"];
	_b pushBack [1, 2, 5, 10, 20, 40];
	_r pushBack [[1487,8564], [1707,9831], [2107,12137], [2738,15773]];
	
	_c pushBack "cwr3_b_m270_he";
	_m pushBack ["CUP_12Rnd_MLRS_HE"];
	_b pushBack [1, 2, 3, 6, 12];
	//_r pushBack [[233,1342], [299,1724], [391,2256], [511,2946], [665,3829], [871,5018], [1151,6630], [1487,8566], [1925,11091], [2476,14263], [3134,18052], [4012,23104], [5223,30083], [7005,40344], [9070,52232], [11790,67898]];
	_r pushBack [[1487,8566], [1925,11091], [2476,14263], [3134,18052]];
	
	_c pushBack "cwr3_b_m270_dpicm";
	_m pushBack ["CUP_12Rnd_MLRS_DPICM"];
	_b pushBack [1, 2, 3, 6, 12];
	//_r pushBack [[233,1342], [299,1724], [391,2256], [511,2946], [665,3829], [871,5018], [1151,6630], [1487,8566], [1925,11091], [2476,14263], [3134,18052], [4012,23104], [5223,30083], [7005,40344], [9070,52232], [11790,67898]];
	_r pushBack [[1487,8566], [1925,11091], [2476,14263], [3134,18052]];
};

if(CTI_BW_ADDON > 0) then {
	_c pushBack "BWA3_Panzerhaubitze2000_Tropen";
	_m pushBack ["BWA3_32Rnd_155mm_Mo_shells", "BWA3_12Rnd_155mm_Mo_Flare_white", "BWA3_6Rnd_155mm_Mo_Smoke_white"];
	_b pushBack [2, 4, 6, 12];
	_r pushBack [[2973,5059], [5096,8670], [9831,16725], [13689,23289]];
	//_r pushBack [[2973,5059], [4026,6850], [5096,8670], [7103,12084], [9831,16725], [13689,23289], [18183,30936]];

	_c pushBack "BWA3_Panzerhaubitze2000_Fleck";
	_m pushBack ["BWA3_32Rnd_155mm_Mo_shells", "BWA3_12Rnd_155mm_Mo_Flare_white", "BWA3_6Rnd_155mm_Mo_Smoke_white"];
	_b pushBack [2, 4, 6, 12];
	_r pushBack [[2973,5059], [5096,8670], [9831,16725], [13689,23289]];
};

//RHS Arty dosn't have any ammo in there setup, maybe this works
//round name: M-21OF
/*if(CTI_RHS_ADDON > 0) then {
	_c pushBack "RHS_BM21_VDV_01";
	_m pushBack ["rhs_mag_m21of_1"];
	_b pushBack [1, 2, 5, 10, 20, 40];
	_r pushBack [[5000,6500], [6500,8300], [8300,10000], [13000,16000]];
};*/

[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";
