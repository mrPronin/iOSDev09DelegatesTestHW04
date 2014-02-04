//
//  RITPatient.m
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITPatient.h"

@implementation RITPatient

- (id)init
{
    self = [super init];
    if (self) {
        _areYouPleased = YES;
    }
    return self;
}

- (BOOL) howAreYou {
    
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
    }
    
    return iFeelGood;
}
- (void) takePill {
    NSLog(@"%@ takes a pill", self.name);
}
- (void) makeShot {
    NSLog(@"%@ makes a shot", self.name);
}

- (void) becameWorse {
    
    //NSLog(@"%@ became worse", self.name);
    
    [self.delegate patientFeelsBad:self];
}

- (void) prepareForSurgery {
    NSLog(@"%@ prepare for surgery", self.name);
}

- (void) doUltrasound {
    NSLog(@"%@ do ultrasound", self.name);
}

- (void) undergoMoreTests {
    NSLog(@"%@ undergo tests", self.name);
}

- (void) showPatientSatisfaction {
    NSLog(@"Name: '%@', doctor: '%@', satisfaction: %@", self.name, self.delegate.name, self.areYouPleased ? @"YES" : @"NO");
}

@end
