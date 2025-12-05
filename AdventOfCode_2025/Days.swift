//
//  Days.swift
//  AdventOfCode_2025
//
//  Created by Josue Flores Inchaurregui on 12/1/25.
//

import Foundation

enum Days: String, Identifiable, CaseIterable {
    case day1 = "Day 1 - Secret Entrance"
    case day2 = "Day 2 - "
    case day3 = "Day 3 - Lobby"
    case day4 = "Day 4 - Printing Department"


    var id: String {
        self.rawValue
    }

    func executor(customInput: Bool) throws -> String {
        switch self {
        case .day1:
            let executor = ProblemExecutor(template: Day1())
            return try executor.execute(customInput: customInput)

        case .day2:
            let executor = ProblemExecutor(template: Day2())
            return try executor.execute(customInput: customInput)

        case .day3:
            let executor = ProblemExecutor(template: Day3())
            return try executor.execute(customInput: customInput)

        case .day4:
            let executor = ProblemExecutor(template: Day4())
            return try executor.execute(customInput: customInput)

        }
    }
}
