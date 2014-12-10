//
//  Swift.swift
//  Cocoa-Swift-CPP-ObjC-Mix
//
//  Created by Mani on 10.12.14.
//  Copyright (c) 2014 Mani. All rights reserved.
//

import Foundation

class Test : NSObject
{
    let objC = TestClass()
    
    override init()
    {
        NSLog("Allocation of Swift object")
    }
    
    deinit
    {
        NSLog("Deallocation of Swift Object")
    }
}