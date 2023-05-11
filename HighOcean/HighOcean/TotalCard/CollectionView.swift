//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct CollectionView: View {
    
    var cardArray: [Card]
    @State private var selectedCard: Card?
    @State private var showModal = false
    @EnvironmentObject var cards: Cards

    
    
//    let data = Array(1...1000).map { "목록 \($0)"}
    let columns = [
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
        GridItem(.flexible(maximum: 111)),
    ]
    
    @State private var cardFormA = false
    @State private var cardFormB = false
    @State private var cardFormC = false
    
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 26) {

                    ForEach(cardArray) { card in
                        Button {
                            self.selectedCard = card
                            self.showModal = true
                        } label: {
                            TotalThumbnailCardView(degree: .constant(0), card: .constant(card))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                }
            }
            .opacity(self.showModal ? 0 : 1)
            
            
            if self.showModal {
                ZStack{
                    CardView(card: self.selectedCard!)
                
                    VStack{
                        
                        Spacer()
                    
                        Button(action: {
                            withAnimation{
                                self.showModal.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark").resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top, 25)
                        })
                        
                    
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            }
        }
    }
}
