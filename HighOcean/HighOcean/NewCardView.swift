//
//  NewCardView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/05.
//

import SwiftUI
import UIKit

struct Card {
    let context: String
    let image: UIImage
    let createdDate: Date
    let from: String
    let isLike: Bool
    let isCheck: Bool
}

struct NewCardView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 40){
                CardView()
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                CardView()
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                CardView()
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
            }
            .padding()
        }
        .onAppear{
            UIScrollView.appearance().isPagingEnabled = true
        }
        .frame(height: 900)
    }
}
struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView()
    }
}
