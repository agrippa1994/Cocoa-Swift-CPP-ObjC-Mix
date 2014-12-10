//
//  TestClass.m
//  Cocoa-Swift-CPP-ObjC-Mix
//
//  Created by Mani on 10.12.14.
//  Copyright (c) 2014 Mani. All rights reserved.
//

#import "TestClass.h"

@interface TestClass()
{
    class TestClassCPP *testClassCPP_;
}

@property TestClassCPP *testClassCPP;
- (void) log:(NSString *)str;
@end

class TestClassCPP
{
    __weak TestClass *testClass_;
public:
    TestClassCPP(TestClass *testClass) : testClass_(testClass)
    {
        NSLog(@"Allocation of CPP object");
    }
    
    ~TestClassCPP()
    {
        NSLog(@"Deallocation of CPP object");
    }
};

@implementation TestClass
@synthesize testClassCPP = testClassCPP_;
-(id)init
{
    NSLog(@"Allocation of ObjC object");
    self = [super init];
    if(self)
    {
        testClassCPP_ = new TestClassCPP(self);
    }
    
    return self;
}

-(void)dealloc
{
    delete testClassCPP_;
    NSLog(@"Deallocation of ObjC object");
}

+(id)testClass
{
    return [[TestClass alloc] init];
}

- (void) log:(NSString *)str
{
    NSLog(@"%@", str);
}

@end
