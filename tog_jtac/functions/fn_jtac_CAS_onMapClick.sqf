//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//fn_jtac_CAS_onMapClick

["TOG_jtac_CAS_mapClick", "onMapSingleClick", {

		_debug = false;

		[false] call TOG_fnc_jtac_CAS_callsign;

		_callsign = TOG_jtac_CAS_callsign;
		_maxDist = 1700;
		if (TOG_jtac_CAS_type == 2) then {_maxDist = 500;};


		_mrk_ico = "EMPTY";
		_mrk_color = "EMPTY";
		_mrk_name = "EMPTY";
		_mrk_str = "EMPTY";
		switch (TOG_jtac_CAS_selectPos) do {
			case 0: {
				_mrk_ico = "mil_destroy";
				_mrk_color = "ColorRed";
				_mrk_name = _callsign + "TGT";
				_mrk_str = (localize "STR_TGTLOC_CAS");
			};
			case 1: {
				_mrk_ico = "mil_start";
				_mrk_color = "ColorBlack";
				_mrk_name= _callsign + "IP";
				_mrk_str = (localize "STR_IPBP_CAS");
			};
			case 2: {
				_mrk_ico = "mil_circle";
				_mrk_color = "ColorWEST";
				_mrk_name = _callsign + "FRIENDS";
				_mrk_str = (localize "STR_FRIENDLOC_CAS");
			};
		};


		deleteMarker _mrk_name;
		_mrkTxtString = format ["%1 / %2",_mrk_str, _callsign];
		_mrk = createMarkerLocal [_mrk_name, _pos];
		_mrk setMarkerTypeLocal _mrk_ico;
		_mrk setMarkerColorLocal _mrk_color;
		_mrk setMarkerTextLocal _mrkTxtString;

		switch (TOG_jtac_CAS_selectPos) do {
			case 0: {
				TOG_jtac_CAS_mrkTgt = _mrk;
				_distMrkName = _mrk_name + "dist";
				deleteMarker _distMrkName;
				_distMrk = createMarkerLocal [_distMrkName, _pos];
				_distMrk setMarkerShapeLocal "ELLIPSE";
				_distMrk setMarkerSizeLocal[_maxDist, _maxDist];
				_distMrk setMarkerColorLocal "ColorBlack";
				_distMrk setMarkerBrushLocal "Border";

			};
			case 1: {
				TOG_jtac_CAS_mrkIp = _mrk;
			};
		};

		if ((!isNil "TOG_jtac_CAS_mrkTgt") && (!isNil "TOG_jtac_CAS_mrkIp")) then {
			_distance = (getMarkerPos TOG_jtac_CAS_mrkTgt) distance (getMarkerPos TOG_jtac_CAS_mrkIp);
			_elev = getTerrainHeightASL (getMarkerPos TOG_jtac_CAS_mrkTgt);

			if (_distance < _maxDist) then {
				hint (localize "STR_INFO_LOWDISTANCE");
				_mrk_name = _callsign + "IP";
				deleteMarker _mrk_name;
				TOG_jtac_CAS_mrkIp = nil;
			} else {
				_display = uiNamespace getVariable "TOG_jtac_cas_dlg";
				_distVal = _display displayCtrl 1007;
				_distVal ctrlSetText str _distance;
			};
			_display = uiNamespace getVariable "TOG_jtac_cas_dlg";
			_distVal = _display displayCtrl 1009;
			_distVal ctrlSetText str _elev;
		};

}] call BIS_fnc_addStackedEventHandler;