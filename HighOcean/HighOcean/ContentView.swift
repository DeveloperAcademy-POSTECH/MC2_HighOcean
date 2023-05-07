//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
    
            VStack {
                NavigationLink(destination: TotalCardCollectionView()){
                        Text("카드모아보기")
                        .frame(width: 120.0, height:40.0)
                        .font(.system(size: 16))
                        .background(Color("Accent"))
                        .foregroundColor(Color.white)
                }
            }
           
  }
 }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
