//
//  Feeds.m
//  FlipView
//
//  Created by VhaL on 7/4/15.
//
//

#import "Feeds.h"
#import "MessageModel.h"
#import "PageModel.h"

@implementation Feeds

+(NSMutableArray*)generateSampleFeeds{

    NSMutableArray *pages = [NSMutableArray new];

    //page 1
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout1";
        page.headerTitle = @"Layout1";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 1; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }

    
    //page 2
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout2";
        page.headerTitle = @"Layout2";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 2; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    
    //page 3
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout3";
        page.headerTitle = @"Layout3";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 3; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    //page 4
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout4";
        page.headerTitle = @"Layout4";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 4; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    //page 5
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout5";
        page.headerTitle = @"Layout5";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 5; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    //page 6
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout6";
        page.headerTitle = @"Layout6";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 5; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    //page 7
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout7";
        page.headerTitle = @"Layout7";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 5; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    //page 8
    {
        PageModel *page = [PageModel new];
        page.layoutNumber = @"Layout8";
        page.headerTitle = @"Layout8";
        
        NSMutableArray *messages = [NSMutableArray new];
        
        for (int i = 1; i <= 5; i++) {
            MessageModel* entry = [MessageModel new];
            entry.messageID= i;
            entry.userName = [NSString stringWithFormat:@"Content:%d", i];
            entry.userImage =  @"missing-people.png";
            entry.createdAt = @"06/07/2011 at 01:00 AM";
            entry.content = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
            [messages addObject:entry];
        }
        
        page.messages = messages;
        [pages addObject:page];
    }
    
    return pages;
}

@end
