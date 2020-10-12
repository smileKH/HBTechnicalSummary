//
//  HBTableSectionModel.h
//  HBTechnicalSummary
//
//  Created by Mac on 2020/10/12.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HBTableItem;
NS_ASSUME_NONNULL_BEGIN
@interface HBTableItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *viewControllerName;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle viewControllerName:(NSString *)name;

@end

@interface HBTableSectionModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray <HBTableItem *>*items;

+ (instancetype)sectionModeWithTitle:(NSString *)title items:(NSArray <HBTableItem *>*)items;

@end

NS_ASSUME_NONNULL_END
