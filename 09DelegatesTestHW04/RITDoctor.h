//
//  RITDoctor.h
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITPatient.h"

@interface RITDoctor : NSObject <RITPatientDelegate>

@property (strong, nonatomic) NSMutableDictionary* statistics;
@property (strong, nonatomic) NSString* name;

- (void) showStatistics;

@end
