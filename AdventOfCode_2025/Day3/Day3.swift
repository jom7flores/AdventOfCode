//
//  Day3.swift
//  AdventOfCode_2025
//
//  Created by Josue Flores Inchaurregui on 12/2/25.
//

import Foundation

struct Day3: DayTemplate {

    var inputFile: String = "2025_day3"

    func solve(input: [String]) -> Int {
        var sum = 0

//        for line in input {
//            sum += getMax(from: line)
//        }

        for line in input {
            let max = getMax(from: line, start: 0, length: 12)
            sum += Int(max) ?? 0
        }

        return sum
    }

    private func getMax(from line: String, start: Int, length: Int) -> String {
        let size = line.count
        guard size >= length else {
            return ""
        }
        guard length > 0 else {
            return ""
        }

        var max = start

        for index in start..<(size - length + 1) {
            if line[index] > line[max] {
                max = index
            }
        }

        let result = "\(line[max])"

        return result + getMax(from: line, start: max + 1, length: length - 1)
    }

    private func getMax(from line: String) -> Int {
        guard line.count > 2 else {
            return Int(line) ?? 0
        }

        guard let initial = line.firstIndex(where: { $0 != "0" }) else {
            return 0
        }
        let starting = line.distance(from: line.startIndex, to: initial)
        guard starting < line.count - 1 else {
            return Int(line) ?? 0
        }

        var first: Character = line[starting]
        var second = line[starting + 1]

        for index in (starting + 1)..<line.count - 1 {
            let char = line[index]
            if first < char {
                first = char
                second = line[index + 1]
            }
            else if second < line[index] {
                second = line[index]
            }
        }

        if second < line.last! {
            second = line.last!
        }

        return Int("\(first)\(second)") ?? 0
    }

    func parseLine(_ line: String) throws -> String {
        line
    }

    func mapLines(_ lines: [String]) throws -> [String] {
        return lines
    }

    func stringOutput(_ output: Int) -> String {
        let result = "Resut: \(output)"
        print(result)
        return result
    }
}

extension String {
    subscript(index: Int) -> Character {
        get {
            let offset = self.index(startIndex, offsetBy: index)
            return self[offset]
        }
    }
}

