//
//  GuessFlagView.swift
//  SwiftUIApp
//
//  Created by Bibin Jacob Pulickal on 09/11/19.
//  Copyright © 2019 bibinjacobpulickal. All rights reserved.
//

import SwiftUI

struct GuessFlagView: View {

    @State private var correctFlagNumber = Int.random(in: 0 ..< 4)
    @State private var countries = Country.allCases.shuffled()
    @State private var score = 0

    @State private var showAlert = false
    @State private var alertTitle = ""
    @Binding var showSelf: Bool

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Choose flag of:\n\(countries[correctFlagNumber].countryName)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    HStack {
                        ForEach(0 ..< 2) { number in
                            FlagView(country: self.countries[number]) {
                                self.selectedFlag(number)
                            }
                        }
                    }
                    HStack {
                        ForEach(2 ..< 4) { number in
                            FlagView(country: self.countries[number]) {
                                self.selectedFlag(number)
                            }
                        }
                    }
                    Text("Your score is: \(score)")
                        .font(.title)
                    Spacer()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle),
                          message: Text("Correct answer is: \(countries[correctFlagNumber].flag)\nYour score is: \(score)"),
                          primaryButton: .default(Text("Go Again!"), action: {
                            self.askNext()
                          }), secondaryButton: .destructive(Text("End Game!")) {
                            self.endGame()
                        })
                }
            }
            .navigationBarTitle("Flag Nation")
        }
    }

    private func endGame() {
        showSelf = false
    }

    private func selectedFlag(_ number: Int) {
        if number == correctFlagNumber {
            score += 4
            alertTitle = "Correct!"
        } else {
            score -= 1
            alertTitle = "Wrong!"
        }
        showAlert.toggle()
    }

    private func askNext() {
        correctFlagNumber = Int.random(in: 0 ..< 3)
        countries = Country.allCases.shuffled()
    }
}

struct GuessFlag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagView: View {

    var country: Country
    var borderColor = Color.clear
    var action = { }

    var body: some View {
        Button(action: action) {
            Text(country.flag)
                .font(.system(size: 128))
                .border(borderColor, width: 2)
        }
    }
}
