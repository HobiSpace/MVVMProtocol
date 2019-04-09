//
//  LendBookDataSourceModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

protocol LendBookDataSourceModelInterface: MVVM_Model_Interface {
    
}

protocol LendBookDataSourceModelProtocol: MVVM_Model, Books {
//    var books: [LendBookModel] {get set}
}

class LendBookDataSourceModel: LendBookDataSourceModelProtocol {
    
    typealias BookType = LendBookModel
    
    var books: [LendBookModel] = []
    
    init() {
        // db拉取数据，转换成book
        for _ in 0...99 {
            let id = String(Int.random(in: 1...999))
            let name = "编程之美" + String(Int.random(in: 0...1000))
            let pageCount = Int.random(in: 1...999)
            let book = LendBookModel.init(id: id, name: name, pageCount: pageCount)
            books.append(book)
        }
    }
}

extension LendBookDataSourceModel: LendBookDataSourceModelInterface {
    
}


