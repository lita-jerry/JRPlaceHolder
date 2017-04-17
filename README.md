# JRPlaceHolder
JRPlaceHolder is a [CYLTableViewPlaceHolder](https://github.com/ChenYilong/CYLTableViewPlaceHolder) framework inspired. Using the [Functional Reactive Programming](https://en.wikipedia.org/wiki/Functional_reactive_programming) ideas, zero costs to integration, It does not affect the previous code, without modifying the code before, Integration costs can be said to be zero.

 1. [Example](#Example)
 1. [Installation](#Installation)
 1. [Usage scenario](#Usage scenario)
 1. [中文](#中文)

## Example
```Objective-C
#import <UITableView+JRTableViewPlaceHolder.h>

...

__weak __typeof(self)weakSelf = self;
[self.tableView jr_configureWithPlaceHolderBlock:^UIView * _Nonnull(UITableView * _Nonnull sender) {
  //do some things, such as pop alert view of wrong reason.
  [weakSelf.tableView setScrollEnabled:NO];
  return placeHolderView;
 } normalBlock:^(UITableView * _Nonnull sender) {
  //do some thins for recovery
  [weakSelf.tableView setScrollEnabled:YES];
}];
//Will auto check whether the data is empty in the [tableView reloadData] method.
```

## Installation
JRPlaceHolder supports `iOS 6.0+`.
Currently does not support the introduction of pod, you can drag the UITableView+JRTableViewPlaceHolder .H and.M file into the yours project(Currently being applied).
In order to gain access to all the files from the repository, you should clone it.
```
git clone --recursive https://github.com/JerrySir/JRPlaceHolder.git
```

## Usage scenario
[Click here](#使用场景)

##中文
 1. [介绍](#介绍)
 1. [使用示例](#使用示例)
 1. [引入方式](#引入方式)
 1. [使用场景](#使用场景)

## 介绍

JRPlaceHolder受[CYLTableViewPlaceHolder](https://github.com/ChenYilong/CYLTableViewPlaceHolder)框架的启发，使用响应式编程思想，将方法尽可能的封装，使用起来更加的方便，既不影响之前的代码，也不用修改现在的代码，只需在所需的位置加一行代码作为配置即可，可以说是零成本集成。

## 使用示例

```Objective-C
#import <UITableView+JRTableViewPlaceHolder.h>

...
__weak __typeof(self)weakSelf = self;
[self.tableView jr_configureWithPlaceHolderBlock:^UIView * _Nonnull(UITableView * _Nonnull sender) {
  //这里做一些空数据的操作，例如弹出一些提醒性的文字等
  [weakSelf.tableView setScrollEnabled:NO]; //禁止tableView滚动
  return placeHolderView; //伪代码，此处返回数据为空时的显示的view
 } normalBlock:^(UITableView * _Nonnull sender) {
  //这里做一些恢复性的操作
  [weakSelf.tableView setScrollEnabled:YES]; //恢复tableView滚动
 }];
 //程序会在[tableView reloadData]方法中自动检查是否为空。
```

## 引入方式

JRPlaceHolder 支持iOS 6.0以上的系统。
暂不支持pod方式引入(正在申请)，需要引入的话可以直接将UITableView+JRTableViewPlaceHolder的.h文件和.m文件拖入到项目中。
如果需要所有的文件和演示的DEMO，可以克隆该库
```
git clone --recursive https://github.com/JerrySir/JRPlaceHolder.git
```

## 使用场景


- | 应用场景之加载失败 |  ---
-------------|-------------|-------------
![应用场景之加载失败](http://a65.tinypic.com/2nqbors.jpg) | ![应用场景之加载失败](http://a64.tinypic.com/17edlv.jpg) | ![应用场景之加载失败](http://a67.tinypic.com/2zg5hrr.jpg)
![应用场景之加载失败](http://a67.tinypic.com/2qx2ryo.jpg) | ![应用场景之加载失败](http://a64.tinypic.com/ms198y.jpg) | ![应用场景之加载失败](http://a66.tinypic.com/2r5eoig.jpg)
![应用场景之加载失败](http://a68.tinypic.com/sblk02.jpg) | ![应用场景之加载失败](http://a64.tinypic.com/2lvfq4y.jpg) | ![应用场景之加载失败](http://a63.tinypic.com/i70g13.jpg)
![应用场景之加载失败](http://a67.tinypic.com/px93s.jpg) | ![应用场景之加载失败](http://a66.tinypic.com/2ai1di.jpg) | ![应用场景之加载失败](http://a68.tinypic.com/mlmukm.jpg)
![应用场景之加载失败](http://a66.tinypic.com/6qxq36.jpg) | ![应用场景之加载失败](http://a66.tinypic.com/68bz7q.jpg) | ![应用场景之加载失败](http://a64.tinypic.com/2qu0yo1.jpg)
![应用场景之加载失败](http://a66.tinypic.com/2h3q4wh.jpg) | ![应用场景之加载失败](http://a65.tinypic.com/2w4b6ag.jpg) | ![应用场景之加载失败](http://a68.tinypic.com/28v9fdw.jpg)
![应用场景之加载失败](http://a65.tinypic.com/311xa9j.jpg) | ![应用场景之加载失败](http://a65.tinypic.com/2zf1g1l.jpg) | ![应用场景之加载失败](http://a63.tinypic.com/11udmbs.jpg)
![应用场景之加载失败](http://a63.tinypic.com/zx703l.jpg) | ![应用场景之加载失败](http://a63.tinypic.com/2chs3uc.jpg) | ![应用场景之加载失败](http://a68.tinypic.com/2a68kty.jpg)
![应用场景之加载失败](http://a67.tinypic.com/htfh1w.jpg) | ![应用场景之加载失败](http://a68.tinypic.com/1zgpykw.jpg)| ![应用场景之加载失败](http://a64.tinypic.com/xgfgi1.jpg)
![应用场景之加载失败](http://a65.tinypic.com/34gk4gm.jpg) | ![应用场景之加载失败](http://a68.tinypic.com/20abals.jpg)|![应用场景之加载失败](http://a68.tinypic.com/2up75hw.jpg)
![应用场景之加载失败](http://a66.tinypic.com/4l0bnt.jpg)| ![应用场景之加载失败](http://a67.tinypic.com/20q11th.jpg) |![应用场景之加载失败](http://a63.tinypic.com/o9o3cw.jpg)

## Licenses

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/JerrySir/JRPlaceHolder/master/LICENSE).
