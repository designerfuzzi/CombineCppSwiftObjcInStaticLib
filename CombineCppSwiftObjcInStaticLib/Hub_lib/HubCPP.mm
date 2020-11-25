//
//  HubCPP.mm
//  Hub_lib
//
//  Created by Ol Sen on 22.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "HubCPP.h"

SomeCPPClass::SomeCPPClass (id<NSObject> obj, size_t size) :
bufferIdx (0),
isReady(false)
{
    uint8_t ringSize = size;
    assert (ringSize > 0);
    for (uint8_t i = 0; i < ringSize; i++)
    {
        buffers.push_back(obj);
        bufferIdx++; //= (unsigned int)size;
    }
    isReady = true;
}
SomeCPPClass::~SomeCPPClass() {
    // cleanup allocated stuff here.
    isReady = false;
    buffers.clear();
}

unsigned int SomeCPPClass::getCurrentIdx() {
    return bufferIdx;
}

id<NSObject> SomeCPPClass::getBufferedObject(unsigned int idx) {
    assert (idx <= bufferIdx);
    return buffers[idx-1];
}
