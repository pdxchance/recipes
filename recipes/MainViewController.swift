//
//  ViewController.swift
//  recipes
//
//  Created by Deanne Chance on 2/23/23.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    let cellReuseID = "cellReuseID"
    
    let service = RecipeService()
    
    var viewModels : [RecipeHeaderViewModel] = []
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupTableView()
        
        loadData()
        
    }
    
    fileprivate func setupTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 15, right: 0))
    }
    
    fileprivate func loadData() {
        service.getMealHeaders(category: "Dessert") { headers in
            
            for header in headers {
                let viewModel = RecipeHeaderViewModel(header: header)
                self.viewModels.append(viewModel)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        service.getMealDetail(mealId: "53049") { detail in
            
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! MainTableViewCell
        
        let vm = viewModels[indexPath.row]
        
        cell.label.text = vm.mealName
        
        if  let url = URL(string: vm.mealImageUrl) {
            cell.image.contentMode = .scaleAspectFit
            cell.image.kf.setImage(with: url) { result, error in
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DetailViewController()
        controller.idMeal = self.viewModels[indexPath.row].mealId
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

