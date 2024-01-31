//
//  ViewController.swift
//
//  Created by Nikita Tsomuk on 30/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var questionCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupAppearence()
    }
    
    func setupAppearence() {
        view.addSubview(hLabelStack)
        view.addSubview(hButtonStack)
        view.addSubview(questionLabel)
        view.addSubview(image)
        NSLayoutConstraint.activate([
            
            hLabelStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            hLabelStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            hLabelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            hLabelStack.heightAnchor.constraint(equalToConstant: 24),
            
            image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            image.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            image.topAnchor.constraint(equalTo: hLabelStack.bottomAnchor, constant: 20),
            image.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -20),
            
            
            questionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            questionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            questionLabel.bottomAnchor.constraint(equalTo: hButtonStack.topAnchor, constant: -20),
            questionLabel.heightAnchor.constraint(equalToConstant: 78),
            
            
            hButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            hButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            hButtonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            hButtonStack.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private lazy var yesButton: UIButton = {
        let button = CustonButton(title: "Yes")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: UIButton = {
        let button = CustonButton(title: "No")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var hButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [noButton, yesButton])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = .coverMock
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Is this movie rated more than 7?"
        questionLabel.font = .systemFont(ofSize: 23, weight: .bold)
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 2
        questionLabel.textAlignment = .center
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private lazy var questionTitleLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Question"
        questionLabel.font = .systemFont(ofSize: 20, weight: .medium)
        questionLabel.textColor = .white
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()

    private lazy var numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "1/10"
        numberLabel.font = .systemFont(ofSize: 20, weight: .medium)
        numberLabel.textColor = .white
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    private lazy var hLabelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ questionTitleLabel, numberLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    func updateUI() {
        numberLabel.text = "\(questionCounter)/10"
    }
    
    @objc func buttonTapped(sender: UIButton) {
      
        if questionCounter == 1 {
            noButton.isEnabled = false
        }
        if sender.titleLabel?.text == "Yes" {
            questionCounter += 1
            updateUI()
            print(questionCounter)
        } else {
            questionCounter -= 1
            print(questionCounter)
            updateUI()
        }
    }
    
}

