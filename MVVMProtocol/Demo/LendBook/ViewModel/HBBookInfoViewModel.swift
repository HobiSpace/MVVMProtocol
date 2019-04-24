//
//  HBBookInfoViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

///// HBBookInfoViewModel提供给View绑定的数据回调
//protocol HBBookInfoViewModelDataBind: MVVM_ViewModel_Data_Bind {
//    var reactName: React<String> {get}
//    var reactPageCount: React<Int> {get}
//}

class HBBookInfoViewModel: MVVM_ViewModel, MVVM_ViewModel_Reformer {
    
    typealias Model = HBBookInfoModel

    var model: HBBookInfoModel
    
    var reactName: React<String>
    
    var reactPageCount: React<Int>
    
    required init(with model: HBBookInfoModel) {
        self.model = model
        reactName = React<String>.init(model.name)
        reactPageCount = React<Int>.init(model.pageCount)
    }
    
}

// MARK: - Public
extension HBBookInfoViewModel {
    func updateName(_ newName: String) {
        model.db_updateName(newName) { [weak self] in
            self?.reactName.update(newName)
        }
    }
}

// MARK: - Private(按模块添加Private)
extension HBBookInfoViewModel {
	
}
