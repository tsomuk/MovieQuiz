//
//  CustonButton.swift
//  MovieQuiz
//
//  Created by Nikita Tsomuk on 30/01/2024.
//

import UIKit

class CustonButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.ypWhite, for: .normal)
        self.backgroundColor = .ypBlack
        self.layer.cornerRadius = 15
        self.titleLabel?.font = UIFont(name: "Marker Felt", size: 24)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

