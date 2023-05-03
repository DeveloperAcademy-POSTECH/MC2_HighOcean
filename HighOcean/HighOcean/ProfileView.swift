//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            
                    VStack {
                        Text("가입을 축하드려요")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        Text("이름을 입력해주세요!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        
                        
                        TextField("Name Input", text: $name)
                            .background(Color.white)
                            .textFieldStyle(.roundedBorder)
                    
                        
                        Button("Next"){
                            
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
