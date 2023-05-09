//
//  HomeView.swift
//  HighOcean
//
//  Created by apple on 2023/05/09.
//

import SwiftUI


struct HomeView: View {
    private var cards = Cards()
    @State private var selectedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 369, height: 182)
                    VStack {
                        Text("지금 무슨 기분이야?")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 21))
                        HStack {
                            EmojiButtonView(buttonIndex: 0, emotionText: "최고", emojiImagename: "good", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 1, emotionText: "행복", emojiImagename: "happy", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 2, emotionText: "쏘쏘", emojiImagename: "soso", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 3, emotionText: "슬픔", emojiImagename: "sad", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 4, emotionText: "화나", emojiImagename: "angry", selectedButtonIndex: $selectedButtonIndex)
                        }
                        
                    }
                    .padding(28)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 369, height: 308)
                    VStack {
                        Text("왈왈! 오션에게 카드가 새로 도착했멍!")
                            .font(.system(size: 17))
                        Image("Dog")
                            .resizable()
                            .scaledToFit()
                        NavigationLink(destination: NewCardView(cards: cards.uncheckedCards)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("Accent"))
                                    .frame(width: 349, height: 54)
                                Text("새 카드 확인하기")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                        }
                    }
                    .padding(10)
                }
                HStack {
                    VStack {
                        NavigationLink(destination: TotalCardCollectionView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 172, height: 86)
                                HStack {
                                    Text("저장한 카드")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        NavigationLink(destination: CollectionView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 172, height: 86)
                                HStack {
                                    Text("전체카드")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Accent"))
                        .frame(width: 172, height: 185)
                }
            }
            .padding(12)
        }
        .navigationTitle(
            Text("Logo")
                .foregroundColor(.black)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
