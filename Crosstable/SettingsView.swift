//
//  SettingsView.swift
//  Crosstable
//
//  Created by Atin Agnihotri on 09/06/21.
//

import SwiftUI

struct SettingsView: View {
//    @State private var uptoTable = 2
    @State private var noOfQuesChoices = ["5", "10", "20", "All"]
    @State private var noOfQuesText = "5"
    @State private var buttonRotationDegrees = 0.0
    @State private var uptoTableVal = 2
    @State private var uptoTable: Binding<Int>
    @State private var playGame: Binding<Bool>
    @State private var noOfQues: Binding<Int>
    
    init(playGame : Binding<Bool>, uptoTable: Binding<Int>, noOfQues: Binding<Int>) {
        self.playGame = playGame
        self.uptoTable = uptoTable
        self.noOfQues = noOfQues
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Tables")) {
                        Stepper("From 1 to \(uptoTableVal)", value: $uptoTableVal, in: 2...12).padding()
                    }
                    
                    
                    
                    Section(header: Text("Number of Questions")) {
                        Picker("Number of questions : \(noOfQuesText)", selection: $noOfQuesText) {
                                ForEach(noOfQuesChoices, id:\.self) {
                                    Text($0)
                                }
                            
                        }.labelsHidden()
                        .padding()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Button("PLAY!") {
                    proceedToPlay()
                }.padding()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(Color.orange)
                .clipShape(Circle())
                .rotation3DEffect(
                    .degrees(buttonRotationDegrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                    
                Spacer()
                
                Spacer()
                
            }.navigationBarTitle("Settings")
        }
        .transition(.scale)
    }
    
    func rotateButton() {
        withAnimation {
            buttonRotationDegrees += 360
        }
        
    }
    func proceedToPlay() {
        rotateButton()
        if let totalQues = Int(noOfQuesText) {
            self.noOfQues.wrappedValue = totalQues
        } else {
            self.noOfQues.wrappedValue = self.uptoTable.wrappedValue * 10
        }
        
        self.playGame.wrappedValue = true
        self.uptoTable.wrappedValue = self.uptoTableVal
        
        
    }
    
    func generateQuestions() {
        
    }
}

//struct SettingsView_Previews: PreviewProvider {
////    @State private var playGame = false
//    static var previews: some View {
////        @State private var playGame = false
//        return SettingsView(playGame: $playGame)
//    }
//}
