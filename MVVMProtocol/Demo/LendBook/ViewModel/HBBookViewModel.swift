//
//  HBBookViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

///// HBBookViewModel提供给View绑定的数据回调
//protocol HBBookViewModelDataBind: MVVM_ViewModel_Data_Bind {
//    
//}

class HBBookViewModel: MVVM_ViewModel {
    
    var booksVM: [HBBookInfoViewModel] = []
    private var bookDataManager: HBBookDataManager = HBBookDataManager.init()
    
    var reactBooksVM: React<[HBBookInfoViewModel]>
    
    init() {
        reactBooksVM = React<[HBBookInfoViewModel]>.init(booksVM)
    }
}

// MARK: - Public
extension HBBookViewModel {
    func loadData() {
        booksVM.removeAll()
        for book in bookDataManager.books {
            let bookInfoVM = HBBookInfoViewModel.init(with: book)
            booksVM.append(bookInfoVM)
        }
        reactBooksVM.update(booksVM)
    }
}

// MARK: - Private(按模块添加Private)
extension HBBookViewModel {
	
}
