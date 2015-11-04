module X11.XKBlib;

import X11.Xlib;

import core.stdc.config;

    /*
     * XKB request codes, used in:
     *  -  xkbReqType field of all requests
     *  -  requestMinor field of some events
     */
enum	X_kbUseExtension		 = 0;
enum	X_kbSelectEvents	 	 = 1;
enum	X_kbBell			 = 3;
enum	X_kbGetState			 = 4;
enum	X_kbLatchLockState		 = 5;
enum	X_kbGetControls			 = 6;
enum	X_kbSetControls			 = 7;
enum	X_kbGetMap			 = 8;
enum	X_kbSetMap			 = 9;
enum	X_kbGetCompatMap		= 10;
enum	X_kbSetCompatMap		= 11;
enum	X_kbGetIndicatorState		= 12;
enum	X_kbGetIndicatorMap		= 13;
enum	X_kbSetIndicatorMap		= 14;
enum	X_kbGetNamedIndicator		= 15;
enum	X_kbSetNamedIndicator		= 16;
enum	X_kbGetNames			= 17;
enum	X_kbSetNames			= 18;
enum	X_kbGetGeometry			= 19;
enum	X_kbSetGeometry			= 20;
enum	X_kbPerClientFlags		= 21;
enum	X_kbListComponents		= 22;
enum	X_kbGetKbdByName		= 23;
enum	X_kbGetDeviceInfo		= 24;
enum	X_kbSetDeviceInfo		= 25;
enum	X_kbSetDebuggingFlags		= 101;

    /*
     * In the X sense, XKB reports only one event.
     * The type field of all XKB events is XkbEventCode
     */
enum	XkbEventCode			= 0;
enum	XkbNumberEvents			= (XkbEventCode+1);

    /*
     * XKB has a minor event code so it can use one X event code for
     * multiple purposes.
     *  - reported in the xkbType field of all XKB events.
     *  - XkbSelectEventDetails: Indicates the event for which event details
     *    are being changed
     */
enum	XkbNewKeyboardNotify		= 0;
enum XkbMapNotify			= 1;
enum	XkbStateNotify			= 2;
enum XkbControlsNotify		= 3;
enum	XkbIndicatorStateNotify		= 4;
enum	XkbIndicatorMapNotify		= 5;
enum	XkbNamesNotify			= 6;
enum XkbCompatMapNotify		= 7;
enum	XkbBellNotify			= 8;
enum	XkbActionMessage		= 9;
enum	XkbAccessXNotify		= 10;
enum	XkbExtensionDeviceNotify	= 11;

    /*
     * Event Mask:
     *  - XkbSelectEvents:  Specifies event interest.
     */
enum	XkbNewKeyboardNotifyMask	= (1L << 0);
enum XkbMapNotifyMask		= (1L << 1);
enum	XkbStateNotifyMask		= (1L << 2);
enum XkbControlsNotifyMask		= (1L << 3);
enum	XkbIndicatorStateNotifyMask	= (1L << 4);
enum	XkbIndicatorMapNotifyMask	= (1L << 5);
enum	XkbNamesNotifyMask		= (1L << 6);
enum XkbCompatMapNotifyMask		= (1L << 7);
enum	XkbBellNotifyMask		= (1L << 8);
enum	XkbActionMessageMask		= (1L << 9);
enum	XkbAccessXNotifyMask		= (1L << 10);
enum	XkbExtensionDeviceNotifyMask	= (1L << 11);
enum	XkbAllEventsMask		= (0xFFF);

    /*
     * NewKeyboardNotify event details:
     */
enum	XkbNKN_KeycodesMask		= (1L << 0);
enum	XkbNKN_GeometryMask		= (1L << 1);
enum	XkbNKN_DeviceIDMask		= (1L << 2);
enum	XkbAllNewKeyboardEventsMask	= (0x7);

    /*
     * AccessXNotify event types:
     *  - The 'what' field of AccessXNotify events reports the
     *    reason that the event was generated.
     */
enum	XkbAXN_SKPress			= 0;
enum	XkbAXN_SKAccept			= 1;
enum	XkbAXN_SKReject			= 2;
enum	XkbAXN_SKRelease		= 3;
enum	XkbAXN_BKAccept			= 4;
enum	XkbAXN_BKReject			= 5;
enum	XkbAXN_AXKWarning		= 6;

    /*
     * AccessXNotify details:
     * - Used as an event detail mask to limit the conditions under which
     *   AccessXNotify events are reported
     */
enum	XkbAXN_SKPressMask		= (1L << 0);
enum	XkbAXN_SKAcceptMask		= (1L << 1);
enum	XkbAXN_SKRejectMask		= (1L << 2);
enum	XkbAXN_SKReleaseMask		= (1L << 3);
enum	XkbAXN_BKAcceptMask		= (1L << 4);
enum	XkbAXN_BKRejectMask		= (1L << 5);
enum	XkbAXN_AXKWarningMask		= (1L << 6);
enum	XkbAllAccessXEventsMask		= (0x7f);

    /*
     * Miscellaneous event details:
     * - event detail masks for assorted events that don't reall
     *   have any details.
     */
enum	XkbAllStateEventsMask		= XkbAllStateComponentsMask;
enum	XkbAllMapEventsMask		= XkbAllMapComponentsMask;
enum	XkbAllControlEventsMask		= XkbAllControlsMask;
enum	XkbAllIndicatorEventsMask	= XkbAllIndicatorsMask;
enum	XkbAllNameEventsMask		= XkbAllNamesMask;
enum	XkbAllCompatMapEventsMask	= XkbAllCompatMask;
enum	XkbAllBellEventsMask		= (1L << 0);
enum	XkbAllActionMessagesMask	= (1L << 0);

    /*
     * XKB reports one error:  BadKeyboard
     * A further reason for the error is encoded into to most significant
     * byte of the resourceID for the error:
     *    XkbErr_BadDevice - the device in question was not found
     *    XkbErr_BadClass  - the device was found but it doesn't bec_long to
     *                       the appropriate class.
     *    XkbErr_BadId     - the device was found and bec_longs to the right
     *                       class, but not feedback with a matching id was
     *                       found.
     * The low byte of the resourceID for this error contains the device
     * id, class specifier or feedback id that failed.
     */
enum	XkbKeyboard			= 0;
enum	XkbNumberErrors			= 1;

enum	XkbErr_BadDevice	= 0xff;
enum	XkbErr_BadClass		= 0xfe;
enum	XkbErr_BadId		= 0xfd;

    /*
     * Keyboard Components Mask:
     * - Specifies the components that follow a GetKeyboardByNameReply
     */
enum	XkbClientMapMask		= (1L << 0);
enum	XkbServerMapMask		= (1L << 1);
enum	XkbCompatMapMask		= (1L << 2);
enum	XkbIndicatorMapMask		= (1L << 3);
enum	XkbNamesMask			= (1L << 4);
enum	XkbGeometryMask			= (1L << 5);
enum	XkbControlsMask			= (1L << 6);
enum	XkbAllComponentsMask		= (0x7f);

    /*
     * State detail mask:
     *  - The 'changed' field of StateNotify events reports which of
     *    the keyboard state components have changed.
     *  - Used as an event detail mask to limit the conditions under
     *    which StateNotify events are reported.
     */
enum	XkbModifierStateMask		= (1L << 0);
enum	XkbModifierBaseMask		= (1L << 1);
enum	XkbModifierLatchMask		= (1L << 2);
enum	XkbModifierLockMask		= (1L << 3);
enum	XkbGroupStateMask		= (1L << 4);
enum	XkbGroupBaseMask		= (1L << 5);
enum	XkbGroupLatchMask		= (1L << 6);
enum XkbGroupLockMask		= (1L << 7);
enum	XkbCompatStateMask		= (1L << 8);
enum	XkbGrabModsMask			= (1L << 9);
enum	XkbCompatGrabModsMask		= (1L << 10);
enum	XkbLookupModsMask		= (1L << 11);
enum	XkbCompatLookupModsMask		= (1L << 12);
enum	XkbPointerButtonMask		= (1L << 13);
enum	XkbAllStateComponentsMask	= (0x3fff);

    /*
     * Controls detail masks:
     *  The controls specified in XkbAllControlsMask:
     *  - The 'changed' field of ControlsNotify events reports which of
     *    the keyboard controls have changed.
     *  - The 'changeControls' field of the SetControls request specifies
     *    the controls for which values are to be changed.
     *  - Used as an event detail mask to limit the conditions under
     *    which ControlsNotify events are reported.
     *
     *  The controls specified in the XkbAllBooleanCtrlsMask:
     *  - The 'enabledControls' field of ControlsNotify events reports the
     *    current status of the boolean controls.
     *  - The 'enabledControlsChanges' field of ControlsNotify events reports
     *    any boolean controls that have been turned on or off.
     *  - The 'affectEnabledControls' and 'enabledControls' fields of the
     *    kbSetControls request change the set of enabled controls.
     *  - The 'accessXTimeoutMask' and 'accessXTimeoutValues' fields of
     *    an XkbControlsRec specify the controls to be changed if the keyboard
     *    times out and the values to which they should be changed.
     *  - The 'autoCtrls' and 'autoCtrlsValues' fields of the PerClientFlags
     *    request specifies the specify the controls to be reset when the
     *    client exits and the values to which they should be reset.
     *  - The 'ctrls' field of an indicator map specifies the controls
     *    that drive the indicator.
     *  - Specifies the boolean controls affected by the SetControls and
     *    LockControls key actions.
     */
