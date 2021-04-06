//
//  ShowViewController.h
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import <UIKit/UIKit.h>
#import "ToDoClass.h"

@interface ShowViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@property ToDoClass *data;

@end

