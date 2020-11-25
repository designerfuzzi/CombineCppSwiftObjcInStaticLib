# CombinedCppSwiftObjcInStaticLib
Combine C++, Swift, Objective-C in one Static Library and make it available in a test iOS app, 
contains two test applications which integrate a fictionaly yet useless static library with name *"Hub_lib"*.

But it shows how to code Swift in a static lib which combines Objective-C and C++ (plus Objective-C++).

The **iOS test app** integrates accordingly the Hub_lib and a `UIButton` will invoke a pre allocated *Hub_lib* class object to show it does realy fire up swift code from the library.

The **macOS test app** does same but additional integrates a `ThreadManagerExample` that runs a thread which will show that `NotificationCenter`s is thread safe. It will catch what bundle (app in workspace) was focused at last and also keep its window allways in front.
