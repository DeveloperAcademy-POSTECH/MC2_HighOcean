//
//  CardContentView.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/10.
//

import Foundation
import SwiftUI

struct CardContentView: View {
    
    @State var content: String = ""
    @State var to: String = ""
    @State var from: String = ""
    var body: some View {
        VStack {
            Text("Write your letter")
            TextField("Fill this", text:$content, axis: .vertical)
                .padding()
            Spacer()
            Spacer()
            Text("받는 사람")
            TextField("애칭을 불러주세요", text: $to)
                .padding()
            Spacer()
            Text("보내는 사람")
            TextField("누구인지 밝혀주세요", text: $from)
                .padding()
            Spacer()

        }
        .navigationTitle("카드 쓰기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CardPreView(content: $content, to: $to, from: $from)) {
                    Text("다음")
                    }
                }
            }
        }
    }

//struct Content_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ContentView()
//        }.accentColor(Color("Accent"))
//    }
//}
