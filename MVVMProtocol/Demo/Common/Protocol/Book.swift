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
    
    var id: String {get set}
    var name: String {get set}
    var pageCount: Int {get set}
    var author: Author? {get set}
    var publish: Publish? {get set}
}

