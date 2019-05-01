////
////  Connection.m
////  Networking
////
////  Created by afnan on 11/30/18.
////  Copyright © 2018 macbook pro. All rights reserved.
////
//#import <Foundation/Foundation.h>
//#import "Connection.h"
//#import "Reachability.h"
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//
//@implementation Connection
//    
////get current network connection type [NoConnection, WIFI, cellular]
//+ (void)connectionType: (void (^)(NetworkStatus))completionHandler {
//
//    Reachability *reachability = [Reachability reachabilityForInternetConnection];
//    
//    [reachability startNotifier];
//    completionHandler([Connection updateReachabilityStatus: reachability]);
//    
//    //send notification when current network status changed
//    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//    [[NSNotificationCenter defaultCenter]
//     addObserverForName: kReachabilityChangedNotification
//     object: nil
//     queue: mainQueue
//     usingBlock: ^(NSNotification *notification) {
//         completionHandler([Connection updateReachabilityStatus: reachability]);
//     }];
//}
//
////method used to update currentNetworkStatus
//+ (NetworkStatus)updateReachabilityStatus: (Reachability *)reachability {
//
//    NetworkStatus status = [reachability currentReachabilityStatus];
//
//    if (status == ReachableViaWiFi) {
//        NSLog(@"Wifi");
//        return ReachableViaWiFi;
//    } else if (status == ReachableViaWWAN) {
//        NSLog(@"WWAN");
//        return ReachableViaWWAN;
//    }
//    return NotReachable;
//}
//
//@end
//
// 

