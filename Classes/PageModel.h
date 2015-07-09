//
//  PageModel.h
//  FlipView
//
//  Created by VhaL on 7/9/15.
//
//

#import <Foundation/Foundation.h>

@interface PageModel : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *pageNumber;
@property (nonatomic, strong) NSString *layoutNumber;
@property (nonatomic, strong) NSMutableArray *messages;

@end
