//
//  HBBookDataManager.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class HBBookDataManager: MVVM_Model {
    
    typealias BookType = HBBookInfoModel
    
	var books: [HBBookInfoModel] = []
    
    init() {
        // db拉取数据，转换成book
        for _ in 0...99 {
            let id = String(Int.random(in: 1...999))
            let name = "编程之美" + String(Int.random(in: 0...1000))
            let pageCount = Int.random(in: 1...999)
            let book = HBBookInfoModel.init(id: id, name: name, pageCount: pageCount)
            books.append(book)
        }
    }
}

// MARK: - Public
extension HBBookDataManager {
    
}

// MARK: - Private
extension HBBookDataManager {
	
}
