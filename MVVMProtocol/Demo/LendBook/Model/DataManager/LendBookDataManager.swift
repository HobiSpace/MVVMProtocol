//
//  LendBookDataManager.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

protocol LendBookDataManagerInterface: MVVM_Model_Interface {
    
}

class LendBookDataManager: MVVM_Model, Books {
    
    typealias BookType = LendBookInfoModel
    
    var books: [LendBookInfoModel] = []
    
    init() {
        // db拉取数据，转换成book
        for _ in 0...99 {
            let id = String(Int.random(in: 1...999))
            let name = "编程之美" + String(Int.random(in: 0...1000))
            let pageCount = Int.random(in: 1...999)
            let book = LendBookInfoModel.init(id: id, name: name, pageCount: pageCount)
            books.append(book)
        }
    }
}

extension LendBookDataManager: LendBookDataManagerInterface {
    
}
