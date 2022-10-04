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

    var inchOutput :Double? {
        switch inputUnitOption {
        case "CM":
            return (input ?? 0) * 0.393701
        case "Foot":
            return (input ?? 0) * 12
        default:
            return input ?? 0
        }
    }
    var output: Double {
        switch outputUnitOption {
        case inputUnitOption:
            return input ?? 0.0
        case "CM":
            return (inchOutput ?? 0) * 2.54
        case "Foot":
            return (inchOutput ?? 0) * 0.08333333
        default:
            return inchOutput ?? 0
        
        }
    }
    
    var ftOutput: Int {
        Int((inchOutput ?? 0) * 0.083)
    }
    var ftInchOutput: Double{
        Double(inchOutput ?? 0) - (Double(12 * ftOutput))
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
                    Text(output, format: .number)
                    Picker("Output unit", selection: $outputUnitOption) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Result")
                }
                
                Section {
                    HStack {
                        Text(ftOutput, format: .number)
                        Text("ft")
                            .padding(5)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Text(round(ftInchOutput), format: .number)
                        Text("inch")
                            .padding(5)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                } header: {
                    Text("ft & inch")
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
