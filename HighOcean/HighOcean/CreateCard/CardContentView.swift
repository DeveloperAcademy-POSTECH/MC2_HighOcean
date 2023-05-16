//
//  CardContentView.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/10.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct CardContentView: View {
//    let ref = database.reference()
    let corverImage: UIImage
    @State private var questionText: String = ""
    @State var content: String = ""
    @State var to: String = ""
    @State var from: String = ""
    @State private var mode: [String: Int] = [:]
    @Binding var firstNaviLinkActive: Bool
    @EnvironmentObject var cards: Cards
    
    
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text(questionText)
            
            TextEditor(text: $content)
                .background(.white)
                .cornerRadius(20)
            Spacer()
            Text("받는 사람")
            TextField("애칭을 불러주세요", text: $to)
                .background(Color("Secondary"))
            
                .textFieldStyle(.roundedBorder)
            Spacer()
            Text("보내는 사람")
            TextField("누구인지 밝혀주세요", text: $from)
                .background(Color("Secondary"))
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .onAppear {
            if user.familyRule == "부모" {
                questionText = NoCheckedEmotion.randomElement() ?? ""
            } else {
                if user.mode < 3 {
                    questionText = PositiveEmotion.randomElement()?[0] ?? ""
                } else {
                    questionText = NegativeEmotion.randomElement()?[0] ?? ""
                }
            }
            
        }
        .padding(20)
        .navigationTitle("카드 쓰기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CardPreView(content: content, reciveUser: to, sendUser: from, coverImage: corverImage, firstNaviLinkActive: $firstNaviLinkActive, user: user).environmentObject(cards)) {
                    Text("다음")
                }
            }
        }
        .background(Color("Secondary"))
    }
}
