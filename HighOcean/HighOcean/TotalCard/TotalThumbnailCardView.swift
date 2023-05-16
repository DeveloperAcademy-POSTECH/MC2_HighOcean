//
//  TotalThumbnailCardView.swift
//  HighOcean
//
//  Created by 이연정 on 2023/05/10.
//

import SwiftUI
import FirebaseStorage
import Kingfisher

struct TotalThumbnailCardView: View {
    @Binding var degree : Double
    @Binding var card: Card
    private let storage = Storage.storage()
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 11)
                .fill(.white)
                .shadow(radius: 3)
                .frame(width: 111, height: 181)
            KFImage(URL(string: "https://firebasestorage.googleapis.com/v0/b/mc2highocean.appspot.com/o/\(card.image)?alt=media")!)
                .placeholder {
                    Image("DefaultCover")
                        .resizable()
                        .frame(width: 97, height: 164)
                }
                .resizable()
                .frame(width: 97, height: 164)
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]),
                startPoint: .top, endPoint: .bottom)
                .frame(width: 97, height: 164)
                .opacity(0.3)
                .blendMode(.multiply)
            DateAndDay
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
    
    var DateAndDay: some View {
        VStack {
            Spacer()
            Text(remakedDate())
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("Secondary"))
                .padding(.bottom, -2.0)
                .shadow(radius: 2)
            Divider()
                .frame(width: 50, height: 2)
                .background(Color("Secondary"))
                .shadow(radius: 2)
            Text(remakedDay())
                .fontWeight(.medium)
                .foregroundColor(Color("Secondary"))
                .shadow(radius: 2)
        }
        .padding(.bottom, 20)
        .frame(width: 97, height: 164)
    }
    
    func remakedDate() -> String {
        let dateString = card.createdDate
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }
        formatter.dateFormat = "dd"
        return formatter.string(from: date)
    }
    
    func remakedDay() -> String {
        let dateString = card.createdDate
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "E요일"
        return formatter.string(from: date)
    }
}
