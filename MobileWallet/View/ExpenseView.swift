//
//  ExpenseView.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import SwiftUI

struct ExpenseView: View {
    var expense: ExpenseModel
    @State var showView = false
    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 8) {
                Text(expense.name)
                    .fontWeight(.semibold)
                Text(expense.type)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(expense.amount)
                    .fontWeight(.semibold)
                Text(expense.Date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding([.top, .trailing, .leading], 5)
        .padding(.bottom, 8)
        .opacity(showView ? 1 : 0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeOut(duration: 0.3).delay(CGFloat(getIndex()) * 0.1)) {
                    showView = true
                }
            }
        }
    }
    func getIndex() -> Int {
        return expenseData.firstIndex { curExpense in
            return curExpense.id == expense.id
        } ?? 0
    }
}

struct ExpensiveView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(expense: ExpenseModel(id: "", name: "qwe", amount: "213", type: "qwe", Date: "123"))
    }
}
