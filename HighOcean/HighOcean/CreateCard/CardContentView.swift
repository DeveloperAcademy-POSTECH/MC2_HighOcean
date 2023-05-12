//
//  CardContentView.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/10.
//

import Foundation
import SwiftUI

struct CardContentView: View {
    let corverImage: UIImage
    
    @State var content: String = ""
    @State var to: String = ""
    @State var from: String = ""
    @Binding var firstNaviLinkActive: Bool
    
    let user: User
    var body: some View {
        VStack {
            Text("질문이 들어갈 구역입니다. \n사랑이 담긴 말을 전해주세요.")
                .frame(alignment: .leading)
            
            TextEditor(text: $content)
                .padding()
                .background(.white)
                .padding()
                .cornerRadius(20)
            
            Spacer()
            Spacer()
            Text("받는 사람")
                .frame(alignment: .leading)
            
            TextField("애칭을 불러주세요", text: $to)
                .padding()
                .background(Color("Secondary"))
            
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            Text("보내는 사람")
                .frame(alignment: .leading)
            
            TextField("누구인지 밝혀주세요", text: $from)
                .padding()
                .background(Color("Secondary"))
                .textFieldStyle(.roundedBorder)
            Spacer()
            
        }
        .navigationTitle("카드 쓰기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbarRole(.editor)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CardPreView(content: content, reciveUser: to, sendUser: from, coverImage: corverImage, firstNaviLinkActive: $firstNaviLinkActive, user: user)) {
                    Text("다음")
                }
            }
        }
        .background(Color("Secondary"))
    }
}
