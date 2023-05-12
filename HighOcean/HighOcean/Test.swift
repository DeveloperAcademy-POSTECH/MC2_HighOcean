import SwiftUI


struct Test: View {

    let items = Array(1...17) // 페이지에 표시할 항목의 배열
    // 짤리는 번호를 어찌 나오게 할지
    let columns = [
            GridItem(.adaptive(minimum: 140))
    ]
    
    var body: some View {
        
        TabView {
            ForEach(0..<items.count/4, id: \.self) { index in
                let startIndex = index * 4
                let endIndex = min(startIndex + 4, items.count)
                let pageItems = items[startIndex..<endIndex]
//                LikedCardCollection().environmentObject(Cards())
                //그리드
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(pageItems, id: \.self) { item in
                        Text("\(item)")
                    }
                }
                
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}


//
//    var body: some View {
//
//        ZStack(){
//            Color("Secondary").ignoresSafeArea()
//            Image("likecardBG")
//
//            TabView{
//                LikedCardCollection().environmentObject(Cards())
//
//
//
//            }
////            .background(Color.red)
//            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .offset(y: 16)
//
//
//
////            ZStack(alignment:.top){
//////                Image("likecardBG")
////                VStack {
//////                    Image("likecardBG")
////                    Text("Hello World")
////                    Text("Hello World")
////                    Text("Hello World")
////                    Text("Hello World")
////                }
////                    .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z:  0), anchor: .leading)
////                    .animation(.easeOut(duration: 1), value: degree)
////
////                //애월 카드 4개 들어오는 곳
//
////
////                Button("Rotate"){
////                    degree -= 180
////                    rotated = true
////                }
////
////            }
//
//            //            DragGesture()
//
//
//
//
//        }
//        .navigationTitle("저장한 카드")
//
//    }
//}
//
////미리보기

