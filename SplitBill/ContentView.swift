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
    @State private var taxPercentage = 2
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
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center, spacing: 20){
                CardView(cardLabelText: "PER PERSON", totalAmount: Int(totalPerPerson), subtotalAmount: Int(subTotalPerPerson), taxAmount: Int(taxValuePerPerson))
                    .frame(width: geo.size.width, height: 100)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
