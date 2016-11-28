//
//  ViewController.h
//  TableViewCheckList
//
//  Created by Rajesh M on 28/11/16.
//  Copyright © 2016 Rajesh M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property (strong, nonatomic) NSArray* array;
@property (strong, nonatomic) NSIndexPath* lastIndexPath;


@end

