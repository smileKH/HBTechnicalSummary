//
//  HBTableSectionModel.m
//  HBTechnicalSummary
//
//  Created by Mac on 2020/10/12.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "HBTableSectionModel.h"

@implementation HBTableItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle viewControllerName:(NSString *)name {
    HBTableItem *model = [[self alloc] init];
    model.title = title;
    model.subTitle = subTitle;
    model.viewControllerName = name;
    return model;
}

@end

@implementation HBTableSectionModel
+ (instancetype)sectionModeWithTitle:(NSString *)title items:(NSArray <HBTableItem *>*)items {
    HBTableSectionModel *sectionModel = [[self alloc] init];
    sectionModel.title = title;
    sectionModel.items = items;
    return sectionModel;
}

@end
