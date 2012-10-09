JJPrivateKeyEvents
==================
** THIS LIBRARY USES UNDOCUMENTED METHODS THAT WILL GET YOUR APP REJECTED BY APPLE **

Take special care to only include this library in your debug target.
This library allows you to capture global keystroke events for debugging purposes in the iOS simulator.  Inspired by a talk given by Flipboard.

## Installation

1.  Add the JJPrivateKeyEvents project to your project.
2.  Navigate to your project settings, select your target, then select the 'Build Phases' tab
3.  Add JJPrivateKeyEvents in the target dependency section
4.  Add JJPrivateKeyEvents.a to the 'Link binary with libraries' section
5.  Add the GraphicsServices private framework to your project in the 'Link binary with libraries' section

The GraphicsServices framework is a private framework and can be found on your filesystem in a path that looks something like:

/Users/jjennings/Library/Developer/Xcode/iOS DeviceSupport/5.1.1 (9B206)/Symbols/System/Library/PrivateFrameworks/GraphicsServices.framework

If you have any issues, please raise an issue on this repository.  Again, make sure this library and the GraphicsServices framework do not get linked to your production application.
