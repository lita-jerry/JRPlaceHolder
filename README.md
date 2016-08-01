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
   //这里做一些空数据的操作，例如弹出一些提醒性的文字等
   [weakSelf.tableView setScrollEnabled:NO]; //禁止tableView滚动
   return placeHolderView; //伪代码，此处返回数据为空时的显示的view
 } normalBlock:^(UITableView * _Nonnull sender) {
	//这里做一些恢复性的操作
	[weakSelf.tableView setScrollEnabled:YES]; //恢复tableView滚动
 }];
 //Will auto check whether the data is empty in the [tableView reloadData] method.

 ## Installation
 JRPlaceHolder supports `iOS 6.0+`.
 Currently does not support the introduction of pod, you can drag the UITableView+JRTableViewPlaceHolder .H and.M file into the yours project(Currently being applied).
 In order to gain access to all the files from the repository, you should clone it.
 ```
 git clone --recursive https://github.com/JerryLoveRice/JRPlaceHolder.git
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

## 引入方式

 JRPlaceHolder 支持iOS 6.0以上的系统。
 暂不支持pod方式引入(正在申请)，需要引入的话可以直接将UITableView+JRTableViewPlaceHolder的.h文件和.m文件拖入到项目中。
 如果需要所有的文件和演示的DEMO，可以克隆该库
 ```
 git clone --recursive https://github.com/JerryLoveRice/JRPlaceHolder.git
 ```

## 使用场景

 | | 
-------------|-------------|-------------
![](Logo/11.jpeg) | ![](Logo/12.jpeg) | ![](Logo/13.jpeg)
![](Logo/21.jpeg) | ![](Logo/22.jpeg) | ![](Logo/23.jpeg)
![](Logo/31.jpeg) | ![](Logo/32.jpeg) | ![](Logo/33.jpeg)
![](Logo/41.jpeg) | ![](Logo/42.jpeg) | ![](Logo/43.jpeg)
![](Logo/51.jpeg) | ![](Logo/52.jpeg) | ![](Logo/53.jpeg)
![](Logo/61.jpeg) | ![](Logo/62.jpeg) | ![](Logo/63.jpeg)
![](Logo/71.jpeg) | ![](Logo/72.jpeg) | ![](Logo/73.jpeg)
![](Logo/81.jpeg) | ![](Logo/82.jpeg) | ![](Logo/83.jpeg)
![](Logo/91.jpeg) | ![](Logo/92.jpeg) | ![](Logo/93.jpeg)
![](Logo/101.jpeg) | ![](Logo/102.jpeg) | ![](Logo/103.jpeg)
![](Logo/111.jpeg) | ![](Logo/112.jpeg) | ![](Logo/113.jpeg)
![](Logo/121.jpeg) | ![](Logo/122.jpeg) | ![](Logo/123.jpeg)
![](Logo/131.jpeg) | ![](Logo/132.jpeg) | ![](Logo/133.jpeg)
![](Logo/141.jpeg) | ![](Logo/142.jpeg) | ![](Logo/143.jpeg)

 ## Licenses

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/JerryLoveRice/JRPlaceHolder/master/LICENSE).