//
//  EditViewController.m
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _priorityPicker.delegate = self;
    _priorityPicker.dataSource = self;
    
    _statusPicker.delegate = self;
    _statusPicker.dataSource = self;
    
    _titleTxt.text = _editToDo.title;
    _descTxt.text = _editToDo.desc;
    
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
        _statusTxt = _status[row];
    }else{
        _priorityTxt = _priority[row];
    }
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == _statusPicker) {
        return _status[row];
    }else{
        return _priority[row];
    }
    
}
- (IBAction)editBtn:(UIButton *)sender {
}
@end
