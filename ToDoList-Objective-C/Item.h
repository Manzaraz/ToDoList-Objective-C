//
//  Item.h
//  ToDoList-Objective-C
//
//  Created by Christian Manzaraz on 04/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject
// Properties
@property NSString *name;
@property NSString *topic;


// Initializer
// Item *item = [[Item alloc] init];
// item.name =
// item.topic =
// Item *item = [[Item alloc] initWithName:@"" topic:@""];
-(instancetype)initWithName: (NSString *)name andTopic: (NSString *)topic;


// Methods
+(NSArray *)fetchItems; // [Item fetchItems]; // returns an array of items


@end

NS_ASSUME_NONNULL_END