enum	XkbRepeatKeysMask	 = (1L << 0);
enum	XkbSlowKeysMask		 = (1L << 1);
enum	XkbBounceKeysMask	 = (1L << 2);
enum	XkbStickyKeysMask	 = (1L << 3);
enum	XkbMouseKeysMask	 = (1L << 4);
enum	XkbMouseKeysAccelMask	 = (1L << 5);
enum	XkbAccessXKeysMask	 = (1L << 6);
enum	XkbAccessXTimeoutMask	 = (1L << 7);
enum	XkbAccessXFeedbackMask	 = (1L << 8);
enum	XkbAudibleBellMask	 = (1L << 9);
enum	XkbOverlay1Mask		 = (1L << 10);
enum	XkbOverlay2Mask		 = (1L << 11);
enum	XkbIgnoreGroupLockMask	 = (1L << 12);
enum	XkbGroupsWrapMask	 = (1L << 27);
enum	XkbInternalModsMask	 = (1L << 28);
enum	XkbIgnoreLockModsMask	 = (1L << 29);
enum	XkbPerKeyRepeatMask	 = (1L << 30);
enum	XkbControlsEnabledMask	 = (1L << 31);

enum	XkbAccessXOptionsMask    = (XkbStickyKeysMask|XkbAccessXFeedbackMask);

enum	XkbAllBooleanCtrlsMask	 = (0x00001FFF);
enum	XkbAllControlsMask	 = (0xF8001FFF);
//enum	XkbAllControlEventsMask	 = XkbAllControlsMask;

    /*
     * AccessX Options Mask
     *  - The 'accessXOptions' field of an XkbControlsRec specifies the
     *    AccessX options that are currently in effect.
     *  - The 'accessXTimeoutOptionsMask' and 'accessXTimeoutOptionsValues'
     *    fields of an XkbControlsRec specify the Access X options to be
     *    changed if the keyboard times out and the values to which they
     *    should be changed.
     */
enum	XkbAX_SKPressFBMask	= (1L << 0);
enum	XkbAX_SKAcceptFBMask	= (1L << 1);
enum	XkbAX_FeatureFBMask	= (1L << 2);
enum	XkbAX_SlowWarnFBMask	= (1L << 3);
enum	XkbAX_IndicatorFBMask	= (1L << 4);
enum	XkbAX_StickyKeysFBMask	= (1L << 5);
enum	XkbAX_TwoKeysMask	= (1L << 6);
enum	XkbAX_LatchToLockMask	= (1L << 7);
enum	XkbAX_SKReleaseFBMask	= (1L << 8);
enum	XkbAX_SKRejectFBMask	= (1L << 9);
enum	XkbAX_BKRejectFBMask	= (1L << 10);
enum	XkbAX_DumbBellFBMask	= (1L << 11);
enum	XkbAX_FBOptionsMask	= (0xF3F);
enum	XkbAX_SKOptionsMask	= (0x0C0);
enum	XkbAX_AllOptionsMask	= (0xFFF);

    /*
     * XkbUseCoreKbd is used to specify the core keyboard without having
     * 			to look up its X input extension identifier.
     * XkbUseCorePtr is used to specify the core pointer without having
     *			to look up its X input extension identifier.
     * XkbDfltXIClass is used to specify "don't care" any place that the
     *			XKB protocol is looking for an X Input Extension
     *			device class.
     * XkbDfltXIId is used to specify "don't care" any place that the
     *			XKB protocol is looking for an X Input Extension
     *			feedback identifier.
     * XkbAllXIClasses is used to get information about all device indicators,
     *			whether they're part of the indicator feedback class
     *			or the keyboard feedback class.
     * XkbAllXIIds is used to get information about all device indicator
     *			feedbacks without having to list them.
     * XkbXINone is used to indicate that no class or id has been specified.
     * XkbLegalXILedClass(c)  True if 'c' specifies a legal class with LEDs
     * XkbLegalXIBellClass(c) True if 'c' specifies a legal class with bells
     * XkbExplicitXIDevice(d) True if 'd' explicitly specifies a device
     * XkbExplicitXIClass(c)  True if 'c' explicitly specifies a device class
     * XkbExplicitXIId(c)     True if 'i' explicitly specifies a device id
     * XkbSingleXIClass(c)    True if 'c' specifies exactly one device class,
     *                        including the default.
     * XkbSingleXIId(i)       True if 'i' specifies exactly one device
     *	                      identifier, including the default.
     */
enum	XkbUseCoreKbd		= 0x0100;
enum	XkbUseCorePtr		= 0x0200;
enum	XkbDfltXIClass		= 0x0300;
enum	XkbDfltXIId		= 0x0400;
enum	XkbAllXIClasses		= 0x0500;
enum	XkbAllXIIds		= 0x0600;
enum	XkbXINone		= 0xff00;


auto XkbLegalXILedClassc(C)(C c) {
    return (c==KbdFeedbackClass)||
					(c==LedFeedbackClass)||
					(c==XkbDfltXIClass)||
					(c==XkbAllXIClasses);
}

auto XkbLegalXIBellClassc(C)(C c) {
    return (c==KbdFeedbackClass)||
					(c==BellFeedbackClass)||
					(c==XkbDfltXIClass)||
					(c==XkbAllXIClasses);
}

auto XkbExplicitXIDevicec(C)(C c) {
    return (c & (~0xff)) == 0;
}

auto XkbExplicitXIDevicec(C)(C c) {
    return ((c&(~0xff))==0);
}

auto XkbExplicitXIClassc(C)(C c) {
    return ((c&(~0xff))==0);
}

auto XkbExplicitXIIdc(C)(C c) {
    return ((c&(~0xff))==0);
}

auto XkbSingleXIClassc(C)(C c) {
    return (((c&(~0xff))==0)||(c==XkbDfltXIClass));
}

auto XkbSingleXIIdc(C)(C c) {
    return (((c&(~0xff))==0)||(c==XkbDfltXIId));
}

enum	XkbNoModifier		= 0xff;
enum	XkbNoShiftLevel		= 0xff;
enum	XkbNoShape		= 0xff;
enum	XkbNoIndicator		= 0xff;

enum	XkbNoModifierMask	= 0;
enum	XkbAllModifiersMask	= 0xff;
enum	XkbAllVirtualModsMask	= 0xffff;

enum	XkbNumKbdGroups		= 4;
enum	XkbMaxKbdGroup		= (XkbNumKbdGroups-1);

enum	XkbMaxMouseKeysBtn	= 4;

    /*
     * Group Index and Mask:
     *  - Indices into the kt_index array of a key type.
     *  - Mask specifies types to be changed for XkbChangeTypesOfKey
     */
enum	XkbGroup1Index		= 0;
enum	XkbGroup2Index		= 1;
enum	XkbGroup3Index		= 2;
enum	XkbGroup4Index		= 3;
enum	XkbAnyGroup		= 254;
enum	XkbAllGroups		= 255;

enum	XkbGroup1Mask		= (1<<0);
enum	XkbGroup2Mask		= (1<<1);
enum	XkbGroup3Mask		= (1<<2);
enum	XkbGroup4Mask		= (1<<3);
enum	XkbAnyGroupMask		= (1<<7);
enum	XkbAllGroupsMask	= (0xf);

    /*
     * BuildCoreState: Given a keyboard group and a modifier state,
     *                 construct the value to be reported an event.
     * GroupForCoreState:  Given the state reported in an event,
     *                 determine the keyboard group.
     * IsLegalGroup:   Returns TRUE if 'g' is a valid group index.
     */
auto XkbBuildCoreState(M, G)(M m, G g) {
    return (((g&0x3)<<13)|(m&0xff));
}
auto XkbGroupForCoreState(S)(S s) {
    return ((s>>13)&0x3);
}
auto XkbIsLegalGroupg(G)(G g) {
    return ((g>=0)&&(g<XkbNumKbdGroups));
}

    /*
     * GroupsWrap values:
     *  - The 'groupsWrap' field of an XkbControlsRec specifies the
     *    treatment of out of range groups.
     *  - Bits 6 and 7 of the group info field of a key symbol map
     *    specify the interpretation of out of range groups for the
     *    corresponding key.
     */
