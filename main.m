//
//  main.m
//  Lab6_1
//
//  Created by Admin on 11.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Analyser.h"

int main(int argc, const char * argv[]) {
    
    Analyser *analys = [[Analyser alloc] init];
    NSString *text = @"LLL hdirm LLL sfet mam oooooo mam eubr pdjr mam eeeee eeeee eeeee eeeee dirntns er er er er er";
    
    [analys foo: text];
   
    return 0;
    
}
