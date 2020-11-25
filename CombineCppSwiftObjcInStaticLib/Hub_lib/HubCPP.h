//
//  HubCPP.h
//  Hub_lib
//
//  Created by Ol Sen on 22.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//
#import "TargetConditionals.h"
#if TARGET_OS_IOS
#import <Foundation/Foundation.h>
#else
#import <Cocoa/Cocoa.h>
#endif

//#include <cstdlib>
#include <vector>

NS_ASSUME_NONNULL_BEGIN

class SomeCPPClass
{
public:
    SomeCPPClass(id<NSObject> obj, size_t size);
    ~SomeCPPClass();
    id<NSObject>                    getBufferedObject(unsigned int idx); // { return buffers[bufferIdx]; }
    unsigned int                    getCurrentIdx();
private:
    std::vector <id <NSObject>>     buffers;
    unsigned int                    bufferIdx;
    bool                            isReady;
};

NS_ASSUME_NONNULL_END




