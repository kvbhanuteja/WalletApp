//
//  CardModel.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import Foundation

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var validity: String
    var type: String
}

var cards: [Card] = [Card(name: "John",
                          cardNumber: "4896123408975672",
                          validity: "01/23",
                          type: "Credit"),
                     Card(name: "Ben",
                          cardNumber: "5432489656720897",
                          validity: "07/25",
                          type: "Debit"),
                     Card(name: "Clara",
                          cardNumber: "4325089756721234",
                          validity: "08/23",
                          type: "Credit")]
