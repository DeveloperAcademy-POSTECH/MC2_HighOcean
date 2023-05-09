//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct CollectionView: View {
    
    let data = Array(1...1000).map { "목록 \($0)"}
    let columns = [
//            GridItem(.adaptive(minimum: 100))
        GridItem(.flexible(maximum: 110)),
        GridItem(.flexible(maximum: 110)),
        GridItem(.flexible(maximum: 110)),
        ]
    
    @State private var cardFormA = false
    @State private var cardFormB = false
    @State private var cardFormC = false
    var body: some View {
    
        LazyVGrid(columns: columns, spacing: 26) {
            
            VStack{
                if cardFormA {
                    Image(systemName: "pencil")
                }
                Image(systemName: "moon.stars.fill")
                Text("날짜 / 시간").onTapGesture {
                    self.cardFormA.toggle()
                }
            }
            VStack{
                if cardFormB {
                    Image(systemName: "pencil")
                }
                Image(systemName: "moon.stars.fill")
                Text("날짜 / 시간").onTapGesture {
                    self.cardFormB.toggle()
                }
            }
            VStack{
                if cardFormC {
                    Image(systemName: "pencil")
                }
                Image(systemName: "moon.stars.fill")
                Text("날짜 / 시간").onTapGesture {
                    self.cardFormC.toggle()
                }
            }
            

        }
        

    }
}
struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
