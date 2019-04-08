//
//  HBModelArray.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/6.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

protocol HBModelArrayInterface: MVVM_Model_Interface {
    
}

class HBModelArray: NSObject, MVVM_Model {
    var modelArray: [HBModel] = []
    
    override init() {
        super.init()
        
        for _ in 0...50 {
            let model = HBModel.init()
            model.age = Int.random(in: 1...99)
            model.name = "张" + String(Int.random(in: 0...1000))
            model.sex = Bool.random() == true ? .male : .female
            modelArray.append(model)
        }
    }
}

extension HBModelArray: HBModelArrayInterface {
    
}
