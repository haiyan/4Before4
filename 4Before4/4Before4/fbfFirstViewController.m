//
//  fbfFirstViewController.m
//  4Before4
//
//  Created by Haiyan Zhang on 30/05/2014.
//  Copyright (c) 2014 Haiyan Zhang. All rights reserved.
//

#import "fbfFirstViewController.h"



@interface fbfFirstViewController ()

@end

@implementation fbfFirstViewController

@synthesize databaseDate;
@synthesize txtCountdown;
@synthesize Button1;
@synthesize Button2;
@synthesize Button3;
@synthesize Button4;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self showClock];
    
    [Button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [Button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [Button3 addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [Button4 addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showClock {
    NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
    if (!timer || remainingSec <= 0) {
        [timer invalidate];
        timer = nil;
        // getting time from database
        //self.databaseDate = [NSDate dateWithTimeIntervalSinceNow:100.0];
        self.databaseDate = [NSDate date];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self.databaseDate];
        [components setHour:16];
        //if ([calendar timeIntervalSinceNow] < 0) {
            NSInteger n = [components day];
            //n += 1;
            [components setDay:n];
        //}
        self.databaseDate = [calendar dateFromComponents:components];
        
        remainingSec = [databaseDate timeIntervalSinceNow];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                               selector:@selector(showClock)
                                               userInfo:nil
                                                repeats:YES];
    }
    
    NSInteger hours = remainingSec / 3600;
    NSInteger remainder = ((NSInteger)remainingSec)% 3600;
    NSInteger minutes = remainder / 60;
    NSInteger seconds = remainder % 60;
    
    txtCountdown.text = [NSString stringWithFormat:@"%02d hours %02d minutes %02d seconds", hours, minutes, seconds];
}

-(IBAction)buttonPressed:(id)sender
{
    
    if (sender == Button1) {
        currPicker = self.Image1;
        [Button1 setTitle:@"Challenge" forState:(UIControlState)UIControlStateNormal];
        [Button1 setTitle:@"Challenge" forState:(UIControlState)UIControlStateHighlighted];
        Button1.hidden = YES;
    } else if (sender == Button2) {
        currPicker = self.Image2;
        [Button2 setTitle:@"Challenge" forState:(UIControlState)UIControlStateNormal];
        [Button2 setTitle:@"Challenge" forState:(UIControlState)UIControlStateHighlighted];
        Button2.hidden = YES;
    } else if (sender == Button3) {
        currPicker = self.Image3;
        [Button3 setTitle:@"Challenge" forState:(UIControlState)UIControlStateNormal];
        [Button3 setTitle:@"Challenge" forState:(UIControlState)UIControlStateHighlighted];
        Button3.hidden = YES;
    } else if (sender == Button4) {
        currPicker = self.Image4;
        [Button4 setTitle:@"Challenge" forState:(UIControlState)UIControlStateNormal];
        [Button4 setTitle:@"Challenge" forState:(UIControlState)UIControlStateHighlighted];
        Button4.hidden = YES;
    }
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    /**cameraUI.mediaTypes =
     [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeCamera];
     **/
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = YES;
    
    cameraUI.delegate = self;
    [self presentViewController:cameraUI animated:YES completion:NULL];
}


#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    currPicker.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
