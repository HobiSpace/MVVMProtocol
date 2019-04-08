//
//  Book.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/8.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

/// 书协议
protocol Book {
    
    associatedtype AuthorType: Author
    associatedtype PublishType: Publish
    
    var id: String {get set}
    var name: String {get set}
    var pageCount: Int {get set}
    var author: AuthorType? {get set}
    var publish: PublishType? {get set}
}

protocol Books {
    associatedtype BookType: Book
    var books: [BookType] {get set}
}
