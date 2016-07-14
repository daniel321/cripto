#include-once

; #INDEX# =======================================================================================================================
; Title .........: RichEdit_Constants
; AutoIt Version : 3.3.14.2
; Language ......: English
; Description ...: <a href="../appendix/GUIStyles.htm#Edit">GUI control Edit/Input styles</a> and much more constants.
; Author(s) .....: Gary Frost, ...
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
; Messages
Global Const $__RICHEDITCONSTANT_WM_USER = 0x400
Global Const $EM_AUTOURLDETECT = $__RICHEDITCONSTANT_WM_USER + 91
Global Const $EM_CANPASTE = $__RICHEDITCONSTANT_WM_USER + 50
Global Const $EM_CANREDO = $__RICHEDITCONSTANT_WM_USER + 85
Global Const $EM_DISPLAYBAND = $__RICHEDITCONSTANT_WM_USER + 51
Global Const $EM_EXGETSEL = $__RICHEDITCONSTANT_WM_USER + 52
Global Const $EM_EXLIMITTEXT = $__RICHEDITCONSTANT_WM_USER + 53
Global Const $EM_EXLINEFROMCHAR = $__RICHEDITCONSTANT_WM_USER + 54
Global Const $EM_EXSETSEL = $__RICHEDITCONSTANT_WM_USER + 55
Global Const $EM_FINDTEXT = $__RICHEDITCONSTANT_WM_USER + 56
Global Const $EM_FINDTEXTEX = $__RICHEDITCONSTANT_WM_USER + 79
Global Const $EM_FINDTEXTEXW = $__RICHEDITCONSTANT_WM_USER + 124
Global Const $EM_FINDTEXTW = $__RICHEDITCONSTANT_WM_USER + 123
Global Const $EM_FINDWORDBREAK = $__RICHEDITCONSTANT_WM_USER + 76
Global Const $EM_FORMATRANGE = $__RICHEDITCONSTANT_WM_USER + 57
Global Const $EM_GETAUTOURLDETECT = $__RICHEDITCONSTANT_WM_USER + 92
Global Const $EM_GETBIDIOPTIONS = $__RICHEDITCONSTANT_WM_USER + 201
Global Const $EM_GETCHARFORMAT = $__RICHEDITCONSTANT_WM_USER + 58
Global Const $EM_GETEDITSTYLE = $__RICHEDITCONSTANT_WM_USER + 205
Global Const $EM_GETEVENTMASK = $__RICHEDITCONSTANT_WM_USER + 59
Global Const $EM_GETIMECOLOR = $__RICHEDITCONSTANT_WM_USER + 105
Global Const $EM_GETIMECOMPMODE = $__RICHEDITCONSTANT_WM_USER + 122
Global Const $EM_GETIMEMODEBIAS = $__RICHEDITCONSTANT_WM_USER + 127
Global Const $EM_GETIMEOPTIONS = $__RICHEDITCONSTANT_WM_USER + 107
Global Const $EM_GETLANGOPTIONS = $__RICHEDITCONSTANT_WM_USER + 121
Global Const $EM_GETOPTIONS = $__RICHEDITCONSTANT_WM_USER + 78
Global Const $EM_GETPARAFORMAT = $__RICHEDITCONSTANT_WM_USER + 61
Global Const $EM_GETPUNCTUATION = $__RICHEDITCONSTANT_WM_USER + 101
Global Const $EM_GETREDONAME = $__RICHEDITCONSTANT_WM_USER + 87
Global Const $EM_GETSCROLLPOS = $__RICHEDITCONSTANT_WM_USER + 221
Global Const $EM_GETSELTEXT = $__RICHEDITCONSTANT_WM_USER + 62
Global Const $EM_GETTEXTEX = $__RICHEDITCONSTANT_WM_USER + 94
Global Const $EM_GETTEXTLENGTHEX = $__RICHEDITCONSTANT_WM_USER + 95
Global Const $EM_GETTEXTMODE = $__RICHEDITCONSTANT_WM_USER + 90
Global Const $EM_GETTEXTRANGE = $__RICHEDITCONSTANT_WM_USER + 75
Global Const $EM_GETTYPOGRAPHYOPTIONS = $__RICHEDITCONSTANT_WM_USER + 203
Global Const $EM_GETUNDONAME = $__RICHEDITCONSTANT_WM_USER + 86
Global Const $EM_GETWORDBREAKPROCEX = $__RICHEDITCONSTANT_WM_USER + 80
Global Const $EM_GETWORDWRAPMODE = $__RICHEDITCONSTANT_WM_USER + 103
Global Const $EM_GETZOOM = $__RICHEDITCONSTANT_WM_USER + 224
Global Const $EM_HIDESELECTION = $__RICHEDITCONSTANT_WM_USER + 63
Global Const $EM_PASTESPECIAL = $__RICHEDITCONSTANT_WM_USER + 64
Global Const $EM_RECONVERSION = $__RICHEDITCONSTANT_WM_USER + 125
Global Const $EM_REDO = $__RICHEDITCONSTANT_WM_USER + 84
Global Const $EM_REQUESTRESIZE = $__RICHEDITCONSTANT_WM_USER + 65
Global Const $EM_SELECTIONTYPE = $__RICHEDITCONSTANT_WM_USER + 66
Global Const $EM_SETBIDIOPTIONS = $__RICHEDITCONSTANT_WM_USER + 200
Global Const $EM_SETBKGNDCOLOR = $__RICHEDITCONSTANT_WM_USER + 67
Global Const $EM_SETCHARFORMAT = $__RICHEDITCONSTANT_WM_USER + 68
Global Const $EM_SETEDITSTYLE = $__RICHEDITCONSTANT_WM_USER + 204
Global Const $EM_SETEVENTMASK = $__RICHEDITCONSTANT_WM_USER + 69
Global Const $EM_SETFONTSIZE = $__RICHEDITCONSTANT_WM_USER + 223
Global Const $EM_SETIMECOLOR = $__RICHEDITCONSTANT_WM_USER + 104
Global Const $EM_SETIMEMODEBIAS = $__RICHEDITCONSTANT_WM_USER + 126
Global Const $EM_SETIMEOPTIONS = $__RICHEDITCONSTANT_WM_USER + 106
Global Const $EM_SETLANGOPTIONS = $__RICHEDITCONSTANT_WM_USER + 120
Global Const $EM_SETOLECALLBACK = $__RICHEDITCONSTANT_WM_USER + 70
Global Const $EM_SETOPTIONS = $__RICHEDITCONSTANT_WM_USER + 77
Global Const $EM_SETPALETTE = $__RICHEDITCONSTANT_WM_USER + 93
Global Const $EM_SETPARAFORMAT = $__RICHEDITCONSTANT_WM_USER + 71
Global Const $EM_SETPUNCTUATION = $__RICHEDITCONSTANT_WM_USER + 100
Global Const $EM_SETSCROLLPOS = $__RICHEDITCONSTANT_WM_USER + 222
Global Const $EM_SETTARGETDEVICE = $__RICHEDITCONSTANT_WM_USER + 72
Global Const $EM_SETTEXTEX = $__RICHEDITCONSTANT_WM_USER + 97
Global Const $EM_SETTEXTMODE = $__RICHEDITCONSTANT_WM_USER + 89
Global Const $EM_SETTYPOGRAPHYOPTIONS = $__RICHEDITCONSTANT_WM_USER + 202
Global Const $EM_SETUNDOLIMIT = $__RICHEDITCONSTANT_WM_USER + 82
Global Const $EM_SETWORDBREAKPROCEX = $__RICHEDITCONSTANT_WM_USER + 81
Global Const $EM_SETWORDWRAPMODE = $__RICHEDITCONSTANT_WM_USER + 102
Global Const $EM_SETZOOM = $__RICHEDITCONSTANT_WM_USER + 225
Global Const $EM_SHOWSCROLLBAR = $__RICHEDITCONSTANT_WM_USER + 96
Global Const $EM_STOPGROUPTYPING = $__RICHEDITCONSTANT_WM_USER + 88
Global Const $EM_STREAMIN = $__RICHEDITCONSTANT_WM_USER + 73
Global Const $EM_STREAMOUT = $__RICHEDITCONSTANT_WM_USER + 74

