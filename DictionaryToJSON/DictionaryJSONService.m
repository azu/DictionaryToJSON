//
//  DictionaryJSONService.m
//  DictionaryToJSON
//
//  Created by azu on 2015/10/12.
//  Copyright © 2015年 azu. All rights reserved.
//

#import "DictionaryJSONService.h"
#import "TTTDictionary.h"
@implementation DictionaryJSONService
+ (NSString *)toJSON:(id)jsonObject {
    NSError *error = nil;
    id jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"%@", error);
        return @"";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

+ (NSString *)jsonDictionaryList {
    NSSet *dictSet = [TTTDictionary availableDictionaries];
    NSMutableArray *array = [NSMutableArray array];
    for(TTTDictionary *dict in dictSet){
        [array addObject:@{
                           @"name":dict.name,
                           @"shortName":dict.shortName
        }];
    }
    return [self toJSON:array];
}

+ (NSString *)search:(NSString *)dictName term:(NSString *)term{
    TTTDictionary *dictionary = [TTTDictionary dictionaryNamed:dictName];
    NSMutableArray *array = [NSMutableArray array];
    for (TTTDictionaryEntry *entry in [dictionary entriesForSearchTerm:term]) {
        [array addObject:@{
                           @"headword": entry.headword ?: @"",
                           @"text": entry.text ?: @"",
                           @"HTML": entry.HTML ?:@""
                           }];
    }
    return [self toJSON:array];
}
@end
