//
//  LendBookInfoViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

protocol LendBookInfoViewModelInterface: MVVM_ViewModel_Interface {
    func updateName(_ newName: String)
    func updatePageCount(_ newPageCount: Int)
}

protocol LendBookInfoViewModelDataBind: MVVM_ViewModel_Data_Bind {
    var reactName: React<String> {get}
    var reactPageCount: React<Int> {get}
}

protocol LendBookInfoViewModelProtocol: MVVM_ViewModel, MVVM_ViewModel_Reformer {
    // 定义自己特有的属性
}

class LendBookInfoViewModel: LendBookInfoViewModelProtocol, LendBookInfoViewModelDataBind {
    
    typealias Model = LendBookInfoModel
    
    var model: LendBookInfoModel?
    
    var reactName: React<String>
    
    var reactPageCount: React<Int>
    
    init(model: LendBookInfoModel) {
        self.model = model
        reactName = React<String>.init(model.name)
        reactPageCount = React<Int>.init(model.pageCount)
    }
}

extension LendBookInfoViewModel: LendBookInfoViewModelInterface {
    func updateName(_ newName: String) {
        // 这里要不要等model的update回掉可以看具体业务
        model?.db_updateName(newName)
        reactName.update(newName)
    }
    
    func updatePageCount(_ newPageCount: Int) {
        model?.db_updatePageCount(newPageCount, completion: { [weak self] (newPageCount) in
            self?.reactPageCount.update(newPageCount)
        })
    }
    
    
}


