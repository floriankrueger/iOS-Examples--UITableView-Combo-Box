//
//  RootViewController.m
//  DropDownTest
//
//  Created by Florian Krüger on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DropDownCell.h"

@interface RootViewController ()

- (void)internalSetup;

@end

@implementation RootViewController

- (id)init
{
    if (self = [super init]) {
        [self internalSetup];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        [self internalSetup];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self internalSetup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self internalSetup];
    }
    
    return self;
}

- (void)internalSetup
{
    dropDown1 = @"Option 1";
    dropDown2 = @"Option 1";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0: 
            if (dropDown1Open) {
                return 4;
            }
            else
            {
                return 1;
            }
            break;
        
        case 1:
            if (dropDown2Open) {
                return 4;
            }
            else
            {
                return 1;
            }
        default:
            return 1;
            break;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSString *DropDownCellIdentifier = @"DropDownCell";
    
    switch ([indexPath section]) {
        case 0: {
    
            switch ([indexPath row]) {
                case 0: {
                 
                    DropDownCell *cell = (DropDownCell*) [tableView dequeueReusableCellWithIdentifier:DropDownCellIdentifier];
                    
                    if (cell == nil){
                        NSLog(@"New Cell Made");
                        
                        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DropDownCell" owner:nil options:nil];
                        
                        for(id currentObject in topLevelObjects)
                        {
                            if([currentObject isKindOfClass:[DropDownCell class]])
                            {
                                cell = (DropDownCell *)currentObject;
                                break;
                            }
                        }
                        
                        if (dropDown1Open) {
                            [cell setOpen];
                        }
                        
                        [[cell textLabel] setText:dropDown1];
                    }
                    
                    // Configure the cell.
                    return cell;
                    
                    break;
                }
                default: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    
                    if (cell == nil) {
                        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                    }
                    
                    NSString *label = [NSString stringWithFormat:@"Option %i", [indexPath row]];
                    
                    [[cell textLabel] setText:label];
                    
                    // Configure the cell.
                    return cell;
                    
                    break;
                }
            }

            break;
        }
        case 1: {

            switch ([indexPath row]) {
                case 0: {
                    DropDownCell *cell = (DropDownCell*) [tableView dequeueReusableCellWithIdentifier:DropDownCellIdentifier];
                    
                    if (cell == nil){
                        NSLog(@"New Cell Made");
                        
                        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DropDownCell" owner:nil options:nil];
                        
                        for(id currentObject in topLevelObjects)
                        {
                            if([currentObject isKindOfClass:[DropDownCell class]])
                            {
                                cell = (DropDownCell *)currentObject;
                                break;
                            }
                        }
                        
                        if (dropDown2Open) {
                            [cell setOpen];
                        }
                        
                        [[cell textLabel] setText:dropDown2];
                    }
                    
                    // Configure the cell.
                    return cell;
                    
                    break;
                }
                default: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    
                    if (cell == nil) {
                        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
                    }
                    
                    NSString *label = [NSString stringWithFormat:@"Option %i", [indexPath row]];
                    
                    [[cell textLabel] setText:label];
                    
                    // Configure the cell.
                    return cell;
                    
                    break;
                }
            }
            
            break;
        }
        case 2: {

            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            }

            [[cell textLabel] setText:@"Save"];
            
            // Configure the cell.
            return cell;
            
            break;
        }
        default:
            
            return nil;
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
    
    switch ([indexPath section]) {
        case 0: {
            
            switch ([indexPath row]) {
                case 0:
                {
                    DropDownCell *cell = (DropDownCell*) [tableView cellForRowAtIndexPath:indexPath];
                    
                    NSIndexPath *path0 = [NSIndexPath indexPathForRow:[indexPath row]+1 inSection:[indexPath section]];
                    NSIndexPath *path1 = [NSIndexPath indexPathForRow:[indexPath row]+2 inSection:[indexPath section]];
                    NSIndexPath *path2 = [NSIndexPath indexPathForRow:[indexPath row]+3 inSection:[indexPath section]];
                    
                    NSArray *indexPathArray = [NSArray arrayWithObjects:path0, path1, path2, nil];
                    
                    if ([cell isOpen])
                    {
                        [cell setClosed];
                        dropDown1Open = [cell isOpen];
                        
                        [tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
                    }
                    else
                    {
                        [cell setOpen];
                        dropDown1Open = [cell isOpen];
                        
                        [tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
                    }
                    
                    break;
                }   
                default:
                {
                    dropDown1 = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
                    
                    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
                    DropDownCell *cell = (DropDownCell*) [tableView cellForRowAtIndexPath:path];
                    
                    [[cell textLabel] setText:dropDown1];
                    
                    break;
                }
            }
            
            break;
        }
        case 1: {
            
            switch ([indexPath row]) {
                case 0:
                {
                    DropDownCell *cell = (DropDownCell*) [tableView cellForRowAtIndexPath:indexPath];
                    
                    NSIndexPath *path0 = [NSIndexPath indexPathForRow:[indexPath row]+1 inSection:[indexPath section]];
                    NSIndexPath *path1 = [NSIndexPath indexPathForRow:[indexPath row]+2 inSection:[indexPath section]];
                    NSIndexPath *path2 = [NSIndexPath indexPathForRow:[indexPath row]+3 inSection:[indexPath section]];
                    
                    NSArray *indexPathArray = [NSArray arrayWithObjects:path0, path1, path2, nil];
                    
                    if ([cell isOpen])
                    {
                        [cell setClosed];
                        dropDown2Open = [cell isOpen];
                        
                        [tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
                    }
                    else
                    {
                        [cell setOpen];
                        dropDown2Open = [cell isOpen];
                        
                        [tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
                    }
                    
                    break;
                }   
                default:
                {
                    dropDown2 = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
                    
                    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
                    DropDownCell *cell = (DropDownCell*) [tableView cellForRowAtIndexPath:path];
                    
                    [[cell textLabel] setText:dropDown2];
                    
                    // close the dropdown cell
                    
                    NSIndexPath *path0 = [NSIndexPath indexPathForRow:[path row]+1 inSection:[indexPath section]];
                    NSIndexPath *path1 = [NSIndexPath indexPathForRow:[path row]+2 inSection:[indexPath section]];
                    NSIndexPath *path2 = [NSIndexPath indexPathForRow:[path row]+3 inSection:[indexPath section]];
                    
                    NSArray *indexPathArray = [NSArray arrayWithObjects:path0, path1, path2, nil];
                    
                    [cell setClosed];
                    dropDown2Open = [cell isOpen];
                    
                    [tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
                    
                    break;
                }
            }
            
            break;
        }
        case 2: {
            
            NSString *msg = [NSString stringWithFormat:@"First Option: %@ \nSecond Option: %@", dropDown1, dropDown2];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hi there!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert autorelease];
            [alert show];
            
            break;
        }
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