; Notifications
Global Const $EN_ALIGNLTR = 0X710
Global Const $EN_ALIGNRTL = 0X711
Global Const $EN_CORRECTTEXT = 0X705
Global Const $EN_DRAGDROPDONE = 0X70c
Global Const $EN_DROPFILES = 0X703
Global Const $EN_IMECHANGE = 0X707
Global Const $EN_LINK = 0X70b
Global Const $EN_MSGFILTER = 0X700
Global Const $EN_OBJECTPOSITIONS = 0X70a
Global Const $EN_OLEOPFAILED = 0X709
Global Const $EN_PROTECTED = 0X704
Global Const $EN_REQUESTRESIZE = 0X701
Global Const $EN_SAVECLIPBOARD = 0X708
Global Const $EN_SELCHANGE = 0X702
Global Const $EN_STOPNOUNDO = 0X706

; Event Mask Flags
Global Const $ENM_CHANGE = 0x1
Global Const $ENM_CORRECTTEXT = 0x400000
Global Const $ENM_DRAGDROPDONE = 0x10
Global Const $ENM_DROPFILES = 0x100000
Global Const $ENM_IMECHANGE = 0x800000
Global Const $ENM_KEYEVENTS = 0x10000
Global Const $ENM_LINK = 0x4000000
Global Const $ENM_MOUSEEVENTS = 0x20000
Global Const $ENM_OBJECTPOSITIONS = 0x2000000
Global Const $ENM_PROTECTED = 0x200000
Global Const $ENM_REQUESTRESIZE = 0x40000
Global Const $ENM_SCROLL = 0x4
Global Const $ENM_SCROLLEVENTS = 0x8
Global Const $ENM_SELCHANGE = 0x80000
Global Const $ENM_UPDATE = 0x2

