//
//  DayTemplate.swift
//  AdventOfCode_24_1
//
//  Created by Josue Flores Inchaurregui on 11/29/25.
//

import Foundation

protocol DayTemplate {
    var inputFile: String { get }
    var customInput: String { get }

    associatedtype Input
    associatedtype Output
    associatedtype Line

    func solve(input: Input) -> Output

    func parseLine(_ line: String) throws -> Line
    func mapLines(_ lines: [Line]) throws -> Input
    func stringOutput(_ output: Output) -> String
}

extension DayTemplate {
    var customInput: String { "" }
}

struct ProblemExecutor<Template: DayTemplate> {

    let template: Template

    func execute(customInput: Bool) throws -> String {
        let source = try customInput ? template.customInput : fileContents()
        let input = try generateInput(from: source)
        let result = template.solve(input: input)
        return template.stringOutput(result)
    }

    private func fileContents() throws -> String {
        guard let path = Bundle.main.path(forResource: template.inputFile, ofType: "txt") else {
            throw NSError(domain: "FileNotFound",
                          code: 2,
                          userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
        return try String(contentsOfFile: path, encoding: .utf8)
    }

    private func generateInput(from content: String) throws -> Template.Input {
        var lines: [Template.Line] = []

        for line in content.components(separatedBy: .newlines) {
            let line = try template.parseLine(line)
            lines.append(line)
        }

        return try template.mapLines(lines)
    }
}
