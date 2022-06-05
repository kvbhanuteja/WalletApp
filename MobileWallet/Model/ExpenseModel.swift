//
//  ExpenseModel.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import Foundation

struct ExpenseModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    var amount: String
    var type: String
    var Date: String
}

var expenseData: [ExpenseModel] = [
    ExpenseModel(name: "Amazon", amount: "$123", type: "Online", Date: "04/05/2022"),
    ExpenseModel(name: "Youtube", amount: "$12", type: "Entertainment", Date: "14/05/2022"),
    ExpenseModel(name: "Dribble", amount: "$15", type: "Membership", Date: "16/05/2022"),
    ExpenseModel(name: "Amazon prime", amount: "$99", type: "Entertainment", Date: "16/05/2022"),
    ExpenseModel(name: "Apple", amount: "$999", type: "Online", Date: "04/06/2022"),
    ExpenseModel(name: "Amazon", amount: "$123", type: "Online", Date: "04/05/2022"),
    ExpenseModel(name: "Youtube", amount: "$12", type: "Entertainment", Date: "14/05/2022"),
    ExpenseModel(name: "Dribble", amount: "$15", type: "Membership", Date: "16/05/2022"),
    ExpenseModel(name: "Amazon prime", amount: "$99", type: "Entertainment", Date: "16/05/2022"),
    ExpenseModel(name: "Apple", amount: "$999", type: "Online", Date: "04/06/2022"),
    ExpenseModel(name: "Amazon", amount: "$123", type: "Online", Date: "04/05/2022"),
    ExpenseModel(name: "Youtube", amount: "$12", type: "Entertainment", Date: "14/05/2022"),
    ExpenseModel(name: "Dribble", amount: "$15", type: "Membership", Date: "16/05/2022"),
    ExpenseModel(name: "Amazon prime", amount: "$99", type: "Entertainment", Date: "16/05/2022"),
    ExpenseModel(name: "Apple", amount: "$999", type: "Online", Date: "04/06/2022")]
