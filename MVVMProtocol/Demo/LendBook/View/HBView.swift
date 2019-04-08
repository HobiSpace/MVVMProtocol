//
//  HBView.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/4.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class HBView: UITableViewCell, MVVM_View {
    
    typealias ViewModel = HBViewModel
    
    var viewModel: HBViewModel?
    
    var nameLabel: UILabel!
    var ageLabel: UILabel!
    var sexLabel: UILabel!
    var nameTextField: UITextField!
    var ageTextField: UITextField!
    var confirmButton: UIButton!
    var nameDispose: Dispose?
    var ageDispose: Dispose?
    var sexDispose: Dispose?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.blue
        nameLabel = {
            let tmpLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 20))
            tmpLabel.textColor = UIColor.red
            return tmpLabel
        }()
        
        ageLabel = {
            let tmpLabel = UILabel.init(frame: CGRect.init(x: 0, y: 30, width: 100, height: 20))
            tmpLabel.textColor = UIColor.red
            return tmpLabel
        }()
        
        sexLabel = {
            let tmpLabel = UILabel.init(frame: CGRect.init(x: 0, y: 60, width: 100, height: 20))
            tmpLabel.textColor = UIColor.red
            return tmpLabel
        }()
        
        nameTextField = {
            let tmpTextField = UITextField.init(frame: CGRect.init(x: 120, y: 0, width: 200, height: 20))
            tmpTextField.backgroundColor = UIColor.white
            tmpTextField.placeholder = "请输入新的名字"
            return tmpTextField
        }()
        
        ageTextField = {
            let tmpTextField = UITextField.init(frame: CGRect.init(x: 120, y: 30, width: 200, height: 20))
            tmpTextField.backgroundColor = UIColor.white
            tmpTextField.placeholder = "请输入新的年龄"
            return tmpTextField
        }()
        
        confirmButton = {
            let tmpButton = UIButton.init(frame: CGRect.init(x: 120, y: 60, width: 100, height: 20))
            tmpButton.setTitle("确认", for: .normal)
            tmpButton.addTarget(self, action: #selector(confirmAction(_:)), for: .touchUpInside)
            return tmpButton
        }()
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(sexLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageTextField)
        contentView.addSubview(confirmButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(_ vm: HBViewModel) {
        
        viewModel = vm
        
        nameDispose = vm.reactName.bindAndFire { [weak self] (newValue) in
            self?.nameLabel.text = newValue
        }
        
        ageDispose = vm.reactAge.bindAndFire { [weak self] (newValue) in
            self?.ageLabel.text = String(newValue)
        }
        
        sexDispose = vm.reactSex.bindAndFire { [weak self] (newSex) in
            if newSex == Sex.female {
                self?.sexLabel.text = "女人"
            } else {
                self?.sexLabel.text = "男人"
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameDispose?.dispose()
        ageDispose?.dispose()
        sexDispose?.dispose()
    }
}

extension HBView {
    @objc func confirmAction(_ sender: UIButton) {
        
        if let nameText = nameTextField.text {
            viewModel?.updateName(nameText)
        }
        
        if let ageText = ageTextField.text, let newAge = Int(ageText) {
            viewModel?.updateAge(newAge)
        }
    }
}
