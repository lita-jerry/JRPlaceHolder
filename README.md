# JRPlaceHolder
JRPlaceHolder is a [CYLTableViewPlaceHolder](https://github.com/ChenYilong/CYLTableViewPlaceHolder) framework inspired. Using the [Functional Reactive Programming](https://en.wikipedia.org/wiki/Functional_reactive_programming) ideas, zero costs to integration, It does not affect the previous code, without modifying the code before, Integration costs can be said to be zero.

 1. [Example](#Example)
 1. [Installation](#Installation)
 1. [Usage scenario](#Usage scenario)
 1. [中文](#中文)

 ## introduction

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
 JRPlaceHolder受[CYLTableViewPlaceHolder](https://github.com/ChenYilong/CYLTableViewPlaceHolder)框架的启发，使用响应式编程思想，将方法尽可能的封装，使用起来更加的方便，既不影响之前的代码，也不用修改现在的代码，只需在所需的位置加一行代码作为配置即可，可以说是零成本集成。

 1. [使用示例](#使用示例)

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

 1. [引入方式](#引入方式)
 JRPlaceHolder 支持iOS 6.0以上的系统。
 暂不支持pod方式引入(正在申请)，需要引入的话可以直接将UITableView+JRTableViewPlaceHolder的.h文件和.m文件拖入到项目中。
 如果需要所有的文件和演示的DEMO，可以克隆该库
 ```
 git clone --recursive https://github.com/JerryLoveRice/JRPlaceHolder.git
 ```

 1. [使用场景](#使用场景)

 | | 
-------------|-------------|-------------
![](Logo/11.jpg) | ![](Logo/12.jpg) | ![](Logo/13.jpg)
![](Logo/21.jpg) | ![](Logo/22.jpg) | ![](Logo/23.jpg)
![](Logo/31.jpg) | ![](Logo/32.jpg) | ![](Logo/33.jpg)
![](Logo/41.jpg) | ![](Logo/42.jpg) | ![](Logo/43.jpg)
![](Logo/51.jpg) | ![](Logo/52.jpg) | ![](Logo/53.jpg)
![](Logo/61.jpg) | ![](Logo/62.jpg) | ![](Logo/63.jpg)
![](Logo/71.jpg) | ![](Logo/72.jpg) | ![](Logo/73.jpg)
![](Logo/81.jpg) | ![](Logo/82.jpg) | ![](Logo/83.jpg)
![](Logo/91.jpg) | ![](Logo/92.jpg) | ![](Logo/93.jpg)
![](Logo/101.jpg) | ![](Logo/102.jpg) | ![](Logo/103.jpg)
![](Logo/111.jpg) | ![](Logo/112.jpg) | ![](Logo/113.jpg)
![](Logo/121.jpg) | ![](Logo/122.jpg) | ![](Logo/123.jpg)
![](Logo/131.jpg) | ![](Logo/132.jpg) | ![](Logo/133.jpg)
![](Logo/141.jpg) | ![](Logo/142.jpg) | ![](Logo/143.jpg)

 ## Licenses

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/JerryLoveRice/JRPlaceHolder/master/LICENSE).