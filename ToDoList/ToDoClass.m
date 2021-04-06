//
//  ToDoClass.m
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#import "ToDoClass.h"
@implementation ToDoClass

-(void) setData:(NSString*) titI:(NSString*)desI:(enum priority)pI:(enum status)stu{
    _title = titI;
    _desc = desI;
    _pri = pI;
    _statusToDo = stu;
}

@end
