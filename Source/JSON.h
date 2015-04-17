@import Foundation;

@interface JSON : NSObject

+ (id)fromFileNamed:(NSString *)fileName;

+ (id)fromFileNamed:(NSString *)fileName inBundle:(NSBundle *)bundle;

@end
