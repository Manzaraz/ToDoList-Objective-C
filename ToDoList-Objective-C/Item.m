//
//  Item.m
//  ToDoList-Objective-C
//
//  Created by Christian Manzaraz on 04/12/2024.
//

#import "Item.h"

@implementation Item
- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
    if (self = [super init]) {
        // initialize all properties here...
        self.name = name;
        self.topic = topic;
    }
    return self;
}


+ (NSArray *)fetchItems {
    return @[
        [[Item alloc] initWithName:@"Coffee with Facebook Engineer" andTopic:@"Informational interview"],
        [[Item alloc] initWithName:@"Phone interview with Snap" andTopic:@"2nd Interview"],
        [[Item alloc] initWithName:@"Review Hash Tables" andTopic:@"DSA"],
        [[Item alloc] initWithName:@"Push app to TestFlight" andTopic:@"iOS app development"],
        [[Item alloc] initWithName:@"Update README for Capstone Project" andTopic:@"GitHub"]
    ];
}


@end
