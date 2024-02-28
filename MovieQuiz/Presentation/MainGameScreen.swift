//
//  ViewController.swift
//
//  Created by Nikita Tsomuk on 30/01/2024.
//

import UIKit

class MainGameScreen: UIViewController {
    // MARK: - Varibles and constants
    
    
    
    private var currentQuestionIndex = 0
    private var correctAnswerCounter = 0
    
    private lazy var yesButton: UIButton = {
        let button = CustonButton(title: "Yes")
        button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: UIButton = {
        let button = CustonButton(title: "No")
        button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
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
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Is this movie rated more than 7?"
        questionLabel.font = UIFont(name: "Marker Felt", size: 23)
        questionLabel.textColor = .ypBlack
        questionLabel.numberOfLines = 2
        questionLabel.textAlignment = .center
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    
    
 // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        var currentQuestioin = questions[currentQuestionIndex]
        show(quiz: convert(model: currentQuestioin))
    }
    
    // MARK: - Private methods
    
    func setupAppearence() {
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        plusButton.tintColor = .ypBlack
        navigationItem.leftBarButtonItem = plusButton
        
        view.backgroundColor = .systemGray6
        view.addSubview(imageView)
        view.addSubview(questionLabel)
        view.addSubview(hButtonStack)
        NSLayoutConstraint.activate([
            
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -20),
            
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
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "Question \(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        questionLabel.text = step.question
        title = step.questionNumber
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text ,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.currentQuestionIndex = 0
            self.correctAnswerCounter = 0
            let firstQuestion = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.borderWidth = 8
        if isCorrect {
            correctAnswerCounter += 1
        }
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.showNextQuestionOrResults()
            self.imageView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 {
            let result = QuizResultsViewModel(
                title: "This round is over!",
                text: "Your result is \(correctAnswerCounter)/10",
                buttonText: "Play again!")
            show(quiz: result)
        } else {
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
            show(quiz: viewModel)
        }
    }
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func answerButtonTapped(sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        if sender.titleLabel?.text == "Yes" {
            let userAnswer = true
            showAnswerResult(isCorrect: userAnswer == currentQuestion.correctAnswer)
        } else {
            let userAnswer = false
            showAnswerResult(isCorrect: userAnswer == currentQuestion.correctAnswer)
        }
    }
}




