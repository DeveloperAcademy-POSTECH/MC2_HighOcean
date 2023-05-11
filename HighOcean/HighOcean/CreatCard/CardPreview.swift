//
//  CardPreview.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/10.
//

import Foundation
import SwiftUI

struct CardPreView: View {
    @Binding var content : String
    @Binding var to : String
    @Binding var from : String
    @State private var showingAlert = false
    
    var body: some View {
        Text("반가워요! \(content)")
            .navigationTitle("미리보기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
            .toolbar {
                Button (action: {
                    self.showingAlert.toggle()
                }) {
                    Text("보내기")
                        .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("진짜 보내용?"), message: Text("왈왈이가 물어다 드릴게요!"), dismissButton: .default(Text("OK"))
                                        )
                                    }
                }
            }
        
    }
}
