import SwiftUI


struct LikedCardCollection: View {

    @State private var selectedCard: Card?
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
                                self.selectedCard = pageItems[index]
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
                    if let selectedCardIndex = likedCards.firstIndex(of: selectedCard!) {
                        CardView(card: $cards.likedCards[selectedCardIndex])
                    }
                    
                    VStack{
                        Spacer()

                        Button(action: {
                            withAnimation{
                                self.showModal.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark").resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, 80)
                        })
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationTitle("저장한 카드")
    }
}
