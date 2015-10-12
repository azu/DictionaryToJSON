//
//  main.m
//  DictionaryToJSON
//
//  Created by azu on 2015/10/12.
//  Copyright © 2015年 azu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DictionaryJSONService.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *list = [DictionaryJSONService jsonDictionaryList];
        // insert code here...
        NSLog(@"%@", list);
        
        NSString *result = [DictionaryJSONService search:@"英辞郎 Ver.146" term:@"英語"];
        NSLog(@"%@", result);
    }
    return 0;
}
