//
//  HomeCryptoCoinView.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
import UIKit

final class HomeCryptoCoinView: UIViewController{
    
    private var HomeCryptoCoinTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
       tableView.register(UINib(nibName: "HomeCryptoCoinTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCryptoCoinTableViewCell")

        return tableView
    }()
    
    private let presenter: HomeCryptoCoinPresentable
    
    init(presenter: HomeCryptoCoinPresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Crypto App"
        setupTableView()
        presenter.onViewAppear()
    }
    
    private func setupTableView(){
        view.addSubview(HomeCryptoCoinTableView)
        
        NSLayoutConstraint.activate([
            HomeCryptoCoinTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            HomeCryptoCoinTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            HomeCryptoCoinTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            HomeCryptoCoinTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        HomeCryptoCoinTableView.dataSource = self
        HomeCryptoCoinTableView.delegate = self
        HomeCryptoCoinTableView.prefetchDataSource = self
    }
}

extension HomeCryptoCoinView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let modelCount = presenter.viewModels.count
        return modelCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCryptoCoinTableViewCell", for: indexPath) as! HomeCryptoCoinTableViewCell
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}

extension HomeCryptoCoinView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension HomeCryptoCoinView: UITableViewDataSourcePrefetching{
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let filtered = indexPaths.filter({$0.row >= presenter.viewModels.count - 1})
        if filtered.count > 0{
            presenter.onViewScroll()
        }
    }
}
extension HomeCryptoCoinView: HomeCryptoCoinListUI{
    func update(cryptoCoins: [HomeCryptoCoinEntity]) {
        DispatchQueue.main.async {
            self.HomeCryptoCoinTableView.reloadData()
        }
    }
}
