//
//  Day1_25.swift
//  AdventOfCode_24_1
//
//  Created by Josue Flores Inchaurregui on 12/1/25.
//

import Foundation

struct Day1: DayTemplate {

    var inputFile: String = "2025_day1"

    func solve(input: [Direction]) -> Int {
        return part2(input: input)
    }

    private func part2(input: [Direction]) -> Int {
        var count = 0
        var dial = 50

        for item in input {
            let turns: Int
            switch item {
            case .left(let value):
                let positive = (100 + ((dial - value) % 100)) % 100
                let result = dial - value
                turns = result < 0 ? -result / 100 + 1 : 0
                dial = positive
            case .right(let value):
                turns = (dial + value) / 100
                dial = (dial + value) % 100
            }

            count += turns
        }

        return count
    }

    private func part1(input: [Direction]) -> Int {
        var count = 0
        var dial = 50

        for item in input {
            switch item {
            case .left(let value):

                dial = (dial - value) % 100
            case .right(let value):
                dial = (dial + value) % 100
            }

            if dial == 0 {
                count += 1
            }
        }

        return count
    }

    func parseLine(_ line: String) throws -> String {
        line
    }
    
    func mapLines(_ lines: [String]) throws -> [Direction] {
        var list = [Direction]()

        for var line in lines where !line.isEmpty {
            let char = line.removeFirst()
            if char == "R" {
                Int(line).map { list.append(.right($0)) }
            }
            else if char == "L" {
                Int(line).map { list.append(.left($0)) }
            }
        }

        return list
    }
    
    func stringOutput(_ output: Int) -> String {
        print(output)
        return "Resut: \(output)"
    }

    var customInput: String = """
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
"""
}

enum Direction {
    case left(Int)
    case right(Int)
}
