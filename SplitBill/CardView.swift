//
//  CardView.swift
//  SplitBill
//
//  Created by Arnold Sidiprasetija on 25/04/22.
//

import SwiftUI

struct CardView: View {
    var cardLabelText = ""
    var totalAmount = 999999.00
    var subtotalAmount = 999999.00
    var taxAmount = 99999.00
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(cardLabelText).foregroundColor(.orange).fontWeight(.black)
            
        ZStack{
            Rectangle().foregroundColor(Color(red:110/255, green: 110/255, blue: 110/255)).cornerRadius(20)
            
            HStack{
                Spacer()
                
                Text("Rp \(totalAmount, specifier: "%.2f")").foregroundColor(.white).font(.system(size: 22, weight: .bold)).fontWeight(.black)
                Spacer()
                
                Rectangle().foregroundColor(Color(red:110/255, green: 110/255, blue: 110/255))
                    .frame(width: 1, height: 70)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    VStack(alignment: .leading){
                        Text("SUBTOTAL").font(.system(.caption, design: .rounded))
                            .fontWeight(.light)
                        Text("Rp \(subtotalAmount, specifier: "%.2f")")
                            .font(.system(.body))
                            .fontWeight(.bold)
                    }
                    
                    VStack(alignment: .leading){
                        Text("TAX").font(.system(.caption, design:.rounded))
                            .fontWeight(.light)
                        Text("Rp\(taxAmount, specifier: "%.2f")")
                            .font(.system(.body))
                            .fontWeight(.bold)
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding(5)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardLabelText: "Per Person")
            .frame(width: 300, height: 150)
            .previewInterfaceOrientation(.portrait)
    }
}
}
