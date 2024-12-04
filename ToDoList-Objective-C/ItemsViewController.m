//
//  ViewController.m
//  ToDoList-Objective-C
//
//  Created by Christian Manzaraz on 03/12/2024.
//

#import "ItemsViewController.h"
#import "Item.h"

// Conform to UITableViewDataSource
@interface ItemsViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *items;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureNavBar];
    
    // table view's data
    self.items = [[NSMutableArray alloc] initWithArray:[Item fetchItems]];
    
    self.tableView.dataSource = self;
    
}


-(void) configureNavBar {
    // 1.  Create an image for the bar button item
    UIImage *image = [UIImage systemImageNamed:@"plus"];
    
    
    // 2.  Create bar button item
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(addItem)];
    
    
    // 3.  Set the "plusButton" as the right bar button item
    self.navigationItem.rightBarButtonItem = plusButton;
    
    self.navigationItem.title = @"To-Do List";
    self.navigationController.navigationBar.prefersLargeTitles = true;
}


-(void)addItem {
    // 1.  Initialize an alert controller
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add a new To-Do list item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    // 2.  Add two text fields to the alert controller
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // code here...
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // Code here..
    }];
    
    
    // 3.  Add placeholder text to the text fields
    alertController.textFields[0].placeholder = @"Enter the name of the item.";
    alertController.textFields[1].placeholder = @"Enter the topic.";
    
    
    // 4.  Define action items "Cancel" and "Save".
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // Handler code here.
    }];
    
    UIAlertAction *saveButton = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Handler code here
        // 1. Insert the new Item
        NSString *name = alertController.textFields[0].text;
        NSString *topic = alertController.textFields[1].text;
        Item *newItem = [[Item alloc] initWithName:name andTopic:topic];
        [self.items addObject:newItem];
        
        
        // 2.  Create an indexPath at the end of items array
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count - 1 inSection:0];
        
        
        // 3.  Insert indexpath into table view
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    
    // 5.  Add actions to the alert controller
    [alertController addAction:cancelButton];
    [alertController addAction:saveButton];
    
    [self presentViewController:alertController animated:true completion:nil];
}


#pragma mark - UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    Item *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    cell.detailTextLabel.text = item.topic;
    cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    return cell;
}

@end
