//
//  HBModel.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/4.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

enum Sex {
    case female
    case male
}

protocol HBModelInterface: MVVM_Model_Interface {
    func db_updateName(_ name: String)
    func db_updateAge(_ age: Int)
    func db_update()
}


class HBModel: NSObject, MVVM_Model {
    var name: String = ""
    var age: Int = 0
    var sex: Sex = .female
}

extension HBModel: HBModelInterface {
    func db_updateName(_ name: String) {
        // 可以自己改，也可以抛代理给集合去改，看你设计吧
    }
    
    func db_updateAge(_ age: Int) {
        
    }
    
    func db_update() {
        
    }
}

