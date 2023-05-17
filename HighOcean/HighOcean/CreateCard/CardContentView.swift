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
    @EnvironmentObject var appState: AppState
    
    
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("quastionIcon")
                    .resizable()
                    .frame(width: 58, height: 58)
                    .padding(.trailing, 12)
                Text(questionText)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(Color("Accent"))
            .cornerRadius(10)
            TextEditor(text: $content)
                .background(.white)
                .cornerRadius(20)
            Spacer()
            Text("받는 사람")
                .font(.system(size: 18))
                .foregroundColor(Color("Accent"))
            TextField("받는사람 이름을 입력해주세요.", text: $to)
                .background(Color("Secondary"))
                .textFieldStyle(.roundedBorder)
            Spacer()
            Text("보내는 사람")
                .font(.system(size: 18))
                .foregroundColor(Color("Accent"))
            TextField("누구인지 밝혀주세요.", text: $from)
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
                NavigationLink(destination: CardPreView(content: content, reciveUser: to, sendUser: from, coverImage: corverImage, firstNaviLinkActive: $firstNaviLinkActive, user: user).environmentObject(cards).environmentObject(appState)) {
                    Text("다음")
                }
            }
        }
        .background(Color("Secondary"))
    }
}
