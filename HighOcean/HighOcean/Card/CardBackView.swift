//
//  CardBackView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/05.
//

import SwiftUI



struct CardBackView: View {
    
    @Binding var degree: Double
    @Binding var card: Card
    @EnvironmentObject var cards: Cards
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 3)
                .frame(width: 292, height: 480)
            CardContent
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }

    var CardContent: some View {
        VStack{
            HStack{
                ZStack{
                    Image("ToPersonBg")
                        .offset(y: 6)
                    Text("To. \(card.to)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
                Spacer()
            }
            Spacer()
            Text(card.context)
                .foregroundColor(Color("Primary"))
                .multilineTextAlignment(.leading)
                .lineSpacing(5)

            Spacer()
            HStack{
                HStack{
                    Button {
                        card.changeIsLiked()
                    } label: {
                        Image(card.isLiked ? "IconHeartFilled" : "IconHeartEmpty")
                    }
                    .opacity(cards.sentCards.contains(card) ? 0 : 1)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 4){
                    ZStack{
                        Image("FromPersonBg")
                            .offset(y: 6)
                        Text("From. \(card.from)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                    }
                    Text(card.createdDate)
                        .foregroundColor(Color("Primary"))
                        .lineLimit(nil)
                }
            }
        }
        .frame(width: 254, height: 437)
    }
}
