// Example.cpp
// file has Target Membership, right side dialog checkmark the lib to include

#include "Example.hpp"
#ifdef __cplusplus

#include <stdio.h>
#include <string>

//namespace Example {

Example::Example(const char *name) :
_name(""),
internalCount(0)
{
    _name = name;
    internalCount = getLen();
}

Example::~Example() {
    _name = NULL;
}
const char * Example::getName(void) {
    return _name;
}
int Example::getLen() {
    return (int)strlen(_name);
}

void Example::setInt() {
    internalCount = getLen();
}

//const char* get_c_string() {
//    char s[] = "abc";
//    return s;
//}

//}

#endif

