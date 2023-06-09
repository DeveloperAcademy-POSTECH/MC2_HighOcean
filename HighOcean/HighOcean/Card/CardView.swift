//
//  CardView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/04.
//

import SwiftUI


struct CardView: View {

    @Binding var card: Card
    @State var frontDegree = 0.0
    @State var backDegree = 90.0
    @State var isFlipped = false
    @EnvironmentObject var cards: Cards
    
    var isHeartButton: Bool
    var isCheckedPreview: Bool
    
    let durationAndDelay : CGFloat = 0.3
    
    func flipCard(){
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        }
    }
    
    var body: some View {
        
        ZStack{
            CardFrontView(degree: $frontDegree, card: $card)
            CardBackView(degree: $backDegree, card: $card, isHeartButton: isHeartButton)
        }
        .frame(width: UIScreen.main.bounds.width - 90, height: card.show ? 500 : 300)
        .onTapGesture {
            flipCard()
            
            if !isCheckedPreview {
                card.editCheckedCard()
                
            }
        }
    }
}
