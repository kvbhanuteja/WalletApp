//
//  DetailView.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import SwiftUI

struct DetailView: View {
    var selectedCard: Card
    @Binding var showDetails: Bool
    var animation: Namespace.ID
    @State var showExpensiveView: Bool = false
    var body: some View {
        VStack {
            CardView(card: selectedCard)
                .matchedGeometryEffect(id: selectedCard.id, in: animation)
                .frame(height: 250)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showExpensiveView = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                        showDetails = false
                        }
                    }
                }
                .padding([.leading, .trailing], 10)
                .zIndex(10)
            GeometryReader { proxy in
                let height = proxy.size.height + 50
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(expenseData) { expense in
                            ExpenseView(expense: expense)
                        }
                    }.padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .ignoresSafeArea()
                )
                .offset(y: showExpensiveView ? 0 : height)
            }
            .padding([.horizontal, .top])
            .zIndex(-10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG").ignoresSafeArea())
        .onAppear {
            withAnimation(.easeInOut.delay(0.1)) {
                showExpensiveView = true
            }
        }
    }
}
