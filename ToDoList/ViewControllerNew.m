//
//  ViewControllerNew.m
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import "ViewControllerNew.h"
#import "ToDoClass.h"
#import "ShowViewController.h"
#import "AddToDoViewController.h"
@interface ViewControllerNew ()
@property int segmentedType;
@property ToDoClass *tmp;
@property ToDoClass *selected;
@property ToDoClass *addToDo;
@property NSMutableArray *tmpList;
@property NSMutableArray *selectedList;

@end

@implementation ViewControllerNew

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _tmp = [ToDoClass new];
    _segmentedType = 0;
    ToDoClass *t1 = [ToDoClass new];
    [t1 setData:@"go ITI" :@"for Learnig" :High:ToDo];
    
    ToDoClass *t2 = [ToDoClass new];
    [t2 setData:@"go home" :@"for resting" :High:Progress];
    
    ToDoClass *t4 = [ToDoClass new];
    [t4 setData:@"go out" :@"for anything" :Medium:ToDo];
    
    ToDoClass *t3 = [ToDoClass new];
    [t3 setData:@"hit" :@"hit someone" :Low:Done];
    
    
    
    _todoList = [[NSMutableArray alloc] initWithObjects:t1,t2,t3,t4, nil];
    
    _tmpList = _todoList;
    
    
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    _selectedList  = [NSMutableArray new];
    [self.myTable reloadData];

}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    _tmp = _todoList[indexPath.row];
    
    switch (_tmp.pri) {
        case High:
            [cell.imageView setImage:[UIImage imageNamed:@"high.png"]];
            break;
        case Medium:
            [cell.imageView setImage:[UIImage imageNamed:@"medium.png"]];
            break;
        case Low:
            [cell.imageView setImage:[UIImage imageNamed:@"low.png"]];
            break;
        default:
            break;
    }
    cell.textLabel.text = _tmp.title;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _todoList.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_segmentedType!=4) {
        return 1;
    }else{
        return 3;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [_todoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
- (IBAction)segmentedTab:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _todoList = _tmpList;
            [_myTable reloadData];
            break;
        case 1:
            _selectedList = [NSMutableArray new];
            _todoList = _tmpList;
            
            for (int i = 0; i < _todoList.count; i++) {
                _tmp = _todoList[i];
                if (_tmp.statusToDo == 0) {
                    [_selectedList addObject:_tmp];
                }
            }
            _todoList = _selectedList;
            [_myTable reloadData];
            break;
        case 2:
            _selectedList = [NSMutableArray new];
            _todoList = _tmpList;
            
            for (int i = 0; i < _todoList.count; i++) {
                _tmp = _todoList[i];
                if (_tmp.statusToDo == 1) {
                    [_selectedList addObject:_tmp];
                }
            }
            _todoList = _selectedList;
            [_myTable reloadData];
            break;
        case 3:
                _selectedList = [NSMutableArray new];
                _todoList = _tmpList;
                
                for (int i = 0; i < _todoList.count; i++) {
                    _tmp = _todoList[i];
                    if (_tmp.statusToDo == 2) {
                        [_selectedList addObject:_tmp];
                    }
                }
            _todoList = _selectedList;
            [_myTable reloadData];
            break;
        
        case 4:
                    _selectedList = [NSMutableArray new];
                    _todoList = _tmpList;
                    
                    for (int i = 0; i < _todoList.count; i++) {
                        _tmp = _todoList[i];
                        if (_tmp.pri == 0) {
                            [_selectedList addObject:_tmp];
                        }
                    }
            for (int i = 0; i < _todoList.count; i++) {
                _tmp = _todoList[i];
                if (_tmp.pri == 1) {
                    [_selectedList addObject:_tmp];
                }
            }
            for (int i = 0; i < _todoList.count; i++) {
                _tmp = _todoList[i];
                if (_tmp.pri == 2) {
                    [_selectedList addObject:_tmp];
                }
            }
            _todoList = _selectedList;
            [_myTable reloadData];
            break;
            
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        
        ShowViewController *shC = segue.destinationViewController;
        NSIndexPath *num = [[self myTable] indexPathForSelectedRow];
        
        
        _selected = [_todoList objectAtIndex:num.row];
        
        
        shC.data = _selected;
//        NSLog(@"%u", _selected.pri);
    }else if ([segue.identifier isEqualToString:@"addToDo"]){
        AddToDoViewController *dC = segue.destinationViewController;
        dC.khtab = self;
        
    }
    
}
@end
