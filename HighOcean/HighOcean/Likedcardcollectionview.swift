import SwiftUI

enum liketapInfo : String, CaseIterable {
    case likeDis = "수신"
    case likeOut = "발신"
}

struct Likedcardcollectionview: View {
    
    
    
    @State private var likeselectedPicker: liketapInfo = .likeDis
    
    var body: some View {
        ZStack(alignment:.top){
                Color("Secondary").ignoresSafeArea()
            
                VStack{
                    Picker("Pick", selection: $likeselectedPicker){
                        ForEach(liketapInfo.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                
                    likecardsView(likecardIist: likeselectedPicker)
                }
    
            }
            .navigationTitle("전체 카드")
        
    }
 }

// 카드 내용 변경
struct likecardsView : View {
    
    @State private var rotated = false
    @State private var degree = 0.0
    
    var likecardIist : liketapInfo
    var body: some View{
        
        switch likecardIist {
        case .likeDis:
            
                ZStack(alignment:.top){
                Image("likecardBG")
                    CollectionView(cardArray: [])
                }
                    .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z:  0), anchor: .leading)
                    .animation(.easeOut(duration: 1), value: degree)
                
                Button("Rotate") {
                               degree -= 180
                               rotated = true
                           }
                           .padding()
            
        case .likeOut:

                ZStack(alignment:.top){
                Image("likecardBG")
                    CollectionView(cardArray: [])    
                }
                    .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z:  0), anchor: .leading)
                    .animation(.easeOut(duration: 1), value: degree)
                
                Button("Rotate") {
                               degree -= 180
                               rotated = true
                           }
                           .padding()
            
            
        }
    }
}


//미리보기
struct Likedcardcollectionview_Previews: PreviewProvider {
    static var previews: some View {
        Likedcardcollectionview()
    }
}
