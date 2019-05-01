//
//  TableViewController.m
//  Networking
//
//  Created by afnan on 12/1/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagesArray = [[NSMutableArray alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView setDelegate: self];
    [self.tableView setDataSource: self];
    
    self.imageURLs = @[@"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", @"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", @"https://i.pinimg.com/736x/40/78/a2/4078a2c375a5f7ff1eb4f40f14aaaeeb--bullmastiff-magazines.jpg" ,@"https://s1.ax1x.com/2017/12/06/oaiz8.png", @"https://s1.ax1x.com/2017/12/06/oakQS.jpg", @"https://http.cat/100"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _imageURLs.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.tableView.bounds.size.height * 0.3;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    
//    __weak typeof(TableViewCell) *weakCell = cell;
    
    [cell.ah_imageView setImageWithURL: _imageURLs[indexPath.section] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data != nil)
        [_imagesArray addObject: data];
//        weakCell.ah_imageView.image = [UIImage imageWithData: _imagesArray [indexPath.section]];
    }];

    return cell;
}




@end
