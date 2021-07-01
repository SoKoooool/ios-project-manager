//
//  ProjectManager - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ProjectManagerViewController: UIViewController {
    
    let projectManagerStackView = UIStackView()
    let toDoTableView = UITableView()
    let doingTableView = UITableView()
    let doneTableView = UITableView()
    let projectManagerToolbar = ProjectManagerToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Project Manager"
        navigationController?.navigationBar.barTintColor = .systemGray5
        projectManagerStackView.backgroundColor = .systemGray4
        toDoTableView.backgroundColor = .systemGray5
        doingTableView.backgroundColor = .systemGray5
        doneTableView.backgroundColor = .systemGray5
        configureToolbar()
        configureStackView()
        stackViewAttribute()
    }
}
