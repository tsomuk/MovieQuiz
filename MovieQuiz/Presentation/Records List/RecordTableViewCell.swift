//
//  TableViewCell.swift
//  MovieQuiz
//
//  Created by Nikita Tsomuk on 14/02/2024.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: "Marker Felt", size: 26)
        return nameLabel
    }()
    
    private lazy var dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.font = UIFont(name: "Marker Felt", size: 12)
        return dataLabel
    }()
    
    private lazy var recordLabel: UILabel = {
        let recordLabel = UILabel()
        recordLabel.translatesAutoresizingMaskIntoConstraints = false
        recordLabel.font = UIFont(name: "Marker Felt", size: 22)
        return recordLabel
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel,dataLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setupAppearance() {
        addSubview(stack)
        addSubview(recordLabel)
        NSLayoutConstraint.activate([
            
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            recordLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            recordLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configCell(record: Records) {
        nameLabel.text = record.userName
        dataLabel.text = record.date
        recordLabel.text = record.record
    }
}
