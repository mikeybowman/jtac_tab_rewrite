//////////////////////////////
//	Advanced JTAC module	//
//		bys SUSHI			//
//	all rights reserverd	//
//		www.armatog.com		//
//////////////////////////////

//fn_jtac_showTab_CAS

disableSerialization;
private ["_TOG_jtac_show_dlg","_display","_i","_type","_picture"];

_TOG_jtac_show_dlg = createDialog "TOG_jtac_cas_dlg";
_display = uiNamespace getVariable "TOG_jtac_cas_dlg";

TOG_jtac_cas_selectPos = 0; //0- TGT, 1-Ip/Bp, 2-Friendlies
TOG_jtac_cas_vehNum = 1;
TOG_jtac_cas_markType = 0; //0- none, 1- Laser, 2- dym
TOG_jtac_CAS_ammoType = 0; //0 - gbu, 1 - carpet, 2- direct || 0 - manual 1- direct
TOG_jtac_CAS_mrkTgt = nil;
TOG_jtac_CAS_mrkIp = nil;
TOG_jtac_CAS_Heading = 0;

//Sprawdzanie czy noc
_date = date;
_h = _date select 3;

if (_h > TOG_jtac_sunrise && _h < TOG_jtac_sunset) then { TOG_jtac_daytime = 1; } else { TOG_jtac_daytime = 2; }; //1 - day 2 - night

////Dodawanie jednostek do list

//ilosc
{lbAdd[1003,_x]} forEach ["1","2"];

//callsign
_i = 0;
{
	{
		if (_x select 3 > 0) then {
			_type = _x select 2;
			_picture = getText (configFile >> "cfgVehicles" >> _type >> "picture");

			lbAdd[1004,( _x select 1)];
			lbSetValue[1004,_i,(_x select 0)];
			lbSetPicture[1004,_i,_picture];
			_i = _i + 1;
		};
	} foreach _x;
} foreach [TOG_jtac_CAS_Plane_arr, TOG_jtac_CAS_Heli_arr];

//Kierunek
_i = 0;
{
	lbAdd[10013,_x];
	lbSetValue[10013,_i,_i];
	_i = _i + 1;
} forEach [(localize "STR_N"),(localize "STR_NE"),(localize "STR_E"),(localize "STR_SE"),(localize "STR_S"),(localize "STR_SW"),(localize "STR_W"),(localize "STR_NW")];

//Offset
{lbAdd[1006,_x]} forEach [(localize "STR_NONE"),(localize "STR_L"),(localize "STR_R")];

//TGT description
{lbAdd[1008,_x]} forEach [(localize "STR_INFANTRY"),(localize "STR_VEHICLE"),(localize "STR_ARMOR"),(localize "STR_HEAVYARMOR"),(localize "STR_STRUCTURE")];

//Marker
_markersArr = [(localize "STR_NONE"),(localize "STR_LASER"),(localize "STR_SMOKE")];
if (TOG_jtac_daytime == 2) then {
	_markersArr = [(localize "STR_NONE"),(localize "STR_LASER"),(localize "STR_LIGHTSTICK")];
};
_i = 0;
{
	lbAdd[1010,_x];
	lbSetValue[1010,_i,_i];
	_i = _i + 1;
} forEach _markersArr;

//Ustawianie pierwszych wartosci
{lbSetCurSel[_x,0]} foreach [1003,1004,1006,10013,1008,1010]; // ustaw pierwsze wartosci
_callSignList = _display displayCtrl 1004;
_size = lbSize _callSignList;
_selectedCallSign = lbCurSel _callSignList;
_casType = _callSignList lbValue _selectedCallSign;

_ammo = _display displayCtrl 1011;
if (_casType == 2) then { _ammo = _display displayCtrl 1013;};
_ammo ctrlShow true;

[_display] call TOG_fnc_jtac_CAS_onMapClick