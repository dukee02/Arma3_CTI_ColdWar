_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

//mortars:
_c = _c + ["B_Mortar_01_F"];
_m = _m + [["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white", "8Rnd_82mm_Mo_LG"]];
_b = _b + [[1, 2, 4, 8]];
_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];

_c = _c + ["O_Mortar_01_F"];
_m = _m + [["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white", "8Rnd_82mm_Mo_LG"]];
_b = _b + [[1, 2, 4, 8]];
_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];
if(CTI_REDD_ADDON == 1) then {
	_c = _c + ["Redd_Tank_M120_Tampella"];
	_m = _m + [["Redd_8Rnd_120mm_Mo_shells", "Redd_8Rnd_120mm_Mo_annz_shells", "Redd_8Rnd_120mm_Mo_Flare_white", "Redd_8Rnd_120mm_Mo_Smoke_white", "Redd_1Rnd_120mm_Mo_shells", "Redd_1Rnd_120mm_Mo_annz_shells", "Redd_1Rnd_120mm_Mo_Flare_white", "Redd_1Rnd_120mm_Mo_Smoke_white"]];
	_b = _b + [[1, 2, 4, 8]];
	_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];
};
if(CTI_CUP_ADDON > 0) then {
	_c = _c + ["CUP_O_2b14_82mm_RU"];
	_m = _m + [["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"]];
	_b = _b + [[1, 2, 4, 8]];
	_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];

	_c = _c + ["CUP_B_M252_US"];
	_m = _m + [["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white", "8Rnd_82mm_Mo_Flare_white"]];
	_b = _b + [[1, 2, 4, 8]];
	_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];
};
if(CTI_RHS_ADDON > 0) then {
	_c = _c + ["rhs_2b14_82mm_vdv"];
	_m = _m + [["rhs_mag_3vo18_10", "rhs_mag_3vs25m_10", "rhs_mag_53_va_832a_10", "rhs_mag_d832du_10"]];
	_b = _b + [[1, 2, 4, 8]];
	_r = _r + [[[100,2500], [100,3000], [100,3500], [100,4000]]];
};
//static Artillery guns:
if(CTI_CUP_ADDON > 0) then {
	//CUP_I_M119_AAF,CUP_B_M119_USMC,CUP_B_M119_US,CUP_I_M119_RACS
	_c = _c + ["CUP_B_M119_US"];
	_m = _m + [["CUP_30Rnd_105mmHE_M119_M", "CUP_30Rnd_105mmWP_M119_M", "CUP_30Rnd_105mmLASER_M119_M", "CUP_30Rnd_105mmSMOKE_M119_M", "CUP_30Rnd_105mmILLUM_M119_M"]];
	_b = _b + [[2, 4, 8, 12]];
	_r = _r + [[[800,4000], [800,6000], [800,8000], [800,10000]]];
	
	//CUP_I_D30_AAF,CUP_B_D30_CDF,CUP_O_D30_ChDKZ,CUP_O_D30_RU,CUP_O_D30_TK,CUP_O_D30_TK_INS,CUP_I_D30_TK_GUE,CUP_O_D30_SLA
	_c = _c + ["CUP_O_D30_RU"];
	_m = _m + [["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmWP_D30_M", "CUP_30Rnd_122mmLASER_D30_M", "CUP_30Rnd_122mmSMOKE_D30_M", "CUP_30Rnd_122mmILLUM_D30_M"]];
	_b = _b + [[2, 4, 8, 12]];
	_r = _r + [[[800,4000], [800,6000], [800,8000], [800,10000]]];
};
if(CTI_RHS_ADDON > 0) then {
	_c = _c + ["rhs_D30_vdv"];
	_m = _m + [["rhs_mag_of462", "rhs_mag_of462_10", "rhs_mag_3of56", "rhs_mag_3of56_10", "rhs_mag_3of56_5", "rhs_mag_bk6m", "rhs_mag_bk6m_26", "rhs_mag_bk6m_5", "rhs_mag_bk13", "rhs_mag_bk13_26", "rhs_mag_bk13_5", "rhs_mag_d462", "rhs_mag_d462_2", "rhs_mag_s463", "rhs_mag_s463_2", "rhs_mag_3of69m", "rhs_mag_3of69m_2"]];
	_b = _b + [[2, 4, 8, 12]];
	_r = _r + [[[800,4000], [800,6000], [800,8000], [800,10000]]];
};

//SPGs
//_c = _c + ["B_MBT_01_arty_F"];
//_c = _c + ["O_MBT_02_arty_F"];
if(CTI_RHS_ADDON > 0) then {
	_c = _c + ["rhs_2s3_tv"];
	_m = _m + [["rhs_mag_HE_2a33", "rhs_mag_WP_2a33", "rhs_mag_Atomic_2a33", "rhs_mag_LASER_2a33", "rhs_mag_SMOKE_2a33", "rhs_mag_ILLUM_2a33", "rhs_mag_HE_2a33_26", "rhs_mag_WP_2a33_26", "rhs_mag_Atomic_2a_2633_26", "rhs_mag_LASER_2a33_26", "rhs_mag_SMOKE_2a33_26", "rhs_mag_ILLUM_2a33_26"]];
	_b = _b + [[2, 4, 8, 12]];
	_r = _r + [[[800,4000], [800,7000], [800,10000], [800,20000]]];
};

//Arty Rocket launcher:
//_c = _c + ["B_MBT_01_mlrs_F"];
//_c = _c + ["I_Truck_02_MRL_F"];
if(CTI_CUP_ADDON > 0) then {
	_c = _c + ["CUP_O_BM21_RU"];
	_m = _m + [["CUP_40Rnd_GRAD_HE"]];
	_b = _b + [[2, 3, 6]];
	_r = _r + [[[800,4500], [800,7500], [800,10500], [800,20500]]];
};
if(CTI_RHS_ADDON > 0) then {
	_c = _c + ["RHS_BM21_VDV_01"];
	_m = _m + [["12Rnd_230mm_rockets"]];
	_b = _b + [[2, 3, 6]];
	_r = _r + [[[800,4500], [800,7500], [800,10500], [800,20500]]];
};




[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";