//
//  LendBookDataSourceViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

protocol LendBookDataSourceViewModelInterface: MVVM_ViewModel_Interface {
    
}

protocol LendBookDataSourceViewModelDataBind: MVVM_ViewModel_Data_Bind {
    
}

protocol LendBookDataSourceViewModelProtocol: MVVM_ViewModel {
    var booksVM: [LendBookViewModel] {get}
}

class LendBookDataSourceViewModel: LendBookDataSourceViewModelProtocol {
    
    typealias Model = LendBookDataSourceModel
    
    var model: LendBookDataSourceModel?
    
    var booksVM: [LendBookViewModel] = []
    
    init(model: LendBookDataSourceModel) {
        self.model = model
        for book in model.books {
            let bookVM = LendBookViewModel.init(model: book)
            booksVM.append(bookVM)
        }
    }
}
