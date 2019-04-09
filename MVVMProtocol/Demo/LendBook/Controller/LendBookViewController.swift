//
//  LendBookViewController.swift
//  MVVMProtocol
//
//  Created by Hobi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class LendBookViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tmpTableView = UITableView.init(frame: self.view.bounds)
        tmpTableView.register(LendBookView.self, forCellReuseIdentifier: LendBookView.reuseIdentifier)
        tmpTableView.delegate = self
        tmpTableView.dataSource = self
        tmpTableView.rowHeight = 80
        return tmpTableView
    }()
    
    var lendBookDataSourceViewModel: LendBookDataSourceViewModel = LendBookDataSourceViewModel.loadData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
}

extension LendBookViewController: MVVM_ViewController {
    func configMVVM() {
        
    }
}

extension LendBookViewController: UITableViewDelegate {
    
}

extension LendBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lendBookDataSourceViewModel.booksVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  LendBookView.reuseIdentifier, for: indexPath) as?  LendBookView else {
            return UITableViewCell.init()
        }
        
        let vm = lendBookDataSourceViewModel.booksVM[indexPath.row]
        cell.bindViewModel(vm)
        return cell
    }

}