enum	XkbWrapIntoRange	= (0x00);
enum	XkbClampIntoRange	= (0x40);
enum	XkbRedirectIntoRange	= (0x80);

    /*
     * Action flags:  Reported in the 'flags' field of most key actions.
     * Interpretation depends on the type of the action; not all actions
     * accept all flags.
     *
     * Option			Used for Actions
     * ------			----------------
     * ClearLocks		SetMods, LatchMods, SetGroup, LatchGroup
     * LatchToLock		SetMods, LatchMods, SetGroup, LatchGroup
     * LockNoLock		LockMods, ISOLock, LockPtrBtn, LockDeviceBtn
     * LockNoUnlock		LockMods, ISOLock, LockPtrBtn, LockDeviceBtn
     * UseModMapMods		SetMods, LatchMods, LockMods, ISOLock
     * GroupAbsolute		SetGroup, LatchGroup, LockGroup, ISOLock
     * UseDfltButton		PtrBtn, LockPtrBtn
     * NoAcceleration		MovePtr
     * MoveAbsoluteX		MovePtr
     * MoveAbsoluteY		MovePtr
     * ISODfltIsGroup		ISOLock
     * ISONoAffectMods		ISOLock
     * ISONoAffectGroup		ISOLock
     * ISONoAffectPtr		ISOLock
     * ISONoAffectCtrls		ISOLock
     * MessageOnPress		ActionMessage
     * MessageOnRelease		ActionMessage
     * MessageGenKeyEvent	ActionMessage
     * AffectDfltBtn		SetPtrDflt
     * DfltBtnAbsolute		SetPtrDflt
     * SwitchApplication	SwitchScreen
     * SwitchAbsolute		SwitchScreen
     */

enum	XkbSA_ClearLocks	= (1L << 0);
enum	XkbSA_LatchToLock	= (1L << 1);

enum	XkbSA_LockNoLock	= (1L << 0);
enum	XkbSA_LockNoUnlock	= (1L << 1);

enum	XkbSA_UseModMapMods	= (1L << 2);

enum	XkbSA_GroupAbsolute	= (1L << 2);
enum	XkbSA_UseDfltButton	= 0;

enum	XkbSA_NoAcceleration	= (1L << 0);
enum	XkbSA_MoveAbsoluteX	= (1L << 1);
enum	XkbSA_MoveAbsoluteY	= (1L << 2);

enum	XkbSA_ISODfltIsGroup 	 = (1L << 7);
enum	XkbSA_ISONoAffectMods	 = (1L << 6);
enum	XkbSA_ISONoAffectGroup	 = (1L << 5);
enum	XkbSA_ISONoAffectPtr	 = (1L << 4);
enum	XkbSA_ISONoAffectCtrls	 = (1L << 3);
enum	XkbSA_ISOAffectMask	 = (0x78);

enum	XkbSA_MessageOnPress	 = (1L << 0);
enum	XkbSA_MessageOnRelease	 = (1L << 1);
enum	XkbSA_MessageGenKeyEvent = (1L << 2);

enum	XkbSA_AffectDfltBtn	= 1;
enum	XkbSA_DfltBtnAbsolute	= (1L << 2);

enum	XkbSA_SwitchApplication	= (1L << 0);
enum	XkbSA_SwitchAbsolute	= (1L << 2);

    /*
     * The following values apply to the SA_DeviceValuator
     * action only.  Valuator operations specify the action
     * to be taken.   Values specified in the action are
     * multiplied by 2^scale before they are applied.
     */
enum	XkbSA_IgnoreVal		= (0x00);
enum	XkbSA_SetValMin		= (0x10);
enum	XkbSA_SetValCenter	= (0x20);
enum	XkbSA_SetValMax		= (0x30);
enum	XkbSA_SetValRelative	= (0x40);
enum	XkbSA_SetValAbsolute	= (0x50);
enum	XkbSA_ValOpMask		= (0x70);
enum	XkbSA_ValScaleMask	= (0x07);

auto XkbSA_ValOp(A)(A a) {
    return ((a)&XkbSA_ValOpMask);
}
auto XkbSA_ValScale(A)(A a) {
    return ((a)&XkbSA_ValScaleMask);
}

    /*
     * Action types: specifies the type of a key action.  Reported in the
     * type field of all key actions.
     */
enum	XkbSA_NoAction		= 0x00;
enum	XkbSA_SetMods		= 0x01;
enum	XkbSA_LatchMods		= 0x02;
enum	XkbSA_LockMods		= 0x03;
enum	XkbSA_SetGroup		= 0x04;
enum	XkbSA_LatchGroup	= 0x05;
enum	XkbSA_LockGroup		= 0x06;
enum	XkbSA_MovePtr		= 0x07;
enum	XkbSA_PtrBtn		= 0x08;
enum	XkbSA_LockPtrBtn	= 0x09;
enum	XkbSA_SetPtrDflt	= 0x0a;
enum	XkbSA_ISOLock		= 0x0b;
enum	XkbSA_Terminate		= 0x0c;
enum	XkbSA_SwitchScreen	= 0x0d;
enum	XkbSA_SetControls	= 0x0e;
enum	XkbSA_LockControls	= 0x0f;
enum	XkbSA_ActionMessage	= 0x10;
enum	XkbSA_RedirectKey	= 0x11;
enum	XkbSA_DeviceBtn		= 0x12;
enum	XkbSA_LockDeviceBtn	= 0x13;
enum	XkbSA_DeviceValuator	= 0x14;
enum	XkbSA_LastAction	= XkbSA_DeviceValuator;
enum	XkbSA_NumActions	= (XkbSA_LastAction+1);

enum	XkbSA_XFree86Private	= 0x86;

    /*
     * Specifies the key actions that clear latched groups or modifiers.
     */
enum XkbSA_BreakLatch =
	((1<<XkbSA_NoAction)|(1<<XkbSA_PtrBtn)|(1<<XkbSA_LockPtrBtn)|
	(1<<XkbSA_Terminate)|(1<<XkbSA_SwitchScreen)|(1<<XkbSA_SetControls)|
	(1<<XkbSA_LockControls)|(1<<XkbSA_ActionMessage)|
	(1<<XkbSA_RedirectKey)|(1<<XkbSA_DeviceBtn)|(1<<XkbSA_LockDeviceBtn));

    /*
     * Macros to classify key actions
     */
enum XkbIsModAction(A)(A a) {
    return (((a).type>=Xkb_SASetMods)&&((a).type<=XkbSA_LockMods));
}
enum XkbIsGroupAction(A)(A a) {
    return (((a).type>=XkbSA_SetGroup)&&((a).type<=XkbSA_LockGroup));
}
enum XkbIsPtrAction(A)(A a) {
    return (((a).type>=XkbSA_MovePtr)&&((a).type<=XkbSA_SetPtrDflt));
}


    /*
     * Key Behavior Qualifier:
     *    KB_Permanent indicates that the behavior describes an unalterable
     *    characteristic of the keyboard, not an XKB software-simulation of
     *    the listed behavior.
     * Key Behavior Types:
     *    Specifies the behavior of the underlying key.
     */
enum	XkbKB_Permanent		= 0x80;
enum	XkbKB_OpMask		= 0x7f;

enum	XkbKB_Default		= 0x00;
enum	XkbKB_Lock		= 0x01;
enum	XkbKB_RadioGroup	= 0x02;
enum	XkbKB_Overlay1		= 0x03;
enum	XkbKB_Overlay2		= 0x04;

enum	XkbKB_RGAllowNone	= 0x80;

    /*
     * Various macros which describe the range of legal keycodes.
     */
enum	XkbMinLegalKeyCode	= 8;
enum	XkbMaxLegalKeyCode	= 255;
enum	XkbMaxKeyCount		= (XkbMaxLegalKeyCode-XkbMinLegalKeyCode+1);
enum	XkbPerKeyBitArraySize	= ((XkbMaxLegalKeyCode+1)/8);
/* Seems kinda silly to check that an ubyte is <= 255... */
enum XkbIsLegalKeycode(A)(A k) {
    return ((k)>=XkbMinLegalKeyCode);
}

    /*
     * Assorted constants and limits.
     */
enum	XkbNumModifiers		= 8;
enum	XkbNumVirtualMods	= 16;
enum	XkbNumIndicators	= 32;
enum	XkbAllIndicatorsMask	= (0xffffffff);
enum	XkbMaxRadioGroups	= 32;
enum	XkbAllRadioGroupsMask	= (0xffffffff);
enum	XkbMaxShiftLevel	= 63;
enum	XkbMaxSymsPerKey	= (XkbMaxShiftLevel*XkbNumKbdGroups);
enum	XkbRGMaxMembers		= 12;
enum	XkbActionMessageLength	= 6;
enum	XkbKeyNameLength	= 4;
enum	XkbMaxRedirectCount	= 8;

