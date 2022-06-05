//
//  Home.swift
//  MobileWallet
//
//  Created by bhanuteja on 04/06/22.
//

import SwiftUI

struct Home: View {
    @State var expanded: Bool = false
    @State var selectedCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Wallet").font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,
                       alignment: expanded ? .leading : .center)
                .overlay(alignment: .trailing) {
                    Button {
                        withAnimation(.interactiveSpring(response: 0.8,
                                                         dampingFraction: 0.7,
                                                         blendDuration: 0.7)) {
                            expanded = false
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
                    }
                    .rotationEffect(.init(degrees: expanded ? 45 : 0))
                    .offset(x: expanded ? 10: 15)
                    .opacity(expanded ? 1 : 0)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(cards) { card in
                        Group {
                            if selectedCard?.id == card.id && showDetailCard {
                                cardView(card: card)
                                    .opacity(0)
                            } else {
                                cardView(card: card)
                                    .matchedGeometryEffect(id: card.id, in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                selectedCard = card
                                showDetailCard = true
                            }
                        }
                    }
                }
                .overlay{
                    Rectangle()
                        .fill(.black.opacity(expanded ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.35)) {
                                expanded = true
                            }
                        }
                }
                .padding(.top, expanded ? 30 : 0)
            }
            .coordinateSpace(name: "scroll")
            .offset(y: expanded ? 0 : 30)
            Button {
                withAnimation(.easeOut(duration: 0.35)) {
                    expanded = true
                }
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expanded ? 180 : 0))
            .scaleEffect(expanded ? 0.01 : 1)
            .opacity(!expanded ? 1 : 0)
            .frame(height: expanded ? 0 : nil)
            .padding(.bottom, expanded ? 0 : 30)
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if let card = selectedCard, showDetailCard {
                DetailView(selectedCard: card,
                           showDetails: $showDetailCard,
                           animation: animation)
            }
        }
    }
    
    @ViewBuilder
    func cardView(card: Card) -> some View {
        GeometryReader { proxy in
            let rect = proxy.frame(in: .named("scroll"))
            let offset = CGFloat(getIndexOf(card: card) * (expanded ? 10 : 70))
            ZStack(alignment: .bottomLeading) {
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background()
            }
            .offset(y: expanded ? offset : -rect.minY + offset)
        }
        .frame(height: 250)
    }
    
    func getIndexOf(card: Card) -> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == card.id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


