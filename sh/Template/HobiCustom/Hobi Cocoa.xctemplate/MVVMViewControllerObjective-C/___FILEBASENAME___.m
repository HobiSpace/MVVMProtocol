//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self configMVVM];
    [self setupData];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self layoutUI];
}

#pragma mark - MVVM
- (void)configMVVM {
    // 做MVVM ViewModel 和 Model数据绑定
}

#pragma mark - UI
- (void)setupUI {
	// addsubview
}

- (void)layoutUI {
	// 如果使用autolayout, 在这里布局
}

#pragma mark - Data
- (void)setupData {
	// 配置各种数据, 根据自己是否需要回调决定该方法有无回调参数
}

#pragma mark - Public Method

#pragma mark - Action

#pragma mark - Notification

#pragma mark - Delegate & Protocol (自己在下方加上各个类的Delegate 和 Protocol)

#pragma mark - Private Method (私有方法按功能模块在进行pragma mark)

#pragma mark - Setter And Getter

@end
