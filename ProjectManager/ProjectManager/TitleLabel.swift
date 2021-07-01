//
//  TitleLabel.swift
//  ProjectManager
//
//  Created by 김민성 on 2021/06/30.
//

import UIKit

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func configure() {
//        font = UIFont.boldSystemFont(ofSize: 17)
        
    }
}
