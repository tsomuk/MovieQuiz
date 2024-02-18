//
//  RecordViewController.swift
//  MovieQuiz
//
//  Created by Nikita Tsomuk on 31/01/2024.
//

import UIKit

class RecordViewController: UIViewController {
    
    let recordsRepo = RecordsRepo.shared
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 20
        tableView.layer.masksToBounds = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }
    
    func setupAppearence() {
        tableView.register(RecordTableViewCell.self, forCellReuseIdentifier: "cell")
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        plusButton.tintColor = .ypBlack
        navigationItem.leftBarButtonItem = plusButton
        
        view.backgroundColor = .systemGray6
        title = "Records"
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
  
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension RecordViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        recordsRepo.getNimbersOfRecordList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecordTableViewCell
        let record = recordsRepo.getRecords(number: indexPath.section)
        cell.configCell(record: record)
        cell.backgroundColor = .ypBackground
        return cell
    }
}

