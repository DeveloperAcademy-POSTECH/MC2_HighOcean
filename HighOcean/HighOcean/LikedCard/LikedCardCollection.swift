import SwiftUI


struct LikedCardCollection: View {

    @State private var selectedCard: Binding<Card?> = .constant(nil)
    @State private var showModal = false
    @EnvironmentObject var cards: Cards
    
    private var likedCards: [Card] {
        return cards.likedCards
    }
    private var likedCardsPageCount: Int {
        let likeCardsCount: Int =  likedCards.count
        return Int(ceil(Float(likeCardsCount)/4.0))
    }
    
    let columns: [GridItem] = [
            GridItem(.flexible(maximum: 120), spacing: 40, alignment: nil),
            GridItem(.flexible(maximum: 120), spacing: 40, alignment: nil)
        ]
    
    var body: some View {
        ZStack{
            Color("Secondary").ignoresSafeArea()
            Image("likecardBG")
            
                        
            TabView{
                ForEach(0..<likedCardsPageCount, id: \.self) { index in
                    let startIndex = index * 4
                    let endIndex = min(startIndex + 4, cards.likedCards.count)
                    let pageItems = cards.likedCards[startIndex..<endIndex]
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(pageItems, id: \.self) { card in
                            Button {
                                self.selectedCard = Binding(get: {
                                    card
                                } , set: { newValue in
                                    if let index = cards.likedCards.firstIndex(of: card) {
                                        cards.likedCards[index] = newValue!
                                    }
                                })
                                self.showModal = true
                            } label: {
                                ThumbnailCardView(degree: .constant(0), card: .constant(card))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
           .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
           .offset(y: 16)
               if self.showModal {
                   ZStack{
                       if let selectedCard = selectedCard.wrappedValue {
                           CardView(card: self.$cards.likedCards[self.cards.likedCards.firstIndex(of: selectedCard)!], isHeartButton: true, isCheckedPreview: false)
                       }
                       
//                       VStack{
//                           Spacer()
//
//                           Button(action: {
//                               withAnimation{
//                                   self.showModal.toggle()
//                               }
//                           }, label: {
//                               Image(systemName: "xmark").resizable()
//                                   .frame(width: 15, height: 15)
//                                   .foregroundColor(.black)
//                                   .padding(20)
//                                   .background(Color.white)
//                                   .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                   .padding(.bottom, 80)
//                           })
//                       }
                   }
                   .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                   .background(Color.black.opacity(0.2))
                   .edgesIgnoringSafeArea(.all)
                   .onTapGesture {
                       self.showModal.toggle()
                   }
            }
        }
        .navigationTitle("좋아요 카드")
        .navigationBarTitleDisplayMode(.inline)
    }
}
