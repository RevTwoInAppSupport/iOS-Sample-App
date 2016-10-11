//
//  TutorialTableViewController.m
//  RevTwoSample
//
//  Created by Ashley Calder on 9/1/15.
//  Copyright (c) 2015 RevTwo. All rights reserved.
//

#import "TutorialTableViewController.h"
#import "R2CommunityViewController.h"
#import "R2MyTicketViewController.h"


@interface TutorialTableViewController ()

@end

@implementation TutorialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tutorials";
    UIImage* logoImage = [UIImage imageNamed:@"logo_black_sm.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logoImage];
    
    
    self.tutorials = [NSArray arrayWithObjects:
                      @"Logging",
                      @"File Browsing",
                      @"SQLite Database",
                      @"My Tickets View",
                      @"Community Tickets View",
                      nil];
    self.pickedTutorial = NO;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.pickedTutorial = NO;
    /*
     * notification permissions
     */
    UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source




/*
 * SECTIONS
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tutorials count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Tutorials";
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0;
}
/*
 * CELL
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tutorialCell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tutorialCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tutorialCell"];
    }
    //Tutorials
    cell.textLabel.text = [self.tutorials objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 * SELECT CELL
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Tutorials
    if (indexPath.section == 0){
        NSString *tutorial = [self.tutorials objectAtIndex:indexPath.row];
        if (!self.pickedTutorial) {
            self.pickedTutorial = YES;
            //Logging
            if ([tutorial isEqualToString:@"Logging"]) {
                LoggingViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Logging"];
                [self.navigationController pushViewController:vc animated:YES];
            }
            //FileBrowser
            else if ([tutorial isEqualToString:@"File Browsing"]) {
                FileBrowserViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FileBrowser"];
                [self.navigationController pushViewController:vc animated:YES];
            }
            
            //DatabaseBrowser
            else if ([tutorial isEqualToString:@"SQLite Database"]) {
                SQLiteBrowserViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DatabaseBrowser"];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if ([tutorial isEqualToString:@"My Tickets View"]) {
                //push my ticket
                R2MyTicketViewController *vc = [[R2MyTicketViewController alloc]init];
                vc.tags = @[@"yellow", @"blue"];
                [self.navigationController pushViewController:vc animated:YES];
                /*
                //modal my ticket
                R2MyTicketViewController *vc = [[R2MyTicketViewController alloc]init];
                vc.delegateModal = self;
                vc.tags = @[@"yellow", @"blue"];
                UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
                [self presentViewController:nc animated:YES completion:nil];
                 */
            }
            else if ([tutorial isEqualToString:@"Community Tickets View"]) {
                //push community
                R2CommunityViewController *vc = [[R2CommunityViewController alloc]init];
                vc.tags = @[@"yellow"];
                [self.navigationController pushViewController:vc animated:YES];
                /*
                 //modal community
                 R2CommunityViewController *vc = [[R2CommunityViewController alloc]init];
                 vc.delegateModal = self;
                 vc.tags = @[@"yellow"];
                 UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
                 [self presentViewController:nc animated:YES completion:nil];
                 */
            }
            
            
        }
    }
    
    
    
    
    
}


- (void)didDismissR2ViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
