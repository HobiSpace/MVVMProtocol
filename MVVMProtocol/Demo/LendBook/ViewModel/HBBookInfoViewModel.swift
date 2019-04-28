//
//  HBBookInfoViewModel.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class HBBookInfoViewModel: MVVM_ViewModel, MVVM_ViewModel_Reformer {
    
    typealias Model = HBBookInfoModel

    var model: HBBookInfoModel
    // react形式
    var reactName: React<String>
    
    // block形式
    var pageCountStr: String
    var pageCountDidChange:((String) -> Void)?
    
    required init(with model: HBBookInfoModel) {
        self.model = model
        reactName = React<String>.init(model.name)
        pageCountStr = String(model.pageCount)
    }
    
}

// MARK: - Public
extension HBBookInfoViewModel {
    func updateName(_ newName: String) {
        model.db_updateName(newName) { [weak self] in
            self?.reactName.update(newName)
        }
    }
    
    func updatePageCount(_ newPageCount: Int) {
        model.db_updatePageCount(newPageCount)
        self.pageCountStr = String(newPageCount)
        self.pageCountDidChange?(self.pageCountStr)
    }
}

// MARK: - Private(按模块添加Private)
extension HBBookInfoViewModel {
	
}
