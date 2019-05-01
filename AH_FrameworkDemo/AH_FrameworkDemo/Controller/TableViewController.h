//
//  TableViewController.h
//  Networking
//
//  Created by afnan on 12/1/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AH_NetworkingFramework/UIImageView+Category.h>

@interface TableViewController : UITableViewController
//    @property NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, strong) NSArray<NSString *> *imageURLs ;

@end
