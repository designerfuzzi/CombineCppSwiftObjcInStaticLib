// ExampleWrapper.cpp
// file has Target Membership, right side dialog checkmark the lib to include

#include "Example.hpp"

extern "C" int myCppFunction(const char * s)
{
    // Create an instance of Example, defined in the library
    // and call getLen() on it, return result.
    Example *c = new Example(s);
    return c->getLen();
}

extern "C" const char *getInCppAndOutOfCpp(const char * s) {
    //Example *c = new Example(s);
    return Example(s).getName();
}
