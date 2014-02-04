//
//  RITQuack.h
//  09DelegatesTestHW02
//
//  Created by Aleksandr Pronin on 04.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITPatient.h"

@interface RITQuack : NSObject <RITPatientDelegate>

@property (strong, nonatomic) NSMutableDictionary* statistics;
@property (strong, nonatomic) NSString* name;

- (void) showStatistics;

@end
