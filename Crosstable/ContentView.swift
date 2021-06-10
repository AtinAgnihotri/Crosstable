//
//  ContentView.swift
//  Crosstable
//
//  Created by Atin Agnihotri on 09/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inGame = false
    @State private var uptoTable = 2
    @State private var numberOfQuestions = 5
    
    var body: some View {
        Group {
            if inGame {
                initGame()
            } else {
                SettingsView(playGame: $inGame, uptoTable: $uptoTable, noOfQues: $numberOfQuestions)
            }
        }
    }
    
    func createQuestions() -> [Questions] {
        var questions = [Questions]()
        for _ in 0..<numberOfQuestions {
            let a = Int.random(in: 2...uptoTable)
            let b = Int.random(in: 1...10)
            questions.append(Questions(a: a, b: b))
        }
        return questions
    }
    
    func initGame () -> some View {
        let questions = createQuestions()
        inGame = true
        return GameView(questions: questions, inGame: $inGame)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
