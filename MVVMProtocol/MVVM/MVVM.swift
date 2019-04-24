//
//  MVVMProtocol.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/3/28.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

/*
                                User Action                  Interface
 MVVM_View/MVVM_ViewController  <-------->  MVVM_ViewModel  <-------->  MVVM_Model
                              Binding/Callback            Binding/Callback
 */

/// 定义MVVM架构中的ViewController层
protocol MVVM_ViewController {
    
    associatedtype ViewModel: MVVM_ViewModel
    
    /// viewModel引用
    var viewModel: ViewModel? {get set}
    
    /// 构建MVVM
    func configMVVM()
    
    /// 解除MVVM绑定
    func removeMVVM()
}

/// 定义MVVM架构中的View层
protocol MVVM_View {
    associatedtype ViewModel: MVVM_ViewModel
    
    /// viewModel引用
    var viewModel: ViewModel? {get set}
    
    /// 绑定ViewModel，自己去设置viewModel的引用
    ///
    /// - Parameter vm: 单向viewModel绑定
    func bindViewModel(_ viewModel: ViewModel)
    
    /// 解除ViewModel绑定
    func unBindViewModel()
}

/// 定义ViewModel架构中的ViewModel层
protocol MVVM_ViewModel {
    
    /// 定义MVVM中双向绑定其中的 ViewModel -> View （定义React回调(Binding) / 数据更新Block回调）
}

/// 定义MVVM中 ViewModel 转换 Model
protocol MVVM_ViewModel_Reformer {
    associatedtype Model: MVVM_Model
    
    /// model引用
    var model: Model {get set}
    
    init(with model: Model)
}

/// 定义MVVM架构中的Model层
protocol MVVM_Model {
    
}
