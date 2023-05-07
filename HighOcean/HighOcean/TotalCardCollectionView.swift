//
//  ContentView.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case dis = "수신"
    case out = "발신"
}

struct TotalCardCollectionView: View {
    @State private var selectedPicker: tapInfo = .dis
    
    var body: some View {
        NavigationView{
            
            VStack{
                Picker("Pick", selection: $selectedPicker){
                    ForEach(tapInfo.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Spacer()
                
            }
            
        }
        .navigationTitle("모아보기")
    
    
    }
 }

//미리보기
struct TotalCardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCardCollectionView()
    }
}

//VStack {
//    Text("23")
//
//}
