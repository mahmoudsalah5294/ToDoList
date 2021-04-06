//
//  DetailsViewController.m
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import "AddToDoViewController.h"


@interface AddToDoViewController ()

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _priorityPicker.delegate = self;
    _priorityPicker.dataSource = self;
    
    _statusPicker.delegate = self;
    _statusPicker.dataSource = self;
    
    
    
    _priority = [[NSArray alloc] initWithObjects:@"High",@"Medium",@"Low", nil];
    
    _status = [[NSArray alloc] initWithObjects:@"ToDo",@"Progress",@"Done", nil];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == _statusPicker) {
        _statusRank =(int)row;
    }else{
        _priorityRank = (int)row;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == _statusPicker) {
        return _status[row];
    }else{
        return _priority[row];
    }
    
}
- (IBAction)add:(UIButton *)sender {
    
    
        ToDoClass *todo = [ToDoClass new];
        todo.title = _titleInput.text;
        todo.desc = _descriptionInput.text;
        todo.pri = _priorityRank;
        todo.statusToDo = _statusRank;
        [self.khtab.todoList addObject:todo];
        [self.navigationController popViewControllerAnimated:YES];
    
}
@end
