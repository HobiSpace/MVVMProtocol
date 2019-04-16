//
//  HBBookInfoModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class HBBookInfoModel: MVVM_Model, Book {
 
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

// MARK: - Public
extension HBBookInfoModel {
    func db_updateName(_ newName: String, completion: (() -> Void)) {
        self.name = newName
        completion()
    }
}

// MARK: - Private
extension HBBookInfoModel {
	
}
