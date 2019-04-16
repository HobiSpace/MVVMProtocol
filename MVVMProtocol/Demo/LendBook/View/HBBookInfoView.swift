//
//  HBBookInfoView.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class HBBookInfoView: UITableViewCell, MVVM_View, ReuseCellAble {
    typealias ViewModel = HBBookInfoViewModel
    
    var viewModel: HBBookInfoViewModel?
    
    var idLabel: UILabel!
    
    var nameLabel: UILabel!
    
    var pageCountLabel: UILabel!
    
    var nameTextField: UITextField!
    
    var pageCountTextField: UITextField!
    
    var confirmButton: UIButton!
    
    var nameDispose: Dispose?
    var pageCountDispose: Dispose?
    
    func bindViewModel(_ viewModel: HBBookInfoViewModel) {
        self.viewModel = viewModel
        
        nameDispose = viewModel.reactName.bindAndFire { [weak self] (value) in
            self?.nameLabel.text = value
        }
        
        pageCountDispose = viewModel.reactPageCount.bindAndFire { [weak self] (value) in
            self?.pageCountLabel.text = String(value)
        }
        
        idLabel.text = viewModel.model.id
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.blue
        
        nameLabel = {
            let tmpLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 20))
            tmpLabel.textColor = UIColor.red
            return tmpLabel
        }()
        
        pageCountLabel = {
            let tmpLabel = UILabel.init(frame: CGRect.init(x: 0, y: 30, width: 100, height: 20))
            tmpLabel.textColor = UIColor.red
            return tmpLabel
        }()
        
        idLabel = {
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
        
        pageCountTextField = {
            let tmpTextField = UITextField.init(frame: CGRect.init(x: 120, y: 30, width: 200, height: 20))
            tmpTextField.backgroundColor = UIColor.white
            tmpTextField.placeholder = "请输入新的页码"
            return tmpTextField
        }()
        
        confirmButton = {
            let tmpButton = UIButton.init(frame: CGRect.init(x: 120, y: 60, width: 100, height: 20))
            tmpButton.setTitle("确认", for: .normal)
            tmpButton.addTarget(self, action: #selector(confirmAction(_:)), for: .touchUpInside)
            return tmpButton
        }()
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(pageCountLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(pageCountTextField)
        contentView.addSubview(confirmButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameDispose?.dispose()
        nameDispose = nil
        pageCountDispose?.dispose()
        pageCountDispose = nil
    }
}

// MARK: - Action
extension HBBookInfoView {
    @objc func confirmAction(_ sender: UIButton) {
        if let nameText = nameTextField.text {
            viewModel?.updateName(nameText)
        }
        
        if let pageCountText = pageCountTextField.text, let pageCount = Int(pageCountText) {
//            viewModel?.updatePageCount(pageCount)
        }
    }
}

// MARK: - Private
extension HBBookInfoView {
	
}
