//
//  ContentView.swift
//  MyLengthConversion
//
//  Created by Yara on 2022-09-30.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double?
    @State private var inputUnitOption = "CM"
    @State private var outputUnitOption = "Inch"
    @FocusState private var inputIsFocused: Bool
    let unitOptions = ["CM", "Inch", "Foot"]

    var output: Double {
        var inchOutput: Double?
        switch inputUnitOption {
        case "CM":
            inchOutput = (input ?? 0.0) * 0.393701
        case "Foot":
            inchOutput = (input ?? 0.0) * 12
        default:
            inchOutput = input ?? 0
        }

        switch outputUnitOption {
        case inputUnitOption:
            return input ?? 0.0
        case "CM":
            return (inchOutput ?? 0.0) * 2.54
        case "Foot":
            return (inchOutput ?? 0.0) * 0.08333333
        default:
            return inchOutput ?? 0.0
        
        }
    }
        
        
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("Input unit", selection: $inputUnitOption) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Your input length")
                }
                
                Section {
                    Text(output, format:
                        .number)
                    Picker("Output unit", selection: $outputUnitOption) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("MyLengthConvertor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
