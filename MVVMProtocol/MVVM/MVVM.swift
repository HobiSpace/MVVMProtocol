//
//  MVVMProtocol.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/3/28.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

/// 定义MVVM架构中的Controller层
protocol MVVM_ViewCtonroller: NSObjectProtocol {
    /// 构造MVVM结构，具体看情况而定
    /// 如果可以的话在该方法完成MVVM的双向绑定
    /// 1. view -> bindViewModel
    /// 2. viewModel -> addDelegate
    func configMVVM()
}

/// 定义MVVM架构中的View层
protocol MVVM_View {
    associatedtype ViewModel: MVVM_ViewModel & MVVM_ViewModel_Data_Bind & MVVM_ViewModel_Interface
    
    /// viewModel引用
    var viewModel: ViewModel? {get set}
    
    /// 绑定ViewModel，自己去设置viewModel的引用
    ///
    /// - Parameter vm: 单向viewModel绑定
    func bindViewModel(_ viewModel: ViewModel)
}

/// 定义MVVM中双向绑定其中的 View -> ViewModel的接口(User Action)
protocol MVVM_ViewModel_Interface {
    
}

/// 定义MVVM中双向绑定其中的 ViewModel -> View （定义React回调(Binding) / 方法回调 / block回调）
protocol MVVM_ViewModel_Data_Bind {

}

/// 定义ViewModel架构中的ViewModel层
protocol MVVM_ViewModel {
    
    associatedtype Model: MVVM_Model & MVVM_Model_Interface
    
    /// model引用
    var model: Model? {get set}
}

/// 定义MVVM架构中Model提供给ViewModel的更新接口（接口包含更新回掉Callback）
protocol MVVM_Model_Interface {
    
}

/// 定义MVVM架构中的Model层
protocol MVVM_Model {
    // 存放数据 可以是组合数据，也可以是单个数据，看你设计了
    
}
