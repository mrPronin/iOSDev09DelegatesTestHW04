//
//  RITPatient.h
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RITSimptomsFever,
    RITSimptomsCough,
    RITSimptomsRunnyNose,
    RITSimptomsHeadAche,
    RITSimptomsFatigue,
    RITSimptomsAbdominalPain,
    RITSimptomsNausea,
    RITSimptomsTasteChange,
    RITSimptomsBloating,
    RITSimptomsLossOfAppetite,
    RITSimptomsWeightLoss,
    RITSimptomsDryMouth,
    RITSimptomsArrhythmia
} RITSimptoms;

typedef enum {
    RITBodyPartsThroat,
    RITBodyPartsStomach,
    RITBodyPartsHead,
    RITBodyPartsLeg,
    RITBodyPartsHand
} RITBodyParts;

@protocol RITPatientDelegate;

@interface RITPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat   temperature;
@property (weak, nonatomic) id <RITPatientDelegate> delegate;
@property (strong, nonatomic) NSSet* simptoms;
@property (assign, nonatomic) RITBodyParts bodyPart;
@property (assign, nonatomic) BOOL areYouPleased;

- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;
- (void) becameWorse;
- (void) prepareForSurgery;
- (void) doUltrasound;
- (void) undergoMoreTests;
- (void) showPatientSatisfaction;

@end

@protocol RITPatientDelegate <NSObject>

@property (strong, nonatomic) NSString* name;
- (void) patientFeelsBad:(RITPatient*) patient;
- (void) patient:(RITPatient*) patient hasQuestion:(NSString*) question;

@end
