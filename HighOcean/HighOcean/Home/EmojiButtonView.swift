//
//  EmojiButtonView.swift
//  HighOcean
//
//  Created by apple on 2023/05/09.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 55, height: 55)
    }
}

struct EmojiButtonView: View {
    let buttonIndex: Int
    let emotionText: String
    let emojiImagename: String
    
    @Binding var selectedButtonIndex: Int?
    
    var isSelected: Bool {
        selectedButtonIndex == buttonIndex
    }
    
    var body: some View {
        Button(action: {
            selectedButtonIndex = buttonIndex
        }) {
            VStack {
                Image("\(emojiImagename)")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .background(isSelected ? CircleView(color: Color("Accent")) : CircleView(color: Color.clear))
                Text("\(emotionText)")
                    .foregroundColor(Color("Primary"))
                    .bold()
            }
            
        }
    }
}
