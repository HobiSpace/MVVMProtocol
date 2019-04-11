//___FILEHEADER___

import UIKit

/// ___FILEBASENAMEASIDENTIFIER___提供给View调用的接口
protocol ___FILEBASENAMEASIDENTIFIER___Interface: MVVM_ViewModel_Interface {
	// 没有的话请删掉
}

/// ___FILEBASENAMEASIDENTIFIER___提供给View绑定的数据回调
protocol ___FILEBASENAMEASIDENTIFIER___DataBind: MVVM_ViewModel_Data_Bind {
	// 没有的话请删掉
}

/// ___FILEBASENAMEASIDENTIFIER___持有的业务属性 方法
protocol ___FILEBASENAMEASIDENTIFIER___Protocol: MVVM_ViewModel, MVVM_ViewModel_Reformer {
	// 非Model转换的ViewModel可以把MVVM_ViewModel_Reformer删掉
}

class ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___Protocol, ___FILEBASENAMEASIDENTIFIER___DataBind {


}

// MARK: - ___FILEBASENAMEASIDENTIFIER___Interface
extension ___FILEBASENAMEASIDENTIFIER___: ___FILEBASENAMEASIDENTIFIER___Interface {
	
}

// MARK: - Private(按模块添加Private)
extension ___FILEBASENAMEASIDENTIFIER___ {
	
}
