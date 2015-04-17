#import "JSON.h"

@implementation JSON

+ (id)fromFileNamed:(NSString *)fileName {
    return [self fromFileNamed:fileName inBundle:[NSBundle mainBundle]];
}

+ (id)fromFileNamed:(NSString *)fileName inBundle:(NSBundle *)bundle {
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

@implementation NSObject (JSON)

- (void)prettyPrint {
    NSError *error = nil;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    NSLog(@"JSON: %@", jsonString);
}

@end
