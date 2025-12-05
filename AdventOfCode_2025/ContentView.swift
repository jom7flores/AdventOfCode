//
//  ContentView.swift
//  AdventOfCode_2025
//
//  Created by Josue Flores Inchaurregui on 12/1/25.
//

import SwiftUI

struct ContentView: View {

    var data = Days.allCases

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(data) { item in
                        NavigationLink(item.rawValue, value: item)
                    }
                }
            }
            .padding()
            .navigationTitle("Advent of code 2025")
            .navigationDestination(for: Days.self) { day in
                DayView(day: day)
            }
        }
    }
}

struct DayView: View {

    let day: Days
    @State var result: String = ""

    var body: some View {
        VStack(spacing: 35) {
            Text(day.rawValue)
                .font(.headline)

            Button("Solve custom input") {
                startProblem(customInput: true)
            }

            Button("Solve from file") {
                startProblem(customInput: false)
            }

            Text(result)

            Spacer()
        }
        .padding()
    }

    func startProblem(customInput: Bool) {
        do {
            self.result = try day.executor(customInput: customInput)
        }
        catch {
            result = error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}
