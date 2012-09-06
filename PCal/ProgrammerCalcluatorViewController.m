//
//  ProgrammerCalcluatorViewController.m
//  PCal
//
//  Created by loseblue on 12-9-2.
//  Copyright (c) 2012 loseblue. All rights reserved.
//

#import "ProgrammerCalcluatorViewController.h"

@implementation ProgrammerCalcluatorViewController
@synthesize labelDisplay = _labelDisplay;

bool firstInputFlag = FALSE;
NSInteger tempDigital = 0;
NSString *tempOperation;

- (IBAction)buttonDigit:(UIButton *)sender
{
    // NSString *myDigital = sender.currentTitle;
    
    // NSLog(@"digit pressed is %@", myDigital);
    
    if (FALSE == firstInputFlag)
    {
        if (![sender.currentTitle isEqual:@"0"])
        {
            self.labelDisplay.text = sender.currentTitle;
            firstInputFlag = TRUE;
        }
    }
    else
    {
        self.labelDisplay.text = [self.labelDisplay.text stringByAppendingString:sender.currentTitle];
    }
}
- (IBAction)buttonOperation:(UIButton *)sender
{
    // NSInteger tempDigital = [self.labelDisplay.text integerValue];
    // NSLog(@"digital is %d",tempDigital);
    
    if([sender.currentTitle isEqual:@"="])
    {
        if ([tempOperation isEqual:@"+"])
        {
            tempDigital = tempDigital + [self.labelDisplay.text integerValue];
            // NSLog(@"digital 2 is %d,%d",tempDigital,[self.labelDisplay.text integerValue]);
        }
        else if ([tempOperation isEqual:@"-"])
        {
            tempDigital = tempDigital - [self.labelDisplay.text integerValue];
        }
        
        self.labelDisplay.text = [NSString stringWithFormat:@"%d",tempDigital];
        tempOperation = nil;
        tempDigital = 0;
        firstInputFlag = FALSE;
        
        return;
    }
    else if ([sender.currentTitle isEqual:@"+"])
    {
        tempDigital = tempDigital + [self.labelDisplay.text integerValue];
        // NSLog(@"digital 2 is %d,%d",tempDigital,[self.labelDisplay.text integerValue]);
    }
    else if ([sender.currentTitle isEqual:@"-"])
    {
        tempDigital = tempDigital - [self.labelDisplay.text integerValue];
    }
    
    tempOperation = sender.currentTitle;
    self.labelDisplay.text = @"0";
    firstInputFlag = FALSE;
    
    
}

@end