; wMask flags for $tagBIDIOPTIONS
Global Const $BOM_DEFPARADIR = 0x1
Global Const $BOM_PLAINTEXT = 0x2
Global Const $BOM_NEUTRALOVERRIDE = 0x4
Global Const $BOM_CONTEXTREADING = 0x8
Global Const $BOM_CONTEXTALIGNMENT = 0x10
Global Const $BOM_LEGACYBIDICLASS = 0x0040

; wEffects flags for $tagBIDIOPTIONS
Global Const $BOE_RTLDIR = 0x1
Global Const $BOE_PLAINTEXT = 0x2
Global Const $BOE_NEUTRALOVERRIDE = 0x4
Global Const $BOE_CONTEXTREADING = 0x8
Global Const $BOE_CONTEXTALIGNMENT = 0x10
Global Const $BOE_LEGACYBIDICLASS = 0x0040

Global Const $ST_DEFAULT = 0
Global Const $ST_KEEPUNDO = 1
Global Const $ST_SELECTION = 2

Global Const $GT_DEFAULT = 0
Global Const $GT_SELECTION = 2
Global Const $GT_USECRLF = 1

Global Const $GTL_CLOSE = 4
Global Const $GTL_DEFAULT = 0
Global Const $GTL_NUMBYTES = 16
Global Const $GTL_NUMCHARS = 8
Global Const $GTL_PRECISE = 2
Global Const $GTL_USECRLF = 1

Global Const $CFU_UNDERLINENONE = 0
Global Const $CFU_UNDERLINE = 1
Global Const $CFU_UNDERLINEWORD = 2
Global Const $CFU_UNDERLINEDOUBLE = 3
Global Const $CFU_UNDERLINEDOTTED = 4
; code pages
Global Const $CP_ACP = 0 ; use system default
Global Const $CP_UNICODE = 1200

Global Const $CFE_SUBSCRIPT = 0x00010000
Global Const $CFE_SUPERSCRIPT = 0x00020000

