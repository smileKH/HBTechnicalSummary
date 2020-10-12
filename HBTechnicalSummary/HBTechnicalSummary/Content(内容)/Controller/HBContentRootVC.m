//
//  HBContentRootVC.m
//  HBTechnicalSummary
//
//  Created by Mac on 2020/10/12.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "HBContentRootVC.h"
#import "HBTableSectionModel.h"
#import "HBTextChangeVC.h"
static NSString *kIdentifier = @"kIdentifier";

@interface HBContentRootVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <HBTableSectionModel *>*datasArr;
@end

@implementation HBContentRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS总结";
    self.view.backgroundColor = [UIColor whiteColor];
    //添加子视图
    [self addSubViewUI];
    //添加数据
    [self addContentAllData];
    
}
#pragma mark ==========添加子视图==========
-(void)addSubViewUI{
    [self.view addSubview:self.tableView];
}
#pragma mark ==========添加数据==========
-(void)addContentAllData{
    self.datasArr = @[].mutableCopy;
    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"ios 基础" items:[self createItemsByPlayerType]]];
//    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"UITableView样式（TableView style）" items:[self createItemsByTableView]]];
//    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"UICollectionView样式（CollectionView style）" items:[self createItemsByCollectionView]]];
//    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"旋转类型（Rotation type）" items:[self createItemsByRotationType]]];
//    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"自定义（Custom）" items:[self createItemsByCustom]]];
//    [self.datasArr addObject:[HBTableSectionModel sectionModeWithTitle:@"其他（Other）" items:[self createItemsByOther]]];
}

- (NSArray <HBTableItem *>*)createItemsByPlayerType {
    return @[[HBTableItem itemWithTitle:@"tableviewcell里文字展开与收起" subTitle:@"" viewControllerName:@"HBTextChangeVC"],
             [HBTableItem itemWithTitle:@"UITableView样式" subTitle:@"UITableView style" viewControllerName:@"ZFAutoPlayerViewController"],
             [HBTableItem itemWithTitle:@"UICollectionView样式" subTitle:@"UICollectionView style" viewControllerName:@"ZFCollectionViewController"],
             [HBTableItem itemWithTitle:@"UIScrollView样式" subTitle:@"UIScrollView style" viewControllerName:@"ZFScrollViewViewController"]];
}
#pragma mark ==========设置tableview的frame==========
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasArr[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    HBTableItem *itme = self.datasArr[indexPath.section].items[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@（%@）",itme.title,itme.subTitle];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.datasArr[section].title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HBTableItem *itme = self.datasArr[indexPath.section].items[indexPath.row];
    NSString *vcString = itme.viewControllerName;
    UIViewController *viewController = [[NSClassFromString(vcString) alloc] init];
//    if ([vcString isEqualToString:@"ZFDouYinViewController"]) {
//        [(ZFDouYinViewController *)viewController playTheIndex:0];
//    }
    viewController.navigationItem.title = itme.title;

//    if ([vcString isEqualToString:@"ZFDouyinCollectionViewController"] && [itme.title isEqualToString:@"横向滚动抖音"]) {
//        ZFDouyinCollectionViewController *douyinVC = (ZFDouyinCollectionViewController *)viewController;
//        douyinVC.scrollViewDirection = ZFPlayerScrollViewDirectionHorizontal;
//    }
    if ([vcString isEqualToString:@"ZFFullScreenViewController"]) {
        [self.navigationController pushViewController:viewController animated:NO];
    } else {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    }
    return _tableView;
}
@end
