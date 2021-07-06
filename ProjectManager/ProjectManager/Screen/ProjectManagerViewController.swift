//
//  ProjectManager - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

// 덕복 - api문서에서 모델이 필요치않나?

import UIKit

class ProjectManagerViewController: UIViewController {
    
    var data: [Int] = [1,2,3]
    
    let processListsStackView = ProcessListsStackView()
    let toDoStackView = ListContentsStackview()
    let doingStackView = ListContentsStackview()
    let doneStackView = ListContentsStackview()
    
    let todoTitleView = ListTitleView()
    let doingTitleView = ListTitleView()
    let doneTitleView = ListTitleView()
    
    let toDoTableView = UITableView()
    let doingTableView = UITableView()
    let doneTableView = UITableView()
    
    let newTodoFormViewController = NewTodoFormViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray4
        title = "소개팅 필승 공략"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushNewTodoFormViewController))
        
        configureStackView()
        configureTitleView()
        configureProcessListsTableView()
        configureListContentsStackview()
        
        toDoTableView.dataSource = self
        doingTableView.dataSource = self
        doneTableView.dataSource = self
        
        toDoTableView.delegate = self
        doingTableView.delegate = self
        doneTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        todoTitleView.layer.addBorder([.bottom], color: .systemGray4, width: 1.5)
        doingTitleView.layer.addBorder([.bottom], color: .systemGray4, width: 1.5)
        doneTitleView.layer.addBorder([.bottom], color: .systemGray4, width: 1.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        toDoTableView.reloadData()
        print("viewWillAppear")
        print(data)
    }
    
    @objc func pushNewTodoFormViewController() {
        let newTodoFormNavigationController = NewTodoFormNavigationController(rootViewController: newTodoFormViewController)
        newTodoFormNavigationController.modalPresentationStyle = .formSheet
        
        present(newTodoFormNavigationController, animated: true)
    }
    
    @objc func plus() {
        data.append(data.count+1)
        toDoTableView.reloadData()
    }

    private func configureTitleView() {
        toDoStackView.addArrangedSubview(todoTitleView)
        doingStackView.addArrangedSubview(doingTitleView)
        doneStackView.addArrangedSubview(doneTitleView)
        
        todoTitleView.title.text = "TODO"
        todoTitleView.count.text = "\(data.count)"
        doingTitleView.title.text = "DOING"
        doingTitleView.count.text = "\(data.count)"
        doneTitleView.title.text = "DONE"
        doneTitleView.count.text = "\(data.count)"
        
        todoTitleView.title.font = UIFont.boldSystemFont(ofSize: 30)
        doingTitleView.title.font = UIFont.boldSystemFont(ofSize: 30)
        doneTitleView.title.font = UIFont.boldSystemFont(ofSize: 30)
        
        todoTitleView.count.textColor = .systemBackground
        doingTitleView.count.textColor = .systemBackground
        doneTitleView.count.textColor = .systemBackground
        
        todoTitleView.count.backgroundColor = .black
        doingTitleView.count.backgroundColor = .black
        doneTitleView.count.backgroundColor = .black
        
        todoTitleView.count.textAlignment = .center
        doingTitleView.count.textAlignment = .center
        doneTitleView.count.textAlignment = .center
        
        todoTitleView.count.layer.cornerRadius = 12.5
        todoTitleView.count.layer.masksToBounds = true
        doingTitleView.count.layer.cornerRadius = 12.5
        doingTitleView.count.layer.masksToBounds = true
        doneTitleView.count.layer.cornerRadius = 12.5
        doneTitleView.count.layer.masksToBounds = true
    }
    
    private func configureProcessListsTableView() {
        toDoStackView.addArrangedSubview(toDoTableView)
        doingStackView.addArrangedSubview(doingTableView)
        doneStackView.addArrangedSubview(doneTableView)
        
        toDoTableView.showsVerticalScrollIndicator = false
        doingTableView.showsVerticalScrollIndicator = false
        doneTableView.showsVerticalScrollIndicator = false
        
        toDoTableView.tableFooterView = UIView(frame: .zero)
        doingTableView.tableFooterView = UIView(frame: .zero)
        doneTableView.tableFooterView = UIView(frame: .zero)
        
        toDoTableView.backgroundColor = .systemGray6
        doingTableView.backgroundColor = .systemGray6
        doneTableView.backgroundColor = .systemGray6
        
        toDoTableView.register(TodoListCell.self, forCellReuseIdentifier: TodoListCell.identifier)
        doingTableView.register(TodoListCell.self, forCellReuseIdentifier: TodoListCell.identifier)
        doneTableView.register(TodoListCell.self, forCellReuseIdentifier: TodoListCell.identifier)
    }
    
    private func configureListContentsStackview() {
        processListsStackView.addArrangedSubview(toDoStackView)
        processListsStackView.addArrangedSubview(doingStackView)
        processListsStackView.addArrangedSubview(doneStackView)

    }
}

// MARK: -StackView AutoLayout
extension ProjectManagerViewController {
    
    private func configureStackView() {
        view.addSubview(processListsStackView)
        
        NSLayoutConstraint.activate([
            processListsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            processListsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            processListsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            processListsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension CALayer {
    
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom: border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left: border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right: border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}

