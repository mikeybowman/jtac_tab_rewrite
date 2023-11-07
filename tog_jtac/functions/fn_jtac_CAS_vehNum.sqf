//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

_display = uiNamespace getVariable "TOG_jtac_cas_dlg";
	_vehNumList = _display displayCtrl 1003;
	_selectedVehNum = lbCurSel _vehNumList;
	_vehNumVal = _vehNumList lbText _selectedVehNum;

	TOG_jtac_CAS_vehNum = parseNumber _vehNumVal;