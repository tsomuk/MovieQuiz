//
//  ViewController.swift
//
//  Created by Nikita Tsomuk on 30/01/2024.
//

import UIKit

class MainGameScreen: UIViewController {
    
    private var currentQuestionIndex = 0
    private var correctAnswerCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        var currentQuestioin = questions[currentQuestionIndex]
        show(quiz: convert(model: currentQuestioin))
    }
    
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
    
    struct QuizQuestion {
        let image: String
        let text: String
        let correctAnswer: Bool
    }
    
    struct QuizStepViewModel {
        let image: UIImage
        let question: String
        let questionNumber: String
    }
    
    // для состояния "Результат квиза"
    struct QuizResultsViewModel {
        let title: String      // строка с заголовком алерта
        let text: String       // строка с текстом о количестве набранных очков
        let buttonText: String // текст для кнопки алерта
    }
    
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "Question \(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text ,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswerCounter = 0
            let firstQuestion = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        questionLabel.text = step.question
        title = step.questionNumber
    }
    
    
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false)
    ]
    
    
    
    
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        if sender.titleLabel?.text == "Yes" {
            let userAnswer = true
            showAnswerResult(isCorrect: userAnswer == currentQuestion.correctAnswer)
        } else {
            let userAnswer = false
            showAnswerResult(isCorrect: userAnswer == currentQuestion.correctAnswer)
        }
        
        
        
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.borderWidth = 8
        if isCorrect {
            correctAnswerCounter += 1
        }
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
        } else { // 2
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
            show(quiz: viewModel)
        }
    }
    
    
    
}




