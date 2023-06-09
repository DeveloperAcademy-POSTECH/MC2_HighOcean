//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct ProfileView: View {
    @State private var userName: String = ""
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack(){
            Color("Secondary").ignoresSafeArea()
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("반가워요!")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(EdgeInsets(top: 110, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("이름을 입력해주세요")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    
                    TextField("이름", text: $userName)
                        .frame(width: 338.0, height:62.0)
                        .padding(.leading,16)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
                NavigationLink(destination: NextAProfileView(userName: userName).environmentObject(appState)) {
                    Text("다음")
                        .frame(width: 354.0, height:54.0)
                        .font(.system(size: 18))
                        .background(userName.isEmpty ? Color("Disabled") : Color("Accent"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .disabled(userName.isEmpty)
            }
            .padding(20)
        }
    }
}
