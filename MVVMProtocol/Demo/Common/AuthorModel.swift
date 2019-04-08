//
//  AuthorModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class AuthorModel: Author {
    
    var name: String
    
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
