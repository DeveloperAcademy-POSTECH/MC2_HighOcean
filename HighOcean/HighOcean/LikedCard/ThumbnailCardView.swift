//
//  ThumbnailCardView.swift
//  HighOcean
//
//  Created by 이연정 on 2023/05/10.
//

import SwiftUI

struct ThumbnailCardView: View {
    @Binding var degree : Double
    @Binding var card: Card
    
    @State private var image = UIImage()
    @State private var createdDate = Date()
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 11)
                .fill(.white)
                .shadow(radius: 3)
                .frame(width: 144, height: 235)
            Image(card.image)
                .resizable()
                .frame(width: 124, height: 213)
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]),
                startPoint: .top, endPoint: .bottom)
            .frame(width: 124, height: 213)
            .opacity(0.3)
            .blendMode(.multiply)
            DateAndDay
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
    
    var DateAndDay: some View {
        VStack {
            Spacer()
            Text("24")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("Secondary"))
                .padding(.bottom, -2.0)
                .shadow(radius: 2)
            Divider()
                .frame(width: 50, height: 2)
                .background(Color("Secondary"))
                .shadow(radius: 2)
            Text("월요일")
                .fontWeight(.medium)
                .foregroundColor(Color("Secondary"))
                .shadow(radius: 2)
        }
        .padding(.bottom, 30)
        .frame(width: 124, height: 213)
    }

    
}

