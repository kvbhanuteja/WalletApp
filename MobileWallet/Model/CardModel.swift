//
//  CardModel.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import Foundation

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardImage: String
}

var cards: [Card] = [Card(cardImage: "Card1"),
                     Card(cardImage: "Card2"),
                     Card(cardImage: "Card3"),
                     Card(cardImage: "Card1"),
                     Card(cardImage: "Card2"),
                     Card(cardImage: "Card3")]
