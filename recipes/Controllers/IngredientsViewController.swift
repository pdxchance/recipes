//
//  IngredientsViewController.swift
//  recipes
//
//  Created by Deanne Chance on 3/21/23.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellReuseId = "reusedId"
    
    var vm : IngredentsViewModel?
    
    var data: [String] = []
    
    let tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupTableView()
        
        getData()
    }
    
    fileprivate func setupMainView() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
    }
    
    fileprivate func getData() {
        if let ingredients = vm?.ingredients {
            self.data = ingredients
            tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
        
        cell.textLabel?.text =  data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