Global Const $CFM_ALLCAPS = 0x80
Global Const $CFM_ANIMATION = 0x40000
Global Const $CFM_BACKCOLOR = 0x4000000
Global Const $CFM_BOLD = 0x1
Global Const $CFM_CHARSET = 0x8000000
Global Const $CFM_COLOR = 0x40000000
Global Const $CFM_DISABLED = 0x2000
Global Const $CFM_EMBOSS = 0x800
Global Const $CFM_FACE = 0x20000000
Global Const $CFM_HIDDEN = 0x100
Global Const $CFM_IMPRINT = 0x1000
Global Const $CFM_ITALIC = 0x2
Global Const $CFM_KERNING = 0x100000
Global Const $CFM_LCID = 0x2000000
Global Const $CFM_LINK = 0x20
Global Const $CFM_OFFSET = 0x10000000
Global Const $CFM_OUTLINE = 0x200
Global Const $CFM_PROTECTED = 0x10
Global Const $CFM_REVAUTHOR = 0x8000
Global Const $CFM_REVISED = 0x4000
Global Const $CFM_SHADOW = 0x400
Global Const $CFM_SIZE = 0x80000000
Global Const $CFM_SMALLCAPS = 0x40
Global Const $CFM_SPACING = 0x200000
Global Const $CFM_STRIKEOUT = 0x8
Global Const $CFM_STYLE = 0x80000
Global Const $CFM_SUBSCRIPT = BitOR($CFE_SUBSCRIPT, $CFE_SUPERSCRIPT)
Global Const $CFM_SUPERSCRIPT = $CFM_SUBSCRIPT
Global Const $CFM_UNDERLINE = 0x4
Global Const $CFM_UNDERLINETYPE = 0x800000
Global Const $CFM_WEIGHT = 0x400000

Global Const $CFE_ALLCAPS = $CFM_ALLCAPS
Global Const $CFE_AUTOBACKCOLOR = $CFM_BACKCOLOR
Global Const $CFE_AUTOCOLOR = $CFM_COLOR
Global Const $CFE_BOLD = $CFM_BOLD
Global Const $CFE_DISABLED = $CFM_DISABLED
Global Const $CFE_EMBOSS = $CFM_EMBOSS
Global Const $CFE_HIDDEN = $CFM_HIDDEN
Global Const $CFE_IMPRINT = $CFM_IMPRINT
Global Const $CFE_ITALIC = $CFM_ITALIC
Global Const $CFE_LINK = $CFM_LINK
Global Const $CFE_OUTLINE = $CFM_OUTLINE
Global Const $CFE_PROTECTED = $CFM_PROTECTED
Global Const $CFE_REVISED = $CFM_REVISED
Global Const $CFE_SHADOW = $CFM_SHADOW
Global Const $CFE_SMALLCAPS = $CFM_SMALLCAPS
Global Const $CFE_STRIKEOUT = $CFM_STRIKEOUT
Global Const $CFE_UNDERLINE = $CFM_UNDERLINE

; Global Const $FR_DOWN = 0x1
Global Const $FR_MATCHALEFHAMZA = 0x80000000
; Global Const $FR_MATCHCASE = 0x4
Global Const $FR_MATCHDIAC = 0x20000000
Global Const $FR_MATCHKASHIDA = 0x40000000

; Global Const $FR_MATCHWHOLEWORD = 0x00000002
; Global Const $FR_WHOLEWORD = $FR_MATCHWHOLEWORD
; Global Const $FR_FINDNEXT = 0x00000008
; Global Const $FR_REPLACE = 0x00000010
; Global Const $FR_REPLACEALL = 0x00000020
; Global Const $FR_DIALOGTERM = 0x00000040
; Global Const $FR_SHOWHELP = 0x00000080
; Global Const $FR_ENABLEHOOK = 0x00000100
; Global Const $FR_ENABLETEMPLATE = 0x00000200
; Global Const $FR_DISABLEUPDOWN = 0x00000400
; Global Const $FR_DISABLEMATCHCASE = 0x00000800
; Global Const $FR_DISABLEWHOLEWORD = 0x00001000
; Global Const $FR_ENABLETEMPLATEHANDLE = 0x00002000
; Global Const $FR_HIDEUPDOWN = 0x00004000
; Global Const $FR_HIDEMATCHCASE = 0x00008000
; Global Const $FR_HIDEWHOLEWORD = 0x00010000

Global Const $SCF_DEFAULT = 0x0
Global Const $SCF_SELECTION = 0x1
Global Const $SCF_WORD = 0x2
Global Const $SCF_ALL = 0x4
Global Const $SCF_USEUIRULES = 0x8
Global Const $SCF_ASSOCIATEFONT = 0x10
Global Const $SCF_NOKBUPDATE = 0x20
; Global Enum $UID_UNKNOWN = 0, _
; $UID_TYPING = 1, _
; $UID_DELETE = 2, _
; $UID_DRAGDROP = 3, _
; $UID_CUT = 4, _
; $UID_PASTE = 5

Global Const $LF_FACESIZE = 32
Global Const $MAX_TAB_STOPS = 32

