//
//  SplashScreen.swift
//  MovieQuiz
//
//  Created by Nikita Tsomuk on 31/01/2024.
//

import UIKit

class SplashScreen: UIViewController {
    
    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Marker Felt", size: 20)!]
//        let image = UIImage(systemName: "pencil.circle.fill")
//        image?.withTintColor(.white, renderingMode: .alwaysTemplate)
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", image: image, target: nil, action: nil)
//        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.backward")
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        setupNavigationBar()
    }
    
    
    
    
    func setupAppearence() {
        view.addSubview(imageView)
        view.addSubview(vButtonStack)
        NSLayoutConstraint.activate([
            
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            newGameButton.heightAnchor.constraint(equalToConstant: 60),
            rulesButton.heightAnchor.constraint(equalToConstant: 60),
 
            vButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            vButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            vButtonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private lazy var newGameButton: UIButton = {
        let button = CustonButton(title: "New game")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rulesButton: UIButton = {
        let button = CustonButton(title: "Records")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newGameButton, rulesButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "111")
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        return image
    }()
 
    
    
    @objc func buttonTapped(sender: UIButton) {
        if sender.titleLabel?.text == "New game" {
            print("MainGameScreen")
            let mainGameScreen = MainGameScreen()
            navigationController?.pushViewController(mainGameScreen, animated: true)
        } else {
            let recordViewController = RecordViewController()
            navigationController?.pushViewController(recordViewController, animated: true)
        }
    }
}



