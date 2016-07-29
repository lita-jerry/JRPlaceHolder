//
//  UITableView+JRTableViewPlaceHolder.h
//  JRTableViewPlaceHolderDemo
//
// This code is distributed under the terms and conditions of the Jerry license.

// Copyright (c) 2016 Jerry ( http://www.JerryGod.com )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if NS_BLOCKS_AVAILABLE
typedef  UIView * _Nonnull (^JRPlaceHolderBlock)(UITableView * _Nonnull sender);
typedef void (^JRPlaceHolderNormalBlock)(UITableView * _Nonnull sender);
#endif

#ifndef JR_STRONG
#if __has_feature(objc_arc)
#define JR_STRONG strong
#else
#define JR_STRONG retain
#endif
#endif

@interface UITableView (JRTableViewPlaceHolder)
NS_ASSUME_NONNULL_BEGIN
/**
 *  this is the tableview's place holder view, when the tableView's data is empty, call addSubView: with the jr_placeHolderView on tableView.
 */
@property (nonatomic, JR_STRONG) UIView * _Nullable jr_placeHolderView;

/**
 *  Configure the category method, Call the first block when data is empty. Call the second block when data is empty.
 *
 *  @param block  After call the block need to return a view as a subView on the tableView, in the block, you can call a coherent method as configuring the tableView, such as the prohibition scrolling and display an error message, and finally must return a view, as the tableView's placeHolder view.
 *  @param normal Block called when tableView's data is normal, the main purpose is to restore tableView style, such as previously set up scrolling is disabled, this time need to re-set.
 */
- (void)jr_configureWithPlaceHolderBlock:(JRPlaceHolderBlock)block normalBlock:(_Nullable JRPlaceHolderNormalBlock)normal;

@end
NS_ASSUME_NONNULL_END
