# CHANGELOG.md

## 1.0.2 (2023-11-07)

Update:

  - fn_jatc_cas_callsign.sqf updated
  - fn_jtac_trans_callsign.sqf updated
  
Broken code repaired:

  - fn_trans_callsign.sqf
  
  ```
	//fn_jtac_TRANS_callsign

	_display = uiNamespace getVariable "TOG_jtac_Trans_dlg";
	_callSignList = _display displayCtrl 1004;
	_size = lbSize _callSignList;
	_selectedCallSign = lbCurSel _callSignList;
	_callsign = _callSignList lbText _selectedCallSign;
	_transType = _callSignList lbValue _selectedCallSign;
	_delMark = _this select 0;

	if (typeName _delMark != "BOOL" || isNil "_delMark") then {_delMark = false;};
	TOG_jtac_Trans_type = _transType;
	TOG_jtac_Trans_callsign = _callsign;
	if (_delMark) then {
		for [{_i = 0},{_size > _i},{_i = _i + 1}] do {
			_callsign = _callSignList lbText _i;
			if (_callsign in TOG_jtac_Trans_requested) then {} else {
				{
					_mrk_name = _callsign + _x;
					_distMrkName = _mrk_name + "dist";
					deleteMarker _mrk_name;
					deleteMarker _distMrkName;
				} foreach ["PICK","DEST"];
			};
		};
	};
  	//fn_jtac_TRANS_callsign

	_display = uiNamespace getVariable "TOG_jtac_Trans_dlg";
	_callSignList = _display displayCtrl 1004;
	_size = lbSize _callSignList;
	_selectedCallSign = lbCurSel _callSignList;
	_callsign = _callSignList lbText _selectedCallSign;
	_transType = _callSignList lbValue _selectedCallSign;
	_delMark = _this select 0;

	if (typeName _delMark != "BOOL" || isNil "_delMark") then {_delMark = false;};
	TOG_jtac_Trans_type = _transType;
	TOG_jtac_Trans_callsign = _callsign;
	if (_delMark) then {
		for [{_i = 0},{_size > _i},{_i = _i + 1}] do {
			_callsign = _callSignList lbText _i;
			if (_callsign in TOG_jtac_Trans_requested) then {} else {
				{
					_mrk_name = _callsign + _x;
					_distMrkName = _mrk_name + "dist";
					deleteMarker _mrk_name;
					deleteMarker _distMrkName;
				} foreach ["PICK","DEST"];
			};
		};
	};
		
	```	
	
Known Issues:

  - On insert, the bird will sit for 2 minutes without the ability to send it back to base

## 1.0.2 (2023-11-07)

Filed Uploaded:

  - Files uploaded for GitHub
  - All changes to this point are implimented and not-properly documented