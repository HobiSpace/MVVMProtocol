//
//  LendBookViewModel.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class LendBookViewModel: MVVM_ViewModel {
    var booksVM: [LendBookInfoViewModel] = []
    var lendBookDataManager: LendBookDataManager = LendBookDataManager.init()
    
    init() {
        for book in lendBookDataManager.books {
            let bookInfoVM = LendBookInfoViewModel.init(model: book)
            booksVM.append(bookInfoVM)
        }
    }
    
}

