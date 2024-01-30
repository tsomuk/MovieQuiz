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
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
