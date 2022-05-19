//
//  PersonCountView.swift
//  SplitBill
//
//  Created by Arnold Sidiprasetija on 25/04/22.
//

import SwiftUI

struct PersonCountView: View {
    @Binding var personCount: Int
    
    var body: some View {
        VStack(spacing:10){
            HStack(spacing: 20){
                Button {
                    if personCount > 1 {
                        personCount -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.orange)
                        .font(.system(.title, design:.rounded))
                }
                Text("\(personCount)")
                    .foregroundColor(.primary)
                    .font(Font(UIFont.systemFont(ofSize: 40, weight: .black)))
            
                Button{
                    personCount += 1
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.orange)
                        .font(.system(.title, design: .rounded))
                }
            }
            Text("PERSONS")
                .foregroundColor(.primary)
                .font(Font(UIFont.systemFont(ofSize: 20, weight: .black)))
        }
    }
}

struct PersonCountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCountView(personCount: .constant(1))
            
    }
}
