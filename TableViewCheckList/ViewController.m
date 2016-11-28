//
//  ViewController.m
//  TableViewCheckList
//
//  Created by Rajesh M on 28/11/16.
//  Copyright © 2016 Rajesh M. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;
@synthesize array = _array;
@synthesize lastIndexPath = _lastIndexPath;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the
    
    NSMutableArray *list = [[NSMutableArray alloc] initWithObjects:@"ffgfgh", @"564654", @"56548", @"fgmjfgmf", @"ggkdj", nil];
    self.array = list;

    int selectedIndex;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)getKeyForIndex:(int)index
{
    return [NSString stringWithFormat:@"KEY%d",index];
}

- (BOOL) getCheckedForIndex:(int)index
{
    if([[[NSUserDefaults standardUserDefaults] valueForKey:[self getKeyForIndex:index]] boolValue]==YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void) checkedCellAtIndex:(int)index
{
    BOOL boolChecked = [self getCheckedForIndex:index];
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:!boolChecked] forKey:[self getKeyForIndex:index]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Here, you can check for previously checked cells like
    
    static NSString *subviewCells = @"Cells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:subviewCells];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:subviewCells];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    if([self getCheckedForIndex:indexPath.row]==YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //Use checkedCellAtIndex for check or uncheck cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self checkedCellAtIndex:indexPath.row];
    
    if([self getCheckedForIndex:indexPath.row]==YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}


@end
