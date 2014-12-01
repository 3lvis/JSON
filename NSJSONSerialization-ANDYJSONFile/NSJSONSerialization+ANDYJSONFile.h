@import Foundation;

@interface NSJSONSerialization (ANDYJSONFile)

+ (id)JSONObjectWithContentsOfFile:(NSString *)fileName inBundle:(NSBundle *)bundle;

+ (id)JSONObjectWithContentsOfFile:(NSString *)fileName;

@end
