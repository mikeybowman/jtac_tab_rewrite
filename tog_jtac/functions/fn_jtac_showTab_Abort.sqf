//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////
disableSerialization;
_TOG_jtac_show_dlg = createDialog "TOG_jtac_abort_dlg";
_display = uiNamespace getVariable "TOG_jtac_abort_dlg";
_type = "";
TOG_jtac_track = false;
	//ALL CAS CALSIGNS
	/*waitUntil { !isNil "TOG_jtac_Trans_arr" };
	{lbAdd[1003,_x]} forEach ["1","2"]; // MAX VEHS
	*/
	_i = 0;
	{

				_callsign = _x;
				if (typename _callsign == "STRING") then {
					{
						{
							if (_x select 1 == _callsign) then {_type = _x select 2;};
						} foreach _x;
					} foreach [TOG_jtac_CAS_Heli_arr,TOG_jtac_CAS_Plane_arr, TOG_jtac_Trans_Heli_arr];

					_picture = getText (configFile >> "cfgVehicles" >> _type >> "picture");



					lbAdd[1004,_callsign];
					lbSetValue[1004,_i,_callsign];
					lbSetPicture[1004,_i,_picture];
					_i = _i + 1;
				};

	} forEach TOG_jtac_Requested_arr; // All Calsigns


	lbSetCurSel[1004,0];



