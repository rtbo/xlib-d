module X11.Xlib_xcb;

import X11.X;

// bindings to Xlib-xcb

alias xcb_connection_t = void;

extern (C) {

    enum XEventQueueOwner {
        XlibOwnsEventQueue = 0,
        XCBOwnsEventQueue
    }

    alias XlibOwnsEventQueue = XEventQueueOwner.XlibOwnsEventQueue;
    alias XCBOwnsEventQueue = XEventQueueOwner.XCBOwnsEventQueue;

    xcb_connection_t *XGetXCBConnection(Display *dpy);

    void XSetEventQueueOwner(Display *dpy, XEventQueueOwner owner);


}

