//
//  HomeView.swift
//  HighOcean
//
//  Created by apple on 2023/05/09.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift


struct HomeView: View {
    let ref: DatabaseReference = Database.database().reference()
    
    @State private var selectedButtonIndex: Int?
    @State private var isSendCardButtonEnabled: Bool = false
    @State private var isOnApperView: Bool = false
    @State private var sendStartTime: String = ""
    @State var firstNaviLinkActive: Bool = false
    
    @State private var user: User
    @StateObject private var cards: Cards
    
    init(user: User) {
        self._user = State(initialValue: user)
        self._cards = StateObject(wrappedValue: Cards(currentUser: user))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Secondary").ignoresSafeArea()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 369, height: 182)
                        if user.familyRule == "아이" {
                            VStack(alignment: .leading) {
                                Text("지금 무슨 기분이야?")
                                    .bold()
                                    .foregroundColor(Color("Primary"))
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
                        } else {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("평소보다")
                                        .bold()
                                        .foregroundColor(Color("Primary"))
                                        .font(.system(size: 21))
                                    Spacer()
                                    Text("늦은 귀가 Mode")
                                        .bold()
                                        .foregroundColor(Color("Primary"))
                                        .font(.system(size: 21))
                                }
                                .padding(EdgeInsets(top: 46, leading: 17, bottom: 46, trailing: 23))
                                EmojiButtonView(buttonIndex: 0, emotionText: "정시 퇴근", emojiImagename: "happy", selectedButtonIndex: $selectedButtonIndex)
                                Spacer()
                                EmojiButtonView(buttonIndex: 1, emotionText: "야근각", emojiImagename: "mad", selectedButtonIndex: $selectedButtonIndex)
                            }
                            .padding(28)
                        }
                    }
                    .onChange(of: selectedButtonIndex) { newMode in
                        if let uewMode = newMode {
                            user.mode = uewMode
                            if user.familyRule == "아이" {
                                ref.child("mode/child").setValue(selectedButtonIndex)
                            } else {
                                ref.child("mode/parent").setValue(selectedButtonIndex)
                            }
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 369, height: 308)
                        VStack {
                            if (cards.uncheckedCards.count != 0) && isSendCardButtonEnabled {
                                Text("왈왈! ")
                                    .font(.system(size: 17))
                                    .bold()
                                +
                                Text("\(user.name)")
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
                            Image((cards.uncheckedCards.count != 0) && isSendCardButtonEnabled ? "walwalHappy" : "walwalSad")
                                .resizable()
                                .scaledToFit()
                            NavigationLink(destination: NewCardView().environmentObject(cards)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill((cards.uncheckedCards.count != 0) && isSendCardButtonEnabled ? Color("Accent") : Color("Disabled"))
                                        .frame(width: 349, height: 54)
                                    Text("새 카드 확인하기")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18))
                                }
                            }
                            .disabled(!((cards.uncheckedCards.count != 0) && isSendCardButtonEnabled))
                        }
                        .padding(21)
                    }
                    
                    HStack(alignment: .center) {
                        VStack {
                            NavigationLink(destination: LikedCardCollection().environmentObject(cards)) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .frame(width: 172, height: 86)
                                    HStack(alignment: .center) {
                                        Image("Book")
                                            .resizable()
                                            .frame(width: 39, height: 39)
                                            .padding(.trailing, 12)
                                        Text("저장한 카드")
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    .padding(19)
                                }
                            }
                            NavigationLink(destination: TotalCardCollectionView().environmentObject(cards)) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .frame(width: 172, height: 86)
                                    HStack {
                                        Image("Box")
                                            .resizable()
                                            .frame(width: 40, height: 34)
                                            .padding(.trailing, 12)
                                        Text("전체 카드")
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    .padding(19)
                                }
                            }
                        }
                        Spacer()
                        NavigationLink(destination:CreatePhotoFrontCardView(firstNaviLinkActive: $firstNaviLinkActive, user: user), isActive: $firstNaviLinkActive) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(isSendCardButtonEnabled ? Color("Accent") : Color("Disabled"))
                                    .frame(width: 172, height: 185)
                                VStack{
                                    Text("카드보내기")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18))
                                    Image("CardSend")
                                        .resizable()
                                        .frame(width: 92, height: 39)
                                    if !isSendCardButtonEnabled {
                                        Text("\(sendStartTime)\n뒤에 보낼수 있어요")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }
                                }
                            }
                        }
                        .onAppear {
                            cards.loadData()
                            updateButtonAvailability()
                            subtractTime(from: user.time)
                        }
                        .disabled(!isSendCardButtonEnabled)
                    }
                    .padding(12)
                }
                .padding(12)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("Logo")
                            .resizable()
                            .frame(width: 137, height: 29)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView(user: user)) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color("Primary"))
                        }
                    }
                }
            }
        }
        .accentColor(Color("Accent"))
        .navigationBarBackButtonHidden(true)
    }
    
    private func updateButtonAvailability() {
        let calendar = Calendar.current

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        dateFormatter.dateFormat = "HH:mm:ss"

        let currentDate = Date()
        let currentTimeString = dateFormatter.string(from: currentDate)
        let currentTimeDate = dateFormatter.date(from: currentTimeString)!
        
        let userTimeString = dateFormatter.string(from: user.time)
        let userTimeDate = dateFormatter.date(from: userTimeString)!
        
        let hour = calendar.component(.hour, from: currentTimeDate)
        
        if hour < 22 {
            let twoHoursLater = Calendar.current.date(byAdding: .hour, value: 2, to: userTimeDate)!
            isSendCardButtonEnabled = userTimeDate <= currentTimeDate && currentTimeDate <= twoHoursLater
        } else {
            let twoHoursBefore = Calendar.current.date(byAdding: .hour, value: -2, to: userTimeDate)!

            isSendCardButtonEnabled = twoHoursBefore <= currentTimeDate && currentTimeDate <= userTimeDate
        }
        
    }
    
    private func subtractTime(from firstTime: Date) {
        let secondTime = Date()
        let calendar = Calendar.current
                        let components = calendar.dateComponents([.hour, .minute], from: secondTime, to: firstTime)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "HH:mm"
                        
        if let hour = components.hour, let minute = components.minute{
            if hour < 0 && minute < 0{
                let modifiedComponents = DateComponents(hour: hour + 24, minute: minute)
                let modifiedDifference = calendar.date(byAdding: modifiedComponents, to: secondTime)
                let modifiedDifferenceComponents = calendar.dateComponents([.hour, .minute], from: modifiedDifference!, to: secondTime)
                let date = calendar.date(from: modifiedComponents)!
                sendStartTime = dateFormatter.string(from: date)
            } else {
                let date = calendar.date(from: components)!
                sendStartTime = dateFormatter.string(from: date)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(name: "Ocean", date: [false, true, true, true, true, true, false], time: Date(), familyRule: "부모", isAlarm: true))
    }
}
