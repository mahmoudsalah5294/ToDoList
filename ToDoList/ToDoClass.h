//
//  ToDoClass.h
//  ToDoList
//
//  Created by Mahmoud Mohamed on 29/03/2021.
//

#ifndef ToDoClass_h
#define ToDoClass_h


#endif /* ToDoClass_h */

#import <Foundation/Foundation.h>

enum priority{
    High = 0,
    Medium = 1,
    Low = 2
};
enum status{
    ToDo = 0,
    Progress = 1,
    Done = 2
};


@interface ToDoClass : NSObject

@property NSString *title;
@property NSString *desc;
@property enum priority pri;
@property enum status statusToDo;
@property int arrayIndex;


-(void) setData:(NSString*) titI:(NSString*)desI:(enum priority)pI:(enum status)stu;

@end
