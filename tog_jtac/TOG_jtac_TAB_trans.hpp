

class TOG_jtac_trans_dlg {
	idd = 1000001;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['TOG_jtac_trans_dlg', (_this select 0)];";
	onUnload = "['TOG_jtac_Trans_mapClick', 'onMapSingleClick'] call BIS_fnc_removeStackedEventHandler";
	objects[] = {};

	class controlsBackground {

		class TOG_jtac_background: TOG_RscPicture {
				moving = 1;
				idc = IDC_TOG_BG;

				text= "\tog_jtac\img\tog_tab_bg.paa";
				x = 9.55 * GUI_GRID_W + GUI_GRID_X;
				y = 1.55 * GUI_GRID_H + GUI_GRID_Y;
				w = 23.8 * GUI_GRID_W;
				h = 25 * GUI_GRID_H;
			};

			class TOG_jtac_screen: TOG_RscPicture {

				idc = IDC_TOG_SCREEN;
				text = "#(argb,8,8,3)color(0.09,0.09,0.09,1)";
				x = 12.6 * GUI_GRID_W + GUI_GRID_X;
				y = 7 * GUI_GRID_H + GUI_GRID_Y;
				w = 16.4 * GUI_GRID_W;
				h = 13 * GUI_GRID_H;
			};

			class TOG_jtac_map: TOG_map {

				idc = IDC_TOG_MAP;
				text = "#(argb,8,8,3)color(0.2,0.431,0.647,1)";
				x = 12.6 * GUI_GRID_W + GUI_GRID_X;
				y = 7 * GUI_GRID_H + GUI_GRID_Y;
				w = 8 * GUI_GRID_W;
				h = 13 * GUI_GRID_H;
			};


	};


	class controls {


		//////////MENU CAS/////////////

		class TOG_jtac_card_title: TOG_RscStructuredText {
			idc = -1;
			text = $STR_TITLE_TRANS;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
		};

		class TOG_jtac_numtype_title: TOG_RscStructuredText {
			idc = -1;
			text = $STR_NUMTYPE_TRANS;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
		};

		/*class TOG_jtac_vehnum: TOG_RscCombo {
			idc = IDC_TOG_CAS_VEHNUM;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 8.52 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			onLBSelChanged = "call TOG_fnc_jtac_Trans_vehNum";
		};*/

		class TOG_jtac_vehtype: TOG_RscCombo {
			idc = IDC_TOG_CAS_VEHTYPE;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 8.52 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			onLBSelChanged = "[true] call TOG_fnc_jtac_Trans_callsign";
		};

		class TOG_jtac_mappos: TOG_RscToolbox {
  			idc = IDC_TOG_CAS_MAPPOS;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);

			strings[] = {$STR_PICK_TRANS,$STR_DEST_TRANS};
  			values[] = {1,1};
  			toolTip = $STR_TOOLTIP_SELECTMAP;
  			onToolBoxSelChanged = "TOG_jtac_Trans_selectPos = (_this select 1);";
		};

		class TOG_jtac_sequritytitle: TOG_RscStructuredText {
  			idc = -1;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			text = $STR_SEQDESC_TRANS;
		};

		class TOG_jtac_sequrityval: TOG_RscCombo {
			idc = IDC_TOG_CAS_DESCVAL;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 11.52 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			onLBSelChanged = "call TOG_fnc_jtac_Trans_sequrity";
		};

		class TOG_jtac_marktitle: TOG_RscStructuredText {
  			idc = -1;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			text = $STR_MARK_CAS;
		};

		class TOG_jtac_marktype: TOG_RscCombo {
  			idc = IDC_TOG_CAS_MARKTYPE;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 13.02 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			onLBSelChanged = "call TOG_fnc_jtac_Trans_markType";
		};

		class TOG_jtac_aborttitle: TOG_RscStructuredText {
  			idc = -1;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			text = $STR_CODE_ABORT;
		};
		class TOG_jtac_abortcode: TOG_RscEdit {
  			idc = IDC_TOG_ABORT_CODE;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 17.52 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
		};

		class TOG_jtac_request: TOG_RscButton {
  			idc = IDC_TOG_CAS_REQUEST;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
  			text= $STR_REQUEST_CAS;
  			onMouseButtonClick = "call TOG_fnc_jtac_Trans_request";
		};
		////////// TAB BTNS
		class TOG_jtac_btn1: TOG_RscButton {
  			idc = 100001;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.2 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
  			text= "";
  			toolTip = "CAS";
  			onMouseButtonClick = "[true] call TOG_fnc_jtac_Trans_callsign; closeDialog 0;  [] spawn TOG_fnc_jtac_showTab_CAS;";
  			colorDisabled[] ={1,1,1,0};
			colorBackground[] ={1,1,1,0};
			colorBackgroundDisabled[] ={1,1,1,0};
			colorBackgroundActive[] ={1,1,1,0};
			colorFocused[] ={1,1,1,0};
			colorShadow[] ={1,1,1,0};
			colorBorder[] ={1,1,1,0};

		};
		class TOG_jtac_btn2: TOG_RscButton {
  			idc = 100001;
			x = 31.2 * GUI_GRID_W + GUI_GRID_X;
			y = 9.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.2 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
  			text= "";
  			toolTip = "Transport";
  			onMouseButtonClick = "";
  			colorDisabled[] ={1,1,1,0};
			colorBackground[] ={1,1,1,0};
			colorBackgroundDisabled[] ={1,1,1,0};
			colorBackgroundActive[] ={1,1,1,0};
			colorFocused[] ={1,1,1,0};
			colorShadow[] ={1,1,1,0};
			colorBorder[] ={1,1,1,0};

		};
		class TOG_jtac_btn3: TOG_RscButton {
  			idc = 100001;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.2 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
  			text= "";
  			toolTip = "REQUESTED";
  			onMouseButtonClick = "[true] call TOG_fnc_jtac_Trans_callsign; closeDialog 0;  [] spawn TOG_fnc_jtac_showTab_Abort;";
  			colorDisabled[] ={1,1,1,0};
			colorBackground[] ={1,1,1,0};
			colorBackgroundDisabled[] ={1,1,1,0};
			colorBackgroundActive[] ={1,1,1,0};
			colorFocused[] ={1,1,1,0};
			colorShadow[] ={1,1,1,0};
			colorBorder[] ={1,1,1,0};

		};
	};
};




