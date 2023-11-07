///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4


#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 40)
#define GUI_GRID_H	(safezoneH / 25)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)

#define IDC_TOG_BG 1000
#define IDC_TOG_SCREEN 1001
#define IDC_TOG_MAP 1002
#define IDC_TOG_CAS_VEHNUM 1003
#define IDC_TOG_CAS_VEHTYPE 1004
#define IDC_TOG_CAS_MAPPOS 1005
#define IDC_TOG_CAS_HEADINGVAL 10013
#define IDC_TOG_CAS_OFFSETVAL 1006
#define IDC_TOG_CAS_DISTVAL 1007
#define IDC_TOG_CAS_DESCVAL 1008
#define IDC_TOG_CAS_ELEVATIONVAL 1009
#define IDC_TOG_CAS_MARKTYPE 1010
#define IDC_TOG_CAS_AMMOTYPE 1011
#define IDC_TOG_CAS_REQUEST 1012
#define IDC_TOG_CAS_AMMOTYPEHELI 1013
#define IDC_TOG_TRACK_DISTTGT 200001
#define IDC_TOG_TRACK_DISTIP 200002
#define IDC_TOG_TRACK_ONOF 200003
#define IDC_TOG_ABORT_CODE 200004


///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////

class TOG_map
{
	idc = -1;
	type=101;
	style=48;
	moveOnEdges = 1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001000;
	scaleMax = 1.000000;
	scaleDefault = 0.160000;
	maxSatelliteAlpha = 0.850000;
	alphaFadeStartScale = 0.350000;
	alphaFadeEndScale = 0.400000;
	colorBackground[]  = {0.969000, 0.957000, 0.949000, 1.000000};
        colorText[] = {0, 0, 0, 1};
	colorSea[]  = {0.467000, 0.631000, 0.851000, 0.500000};
	colorForest[]  = {0.624000, 0.780000, 0.388000, 0.500000};
	colorForestBorder[]  = {0.000000, 0.000000, 0.000000, 0.000000};
	colorRocks[]  = {0.000000, 0.000000, 0.000000, 0.300000};
	colorRocksBorder[]  = {0.000000, 0.000000, 0.000000, 0.000000};
	colorLevels[]  = {0.286000, 0.177000, 0.094000, 0.500000};
	colorMainCountlines[]  = {0.572000, 0.354000, 0.188000, 0.500000};
	colorCountlines[]  = {0.572000, 0.354000, 0.188000, 0.250000};
	colorMainCountlinesWater[]  = {0.491000, 0.577000, 0.702000, 0.600000};
	colorCountlinesWater[]  = {0.491000, 0.577000, 0.702000, 0.300000};
	colorPowerLines[]  = {0.100000, 0.100000, 0.100000, 1.000000};
	colorRailWay[]  = {0.800000, 0.200000, 0.000000, 1.000000};
	colorNames[]  = {0.100000, 0.100000, 0.100000, 0.900000};
	colorInactive[]  = {1.000000, 1.000000, 1.000000, 0.500000};
	colorOutside[]  = {0.000000, 0.000000, 0.000000, 1.000000};
	colorTracks[]  = {0.840000, 0.760000, 0.650000, 0.150000};
	colorTracksFill[]  = {0.840000, 0.760000, 0.650000, 1.000000};
	colorRoads[]  = {0.700000, 0.700000, 0.700000, 1.000000};
	colorRoadsFill[]  = {1.000000, 1.000000, 1.000000, 1.000000};
	colorMainRoads[]  = {0.900000, 0.500000, 0.300000, 1.000000};
	colorMainRoadsFill[]  = {1.000000, 0.600000, 0.400000, 1.000000};
	colorGrid[]  = {0.100000, 0.100000, 0.100000, 0.600000};
	colorGridMap[]  = {0.100000, 0.100000, 0.100000, 0.600000};
        font = "TahomaB";
        sizeEx = 0.04;
	fontLabel = "PuristaMedium";
	sizeExLabel = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.020000;
	fontUnits = "TahomaB";
	sizeExUnits = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "PuristaMedium";
	sizeExNames = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.020000;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	class Legend
        {
		x = "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[]  = {1, 1, 1, 0.500000};
		color[]  = {0, 0, 0, 1};
	};
	class Task
        {
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		color[]  = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCreated[]  = {1, 1, 1, 1};
		colorCanceled[]  = {0.700000, 0.700000, 0.700000, 1};
		colorDone[]  = {0.700000, 1, 0.300000, 1};
		colorFailed[]  = {1, 0.300000, 0.200000, 1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Waypoint
        {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[]  = {0, 0, 0, 1};
                size = 20;
		coefMin = 0.9;
		coefMax = 4;
		importance = "1.2 * 16 * 0.05";
	};
	class WaypointCompleted
        {
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[]  = {0, 0, 0, 1};
                size = 20;
		coefMin = 0.9;
		coefMax = 4;
		importance = "1.2 * 16 * 0.05";
	};
	class ActiveMarker
        {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		size = 20;
		color[] = {0, 0.9, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class CustomMark
        {
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[]  = {0, 0, 0, 1};
	};
	class Command
        {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[]  = {1, 1, 1, 1};
	};
	class Bush
        {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]  = {0.450000, 0.640000, 0.330000, 0.400000};
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Rock
        {
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[]  = {0.100000, 0.100000, 0.100000, 0.800000};
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class SmallTree
        {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]  = {0.450000, 0.640000, 0.330000, 0.400000};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Tree
        {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]  = {0.450000, 0.640000, 0.330000, 0.400000};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class busstop
        {
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class fuelstation
        {
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class hospital
        {
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class church
        {
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class lighthouse
        {
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class power
        {
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class powersolar
        {
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class powerwave
        {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class powerwind
        {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class quay
        {
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class shipwreck
        {
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class transmitter
        {
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class watertower
        {
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {1, 1, 1, 1};
	};
	class Cross
        {
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {0, 0, 0, 1};
	};
	class Chapel
        {
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.850000;
		coefMax = 1.000000;
		color[]  = {0, 0, 0, 1};
	};
	class Bunker
        {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class Fortress
        {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class Fountain
        {
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class Ruin
        {
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class Stack
        {
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class Tourism
        {
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.700000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};
	class ViewTower
        {
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
		color[]  = {0, 0, 0, 1};
	};

};

class TOG_RscPicture
{
	access = 0;
	type = ol types
	#define CT_STATIC;
	idc = -1;
	style = 48;
	colorBackground[] =
	{
		0,
		0,
		0,
		0
	};
	colorText[] =
	{
		1,
		1,
		1,
		1
	};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	tooltipColorText[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] =
	{
		0,
		0,
		0,
		0.65
	};
	tooltipColorShade[] =
	{
		0,
		0,
		0,
		0.65
	};
};

class TOG_RscStructuredText
{
	access = 0;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = 0;
	colorText[] ={1,1,1,1};
	colorBackground[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7
	};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	text = "";
	size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
	shadow = 1;
};

class TOG_RscCombo  {
	access = 0;
	type = 4;
	colorSelect[] =
	{
		0,
		0,
		0,
		1
	};
	colorText[] =
	{
		1,
		1,
		1,
		1
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		1
	};
	colorScrollbar[] =
	{
		1,
		0,
		0,
		1
	};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] =
		{
			1,
			1,
			1,
			1
		};
	};
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] =
	{
		1,
		1,
		1,
		0.7
	};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] =
	{
		1,
		0,
		0,
		1
	};
	colorDisabled[] =
	{
		1,
		1,
		1,
		0.25
	};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
	tooltipColorText[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] =
	{
		0,
		0,
		0,
		0.65
	};
};



class TOG_RscToolbox {
  idc = -1;
  type = CT_TOOLBOX;
  style = ST_CENTER;

  x = 0.1;
  y = 0.2;
  w = 0.2;
  h = 0.15;

  colorText[] = {1, 1, 1, 1};
  color[] = {0.8, 0.8, 0.8, 1};
  colorBackground[] =
	{
		0.2,
		0.2,
		0.2,
		1
	};
  colorTextSelect[] = {1, 1, 1, 1};
  colorSelect[] = {
  		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7};
  colorSelectedBg[] = {
  		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7};
  colorTextDisable[] = {0.4, 0.4, 0.4, 1};
  colorDisable[] = {0.4, 0.4, 0.4, 1};
  colorDisabledBg[] = {0.4, 0.4, 0.4, 1};

  font = "PuristaMedium";
  sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";

  rows = 1;
  columns = 3;
  strings[] = {"","",""};
  values[] = {0,0,0};

  // Only a simple user interface event handler to show some response
  //onToolBoxSelChanged = "hint format[""Toolbox change:\n%1\nEntry#:%2"",(_this select 0),(_this select 1)];"

	tooltipColorText[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] =
	{
		0,
		0,
		0,
		0.65
	};

	};
	class TOG_RscEdit {
		idc =-1;
		type = CT_EDIT;
		style = ST_LEFT;
		x = 0.1;
  		y = 0.2;
  		w = 0.2;
  		h = 0.15;
  		font = "PuristaMedium";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
		colorDisabled[] = {1,1,1,1};
		colorSelection[] = {1,1,1,1};
		autocomplete = false;
		text ="";
		colorText[] = {1,1,1,1};
		colorBorder[] ={1,1,1,1};
		colorBorderFocused[] = {
	  		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
			0.7
		};

};

class TOG_RscButton
	{
		access = 0;
		type = CT_BUTTON;
		text = "";
		colorText[] =
		{
			1,
			1,
			1,
			1
		};
		colorDisabled[] =
		{
			1,
			1,
			1,
			0.25
		};
		colorBackground[] =
		{
			0,
			0,
			0,
			0.5
		};
		colorBackgroundDisabled[] =
		{
			0,
			0,
			0,
			0.5
		};
		colorBackgroundActive[] =
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7
		};
		colorFocused[] =
		{
			0,
			0,
			0,
			1
		};
		colorShadow[] =
		{
			0,
			0,
			0,
			0
		};
		colorBorder[] =
		{
			0,
			0,
			0,
			1
		};
		soundEnter[] =
		{
			"\A3\ui_f\data\sound\RscButton\soundEnter",
			0.09,
			1
		};
		soundPush[] =
		{
			"\A3\ui_f\data\sound\RscButton\soundPush",
			0.09,
			1
		};
		soundClick[] =
		{
			"\A3\ui_f\data\sound\RscButton\soundClick",
			0.09,
			1
		};
		soundEscape[] =
		{
			"\A3\ui_f\data\sound\RscButton\soundEscape",
			0.09,
			1
		};
		style = 2;
		x = 0;
		y = 0;
		w = 0.095589;
		h = 0.039216;
		shadow = 2;
		font = "PuristaMedium";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		borderSize = 0;
		offsetX = 0;
		offsetY = 0;
		offsetPressedX = 0;
		offsetPressedY = 0;
		period = 1.2;
		periodFocus = 1.2;
		periodOver = 1.2;
	};














