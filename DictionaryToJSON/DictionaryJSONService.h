//
//  DictionaryJSONService.h
//  DictionaryToJSON
//
//  Created by azu on 2015/10/12.
//  Copyright © 2015年 azu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryJSONService : NSObject
+ (NSString *)jsonDictionaryList;

+ (NSString *)search:(NSString *)dictName term:(NSString *)term;
@end
