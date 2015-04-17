@import UIKit;
@import XCTest;

#import "JSON.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testFromFileNamed
{
    XCTAssertNotNil([JSON fromFileNamed:@"simple.json" inBundle:[NSBundle bundleForClass:[self class]]]);
}

@end
