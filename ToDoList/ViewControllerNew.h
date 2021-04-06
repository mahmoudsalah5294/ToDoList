//
//  ViewControllerNew.h
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import <UIKit/UIKit.h>

#import "ToDoClass.h"


@interface ViewControllerNew : UIViewController
<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (weak, nonatomic) IBOutlet UITableView *myTable;
- (IBAction)segmentedTab:(UISegmentedControl *)sender;

@property NSMutableArray *todoList;

@end
