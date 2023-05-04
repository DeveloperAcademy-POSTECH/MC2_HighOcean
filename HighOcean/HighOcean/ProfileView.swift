//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct ProfileView: View {
    //이름 변수 저장
    @State var name: String = ""
    
    var body: some View {
        NavigationView{
             
            ZStack(){
                Color("Secondary").ignoresSafeArea()
                
                VStack(){
                    VStack(alignment: .leading) {
                        Text("반가워요!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary"))
                            .offset(y: 110)
                        
                        Text("이름을 입력해주세요")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary"))
                            .offset(y: 110)
                        
                        TextField("이름", text: $name)
                            .frame(width: 338.0, height:62.0)
                            .padding(.leading,16)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .offset(y: 300)
                    
                    }
                    Spacer()

                    NavigationLink(destination: NextAProfileView()){
                        Text("다음")
                            .frame(width: 354.0, height:54.0)
                            .font(.system(size: 18))
                            .background(Color("Accent"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
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






