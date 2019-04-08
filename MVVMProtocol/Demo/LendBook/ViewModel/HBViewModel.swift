//
//  HBViewModel.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/4.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

protocol HBViewModelDataBind: MVVM_ViewModel_Data_Bind {
    var reactName: React<String> {get set}
    var reactAge: React<Int> {get set}
    var reactSex: React<Sex> {get set}
}

protocol HBViewModelInterface: MVVM_ViewModel_Interface {
    func updateName(_ newName: String)
    func updateAge(_ newAge: Int)
    func updateAll(newName: String, newAge: Int, newSex: Sex)
}

class HBViewModel: NSObject, MVVM_ViewModel, HBViewModelDataBind {
    
    typealias Model = HBModel
    
    var model: HBModel
    
    var reactName: React<String>
    
    var reactAge: React<Int>
    
    var reactSex: React<Sex>
    
    required init(with model: HBModel) {
        self.model = model
        reactName = React<String>.init(model.name)
        reactAge = React<Int>.init(model.age)
        reactSex = React<Sex>.init(model.sex)
    }
}

extension HBViewModel: HBViewModelInterface {
    
    func updateName(_ newName: String) {
        model.db_updateName(newName)
//        reactName.update(newName)
        model.name = newName
    }
    
    func updateAge(_ newAge: Int) {
        model.db_updateAge(newAge)
        reactAge.update(newAge)
    }
    
    func updateAll(newName: String, newAge: Int, newSex: Sex) {
        
    }
}



