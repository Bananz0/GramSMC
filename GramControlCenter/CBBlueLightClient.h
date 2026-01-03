//
//  CBBlueLightClient.h
//  GramControlCenter
//
//  Based on CBBlueLightClient from Shifty by Nate Thompson
//  https://github.com/thompsonate/Shifty
//
//  Enhanced header for CBBlueLightClient in private CoreBrightness API
//  Includes additional methods for CCT control and status
//

#import <Foundation/Foundation.h>

@interface CBBlueLightClient : NSObject

typedef struct {
    int hour;
    int minute;
} Time;

typedef struct {
    Time fromTime;
    Time toTime;
} Schedule;

typedef struct {
    BOOL active;
    BOOL enabled;
    BOOL sunSchedulePermitted;
    int mode;
    Schedule schedule;
    unsigned long long disableFlags;
    BOOL available;
} Status;

typedef struct {
    float minCCT;
    float maxCCT;
    float midCCT;
} CCTRange;

// Existing methods
- (BOOL)setStrength:(float)strength commit:(BOOL)commit;
- (BOOL)setEnabled:(BOOL)enabled;
- (BOOL)setMode:(int)mode;
- (BOOL)setSchedule:(Schedule *)schedule;
- (BOOL)getStrength:(float *)strength;
- (BOOL)getBlueLightStatus:(Status *)status;
- (void)setStatusNotificationBlock:(void (^)(void))block;
+ (BOOL)supportsBlueLightReduction;

// Enhanced methods for CCT (Color Temperature) control
- (BOOL)setCCT:(float)cct commit:(BOOL)commit;
- (BOOL)setCCT:(float)cct withPeriod:(float)period commit:(BOOL)commit;
- (BOOL)getCCT:(float *)cct;
- (BOOL)getCCTRange:(CCTRange *)range;
- (BOOL)setCCTRange:(CCTRange *)range;
- (BOOL)getDefaultCCTRange:(CCTRange *)range;

// Additional status and control methods
- (BOOL)setActive:(BOOL)active;
- (BOOL)setEnabled:(BOOL)enabled withOption:(int)option;
- (BOOL)getWarningCCT:(float *)cct;
- (BOOL)getWarningStrength:(float *)strength;
- (void)suspendNotifications:(BOOL)suspend;
- (void)suspendNotifications:(BOOL)suspend force:(BOOL)force;
- (void)enableNotifications;
- (void)disableNotifications;

@end
