//
//  CardBackView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/05.
//

import SwiftUI



struct CardBackView: View {
    
    @Binding var degree : Double
    
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
                    Text("To. 오션에게")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
                Spacer()
            }
            Spacer()
            Text("본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문")
                .foregroundColor(Color("Primary"))
                .multilineTextAlignment(.leading)
                .lineSpacing(5)

            Spacer()
            HStack{
                ZStack{
                    Image("IconHeartEmpty")
                    Image("IconHeartFilled")
                }
                Spacer()
                VStack(alignment: .leading, spacing: 4){
                    ZStack{
                        Image("FromPersonBg")
                            .offset(y: 6)
                        Text("From. 엄마가")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                    }
                    Text("2023. 5. 5.")
                        .foregroundColor(Color("Primary"))
                        .lineLimit(nil)
                }
            }
            }
        .frame(width: 254, height: 437)
    }
}
