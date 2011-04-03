//
//  DropDownCell.h
//  DropDownTest
//
//  Created by Florian Krüger on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DropDownCell : UITableViewCell {
    
    IBOutlet UILabel *textLabel;
    IBOutlet UIImageView *arrow_up;
    IBOutlet UIImageView *arrow_down;
    
    BOOL isOpen;

}

- (void) setOpen;
- (void) setClosed;

@property (nonatomic) BOOL isOpen;
@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) IBOutlet UIImageView *arrow_up;
@property (nonatomic, retain) IBOutlet UIImageView *arrow_down;

@end
