//
//  LendBookView.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation
import UIKit

protocol LendBookViewProtocol: MVVM_View {
    var nameLabel: UILabel! {get set}
    var ageLabel: UILabel! {get set}
    var sexLabel: UILabel! {get set}
    var nameTextField: UITextField! {get set}
    var ageTextField: UITextField! {get set}
    var confirmButton: UIButton! {get set}
    var nameDispose: Dispose? {get set}
    var ageDispose: Dispose? {get set}
    var sexDispose: Dispose? {get set}
}


class LendBookView: UITableViewCell, LendBookViewProtocol, ReuseCellAble {
    
    

    
    typealias ViewModel = LendBookViewModel
    
    var viewModel: LendBookViewModel?
    
    func bindViewModel(_ viewModel: LendBookViewModel) {
        self.viewModel = viewModel
    }
    
}

