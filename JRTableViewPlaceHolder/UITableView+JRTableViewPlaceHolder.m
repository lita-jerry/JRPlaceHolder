//
//  UITableView+JRTableViewPlaceHolder.m
//  JRTableViewPlaceHolderDemo
//

#import "UITableView+JRTableViewPlaceHolder.h"
#import <objc/runtime.h>

@implementation UITableView (JRTableViewPlaceHolder)

- (void)jr_configureWithPlaceHolderBlock:(JRPlaceHolderBlock)block normalBlock:(JRPlaceHolderNormalBlock)normal{
    self.jr_placeHolderBlock = [block copy];
    if(self.jr_placeHolderBlock){
        [self jrPlaceHolder_swizzling];
        self.jrPlaceHolder_configure = YES;
        self.jr_placeHolderNormalBlock = [normal copy];
        return;
    }
    self.jrPlaceHolder_configure = NO;
}

- (void)jrPlaceHolder_swizzling {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(reloadData);
        SEL swizzledSelector = @selector(jr_reloadData);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)jr_reloadData {
    [self jr_reloadData];
    
    if(!self.jrPlaceHolder_isConfigured) return;
    
    BOOL isEmpty = YES;
    
    id<UITableViewDataSource> src = self.dataSource;
    NSInteger sections = 1;
    if ([src respondsToSelector: @selector(numberOfSectionsInTableView:)]) {
        sections = [src numberOfSectionsInTableView:self];
    }
    for (int i = 0; i<sections; ++i) {
        NSInteger rows = [src tableView:self numberOfRowsInSection:i];
        if (rows) {
            isEmpty = NO;
        }
    }
    if(isEmpty){
        if(self.jr_placeHolderView){
            //Prevent repeated addition view
            [self.jr_placeHolderView removeFromSuperview];
            self.jr_placeHolderView = nil;
        }
        //show the placeHolder view
        self.jr_placeHolderView = self.jr_placeHolderBlock(self);
        if(!self.jr_placeHolderView) @throw [NSException exceptionWithName:NSGenericException
                                                 reason:[NSString stringWithFormat:@"must return a view at the time of calling the jr_configureWithPlaceHolderBlock:: in the first block."]
                                               userInfo:nil];
//        self.jr_placeHolderView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height); https://github.com/JerryLoveRice/JRPlaceHolder/issues/1
        self.jr_placeHolderView.frame = self.bounds;
        [self addSubview:self.jr_placeHolderView];
    }else{
        //remove the placeHolder from super view
        [self.jr_placeHolderView removeFromSuperview];
        self.jr_placeHolderView = nil;
        if(self.jr_placeHolderNormalBlock) self.jr_placeHolderNormalBlock(self);
    }
}

#pragma mark - category property getter and setter method
- (BOOL)jrPlaceHolder_isConfigured {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setJrPlaceHolder_configure:(BOOL)isConfigured {
    NSNumber *boolValue = [NSNumber numberWithBool:isConfigured];
    objc_setAssociatedObject(self, @selector(jrPlaceHolder_isConfigured), boolValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JRPlaceHolderBlock)jr_placeHolderBlock {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setJr_placeHolderBlock:(JRPlaceHolderBlock)block {
    objc_setAssociatedObject(self, @selector(jr_placeHolderBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (JRPlaceHolderNormalBlock)jr_placeHolderNormalBlock {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setJr_placeHolderNormalBlock:(JRPlaceHolderNormalBlock)block {
    objc_setAssociatedObject(self, @selector(jr_placeHolderNormalBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *)jr_placeHolderView {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setJr_placeHolderView:(UIView *)view {
    objc_setAssociatedObject(self, @selector(jr_placeHolderView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
