//
//  GameView.swift
//  Crosstable
//
//  Created by Atin Agnihotri on 09/06/21.
//

import SwiftUI

struct GameView: View {
    var questions = [Questions]()
    @State private var inGame: Binding<Bool>
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var restartBtnRotation = 0.0
    @State private var userAns = ""
    @State private var ansSubmitted = false
    @State private var rightAns = false
    
    init(questions: [Questions], inGame: Binding<Bool>) {
        self.questions = questions
        self.inGame = inGame
    }
    
     
    
    var body: some View {
        NavigationView {
            if currentQuestion == questions.count {
                VStack {
                    Text("Your total score is \(score))")
                        .font(.title)
                        .padding()
                    Button("Restart") {
                        restartGame()
                    }.rotation3DEffect(.degrees(restartBtnRotation), axis: (x: 0, y: 1, z: 0))
                }.navigationBarTitle("Your Results")
            } else {
                VStack {
                    Form {
                        Section(header: Text(questions[currentQuestion].getQuestionHeader())) {
                            TextField(questions[currentQuestion].getQuestionLabel(),
                                      text: $userAns,
                                      onCommit: {
                                        checkAnswer()
                                      })
                                .padding()
                                .labelsHidden()
                        }.padding()
                    }
                    
                    if ansSubmitted {
                        showResultView()
                    }
                    
                    Text("Your score is \(score)")
                        .font(.title)
                        .padding()
                    
                }.navigationBarTitle("CrossTable")
            }
        }
    }
    
    func showResultView() -> some View {
        VStack {
           Text(rightAns ? "Correct!" : "Wrong!")
               .font(.title)
               .foregroundColor(rightAns ? .green : .red)
               .frame(width: 100, height: 50)
               .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .leading, endPoint: .trailing))
               .clipShape(RoundedRectangle(cornerRadius: 10))
               .padding()
               .transition(.scale)
           
           Button("Next!") {
               nextQuestion()
           }.frame(width: 100, height: 50)
           .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .leading, endPoint: .trailing))
           .foregroundColor(.orange)
           .padding()
       }
   }
    
    func checkAnswer() {
        ansSubmitted = true
        rightAns = questions[currentQuestion].getAnswer() == userAns
        score += rightAns ? 1 : 0
    }
    
    func nextQuestion() {
        ansSubmitted = false
        currentQuestion += 1
        userAns = ""
    }
    
    func restartGame() {
        withAnimation {
            restartBtnRotation += 360
        }
        self.inGame.wrappedValue = false
    }
    
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(questions: [Questions(a: 1, b: 2)])
//    }
//}
