#import "JSON.h"

@implementation JSON

+ (id)fromFileNamed:(NSString *)fileName
{
    return [self fromFileNamed:fileName inBundle:[NSBundle mainBundle]];
}

+ (id)fromFileNamed:(NSString *)fileName inBundle:(NSBundle *)bundle
{
    NSString *filePath = [bundle pathForResource:[fileName stringByDeletingPathExtension]
                                          ofType:[fileName pathExtension]];

    NSAssert(filePath, @"JSON file not found");

    NSData *data = [NSData dataWithContentsOfFile:filePath];

    NSError *error = nil;

    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    if (error) {
        NSLog(@"JSON file error: %@", error);
    }

    return result;
}

@end
