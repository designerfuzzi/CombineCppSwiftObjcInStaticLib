// Example.hpp
// file has no Target Membership, it is "only" a header

#ifndef Example_hpp
#define Example_hpp

#ifdef __cplusplus // Xcode, the enclosed stuff is c++

#include <stdio.h>
//#include <string>

// namespace Example {

class Example {
    
private:
    int internalCount;
    void setInt(void);
    const char * _name;

public:
    Example(const char *name);
    ~Example(void);
    int getLen(void);
    const char * getName(void);
};

//}

#endif //end __cplusplus

#endif //end Example_hpp
