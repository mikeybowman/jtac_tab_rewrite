//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//fn_jtac_CAS_changeMrkDir

if (isNil "TOG_jtac_CAS_mrkIp") exitWith {};
_display = uiNamespace getVariable "TOG_jtac_cas_dlg";
_headingList = _display displayCtrl 10013;
_selectedHeading = lbCurSel _headingList;
_headingVal = _headingList lbValue _selectedHeading;
_dir = 0;

if (_headingVal == 0) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 0; _dir = 0;};
if (_headingVal == 1) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 45; _dir = 45; };
if (_headingVal == 2) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 90; _dir = 90;};
if (_headingVal == 3) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 135; _dir = 135;};
if (_headingVal == 4) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 180; _dir = 180;};
if (_headingVal == 5) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 225; _dir = 225;};
if (_headingVal == 6) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 270; _dir = 270;};
if (_headingVal == 7) exitWith {TOG_jtac_CAS_mrkIp setMarkerDirLocal 315; _dir = 315;};

TOG_jtac_CAS_Heading = _dir;

true