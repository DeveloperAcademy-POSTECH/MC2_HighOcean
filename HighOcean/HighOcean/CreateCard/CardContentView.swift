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
    
    @State var content: String = ""
    @State var to: String = ""
    @State var from: String = ""
    @State private var mode: [String: Int] = [:]
    @Binding var firstNaviLinkActive: Bool
    
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text("질문이 들어갈 구역입니다. \n사랑이 담긴 말을 전해주세요.")
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
//            ref.queryOrdered(byChild: "mode").queryEqual(toValue: 1).observe(.value) { (snapshot) in
//                if let value = snapshot.value as? [String: Any] {
//                    self.data = value
//                }
//            }
        }
        .padding(20)
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