enum	XkbGeomPtsPerMM		= 10;
enum	XkbGeomMaxColors	= 32;
enum	XkbGeomMaxLabelColors	= 3;
enum	XkbGeomMaxPriority	= 255;

    /*
     * Key Type index and mask for the four standard key types.
     */
enum	XkbOneLevelIndex	= 0;
enum	XkbTwoLevelIndex	= 1;
enum	XkbAlphabeticIndex	= 2;
enum	XkbKeypadIndex		= 3;
enum	XkbLastRequiredType	= XkbKeypadIndex;
enum	XkbNumRequiredTypes	= (XkbLastRequiredType+1);
enum	XkbMaxKeyTypes		= 255;

enum	XkbOneLevelMask		= (1<<0);
enum	XkbTwoLevelMask		= (1<<1);
enum	XkbAlphabeticMask	= (1<<2);
enum	XkbKeypadMask		= (1<<3);
enum	XkbAllRequiredTypes	= (0xf);

enum XkbShiftLevel(A)(A n) {
    return ((n)-1);
}
enum XkbShiftLevelMask(A)(A n) {
    return (1<<((n)-1));
}

    /*
     * Extension name and version information
     */
enum	XkbName = "XKEYBOARD";
enum	XkbMajorVersion	= 1;
enum	XkbMinorVersion	= 0;

    /*
     * Explicit map components:
     *  - Used in the 'explicit' field of an XkbServerMap.  Specifies
     *    the keyboard components that should _not_ be updated automatically
     *    in response to core protocol keyboard mapping requests.
     */
enum	XkbExplicitKeyTypesMask	  = (0x0f);
enum	XkbExplicitKeyType1Mask	  = (1<<0);
enum	XkbExplicitKeyType2Mask	  = (1<<1);
enum	XkbExplicitKeyType3Mask	  = (1<<2);
enum	XkbExplicitKeyType4Mask	  = (1<<3);
enum	XkbExplicitInterpretMask  = (1<<4);
enum	XkbExplicitAutoRepeatMask = (1<<5);
enum	XkbExplicitBehaviorMask	  = (1<<6);
enum	XkbExplicitVModMapMask	  = (1<<7);
enum	XkbAllExplicitMask	  = (0xff);

    /*
     * Map components masks:
     * Those in AllMapComponentsMask:
     *  - Specifies the individual fields to be loaded or changed for the
     *    GetMap and SetMap requests.
     * Those in ClientInfoMask:
     *  - Specifies the components to be allocated by XkbAllocClientMap.
     * Those in ServerInfoMask:
     *  - Specifies the components to be allocated by XkbAllocServerMap.
     */
enum	XkbKeyTypesMask		= (1<<0);
enum	XkbKeySymsMask		= (1<<1);
enum	XkbModifierMapMask	= (1<<2);
enum	XkbExplicitComponentsMask = (1<<3);
enum XkbKeyActionsMask	= (1<<4);
enum	XkbKeyBehaviorsMask	= (1<<5);
enum	XkbVirtualModsMask	= (1<<6);
enum	XkbVirtualModMapMask	= (1<<7);

enum	XkbAllClientInfoMask	= (XkbKeyTypesMask|XkbKeySymsMask|XkbModifierMapMask);
enum	XkbAllServerInfoMask	= (XkbExplicitComponentsMask|XkbKeyActionsMask|XkbKeyBehaviorsMask|XkbVirtualModsMask|XkbVirtualModMapMask);
enum	XkbAllMapComponentsMask	= (XkbAllClientInfoMask|XkbAllServerInfoMask);

    /*
     * Symbol interpretations flags:
     *  - Used in the flags field of a symbol interpretation
     */
enum	XkbSI_AutoRepeat	= (1<<0);
enum	XkbSI_LockingKey	= (1<<1);

    /*
     * Symbol interpretations match specification:
     *  - Used in the match field of a symbol interpretation to specify
     *    the conditions under which an interpretation is used.
     */
enum	XkbSI_LevelOneOnly	= (0x80);
enum	XkbSI_OpMask		= (0x7f);
enum	XkbSI_NoneOf		= (0);
enum	XkbSI_AnyOfOrNone	= (1);
enum	XkbSI_AnyOf		= (2);
enum	XkbSI_AllOf		= (3);
enum	XkbSI_Exactly		= (4);

    /*
     * Indicator map flags:
     *  - Used in the flags field of an indicator map to indicate the
     *    conditions under which and indicator can be changed and the
     *    effects of changing the indicator.
     */
enum	XkbIM_NoExplicit	= (1L << 7);
enum	XkbIM_NoAutomatic	= (1L << 6);
enum	XkbIM_LEDDrivesKB	= (1L << 5);

    /*
     * Indicator map component specifications:
     *  - Used by the 'which_groups' and 'which_mods' fields of an indicator
     *    map to specify which keyboard components should be used to drive
     *    the indicator.
     */
enum	XkbIM_UseBase		= (1L << 0);
enum	XkbIM_UseLatched	= (1L << 1);
enum	XkbIM_UseLocked		= (1L << 2);
enum	XkbIM_UseEffective	= (1L << 3);
enum	XkbIM_UseCompat		= (1L << 4);

enum	XkbIM_UseNone	  = 0;
enum	XkbIM_UseAnyGroup = (XkbIM_UseBase|XkbIM_UseLatched|XkbIM_UseLocked
                           |XkbIM_UseEffective);
enum	XkbIM_UseAnyMods  = (XkbIM_UseAnyGroup|XkbIM_UseCompat);

    /*
     * Compatibility Map Compontents:
     *  - Specifies the components to be allocated in XkbAllocCompatMap.
     */
enum	XkbSymInterpMask	= (1<<0);
enum	XkbGroupCompatMask	= (1<<1);
enum	XkbAllCompatMask	= (0x3);

    /*
     * Names component mask:
     *  - Specifies the names to be loaded or changed for the GetNames and
     *    SetNames requests.
     *  - Specifies the names that have changed in a NamesNotify event.
     *  - Specifies the names components to be allocated by XkbAllocNames.
     */
enum	XkbKeycodesNameMask	= (1<<0);
enum	XkbGeometryNameMask	= (1<<1);
enum	XkbSymbolsNameMask	= (1<<2);
enum	XkbPhysSymbolsNameMask	= (1<<3);
enum	XkbTypesNameMask	= (1<<4);
enum	XkbCompatNameMask 	= (1<<5);
enum	XkbKeyTypeNamesMask	= (1<<6);
enum	XkbKTLevelNamesMask	= (1<<7);
enum	XkbIndicatorNamesMask	= (1<<8);
enum	XkbKeyNamesMask		= (1<<9);
enum	XkbKeyAliasesMask	= (1<<10);
enum	XkbVirtualModNamesMask	= (1<<11);
enum	XkbGroupNamesMask	= (1<<12);
enum	XkbRGNamesMask		= (1<<13);
enum	XkbComponentNamesMask	= (0x3f);
enum	XkbAllNamesMask		= (0x3fff);

    /*
     * GetByName components:
     *  - Specifies desired or necessary components to GetKbdByName request.
     *  - Reports the components that were found in a GetKbdByNameReply
     */
enum	XkbGBN_TypesMask		= (1L << 0);
enum	XkbGBN_CompatMapMask		= (1L << 1);
enum	XkbGBN_ClientSymbolsMask	= (1L << 2);
enum	XkbGBN_ServerSymbolsMask	= (1L << 3);
enum	XkbGBN_SymbolsMask = (XkbGBN_ClientSymbolsMask|XkbGBN_ServerSymbolsMask);
enum	XkbGBN_IndicatorMapMask		= (1L << 4);
enum	XkbGBN_KeyNamesMask		= (1L << 5);
enum	XkbGBN_GeometryMask		= (1L << 6);
enum	XkbGBN_OtherNamesMask		= (1L << 7);
enum	XkbGBN_AllComponentsMask	= (0xff);

     /*
      * ListComponents flags
      */
enum	XkbLC_Hidden			= (1L <<  0);
enum	XkbLC_Default			= (1L <<  1);
enum	XkbLC_Partial			= (1L <<  2);

