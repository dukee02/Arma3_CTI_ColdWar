//VAM Hummingbird/Pawnee Vehicle Camo Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _list_selection = lbCurSel _list_camo;
private _selected_camo_class_name = camo_class_names select _list_selection;

VAM_targetvehicle setObjectTextureGlobal [0, _selected_camo_class_name];