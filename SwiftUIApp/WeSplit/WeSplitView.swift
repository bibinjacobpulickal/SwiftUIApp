//
//  WeSplitView.swift
//  SwiftUIApp
//
//  Created by Bibin Jacob Pulickal on 09/11/19.
//  Copyright © 2019 bibinjacobpulickal. All rights reserved.
//

import SwiftUI

struct WeSplitView: View {

    @State private var amount = ""
    @State private var numberOfPeople = 2
    @State private var selectedTipPercentage = 2

    private var tipPercentages = [5, 10, 15, 20, 25, 0]

    var amountPerPerson: Double {
        let totalAmout = Double(amount) ?? 0
        let totalTip   = totalAmout / 100 * Double(tipPercentages[selectedTipPercentage])
        return (totalAmout + totalTip) / Double(numberOfPeople + 2)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Amout:")
                        TextField("Enter check amount",
                                  text: $amount)
                            .keyboardType(.decimalPad)
                    }
                    Picker("Number of people:", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Choose tip percentage:")
                        Picker("Tip percentage:", selection: $selectedTipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section {
                    Text("Your amount is: \(amountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
        .layoutPriority(1)
    }
}

struct WeSplitView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitView()
    }
}