enum	XkbLC_AlphanumericKeys		= (1L <<  8);
enum	XkbLC_ModifierKeys		= (1L <<  9);
enum	XkbLC_KeypadKeys		= (1L << 10);
enum	XkbLC_FunctionKeys		= (1L << 11);
enum	XkbLC_AlternateGroup		= (1L << 12);

    /*
     * X Input Extension Interactions
     * - Specifies the possible interactions between XKB and the X input
     *   extension
     * - Used to request (XkbGetDeviceInfo) or change (XKbSetDeviceInfo)
     *   XKB information about an extension device.
     * - Reports the list of supported optional features in the reply to
     *   XkbGetDeviceInfo or in an XkbExtensionDeviceNotify event.
     * XkbXI_UnsupportedFeature is reported in XkbExtensionDeviceNotify
     * events to indicate an attempt to use an unsupported feature.
     */
enum	XkbXI_KeyboardsMask		= (1L << 0);
enum	XkbXI_ButtonActionsMask		= (1L << 1);
enum	XkbXI_IndicatorNamesMask	= (1L << 2);
enum	XkbXI_IndicatorMapsMask		= (1L << 3);
enum	XkbXI_IndicatorStateMask	= (1L << 4);
enum	XkbXI_UnsupportedFeatureMask	= (1L << 15);
enum	XkbXI_AllFeaturesMask		= (0x001f);
enum	XkbXI_AllDeviceFeaturesMask	= (0x001e);

enum	XkbXI_IndicatorsMask		= (0x001c);
enum	XkbAllExtensionDeviceEventsMask = (0x801f);

    /*
     * Per-Client Flags:
     *  - Specifies flags to be changed by the PerClientFlags request.
     */
enum	XkbPCF_DetectableAutoRepeatMask	= (1L << 0);
enum	XkbPCF_GrabsUseXKBStateMask	= (1L << 1);
enum	XkbPCF_AutoResetControlsMask	= (1L << 2);
enum	XkbPCF_LookupStateWhenGrabbed	= (1L << 3);
enum	XkbPCF_SendEventUsesXKBState	= (1L << 4);
enum	XkbPCF_AllFlagsMask		= (0x1F);

    /*
     * Debugging flags and controls
     */
enum	XkbDF_DisableLocks	= (1<<0);

extern(C) {


    struct XkbDescRec;
    struct XkbMapChangesRec;
    struct XkbIndicatorMapRec;
    struct XkbKeyTypeRec;
    struct XkbSymInterpretRec;
    struct XkbChangesRec;
    struct XkbStateRec;
    struct XkbComponentListRec;
    struct XkbComponentNamesRec;
    struct XkbDeviceLedInfoRec;
    struct XkbDeviceInfoRec;
    struct XkbNameChangesRec;
    struct XkbControlsChangesRec;
    struct XkbDeviceChangesRec;
    struct XkbAction;

    alias XkbDescPtr = XkbDescRec*;
    alias XkbMapChangesPtr = XkbMapChangesRec*;
    alias XkbIndicatorMapPtr = XkbIndicatorMapRec*;
    alias XkbKeyTypePtr = XkbKeyTypeRec*;
    alias XkbSymInterpretPtr = XkbSymInterpretRec*;
    alias XkbChangesPtr = XkbChangesRec*;
    alias XkbStatePtr = XkbStateRec*;
    alias XkbComponentListPtr = XkbComponentListRec*;
    alias XkbComponentNamesPtr = XkbComponentNamesRec*;
    alias XkbDeviceLedInfoPtr = XkbDeviceLedInfoRec*;
    alias XkbDeviceInfoPtr = XkbDeviceInfoRec*;
    alias XkbNameChangesPtr = XkbNameChangesRec*;
    alias XkbControlsChangesPtr = XkbControlsChangesRec*;
    alias XkbDeviceChangesPtr = XkbDeviceChangesRec*;


    struct XkbAnyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* # of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XKB event minor code */
        uint 	device;		/* device ID */
    }

    struct XkbNewKeyboardNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbNewKeyboardNotify */
        int	 	device;		/* device ID */
        int	 	old_device;	/* device ID of previous keyboard */
        int	 	min_key_code;	/* minimum key code */
        int		max_key_code;	/* maximum key code */
        int	 	old_min_key_code;/* min key code of previous kbd */
        int		old_max_key_code;/* max key code of previous kbd */
        uint	changed;	/* changed aspects of the keyboard */
        char	 	req_major;	/* major and minor opcode of req */
        char	 	req_minor;	/* that caused change, if applicable */
    }

    struct XkbMapNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbMapNotify */
        int 		device;		/* device ID */
        uint 	changed;	/* fields which have been changed */
        uint 	flags;		/* reserved */
        int 		first_type;	/* first changed key type */
        int 		num_types;	/* number of changed key types */
        KeyCode		min_key_code;
        KeyCode		max_key_code;
        KeyCode		first_key_sym;
        KeyCode		first_key_act;
        KeyCode		first_key_behavior;
        KeyCode		first_key_explicit;
        KeyCode		first_modmap_key;
        KeyCode		first_vmodmap_key;
        int		num_key_syms;
        int		num_key_acts;
        int		num_key_behaviors;
        int		num_key_explicit;
        int 		num_modmap_keys;
        int 		num_vmodmap_keys;
        uint 	vmods;		/* mask of changed virtual mods */
    }

    struct XkbStateNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* # of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbStateNotify */
        int 		device;		/* device ID */
        uint 	changed;	/* mask of changed state components */
        int 		group;		/* keyboard group */
        int 		base_group;	/* base keyboard group */
        int 		latched_group;	/* latched keyboard group */
        int 		locked_group;	/* locked keyboard group */
        uint	mods;		/* modifier state */
        uint 	base_mods;	/* base modifier state */
        uint	latched_mods;	/* latched modifiers */
        uint	locked_mods;	/* locked modifiers */
        int 		compat_state;	/* compatibility state */
        ubyte	grab_mods;	/* mods used for grabs */
        ubyte	compat_grab_mods;/* grab mods for non-XKB clients */
        ubyte	lookup_mods;	/* mods sent to clients */
        ubyte	compat_lookup_mods; /* mods sent to non-XKB clients */
        int 		ptr_buttons;	/* pointer button state */
        KeyCode		keycode;	/* keycode that caused the change */
        char 		event_type;	/* KeyPress or KeyRelease */
        char 		req_major;	/* Major opcode of request */
        char 		req_minor;	/* Minor opcode of request */
    }

    struct XkbControlsNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbControlsNotify */
        int 		device;		/* device ID */
        uint	changed_ctrls;	/* controls with changed sub-values */
        uint 	enabled_ctrls;	/* controls currently enabled */
        uint	enabled_ctrl_changes;/* controls just {en,dis}abled */
        int 		num_groups;	/* total groups on keyboard */
        KeyCode		keycode;	/* key that caused change or 0 */
        char 		event_type;	/* type of event that caused change */
        char 		req_major;	/* if keycode==0, major and minor */
        char 		req_minor;	/* opcode of req that caused change */
    }

    struct XkbIndicatorNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbIndicatorNotify */
        int 		device;		/* device ID */
        uint	changed;	/* indicators with new state or map */
        uint	state;	 	/* current state of all indicators */
    }

    struct XkbNamesNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbNamesNotify */
        int	 	device;		/* device ID */
        uint 	changed;	/* names that have changed */
        int	 	first_type;	/* first key type with new name */
        int	 	num_types;	/* number of key types with new names */
        int	 	first_lvl;	/* first key type new new level names */
        int	 	num_lvls;	/* # of key types w/new level names */
        int	 	num_aliases;	/* total number of key aliases*/
        int	 	num_radio_groups;/* total number of radio groups */
        uint 	changed_vmods;	/* virtual modifiers with new names */
        uint 	changed_groups;	/* groups with new names */
        uint 	changed_indicators;/* indicators with new names */
        int		first_key;	/* first key with new name */
        int		num_keys;	/* number of keys with new names */
    }

    struct XkbCompatMapNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbCompatMapNotify */
        int	 	device;		/* device ID */
        uint 	changed_groups; /* groups with new compat maps */
        int	 	first_si;	/* first new symbol interp */
        int	 	num_si;		/* number of new symbol interps */
        int	 	num_total_si;	/* total # of symbol interps */
    }

    struct XkbBellNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbBellNotify */
        int	 	device;		/* device ID */
        int	 	percent;	/* requested volume as a % of maximum */
        int	 	pitch;		/* requested pitch in Hz */
        int	 	duration;	/* requested duration in useconds */
        int	 	bell_class;	/* (input extension) feedback class */
        int	 	bell_id;	/* (input extension) ID of feedback */
        Atom 		name;		/* "name" of requested bell */
        Window 		window;		/* window associated with event */
        Bool		event_only;	/* "event only" requested */
    }

    struct XkbActionMessageEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbActionMessage */
        int	 	device;		/* device ID */
        KeyCode		keycode;	/* key that generated the event */
        Bool 		press;		/* true if act caused by key press */
        Bool 		key_event_follows;/* true if key event also generated */
        int		group;		/* effective group */
        uint	mods;		/* effective mods */
        char[XkbActionMessageLength+1] message;
                        /* message -- leave space for NUL */
    }

    struct XkbAccessXNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbAccessXNotify */
        int	 	device;		/* device ID */
        int	 	detail;		/* XkbAXN_* */
        int	 	keycode;	/* key of event */
        int	 	sk_delay;	/* current slow keys delay */
        int		debounce_delay;	/* current debounce delay */
    }

    struct XkbExtensionDeviceNotifyEvent {
        int 		type;		/* XkbAnyEvent */
        c_ulong 	serial;		/* of last req processed by server */
        Bool 		send_event;	/* is this from a SendEvent request? */
        Display *	display;	/* Display the event was read from */
        Time 		time;		/* milliseconds */
        int 		xkb_type;	/* XkbExtensionDeviceNotify */
        int	 	device;		/* device ID */
        uint	reason;		/* reason for the event */
        uint	supported;	/* mask of supported features */
        uint	unsupported;	/* mask of unsupported features */
                        /* that some app tried to use */
        int	 	first_btn;	/* first button that changed */
        int	 	num_btns;	/* range of buttons changed */
        uint	leds_defined;   /* indicators with names or maps */
        uint	led_state;	/* current state of the indicators */
        int		led_class;	/* feedback class for led changes */
        int		led_id;   	/* feedback id for led changes */
    }

    union XkbEvent {
        int				type;
        XkbAnyEvent			any;
        XkbNewKeyboardNotifyEvent	new_kbd;
        XkbMapNotifyEvent		map;
        XkbStateNotifyEvent		state;
        XkbControlsNotifyEvent		ctrls;
        XkbIndicatorNotifyEvent 	indicators;
        XkbNamesNotifyEvent		names;
        XkbCompatMapNotifyEvent		compat;
        XkbBellNotifyEvent		bell;
        XkbActionMessageEvent		message;
        XkbAccessXNotifyEvent		accessx;
        XkbExtensionDeviceNotifyEvent 	device;
        XEvent				core;
    }

    struct	_XkbKbdDpyState;

    alias XkbKbdDpyStateRec = _XkbKbdDpyState;
    alias XkbKbdDpyStatePtr = _XkbKbdDpyState*;

        /* XkbOpenDisplay error codes */
    enum	XkbOD_Success =		0;
    enum	XkbOD_BadLibraryVersion =	1;
    enum	XkbOD_ConnectionRefused =	2;
    enum	XkbOD_NonXkbServer =	3;
    enum	XkbOD_BadServerVersion =	4;

        /*; Values for XlibFlags */
    enum	XkbLC_ForceLatin1Lookup =		(1<<0);
    enum	XkbLC_ConsumeLookupMods =		(1<<1);
    enum	XkbLC_AlwaysConsumeShiftAndLock = (1<<2);
    enum	XkbLC_IgnoreNewKeyboards =	(1<<3);
    enum	XkbLC_ControlFallback =		(1<<4);
    enum	XkbLC_ConsumeKeysOnComposeFail =	(1<<29);
    enum	XkbLC_ComposeLED =		(1<<30);
    enum	XkbLC_BeepOnComposeFail =		(1<<31);

    enum	XkbLC_AllComposeControls =	(0xc0000000);
    enum	XkbLC_AllControls =		(0xc000001f);

    Bool	XkbIgnoreExtension(
        Bool			/* ignore */
    );

    Display *XkbOpenDisplay(
        char *			/* name */,
        int *			/* ev_rtrn */,
        int *			/* err_rtrn */,
        int *			/* major_rtrn */,
        int *			/* minor_rtrn */,
        int *			/* reason */
    );

    Bool	XkbQueryExtension(
        Display *		/* dpy */,
        int *			/* opcodeReturn */,
        int *			/* eventBaseReturn */,
        int *			/* errorBaseReturn */,
        int *			/* majorRtrn */,
        int *			/* minorRtrn */
    );

    Bool	XkbUseExtension(
        Display *		/* dpy */,
        int *			/* major_rtrn */,
        int *			/* minor_rtrn */
    );

    Bool	XkbLibraryVersion(
        int *			/* libMajorRtrn */,
        int *			/* libMinorRtrn */
    );

    uint	XkbSetXlibControls(
        Display*		/* dpy */,
        uint		/* affect */,
        uint		/* values */
    );

    uint	XkbGetXlibControls(
        Display*		/* dpy */
    );

    uint	XkbXlibControlsImplemented();

    alias XkbInternAtomFunc = Atom function(
        Display *		/* dpy */,
        const(char) *		/* name */,
        Bool			/* only_if_exists */
    );

    alias XkbGetAtomNameFunc = char* function (
        Display *		/* dpy */,
        Atom			/* atom */
    );

    void		XkbSetAtomFuncs(
        XkbInternAtomFunc	/* getAtom */,
        XkbGetAtomNameFunc	/* getName */
    );

