
#import "FullScreenDoc.h"
#import <MobileCoreServices/MobileCoreServices.h>


@implementation FullScreenDoc


- (void)setupDocumentControllerWithURL:(NSURL *)url
{
    //checks if docInteractionController has been initialized with the URL
    if (self.docInteractionController == nil)
    {
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
    }
    else
    {
        self.docInteractionController.URL = url;
    }
}


- (void) showDocumentURL:(CDVInvokedUrlCommand*)command{
    // Check command.arguments here.
    [self.commandDelegate runInBackground:^{
        self.documentURLs = [NSMutableArray array];

        NSString *fullPath = [[command.arguments objectAtIndex:0] valueForKey:@"url"];
        NSURL *furl = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fullPath]];
        
        if (furl) {
            
            [self.documentURLs addObject:furl];
            [self setupDocumentControllerWithURL:furl];
            double delayInSeconds = 0.1;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self.docInteractionController presentPreviewAnimated:YES];
            });
            
            
            
        }
    }];
}

- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL
                                               usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate {
    
    UIDocumentInteractionController *interactionController =
    [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    
    return interactionController;
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *) controller {
    return self.viewController;
}



@end

