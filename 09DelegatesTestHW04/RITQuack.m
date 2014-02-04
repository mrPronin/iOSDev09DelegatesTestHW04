//
//  RITQuack.m
//  09DelegatesTestHW02
//
//  Created by Aleksandr Pronin on 04.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITQuack.h"

@implementation RITQuack

- (id)init
{
    self = [super init];
    if (self) {
        _statistics = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @(0), @(RITBodyPartsThroat),
                       @(0), @(RITBodyPartsStomach),
                       @(0), @(RITBodyPartsHead),
                       @(0), @(RITBodyPartsLeg),
                       @(0), @(RITBodyPartsHand),
                       nil];
    }
    return self;
}

#pragma mark - RITPatientDelegate

- (void) patientFeelsBad:(RITPatient*) patient {
    
    NSLog(@"Patient %@ fells bad", patient.name);
    
    // collect statistics
    int count = 0;
    switch (patient.bodyPart) {
        case RITBodyPartsThroat:
        case RITBodyPartsStomach:
        case RITBodyPartsHead:
        case RITBodyPartsLeg:
        case RITBodyPartsHand:
            count = [self.statistics[@(patient.bodyPart)] intValue];
            count++;
            self.statistics[@(patient.bodyPart)] = @(count);
            break;
        default:
            break;
    }
    
    switch (arc4random() % 4) {
        case 0:
            // treat flu
            NSLog(@"Patient %@ diagnosed flu", patient.name);
            [patient takePill];
            break;
            
        case 1:
            // prepare for surgery
            NSLog(@"Patient %@ diagnosed appendicitis", patient.name);
            [patient prepareForSurgery];
            break;
            
        case 2:
            // do ultrasound
            NSLog(@"Patient %@ diagnosed pregnancy", patient.name);
            [patient doUltrasound];
            break;
        default:
            // pass tests
            [patient undergoMoreTests];
            break;
    }
    
    // doctor's assesment
    patient.areYouPleased = arc4random() % 2;
    
    NSLog(@"\n");
    
}

- (void) patient:(RITPatient*) patient hasQuestion:(NSString*) question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

- (void) showStatistics {
    
    NSLog(@"%@ statistics:", self.name);
    
    for (NSNumber* key in self.statistics) {
        int         value  = [self.statistics[key] intValue];
        NSString*   stringPart;
        
        switch ([key intValue]) {
            case RITBodyPartsThroat:
                stringPart = @"Throat";
                break;
                
            case RITBodyPartsStomach:
                stringPart = @"Stomach";
                break;
                
            case RITBodyPartsHead:
                stringPart = @"Head";
                break;
                
            case RITBodyPartsLeg:
                stringPart = @"Leg";
                break;
                
            case RITBodyPartsHand:
                stringPart = @"Hand";
                break;
                
            default:
                break;
        }
        
        NSLog(@"%@ = %d", stringPart, value);
    }
    
    NSLog(@"\n");

}

@end
