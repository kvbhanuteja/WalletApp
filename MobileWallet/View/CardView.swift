//
//  CardView.swift
//  MobileWallet
//
//  Created by bhanuteja on 05/06/22.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Text(card.type)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding([.top, .leading], 30)
                    
                    Image(systemName: "creditcard")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding([.top, .leading, .trailing], 30)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(formatCard(number: card.cardNumber))
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding([.leading],30)
                    
                    HStack(alignment: .bottom, spacing: 5) {
                        Text(card.name)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .center, spacing: 5) {
                            Text("Validity")
                                .font(.caption)
                                .foregroundColor(.white)
                            Text(card.validity)
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 30)
                    
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .background(.green.opacity(0.2))
                
            }
            .background(LinearGradient(colors: [Color("Color1"), Color("Color2")],
                                       startPoint: .leading,
                                       endPoint: .trailing))
            .cornerRadius(25)
        }
    }
    
    func formatCard(number: String) -> String {
        var formatString = ""
        let maxCount = number.count - 4
        number.enumerated().forEach { value in
            if value.offset >= maxCount {
                formatString.append(contentsOf: " " + String(value.element))
            } else {
                formatString.append(contentsOf: "*")
            }
        }
        return formatString
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "John",
                            cardNumber: "4896123408975672",
                            validity: "01/23",
                            type: "Credit"))
    }
}