Global Const $PFA_LEFT = 0x1
Global Const $PFA_RIGHT = 0x2
Global Const $PFA_CENTER = 0x3
Global Const $PFA_JUSTIFY = 4
Global Const $PFA_FULL_INTERWORD = 4
Global Const $PFE_TABLE = 0x4000

Global Const $PFM_NUMBERING = 0x20
Global Const $PFM_ALIGNMENT = 0x8
Global Const $PFM_SPACEBEFORE = 0x40
Global Const $PFM_NUMBERINGSTYLE = 0x2000
Global Const $PFM_NUMBERINGSTART = 0x8000
Global Const $PFM_BORDER = 0x800
Global Const $PFM_RIGHTINDENT = 0x2
Global Const $PFM_STARTINDENT = 0x1
Global Const $PFM_OFFSET = 0x4
; Global Const $PFM_OFFSETINDENT = 0x80000000
Global Const $PFM_LINESPACING = 0x100
Global Const $PFM_SPACEAFTER = 0x80
Global Const $PFM_NUMBERINGTAB = 0x4000
Global Const $PFM_TABLE = 0x40000000
Global Const $PFM_TABSTOPS = 0x10
Global Const $PFN_BULLET = 0x1
; Source: http://cvs.sourceforge.jp/cgi-bin/viewcvs.cgi/ablib/ver5lib/Include/api_richedit.sbp?revision=1.2
Global Const $PFM_RTLPARA = 0x10000
Global Const $PFM_KEEP = 0x20000
Global Const $PFM_KEEPNEXT = 0x40000
Global Const $PFM_PAGEBREAKBEFORE = 0x80000
Global Const $PFM_NOLINENUMBER = 0x100000
Global Const $PFM_NOWIDOWCONTROL = 0x200000
Global Const $PFM_DONOTHYPHEN = 0x400000
Global Const $PFM_SIDEBYSIDE = 0x800000

Global Const $PFE_RTLPARA = 0x00000001 ; BitShift($PFM_RTLPARA, 16)
Global Const $PFE_KEEP = 0x00000002 ; BitShift($PFM_KEEP, 16)
Global Const $PFE_KEEPNEXT = 0x00000004 ; BitShift($PFM_KEEPNEXT, 16)
Global Const $PFE_PAGEBREAKBEFORE = 0x00000008 ; BitShift($PFM_PAGEBREAKBEFORE, 16)
Global Const $PFE_NOLINENUMBER = 0x00000010 ; BitShift($PFM_NOLINENUMBER, 16)
Global Const $PFE_NOWIDOWCONTROL = 0x00000020 ; BitShift($PFM_NOWIDOWCONTROL, 16)
Global Const $PFE_DONOTHYPHEN = 0x00000040 ; BitShift($PFM_DONOTHYPHEN, 16)
Global Const $PFE_SIDEBYSIDE = 0x00000080 ; BitShift($PFM_SIDEBYSIDE, 16)
; end of source sourceforge
Global Const $PFM_SHADING = 0x1000
Global Const $WB_CLASSIFY = 3
Global Const $WB_ISDELIMITER = 2
Global Const $WB_LEFT = 0
Global Const $WB_LEFTBREAK = 6
Global Const $WB_MOVEWORDLEFT = 4
Global Const $WB_MOVEWORDNEXT = 5
Global Const $WB_MOVEWORDPREV = 4
Global Const $WB_MOVEWORDRIGHT = 5
Global Const $WB_NEXTBREAK = 7
Global Const $WB_PREVBREAK = 6
Global Const $WB_RIGHT = 1
Global Const $WB_RIGHTBREAK = 7
Global Const $WBF_ISWHITE = 0x10
Global Const $WBF_BREAKLINE = 0x20
Global Const $WBF_BREAKAFTER = 0x40
; For Stream Callbacks :)
Global Const $SF_TEXT = 0x1
Global Const $SF_RTF = 0x2
Global Const $SF_RTFNOOBJS = 0x3
Global Const $SF_TEXTIZED = 0x4
Global Const $SF_UNICODE = 0x0010
Global Const $SF_USECODEPAGE = 0x20
Global Const $SFF_PLAINRTF = 0x4000
Global Const $SFF_SELECTION = 0x8000
; ===============================================================================================================================
