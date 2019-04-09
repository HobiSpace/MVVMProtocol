//
//  LendBookInfoModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/8.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

// 胖Model
protocol LendBookInfoModelInterface: MVVM_Model_Interface {
    func db_updateName(_ newName: String)
    func db_updatePageCount(_ newPageCount: Int, completion: ((Int) -> Void))
}

protocol LendBookInfoModelProtocol: MVVM_Model, Book {
    // 定义该Model的字段 （可以由开发者自行决定是否要抽协议(建议抽)，如果考虑觉得不可能复用，可以不用抽，直接让Class实现MVVM_Model, Book）
}

class LendBookInfoModel: LendBookInfoModelProtocol {
    
    typealias AuthorType = AuthorModel
    
    typealias PublishType = PublishModel
    
    
    var id: String
    
    var name: String
    
    var pageCount: Int
    
    var author: AuthorModel?
    
    var publish: PublishModel?
    
    init(id: String, name: String, pageCount: Int, author: AuthorModel? = nil, publish: PublishModel? = nil) {
        self.id = id
        self.name = name
        self.pageCount = pageCount
        self.author = author
        self.publish = publish
    }
    
}

extension LendBookInfoModel: LendBookInfoModelInterface {
    func db_updatePageCount(_ newPageCount: Int, completion: ((Int) -> Void)) {
        completion(newPageCount)
    }
    
    func db_updateName(_ newName: String) {
        
    }
    
}
