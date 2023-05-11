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
    @State private var isNewCards: Bool = false
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 369, height: 182)
                    VStack(alignment: .leading) {
                        Text("지금 무슨 기분이야?")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 21))
                        HStack {
                            EmojiButtonView(buttonIndex: 0, emotionText: "행복해", emojiImagename: "happy", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 1, emotionText: "신나", emojiImagename: "excited", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 2, emotionText: "그저그래", emojiImagename: "soso", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 3, emotionText: "화나", emojiImagename: "mad", selectedButtonIndex: $selectedButtonIndex)
                            Spacer()
                            EmojiButtonView(buttonIndex: 4, emotionText: "슬퍼", emojiImagename: "sad", selectedButtonIndex: $selectedButtonIndex)
                        }
                        
                    }
                    .padding(28)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 369, height: 308)
                    VStack {
                        if isNewCards {
                            Text("왈왈! ")
                                .font(.system(size: 17))
                                .bold()
                            +
                            Text("오션")
                                .font(.system(size: 17))
                                .foregroundColor(Color("Green"))
                                .bold()
                            +
                            Text("에게 카드가 새로 도착했멍!")
                                .font(.system(size: 17))
                                .bold()
                        } else {
                            Text("왈! 새로운 카드는 없다멍..")
                                .bold()
                        }
                        Image(isNewCards ? "walwalHappy" : "walwalSad")
                            .resizable()
                            .scaledToFit()
                        NavigationLink(destination: NewCardView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(isNewCards ? Color("Accent") : Color("Disabled"))
                                    .frame(width: 349, height: 54)
                                Text("새 카드 확인하기")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                        }
                    }
                    .padding(10)
                }
                .onAppear{
                    if cards.recievedCards.count != 0 {
                        isNewCards = true
                    }
                }
                
                HStack {
                    VStack {
                        NavigationLink(destination: LikedCardCollection().environmentObject(cards)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 172, height: 86)
                                HStack {
                                    Image("Book")
                                        .resizable()
                                        .frame(width: 39, height: 39)
                                    Spacer()
                                    Text("저장한 카드")
                                        .foregroundColor(.black)
                                }
                                .padding(19)
                            }
                        }
                        NavigationLink(destination: TotalCardCollectionView()          .environmentObject(cards)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 172, height: 86)
                                HStack {
                                    Image("Box")
                                        .resizable()
                                        .frame(width: 39, height: 39)
                                    Spacer()
                                    Text("전체 카드")
                                        .foregroundColor(.black)
                                }
                                .padding(19)
                            }
                        }
                    }
                    Spacer()
                    NavigationLink(destination:CreatePhotoFrontCardView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("Accent"))
                                .frame(width: 172, height: 185)
                            VStack{
                                Text("카드보내기")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.system(size: 18))
                                Image("CardSend")
                                    .resizable()
                                    .frame(width: 92, height: 39)
                                Text("1시간 14분")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            
                        }
                    }
                }
            }
            .padding(12)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 137, height: 29)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("Primary"))
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
