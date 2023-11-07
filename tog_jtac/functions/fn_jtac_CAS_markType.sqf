//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
_display = uiNamespace getVariable "TOG_jtac_cas_dlg";
	_markTypeList = _display displayCtrl 1010;
	_selectedMarkType = lbCurSel _markTypeList;
	_markType = _markTypeList lbValue _selectedMarkType;

	TOG_jtac_CAS_markType = _markType;