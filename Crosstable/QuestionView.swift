//
//  QuestionView.swift
//  Crosstable
//
//  Created by Atin Agnihotri on 10/06/21.
//

import SwiftUI

struct QuestionView: View {
    @State private var userAns = ""
    @State private var ansSubmitted = false
    @State private var rightAns = false
    var a = 0
    var b = 0
    var ans = 0
    
//    @State private var uptoTableVal = 2

    init(a: Int, b: Int, ans: Int) {
        self.a = a
        self.b = b
        self.ans = ans
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("\(a) into \(b) equals?")) {
                    TextField("\(a) * \(b) = ",
                              text: $userAns,
                              onCommit: {
                                checkAnswer()
                              })
                        .padding()
                        .labelsHidden()
                }.padding()
            }
            
            if ansSubmitted {
                VStack {
                    Text(rightAns ? "Correct!" : "Wrong!")
                        .font(.title)
                        .foregroundColor(rightAns ? .green : .red)
                        .frame(width: 100, height: 100)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .transition(.scale)
                    
                }
            }
            
//            Section(header: Text("Tables")) {
//                Stepper("From 1 to \(uptoTableVal)", value: $uptoTableVal, in: 2...12).padding()
//            }

        }.transition(.scale)
    }
    
    func checkAnswer() {
        withAnimation {
            ansSubmitted = true
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(a: 1, b: 2, ans: 2)
    }
}
