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

//tempOperation 1:+ 2:-
NSInteger tempOperation = 0;

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
        if (1 == tempOperation)//+
        {
            tempDigital = tempDigital + [self.labelDisplay.text integerValue];
        }
        else if (2 == tempOperation) //-
        {
            tempDigital = tempDigital - [self.labelDisplay.text integerValue];
        }
        
        self.labelDisplay.text = [NSString stringWithFormat:@"%d",tempDigital];
        tempOperation = 0;
        tempDigital = 0;
    }
    else
    {
        if (0 == tempOperation)
        {
            tempDigital = [self.labelDisplay.text integerValue];
        }
        else if (1 == tempOperation)
        {
            tempDigital = tempDigital + [self.labelDisplay.text integerValue];
        }
        else if (2 == tempOperation)
        {
            tempDigital = tempDigital - [self.labelDisplay.text integerValue];
        }
        
        self.labelDisplay.text = [NSString stringWithFormat:@"%d",tempDigital];
        if ([sender.currentTitle isEqual:@"+"])
            tempOperation = 1;
        else if ([sender.currentTitle isEqual:@"-"])
            tempOperation = 2;
    }
    firstInputFlag = FALSE;
}

- (IBAction)buttonClean:(UIButton *)sender
{
    tempOperation = 0;
    tempDigital = 0;
    firstInputFlag = FALSE;
    self.labelDisplay.text = @"0";
}

@end
