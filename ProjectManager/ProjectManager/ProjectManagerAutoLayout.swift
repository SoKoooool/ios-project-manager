//
//  ProjectManagerAutoLayout.swift
//  ProjectManager
//
//  Created by 김민성 on 2021/07/01.
//

import UIKit

extension ProjectManagerViewController {
    func configureStackView() {
        view.addSubview(projectManagerStackView)
        projectManagerStackView.addArrangedSubview(toDoTableView)
        projectManagerStackView.addArrangedSubview(doingTableView)
        projectManagerStackView.addArrangedSubview(doneTableView)
        projectManagerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            projectManagerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            projectManagerStackView.bottomAnchor.constraint(equalTo: projectManagerToolbar.safeAreaLayoutGuide.topAnchor),
            projectManagerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            projectManagerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    //나중에 stackview에 따로 정의
    func stackViewAttribute() {
        projectManagerStackView.alignment = .fill
        projectManagerStackView.distribution = .fillEqually
        projectManagerStackView.axis = .horizontal
        projectManagerStackView.spacing = 10
    }
    
    func configureToolbar() {
        view.addSubview(projectManagerToolbar)
        projectManagerToolbar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            projectManagerToolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            projectManagerToolbar.heightAnchor.constraint(equalToConstant: 30),
            projectManagerToolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            projectManagerToolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
