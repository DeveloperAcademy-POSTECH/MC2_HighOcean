//
//  CardView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/04.
//

import SwiftUI


struct CardView: View {
    
//    var data: Card
    @State var data:Card = Card(context: "안녕 아들아", image: UIImage(systemName: "bolt")!, createdDate: Date(), from: "엄마가", isLike: false, isCheck: true, show:false)
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    let durationAndDelay : CGFloat = 0.3
    
    func flipCard(){
        isFlipped = !isFlipped
        if isFlipped {
                    withAnimation(.linear(duration: durationAndDelay)) {
                        backDegree = 90
                    }
                    withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                        frontDegree = 0
                    }
                } else {
                    withAnimation(.linear(duration: durationAndDelay)) {
                        frontDegree = -90
                    }
                    withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                        backDegree = 0
                    }
                }
    }
    
    var body: some View {
        
        ZStack{
            CardFrontView(degree: $frontDegree)
            CardBackView(degree: $backDegree)
        }
        .frame(width: UIScreen.main.bounds.width - 100, height: data.show ? 500 : 440)
        .onTapGesture {
            flipCard()
        }
    }
        
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
