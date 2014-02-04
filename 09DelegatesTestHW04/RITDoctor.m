//
//  RITDoctor.m
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITDoctor.h"

@implementation RITDoctor

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
    
    NSSet*  fluSimptoms = [NSSet setWithObjects:
                           @(RITSimptomsFever),
                           @(RITSimptomsCough),
                           @(RITSimptomsRunnyNose),
                           @(RITSimptomsHeadAche),
                           @(RITSimptomsFatigue),
                           nil
                           ];
    
    NSSet*  appendicitisSimptoms = [NSSet setWithObjects:
                           @(RITSimptomsAbdominalPain),
                           nil
                           ];
    
    NSSet*  pregnancySimptoms = [NSSet setWithObjects:
                           @(RITSimptomsNausea),
                           @(RITSimptomsTasteChange),
                           @(RITSimptomsBloating),
                           @(RITSimptomsHeadAche),
                           nil
                           ];

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
    
    if (patient.temperature >= 36.5f &&
        [fluSimptoms isSubsetOfSet:patient.simptoms] &&
        patient.bodyPart == RITBodyPartsThroat) {
        
        // treat flu
        NSLog(@"Patient %@ diagnosed flu", patient.name);
        [patient takePill];
        
    } else if (
        [appendicitisSimptoms isSubsetOfSet:patient.simptoms] &&
        patient.bodyPart == RITBodyPartsStomach) {
        
        // prepare for surgery
        NSLog(@"Patient %@ diagnosed appendicitis", patient.name);
        [patient prepareForSurgery];
        
    } else if (
        [pregnancySimptoms isSubsetOfSet:patient.simptoms] &&
        patient.bodyPart == RITBodyPartsHead) {
        
        // do ultrasound
        NSLog(@"Patient %@ diagnosed pregnancy", patient.name);
        [patient doUltrasound];
        
    } else {
        
        // pass tests
        [patient undergoMoreTests];
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
