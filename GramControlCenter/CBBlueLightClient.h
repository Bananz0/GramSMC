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

typedef struct {
  int hour;
  int minute;
} GTime;

typedef struct {
  GTime fromTime;
  GTime toTime;
} GSchedule;

typedef struct {
  BOOL active;
  BOOL enabled;
  BOOL sunSchedulePermitted;
  int mode;
  GSchedule schedule;
  unsigned long long disableFlags;
  BOOL available;
} GStatus;

typedef struct {
  float minCCT;
  float maxCCT;
  float midCCT;
} GCCTRange;

@interface CBBlueLightClient : NSObject

// Existing methods
- (BOOL)setStrength:(float)strength commit:(BOOL)commit;
- (BOOL)setEnabled:(BOOL)enabled;
- (BOOL)setMode:(int)mode;
- (BOOL)setSchedule:(GSchedule *)schedule;
- (BOOL)getStrength:(float *)strength;
- (BOOL)getBlueLightStatus:(GStatus *)status;
- (void)setStatusNotificationBlock:(void (^)(void))block;
+ (BOOL)supportsBlueLightReduction;

// Enhanced methods for CCT (Color Temperature) control
- (BOOL)setCCT:(float)cct commit:(BOOL)commit;
- (BOOL)setCCT:(float)cct withPeriod:(float)period commit:(BOOL)commit;
- (BOOL)getCCT:(float *)cct;
- (BOOL)getCCTRange:(GCCTRange *)range;
- (BOOL)setCCTRange:(GCCTRange *)range;
- (BOOL)getDefaultCCTRange:(GCCTRange *)range;

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
