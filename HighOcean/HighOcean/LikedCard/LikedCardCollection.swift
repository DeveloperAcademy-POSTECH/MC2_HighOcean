//
//  LikedCardCollection.swift
//  HighOcean
//
//  Created by 이연정 on 2023/05/09.
//

import SwiftUI


struct LikedCardCollection: View {
    
//    @Binding var card: Card
    @State private var selectedCard: Card?
    @EnvironmentObject var cards: Cards

//    @State private var showModal = false
    
//    var selectedCardBinding: Binding<Bool> {
//        Binding<Bool>(
//            get: { self.selectedCard != nil },
//            set: { if !$0 { self.selectedCard = nil } }
//        )
//    }
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 144))], spacing: 18) {
                    ForEach($cards.likedCards) { $card in
                        Button {
                            self.selectedCard = card
//                            self.showModal = true
                        } label: {
                            ThumbnailCardView(degree: .constant(0), card: $card)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
//            ModalView(show: self.selectedCardBinding) {
//                CardView(card: $selectedCardBinding)
//            }
//            .opacity(self.showModal ? 1 : 0)
//            .animation(.easeInOut)
        }
    }
}


//extension View {
//    func snapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
//        let view = controller.view
//
//        let targetSize = controller.view.intrinsicContentSize
//
//        view?.bounds = CG
//    }
//}


struct LikedCardCollection_Previews: PreviewProvider {
    static var previews: some View {
        LikedCardCollection()
            .environmentObject(Cards())
    }
}