//
//  Day4.swift
//  AdventOfCode_2025
//
//  Created by Josue Flores Inchaurregui on 12/3/25.
//

import Foundation

class Day4: DayTemplate {

    var inputFile: String = "2025_day4"

    func solve(input: [String]) -> Int {
        var count = 0
        var input = input
        var result: Int = 0

        repeat {
            result = part2(input: &input)
            count += result
        }
        while result != 0

        return count
    }

    private func part2(input: inout [String]) -> Int {
        var count = 0
        let rows = input.count

        knowIndex.removeAll()

        for row in 0..<rows {
            let column = input[row].count
            for col in 0..<column {
                if input[row, col] == "@" && isAccessible(input: &input, row: row, col: col) {
                    count += 1
                    input[row, col] = "."
                    knowIndex.insert(.init(x: row, y: col))
                }
            }
        }

        return count
    }

    var knowIndex = Set<CGPoint>()

    private func part1(input: [String]) -> Int {
        var count = 0
        let rows = input.count
        var input = input

        for row in 0..<rows {
            let column = input[row].count
            for col in 0..<column {
                if input[row, col] == "@" && isAccessible(input: &input, row: row, col: col) {
                    count += 1
                }
            }
        }

        return count
    }

    func isAccessible(input: inout [String], row: Int, col: Int) -> Bool {
        let points = [
            CGPoint(x: row - 1, y: col - 1),
            CGPoint(x: row - 1, y: col),
            CGPoint(x: row - 1, y: col + 1),
            CGPoint(x: row, y: col - 1),
            CGPoint(x: row, y: col + 1),
            CGPoint(x: row + 1, y: col - 1),
            CGPoint(x: row + 1, y: col),
            CGPoint(x: row + 1, y: col + 1)
        ]

        let result: [Bool] = points.map { knowIndex.contains($0) || input[Int($0.x), Int($0.y)] == "@" }
            .filter({ $0 })
        return result.count < 4
    }

    func parseLine(_ line: String) throws -> String {
        line
    }
    
    func mapLines(_ lines: [String]) throws -> [String] {
        return lines
    }
    
    func stringOutput(_ output: Int) -> String {
        print(output)
        return "Resut: \(output)"
    }

    var customInput: String =
"""
..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
"""
}

extension Array where Element == String {
    subscript(x: Int, y: Int) -> Character? {
        get {
            guard self.indices.contains(x) else { return nil }
            guard y >= 0 && y < self[x].count else { return nil }
            return self[x][y]
        }
        set {
            guard self.indices.contains(x) else { return }
            guard y >= 0 && y < self[x].count, let newValue else { return }
            let index = self[x].index(self[x].startIndex, offsetBy: y)
            self[x].replaceSubrange(index...index, with: "\(newValue)")
        }
    }
}
