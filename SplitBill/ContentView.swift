//
//  ContentView.swift
//  SplitBill
//
//  Created by Arnold Sidiprasetija on 25/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var taxPercentage = 1
    @FocusState private var isInputActive: Bool
    
    private let taxPercentages = [0, 11]
    
    private var subTotal: Double { Double(checkAmount) ?? 0}
    
    private var subTotalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / peopleCount
    }
    
    private var taxValue : Double{
        let taxSelection = Double(taxPercentages[taxPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * taxSelection
    }
    
    private var taxValuePerPerson: Double {taxValue / Double(numberOfPeople)}
    
    private var totalAmountWithTax: Double{
        let taxSelection = Double(taxPercentages[taxPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let taxValue = orderAmount / 100 * taxSelection
        let grandTotal = orderAmount + taxValue
        
        return grandTotal
    }
    
    private var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmountWithTax / peopleCount
        
        return amountPerPerson
    }
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.orange)
    }
    
    var body: some View {
            GeometryReader { geo in
                VStack(alignment: .center, spacing: 20){
                    CardView(cardLabelText: "PER PERSON",
                             totalAmount: totalPerPerson,
                             subtotalAmount: subTotalPerPerson,
                             taxAmount: taxValuePerPerson)
                        .frame(width: geo.size.width, height: 100)
                
                    CardView(cardLabelText: "TOTAL",
                             totalAmount: totalAmountWithTax,
                             subtotalAmount: subTotal,
                             taxAmount: taxValue)
                        .frame(width: geo.size.width, height: 100)
                    
                    TitleView(title: "TAX")
                    Picker("Tax Percentage", selection: $taxPercentage) {
                        ForEach(0..<taxPercentages.count) {
                            Text("\(self.taxPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .accessibilityLabel("The percentage of the tax that used in transactions.")
                    
                TitleView(title: "BILL AMOUNT")
                
                HStack{
                    Text("Rp")
                        .foregroundColor(.primary)
                        .font(Font(UIFont.systemFont(ofSize: 40, weight: .black)))
                    TextField("0.00", text: $checkAmount)
                        .foregroundColor(.primary)
                        .font(Font(UIFont.systemFont(ofSize: 40, weight: .black)))
                        .keyboardType(.decimalPad)
                        .focused($isInputActive)
                        .accessibilityLabel("Amount of your bill that you have input.")
                    
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }
                TitleView(title: "SPLIT INTO")
                        .accessibilityLabel("How many person are involved in this bill?")
                PersonCountView(personCount: $numberOfPeople)
            }
        }
        .padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}

struct TitleView: View {
    var title: String
    
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.orange)
                .fontWeight(.black)
            Spacer()
        }
    }
}
