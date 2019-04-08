//
//  HBViewModelArray.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/6.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class HBViewModelArray: NSObject, MVVM_ViewModel {
    
    typealias Model = HBModelArray
    
    var model: HBModelArray
    
    var viewModelArray: [HBViewModel] = []
    
    required init(with model: HBModelArray) {
        
        self.model = model
        
        for tmpModel in model.modelArray {
            let vm = HBViewModel.init(with: tmpModel)
            viewModelArray.append(vm)
        }
    }
    
    
    subscript(index: Int) -> HBViewModel? {
        guard index < viewModelArray.count else {
            return nil
        }
        
        return viewModelArray[index]
    }
    
    class func loadData() -> HBViewModelArray {
        let modelArray = HBModelArray.init()
        let viewModelArray = HBViewModelArray.init(with: modelArray)
        return viewModelArray
    }
}
