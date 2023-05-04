//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI
struct ColorManager {
//    static let BackgroundColor = Color("BackcolorA")
//    static let PrimaryColor = Color("PrimaryA")
//    static let TitelColor = Color("TitelColorA")
}


struct ProfileView: View {
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            
            ZStack(){
//                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack(alignment: .leading) {
                    
                    Text("반가워요!")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
//                        .foregroundColor(ColorManager.TitelColor)
                        
                        .offset(y: 110)
                    Text("이름을 입력해주세요")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .offset(y: 110)
//                        .foregroundColor(ColorManager.TitelColor)
                    
                    VStack(){
                        TextField("이름", text: $name)
                            .frame(width: 338.0, height:62.0)
                            .padding(.leading,16)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            
                            .offset(y: 300)
                    }
                    Spacer()
                      
                    
                
                    Button("다음"){}
                        .padding(.horizontal)
                        .frame(width: 354, height:54)
//                        .background(RoundedRectangle(cornerRadius: 10).fill())
                    
                    
                }
                .padding(20)
                
            }
                
        }
    }
    
}

// 미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
