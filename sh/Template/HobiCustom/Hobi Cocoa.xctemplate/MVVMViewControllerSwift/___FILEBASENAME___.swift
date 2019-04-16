//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController, MVVM_ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configMVVM()
        setupData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutUI()
    }
    
    
    func configMVVM() {
        // 做MVVM 数据绑定 View的操作
    }
}

// MARK: - UI
extension ___FILEBASENAMEASIDENTIFIER___ {
    private func setupUI() {

        // 闭包形式初始话View

        // addsubview
    }

    private func layoutUI() {
        // layout
    }
}

// MARK: - Data
extension ___FILEBASENAMEASIDENTIFIER___ {
    private func setupData() {
        // 配置各种数据, 根据自己是否需要回调决定该方法有无回调参数
    }
}

// MARK: - Public Method
extension ___FILEBASENAMEASIDENTIFIER___ {
    
}

// MARK: - Action
extension ___FILEBASENAMEASIDENTIFIER___ {
    
}

// MARK: - Notification
extension ___FILEBASENAMEASIDENTIFIER___ {
    
}

// MARK: - Delegate & Protocol (自己在下方加上各个类的Delegate 和 Protocol)
extension ___FILEBASENAMEASIDENTIFIER___: Protocol {
    
}

// MARK: - Private Method (私有方法按功能模块在进行pragma mark)
extension ___FILEBASENAMEASIDENTIFIER___ {
    
}
