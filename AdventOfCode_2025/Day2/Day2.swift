//
//  Day2.swift
//  AdventOfCode_2025
//
//  Created by Josue Flores Inchaurregui on 12/1/25.
//

import Foundation

struct Day2: DayTemplate {

    var inputFile: String = "2025_day2"

    func solve(input: [ClosedRange<Int>]) -> Int {
        var sum = 0
        let repetitionRegex = /^(.*)\1+$/

        for range in input {

            for elem: Int in range {
                let eval = String(elem)

                if eval.wholeMatch(of: repetitionRegex) != nil {
                    sum += elem
                }

            }
        }

        return sum
    }

    func parseLine(_ line: String) throws -> [String] {
        line.split(separator: ",").map { String($0) }
    }

    func mapLines(_ lines: [[String]]) throws -> [ClosedRange<Int>] {
        var list = [ClosedRange<Int>]()

        for line in lines.flatMap({ $0 }) {
            let result: [Int] = line.split(separator: "-")
                .compactMap { Int("\($0)") }
            if result.count == 2 {
                list.append(result[0]...result[1])
            }
        }

        return list
    }

    func stringOutput(_ output: Int) -> String {
        let result = "Resut: \(output)"
        print(result)
        return result
    }
}

extension String {
    subscript(range: Range<Int>) -> String {
        get {
            let start = self.index(startIndex, offsetBy: range.lowerBound)
            let end = self.index(startIndex, offsetBy: range.upperBound)
            return String(self[start..<end])
        }
    }
}
