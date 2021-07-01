//
//  ProjectManagerToolbar.swift
//  ProjectManager
//
//  Created by 김민성 on 2021/07/01.
//

import UIKit

class ProjectManagerToolbar: UIToolbar {

    let unDoBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: nil)
    let reDoBarButtonItem = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: nil)
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        barTintColor = .systemGray5
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        setItems([flexibleSpace, unDoBarButtonItem, reDoBarButtonItem], animated: true)
        unDoBarButtonItem.isEnabled = false
        reDoBarButtonItem.isEnabled = false
    }
}