version(XlibWidePrototypes) {
    KeySym XkbKeycodeToKeysym(
        Display *	/* dpy */,
        uint	/* kc */,
        int 		/* group */,
        int		/* level */
    );
}
else {
    KeySym XkbKeycodeToKeysym(
        Display *	/* dpy */,
        KeyCode		/* kc */,
        int 		/* group */,
        int		/* level */
    );
}

    uint	XkbKeysymToModifiers(
        Display *			/* dpy */,
        KeySym 			/* ks */
    );

    Bool		XkbLookupKeySym(
        Display *			/* dpy */,
        KeyCode 			/* keycode */,
        uint 		/* modifiers */,
        uint *		/* modifiers_return */,
        KeySym *			/* keysym_return */
    );

    int		XkbLookupKeyBinding(
        Display *			/* dpy */,
        KeySym 			/* sym_rtrn */,
        uint 		/* mods */,
        char *			/* buffer */,
        int 			/* nbytes */,
        int * 			/* extra_rtrn */
    );

    Bool		XkbTranslateKeyCode(
        XkbDescPtr			/* xkb */,
        KeyCode 			/* keycode */,
        uint 		/* modifiers */,
        uint *		/* modifiers_return */,
        KeySym *			/* keysym_return */
    );

    /* FIXME: does register keyword affect binary compatibility ?? */
    int		XkbTranslateKeySym(
        Display *			/* dpy */,
        /*register*/ KeySym *		/* sym_return */,
        uint 		/* modifiers */,
        char *			/* buffer */,
        int 			/* nbytes */,
        int *			/* extra_rtrn */
    );

    Bool	XkbSetAutoRepeatRate(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint		/* delay */,
        uint		/* interval */
    );

    Bool	XkbGetAutoRepeatRate(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint *		/* delayRtrn */,
        uint *		/* intervalRtrn */
    );

    Bool	XkbChangeEnabledControls(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint		/* affect */,
        uint		/* values */
    );

    Bool	XkbDeviceBell(
        Display *		/* dpy */,
        Window			/* win */,
        int			/* deviceSpec */,
        int			/* bellClass */,
        int			/* bellID */,
        int			/* percent */,
        Atom			/* name */
    );

    Bool	XkbForceDeviceBell(
        Display *		/* dpy */,
        int			/* deviceSpec */,
        int			/* bellClass */,
        int			/* bellID */,
        int			/* percent */
    );

    Bool	XkbDeviceBellEvent(
        Display *		/* dpy */,
        Window			/* win */,
        int			/* deviceSpec */,
        int			/* bellClass */,
        int			/* bellID */,
        int			/* percent */,
        Atom			/* name */
    );

    Bool	XkbBell(
        Display *		/* dpy */,
        Window			/* win */,
        int			/* percent */,
        Atom			/* name */
    );

    Bool	XkbForceBell(
        Display *		/* dpy */,
        int			/* percent */
    );

    Bool	XkbBellEvent(
        Display *		/* dpy */,
        Window			/* win */,
        int			/* percent */,
        Atom			/* name */
    );

    Bool	XkbSelectEvents(
        Display *		/* dpy */,
        uint		/* deviceID */,
        uint 		/* affect */,
        uint 		/* values */
    );

    Bool	XkbSelectEventDetails(
        Display *		/* dpy */,
        uint 		/* deviceID */,
        uint 		/* eventType */,
        c_ulong 		/* affect */,
        c_ulong 		/* details */
    );

    void	XkbNoteMapChanges(
        XkbMapChangesPtr		/* old */,
        XkbMapNotifyEvent	*	/* new */,
        uint	 	/* wanted */
    );

    void	XkbNoteNameChanges(
        XkbNameChangesPtr		/* old */,
        XkbNamesNotifyEvent	*	/* new */,
        uint	 	/* wanted */
    );

    Status	XkbGetIndicatorState(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint *		/* pStateRtrn */
    );

    Status	XkbGetDeviceIndicatorState(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint		/* ledClass */,
        uint		/* ledID */,
        uint *		/* pStateRtrn */
    );

    Status	 XkbGetIndicatorMap(
        Display *		/* dpy */,
        c_ulong		/* which */,
        XkbDescPtr		/* desc */
    );

    Bool	 XkbSetIndicatorMap(
        Display *		/* dpy */,
        c_ulong 		/* which */,
        XkbDescPtr		/* desc */
    );


    enum XkbNoteIndicatorMapChanges(O, N, W)(O o, N n, W w) {
        return ((o).map_changes|=((n).map_changes&(w)));
    }
    auto XkbNoteIndicatorStateChanges(O, N, W)(O o, N n, W w) {
        ((o).state_changes|=((n).state_changes&(w)));
    }
    auto XkbGetIndicatorMapChanges(D, X, C)(D d, X x, C c) {
        return (XkbGetIndicatorMap((d),(c).map_changes,x));
    }
    auto XkbChangeIndicatorMaps(D, X, C)(D d, X x, C c) {
        return (XkbSetIndicatorMap((d),(c).map_changes,x));
    }

    Bool	XkbGetNamedIndicator(
        Display *		/* dpy */,
        Atom			/* name */,
        int *			/* pNdxRtrn */,
        Bool *			/* pStateRtrn */,
        XkbIndicatorMapPtr	/* pMapRtrn */,
        Bool *			/* pRealRtrn */
    );

    Bool	XkbGetNamedDeviceIndicator(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint		/* ledClass */,
        uint		/* ledID */,
        Atom			/* name */,
        int *			/* pNdxRtrn */,
        Bool *			/* pStateRtrn */,
        XkbIndicatorMapPtr	/* pMapRtrn */,
        Bool *			/* pRealRtrn */
    );

    Bool	XkbSetNamedIndicator(
        Display *		/* dpy */,
        Atom			/* name */,
        Bool			/* changeState */,
        Bool 			/* state */,
        Bool			/* createNewMap */,
        XkbIndicatorMapPtr	/* pMap */
    );

    Bool	XkbSetNamedDeviceIndicator(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        uint		/* ledClass */,
        uint		/* ledID */,
        Atom			/* name */,
        Bool			/* changeState */,
        Bool 			/* state */,
        Bool			/* createNewMap */,
        XkbIndicatorMapPtr	/* pMap */
    );

    Bool	XkbLockModifiers(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* affect */,
        uint 		/* values */
    );

    Bool	XkbLatchModifiers(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* affect */,
        uint 		/* values */
    );

    Bool	XkbLockGroup(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* group */
    );

    Bool	XkbLatchGroup(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* group */
    );

    Bool	XkbSetServerInternalMods(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* affectReal */,
        uint 		/* realValues */,
        uint		/* affectVirtual */,
        uint		/* virtualValues */
    );

    Bool	XkbSetIgnoreLockMods(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        uint 		/* affectReal */,
        uint 		/* realValues */,
        uint		/* affectVirtual */,
        uint		/* virtualValues */
    );


    Bool	XkbVirtualModsToReal(
        XkbDescPtr		/* xkb */,
        uint		/* virtual_mask */,
        uint *		/* mask_rtrn */
    );

    Bool	XkbComputeEffectiveMap(
        XkbDescPtr 		/* xkb */,
        XkbKeyTypePtr		/* type */,
        ubyte *		/* map_rtrn */
    );

    Status XkbInitCanonicalKeyTypes(
        XkbDescPtr			/* xkb */,
        uint		/* which */,
        int				/* keypadVMod */
    );

    XkbDescPtr XkbAllocKeyboard();

    void	XkbFreeKeyboard(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        Bool			/* freeDesc */
    );

    Status XkbAllocClientMap(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        uint		/* nTypes */
    );

    Status XkbAllocServerMap(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        uint		/* nActions */
    );

    void	XkbFreeClientMap(
        XkbDescPtr			/* xkb */,
        uint		/* what */,
        Bool			/* freeMap */
    );

    void	XkbFreeServerMap(
        XkbDescPtr			/* xkb */,
        uint		/* what */,
        Bool			/* freeMap */
    );

    XkbKeyTypePtr	XkbAddKeyType(
        XkbDescPtr			/* xkb */,
        Atom			/* name */,
        int				/* map_count */,
        Bool			/* want_preserve */,
        int				/* num_lvls */
    );

    Status XkbAllocIndicatorMaps(
        XkbDescPtr		/* xkb */
    );

    void XkbFreeIndicatorMaps(
        XkbDescPtr			/* xkb */
    );

    XkbDescPtr XkbGetMap(
        Display *		/* dpy */,
        uint 		/* which */,
        uint 		/* deviceSpec */
    );

    Status	XkbGetUpdatedMap(
        Display *		/* dpy */,
        uint 		/* which */,
        XkbDescPtr		/* desc */
    );

    Status	XkbGetMapChanges(
        Display *			/* dpy */,
        XkbDescPtr			/* xkb */,
        XkbMapChangesPtr		/* changes */
    );


    Status	XkbRefreshKeyboardMapping(
        XkbMapNotifyEvent *		/* event */
    );

    Status	XkbGetKeyTypes(
        Display *			/* dpy */,
        uint		/* first */,
        uint 		/* num */,
        XkbDescPtr			/* xkb */
    );

    Status	XkbGetKeySyms(
        Display *			/* dpy */,
        uint		/* first */,
        uint		/* num */,
        XkbDescPtr			/* xkb */
    );

    Status	XkbGetKeyActions(
        Display *			/* dpy */,
        uint 		/* first */,
        uint 		/* num */,
        XkbDescPtr			/* xkb */
    );

    Status	XkbGetKeyBehaviors(
        Display *		/* dpy */,
        uint 		/* firstKey */,
        uint		/* nKeys */,
        XkbDescPtr		/* desc */
    );

    Status	XkbGetVirtualMods(
        Display *		/* dpy */,
        uint 		/* which */,
        XkbDescPtr		/* desc */
    );

    Status	XkbGetKeyExplicitComponents(
        Display *		/* dpy */,
        uint 		/* firstKey */,
        uint		/* nKeys */,
        XkbDescPtr		/* desc */
    );

    Status	XkbGetKeyModifierMap(
        Display *		/* dpy */,
        uint 		/* firstKey */,
        uint		/* nKeys */,
        XkbDescPtr		/* desc */
    );

    Status	XkbGetKeyVirtualModMap(
        Display *		/* dpy */,
        uint		/* first */,
        uint		/* num */,
        XkbDescPtr		/* xkb */
    );

    Status	XkbAllocControls(
        XkbDescPtr		/* xkb */,
        uint		/* which*/
    );

    void	XkbFreeControls(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        Bool			/* freeMap */
    );

    Status	XkbGetControls(
        Display *		/* dpy */,
        c_ulong		/* which */,
        XkbDescPtr		/* desc */
    );

    Bool	XkbSetControls(
        Display *		/* dpy */,
        c_ulong		/* which */,
        XkbDescPtr		/* desc */
    );

    void	XkbNoteControlsChanges(
        XkbControlsChangesPtr	/* old */,
        XkbControlsNotifyEvent *	/* new */,
        uint	 	/* wanted */
    );

    auto XkbGetControlsChanges(D, X, C)(D d, X x, C c) {
        return XkbGetControls(d,(c).changed_ctrls,x);
    }
    auto XkbChangeControls(D, X, C)(D d, X x, C c) {
        return XkbSetControls(d,(c).changed_ctrls,x);
    }

    Status	XkbAllocCompatMap(
        XkbDescPtr			/* xkb */,
        uint		/* which */,
        uint		/* nInterpret */
    );

    void	XkbFreeCompatMap(
        XkbDescPtr			/* xkb */,
        uint		/* which */,
        Bool			/* freeMap */
    );

    Status XkbGetCompatMap(
        Display *		/* dpy */,
        uint 		/* which */,
        XkbDescPtr 		/* xkb */
    );

    Bool XkbSetCompatMap(
        Display *		/* dpy */,
        uint 		/* which */,
        XkbDescPtr 		/* xkb */,
        Bool			/* updateActions */
    );

    XkbSymInterpretPtr XkbAddSymInterpret(
        XkbDescPtr		/* xkb */,
        XkbSymInterpretPtr	/* si */,
        Bool			/* updateMap */,
        XkbChangesPtr		/* changes */
    );

    Status XkbAllocNames(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        int			/* nTotalRG */,
        int			/* nTotalAliases */
    );

    Status	XkbGetNames(
        Display *		/* dpy */,
        uint		/* which */,
        XkbDescPtr		/* desc */
    );

    Bool	XkbSetNames(
        Display *		/* dpy */,
        uint		/* which */,
        uint		/* firstType */,
        uint		/* nTypes */,
        XkbDescPtr		/* desc */
    );

    Bool	XkbChangeNames(
        Display *		/* dpy */,
        XkbDescPtr		/* xkb */,
        XkbNameChangesPtr	/* changes */
    );

    void XkbFreeNames(
        XkbDescPtr		/* xkb */,
        uint		/* which */,
        Bool			/* freeMap */
    );


    Status	XkbGetState(
        Display *		/* dpy */,
        uint 		/* deviceSpec */,
        XkbStatePtr		/* rtrnState */
    );

    Bool	XkbSetMap(
        Display *		/* dpy */,
        uint		/* which */,
        XkbDescPtr		/* desc */
    );

    Bool	XkbChangeMap(
        Display*		/* dpy */,
        XkbDescPtr		/* desc */,
        XkbMapChangesPtr	/* changes */
    );

    Bool	XkbSetDetectableAutoRepeat(
        Display *		/* dpy */,
        Bool			/* detectable */,
        Bool *			/* supported */
    );

    Bool	XkbGetDetectableAutoRepeat(
        Display *		/* dpy */,
        Bool *			/* supported */
    );

    Bool	XkbSetAutoResetControls(
        Display *			/* dpy */,
        uint 		/* changes */,
        uint *		/* auto_ctrls */,
        uint *		/* auto_values */
    );

    Bool	XkbGetAutoResetControls(
        Display *			/* dpy */,
        uint *		/* auto_ctrls */,
        uint *		/* auto_ctrl_values */
    );

    Bool	XkbSetPerClientControls(
        Display *			/* dpy */,
        uint		/* change */,
        uint *		/* values */
    );

    Bool	XkbGetPerClientControls(
        Display *			/* dpy */,
        uint *		/* ctrls */
    );

    Status XkbCopyKeyType(
        XkbKeyTypePtr	/* from */,
        XkbKeyTypePtr	/* into */
    );

    Status XkbCopyKeyTypes(
        XkbKeyTypePtr	/* from */,
        XkbKeyTypePtr	/* into */,
        int			/* num_types */
    );

    Status	XkbResizeKeyType(
        XkbDescPtr		/* xkb */,
        int			/* type_ndx */,
        int			/* map_count */,
        Bool		/* want_preserve */,
        int			/* new_num_lvls */
    );

    KeySym *XkbResizeKeySyms(
        XkbDescPtr		/* desc */,
        int 			/* forKey */,
        int 			/* symsNeeded */
    );

    XkbAction *XkbResizeKeyActions(
        XkbDescPtr		/* desc */,
        int 			/* forKey */,
        int 			/* actsNeeded */
    );

    Status XkbChangeTypesOfKey(
        XkbDescPtr		/* xkb */,
        int 			/* key */,
        int			/* num_groups */,
        uint		/* groups */,
        int *			/* newTypes */,
        XkbMapChangesPtr	/* pChanges */
    );

    Status   XkbChangeKeycodeRange(
        XkbDescPtr		/* xkb */,
        int			/* minKC */,
        int			/* maxKC */,
        XkbChangesPtr		/* changes */
    );

    /***====================================================================***/

    XkbComponentListPtr	XkbListComponents(
        Display *		/* dpy */,
        uint		/* deviceSpec */,
        XkbComponentNamesPtr	/* ptrns */,
        int *			/* max_inout */
    );

    void XkbFreeComponentList(
        XkbComponentListPtr	/* list */
    );

    XkbDescPtr XkbGetKeyboard(
        Display *		/* dpy */,
        uint 		/* which */,
        uint 		/* deviceSpec */
    );

    XkbDescPtr XkbGetKeyboardByName(
        Display *			/* dpy */,
        uint		/* deviceSpec */,
        XkbComponentNamesPtr	/* names */,
        uint 		/* want */,
        uint 		/* need */,
        Bool			/* load */
    );

    /***====================================================================***/

    int	XkbKeyTypesForCoreSymbols(	/* returns # of groups */
        XkbDescPtr	/* xkb */,			/* keyboard device */
        int		/* map_width */,		/* width of core KeySym array */
        KeySym *	/* core_syms */,		/* always mapWidth symbols */
        uint	/* protected */,	/* explicit key types */
        int *	/* types_inout */,		/* always four type indices */
        KeySym * 	/* xkb_syms_rtrn */		/* must have enough space */
    );

    Bool	XkbApplyCompatMapToKey(	/* False only on error */
        XkbDescPtr		/* xkb */,		/* keymap to be edited */
        KeyCode		/* key */,		/* key to be updated */
        XkbChangesPtr	/* changes */		/* resulting changes to map */
    );

    Bool	XkbUpdateMapFromCore( /* False only on error */
        XkbDescPtr		/* xkb */,		/* XKB keyboard to be edited */
        KeyCode		/* first_key */,	/* first changed key */
        int			/* num_keys */, 	/* number of changed keys */
        int			/* map_width */,	/* width of core keymap */
        KeySym *		/* core_keysyms */,	/* symbols from core keymap */
        XkbChangesPtr	/* changes */		/* resulting changes */
    );

    /***====================================================================***/

    XkbDeviceLedInfoPtr	XkbAddDeviceLedInfo(
        XkbDeviceInfoPtr	/* devi */,
        uint		/* ledClass */,
        uint		/* ledId */
    );

    Status			XkbResizeDeviceButtonActions(
        XkbDeviceInfoPtr	/* devi */,
        uint		/* newTotal */
    );

    XkbDeviceInfoPtr	XkbAllocDeviceInfo(
        uint		/* deviceSpec */,
        uint		/* nButtons */,
        uint		/* szLeds */
    );

    void XkbFreeDeviceInfo(
        XkbDeviceInfoPtr	/* devi */,
        uint		/* which */,
        Bool			/* freeDevI */
    );

    void	XkbNoteDeviceChanges(
        XkbDeviceChangesPtr			/* old */,
        XkbExtensionDeviceNotifyEvent *	/* new */,
        uint	 		/* wanted */
    );

    XkbDeviceInfoPtr XkbGetDeviceInfo(
        Display *		/* dpy */,
        uint 		/* which */,
        uint		/* deviceSpec */,
        uint		/* ledClass */,
        uint		/* ledID */
    );

    Status	XkbGetDeviceInfoChanges(
        Display *		/* dpy */,
        XkbDeviceInfoPtr	/* devi */,
        XkbDeviceChangesPtr 	/* changes */
    );

    Status	XkbGetDeviceButtonActions(
        Display *		/* dpy */,
        XkbDeviceInfoPtr	/* devi */,
        Bool			/* all */,
        uint		/* first */,
        uint		/* nBtns */
    );

    Status	XkbGetDeviceLedInfo(
        Display *		/* dpy */,
        XkbDeviceInfoPtr	/* devi */,
        uint		/* ledClass (class, XIDflt, XIAll) */,
        uint		/* ledId (id, XIDflt, XIAll) */,
        uint		/* which (XkbXI_Indicator{Names,Map}Mask */
    );

    Bool	XkbSetDeviceInfo(
        Display *		/* dpy */,
        uint		/* which */,
        XkbDeviceInfoPtr	/* devi */
    );

    Bool	XkbChangeDeviceInfo(
        Display*		/* dpy */,
        XkbDeviceInfoPtr	/* desc */,
        XkbDeviceChangesPtr	/* changes */
    );

    Bool XkbSetDeviceLedInfo(
        Display *		/* dpy */,
        XkbDeviceInfoPtr	/* devi */,
        uint 		/* ledClass */,
        uint		/* ledID */,
        uint		/* which */
    );

    Bool XkbSetDeviceButtonActions(
        Display *		/* dpy */,
        XkbDeviceInfoPtr	/* devi */,
        uint		/* first */,
        uint		/* nBtns */
    );

    /***====================================================================***/

    char	XkbToControl(
        char		/* c */
    );

    /***====================================================================***/

    Bool XkbSetDebuggingFlags(
        Display *		/* dpy */,
        uint	/* mask */,
        uint	/* flags */,
        char *		/* msg */,
        uint	/* ctrls_mask */,
        uint	/* ctrls */,
        uint *	/* rtrn_flags */,
        uint *	/* rtrn_ctrls */
    );

    Bool XkbApplyVirtualModChanges(
       XkbDescPtr		/* xkb */,
       uint		/* changed */,
       XkbChangesPtr	/* changes */
    );

    Bool XkbUpdateActionVirtualMods(
        XkbDescPtr		/* xkb */,
        XkbAction *		/* act */,
        uint		/* changed */
    );

    void XkbUpdateKeyTypeVirtualMods(
        XkbDescPtr		/* xkb */,
        XkbKeyTypePtr		/* type */,
        uint		/* changed */,
        XkbChangesPtr		/* changes */
    );

}
