//
//  firstTableViewController.m
//  JRTableViewPlaceHolderDemo
//
//  Created by Jerry on 7/29/16.
//  Copyright © 2016 com.JerryGod. All rights reserved.
//

#import "firstTableViewController.h"
#import "UITableView+JRTableViewPlaceHolder.h"

@interface firstTableViewController ()

@property (nonatomic, assign) NSInteger numberOfRows;

@end

@implementation firstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __typeof(self)weakSelf = self;
    [self.tableView jr_configureWithPlaceHolderBlock:^UIView * _Nonnull(UITableView * _Nonnull sender) {
        [weakSelf.tableView setScrollEnabled:NO];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [btn setImage:[UIImage imageNamed:@"reload_icon"] forState:UIControlStateNormal];
        [btn addTarget:weakSelf.tableView action:@selector(reloadData) forControlEvents:UIControlEventTouchUpInside];
        UIView *v = [[UIView alloc] initWithFrame:weakSelf.tableView.bounds];
        v.backgroundColor = [UIColor lightGrayColor];
        [v addSubview:btn];
        btn.center = weakSelf.tableView.center;
        return v;
    } normalBlock:^(UITableView * _Nonnull sender) {
        [weakSelf.tableView setScrollEnabled:YES];
    }];
    
    [self.tableView reloadData];//测试是否多次添加view
    [self.tableView reloadData];
    [self.tableView reloadData];
    [self.tableView reloadData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"the cell is test %d", indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}


- (IBAction)addTheNumberOfCell:(UIButton *)sender {
    self.numberOfRows++;
    [self.tableView reloadData];
}
- (IBAction)reduceTheNumberOfCell:(UIButton *)sender {
    self.numberOfRows--;
    if(self.numberOfRows < 0) self.numberOfRows = 0;
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
