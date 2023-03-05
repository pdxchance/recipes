//
//  ViewController.swift
//  recipes
//
//  Created by Deanne Chance on 2/23/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 15, right: 0))
        

        
        
        service.getMealHeaders { headers in

            for header in headers {
                let viewModel = RecipeHeaderViewModel(header: header)
                self.viewModels.append(viewModel)
                
            }
            
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        
        let vm = viewModels[indexPath.row]
        
        cell.textLabel?.text = vm.mealName
        cell.imageView?.image = vm.mealImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    

}

