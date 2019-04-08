//
//  LendBookViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

protocol LendBookViewModelInterface: MVVM_ViewModel_Interface {
    func updateName(_ newName: String)
    func updatePageCount(_ newPageCount: Int)
}

protocol LendBookViewModelDataBind: MVVM_ViewModel_Data_Bind {
    var reactName: React<String> {get}
    var reactPageCount: React<Int> {get}
}

protocol LendBookViewModelProtocol: MVVM_ViewModel {
    // 定义自己特有的属性
}

class LendBookViewModel: LendBookViewModelProtocol, LendBookViewModelDataBind {
    
    typealias Model = LendBookModel
    
    var model: LendBookModel?
    
    var reactName: React<String>
    
    var reactPageCount: React<Int>
    
    init(model: LendBookModel) {
        self.model = model
        reactName = React<String>.init(model.name)
        reactPageCount = React<Int>.init(model.pageCount)
    }
}

extension LendBookViewModel: LendBookViewModelInterface {
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


