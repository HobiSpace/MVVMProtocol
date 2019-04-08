//
//  HBViewController.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/4.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class HBViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tmpTableView = UITableView.init(frame: self.view.bounds)
        tmpTableView.register(HBView.self, forCellReuseIdentifier: "HBView")
        tmpTableView.delegate = self
        tmpTableView.dataSource = self
        tmpTableView.rowHeight = 80
        return tmpTableView
    }()
    
    var viewModelArray: HBViewModelArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelArray = HBViewModelArray.loadData()
        view.addSubview(tableView)
    }

}

extension HBViewController: MVVM_ViewCtonroller {
    
    func configMVVM() {
        
    }
    
}

extension HBViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HBViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vmArray = viewModelArray else {
            return 0
        }
        return vmArray.viewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HBView", for: indexPath) as? HBView, let vmArray = viewModelArray else {
            return UITableViewCell.init()
        }
        
        if let vm = vmArray[indexPath.row] {
            cell.bindViewModel(vm)
        }
        
        return cell
    }
    
}
