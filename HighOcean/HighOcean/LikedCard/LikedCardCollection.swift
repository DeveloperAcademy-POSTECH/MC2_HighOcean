import SwiftUI


struct LikedCardCollection: View {

    @State private var selectedCard: Card?
    @EnvironmentObject var cards: Cards
    
    let columns = [
            GridItem(.adaptive(minimum: 140))
    ]
    
    var body: some View {
        
        
        ZStack{
            Color("Secondary").ignoresSafeArea()
            Image("likecardBG")
            
                        
            TabView{
                ForEach(0..<cards.likedCards.count/4, id: \.self) { index in
                    let startIndex = index * 4
                    let endIndex = min(startIndex + 4, cards.likedCards.count)
                    let pageItems = cards.likedCards[startIndex..<endIndex]
    //                LikedCardCollection().environmentObject(Cards())
                    //그리드
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0..<pageItems.count, id: \.self) { index in
                            Button {
                                self.selectedCard = pageItems[index]
                            } label: {
                                Text("\(index)")
                                ThumbnailCardView(degree: .constant(0), card: .constant(pageItems[index]))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }

//                ForEach($cards.likedCards) { $card in
//                    Button {
//                        self.selectedCard = card
//                    } label: {
//                        ThumbnailCardView(degree: .constant(0), card: $card)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//
//                }
                
                
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .offset(y: 16)
            
        }
        .navigationTitle("저장한 카드")
       
    }
}

struct LikedCardCollection_Previews: PreviewProvider {
    static var previews: some View {
        LikedCardCollection()
            .environmentObject(Cards())
    }
}

//self.showModal = true

//            ModalView(show: self.selectedCardBinding) {
//                CardView(card: $selectedCardBinding)
//            }
//            .opacity(self.showModal ? 1 : 0)
//            .animation(.easeInOut)
//    @State private var showModal = false
    
//    var selectedCardBinding: Binding<Bool> {
//        Binding<Bool>(
//            get: { self.selectedCard != nil },
//            set: { if !$0 { self.selectedCard = nil } }
//        )
//    }
    
//    var body: some View {
//        ZStack {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 144))], spacing: 18) {
//                    ForEach($cards.likedCards) { $card in
//                        Button {
//                            self.selectedCard = card
////                            self.showModal = true
//                        } label: {
//                            ThumbnailCardView(degree: .constant(0), card: $card)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//                .padding(.horizontal)
////            ModalView(show: self.selectedCardBinding) {
////                CardView(card: $selectedCardBinding)
////            }
////            .opacity(self.showModal ? 1 : 0)
////            .animation(.easeInOut)
//        }
//    }
//}


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
