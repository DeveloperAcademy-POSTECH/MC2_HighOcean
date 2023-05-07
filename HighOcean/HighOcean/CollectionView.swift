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
            GridItem(.adaptive(minimum: 100))
        ]
    
    var body: some View {
    
        LazyVGrid(columns: columns, spacing: 2) {
            
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }
            VStack{
                Color("Green")
                Text("날짜 / 요일")
            }

        }

    }
}
struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
