//
//  TableViewCell.m
//  Networking
//
//  Created by afnan on 12/3/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier: @"cell"];

    _ah_imageView = [[UIImageView alloc] init];
    [_ah_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    _ah_imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_ah_imageView];

    return self;
}
    
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)prepareForReuse {
    [super prepareForReuse];
    _ah_imageView.image = NULL;
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _ah_imageView.frame = CGRectMake(0,0, self.contentView.frame.size.width,
                                         self.contentView.frame.size.height);
// Do your resizing
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
