//
//  RecordsRepo.swift
//  MovieQuiz
//
//  Created by Nikita Tsomuk on 31/01/2024.
//

import Foundation


struct RecordsRepo {
    
    static let shared = RecordsRepo()
    
    private var records : [Records] = [
        Records(userName: "John Smith", date: "01.01.2023", record: "10/10"),
        Records(userName: "Emma Johnson", date: "06.06.2023", record: "10/10"),
        Records(userName: "Michael Brown", date: "06.06.2023", record: "10/10"),
        Records(userName: "Olivia Davis", date: "01.01.2023", record: "10/10"),
        Records(userName: "William Wilson", date: "01.01.2023", record: "10/10"),
        Records(userName: "Sophia Taylor", date: "06.06.2023", record: "10/10"),
        Records(userName: "James Anderson", date: "06.06.2023", record: "10/10"),
        Records(userName: "Charlotte Martinez", date: "01.01.2023", record: "10/10"),
        Records(userName: "David Thomas", date: "06.06.2023", record: "10/10"),
        Records(userName: "Emily Jackson", date: "01.01.2023", record: "10/10"),
        Records(userName: "Daniel White", date: "06.06.2023", record: "10/10"),
        Records(userName: "Ava Harris", date: "01.01.2023", record:"10/10")
        ]

    
    func getNimbersOfRecordList() -> Int {
        records.count
    }
    
    func getRecords(number: Int) -> Records {
        records[number]
    }
    
}
