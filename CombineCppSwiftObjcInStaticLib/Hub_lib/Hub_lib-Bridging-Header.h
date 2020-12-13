//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

// for extern "C" functions declare them one by one here
// as implemented in ExampleWrapper.cpp
// becomes "func myCppFunction(_ s: UnsafePointer<Int8>!) -> Int32" in swift
int myCppFunction(const char * s);

const char *getInCppAndOutOfCpp(const char * s);

extern char global_sensor_data_buf[300];
