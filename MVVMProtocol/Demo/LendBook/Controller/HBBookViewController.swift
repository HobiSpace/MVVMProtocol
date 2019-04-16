//
//  HBBookViewController.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import UIKit

class HBBookViewController: UIViewController, MVVM_ViewController {
    
    typealias ViewModel = HBBookViewModel
    
    var viewModel: HBBookViewModel?
    
    var tableView: UITableView!
    
    var booksVMDispose: Dispose?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configMVVM()
        setupData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutUI()
    }
    
    func configMVVM() {
        viewModel = HBBookViewModel.init()
        booksVMDispose = viewModel?.reactBooksVM.bind({ [weak self] (bookInfoArray) in
            self?.tableView.reloadData()
        })
    }
    
    deinit {
        booksVMDispose?.dispose()
        booksVMDispose = nil
    }
}

// MARK: - UI
extension HBBookViewController {
    private func setupUI() {

        // 闭包形式初始话View
        tableView = {
            let tmpTableView = UITableView.init(frame: self.view.bounds)
            tmpTableView.register(HBBookInfoView.self, forCellReuseIdentifier: HBBookInfoView.reuseIdentifier)
            tmpTableView.delegate = self
            tmpTableView.dataSource = self
            tmpTableView.rowHeight = 80
            return tmpTableView
        }()

        // addsubview
        view.addSubview(tableView)
    }

    private func layoutUI() {
        // layout
    }
}

// MARK: - Data
extension HBBookViewController {
    private func setupData() {
        // 配置各种数据, 根据自己是否需要回调决定该方法有无回调参数
        viewModel?.loadData()
    }
}

// MARK: - Public Method
extension HBBookViewController {
    
}

// MARK: - Action
extension HBBookViewController {
    
}

// MARK: - Notification
extension HBBookViewController {
    
}

// MARK: - Delegate & Protocol (自己在下方加上各个类的Delegate 和 Protocol)
extension HBBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.booksVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel, let cell = tableView.dequeueReusableCell(withIdentifier:  HBBookInfoView.reuseIdentifier, for: indexPath) as?  HBBookInfoView else {
            return UITableViewCell.init()
        }
        
        let vm = viewModel.booksVM[indexPath.row]
        cell.bindViewModel(vm)
        return cell
    }}

extension HBBookViewController: UITableViewDelegate {
    
}

// MARK: - Private Method (私有方法按功能模块在进行pragma mark)
extension HBBookViewController {
    
}
