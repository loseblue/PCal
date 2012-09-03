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

@end
