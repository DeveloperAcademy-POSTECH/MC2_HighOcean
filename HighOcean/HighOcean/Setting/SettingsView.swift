//
//  SettingsView.swift
//  HighOcean
//
//  Created by apple on 2023/05/10.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @Environment(\.presentationMode) private var presentationMode
    let user: User
    let userNotifivationCenter = UNUserNotificationCenter.current()
    
    @State private var isSun = false
    @State private var isMon = false
    @State private var isTue = false
    @State private var isWed = false
    @State private var isThu = false
    @State private var isFir = false
    @State private var isSat = false
    
    @State private var datepk = Date()
    @State var selectedColor = ""
    @State var isAlarm = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            VStack {
                Toggle(isOn: $isAlarm) {
                    Text("알람 설정")
                        .bold()
                        .font(.system(size: 18))
                }
                .padding(EdgeInsets(top: 23, leading: 17, bottom: 23, trailing: 17))
                .frame(width: 353, height: 68)
                .cornerRadius(10)
                .background(.white)
                Spacer()
                VStack {
                    Group {
                        Text("근무 요일 설정")
                            .bold()
                            .font(.system(size: 18))
                        HStack(){
                            WeekButtonView(week: $isSun, weekName: "일")
                            WeekButtonView(week: $isMon, weekName: "월")
                            WeekButtonView(week: $isTue, weekName: "화")
                            WeekButtonView(week: $isWed, weekName: "수")
                            WeekButtonView(week: $isThu, weekName: "목")
                            WeekButtonView(week: $isFir, weekName: "금")
                            WeekButtonView(week: $isSat, weekName: "토")
                        }
                    }
                }
                .frame(width: 350, height: 97.0)
                .cornerRadius(15)
                .background(Color.white)
                Spacer()
                VStack(alignment: .leading) {
                    Text("시간 설정")
                        .bold()
                        .font(.system(size: 18))
                    DatePicker("Please enter a date", selection: $datepk,
                                       displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                }
                .frame(width: 353, height: 315)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
                Button(action: {
                    UserDefaults.standard.removeObject(forKey: "User")
                    self.userNotifivationCenter.removeAllPendingNotificationRequests()
                    appState.rootViewId = UUID()
                }) {
                    Text("Logout")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(Color("Disabled"))
                }
            }
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 135, trailing: 20))
        }
        .onAppear {
            self.isSun = user.date[0]
            self.isMon = user.date[1]
            self.isTue = user.date[2]
            self.isWed = user.date[3]
            self.isThu = user.date[4]
            self.isFir = user.date[5]
            self.isSat = user.date[6]
            self.datepk = user.time
            self.isAlarm = user.isAlarm
        }
        .navigationTitle("설정")
        .navigationBarItems(trailing: Button(action: {
            // 사용자 정보를 저장하고 ContentView로 돌아갑니다.
            user.date = [isSun, isMon, isTue, isWed, isThu, isFir, isSat]
            user.time = datepk
            user.isAlarm = isAlarm
            let encodedSettings = try? JSONEncoder().encode(user)
            UserDefaults.standard.set(encodedSettings, forKey: "User")
            saveAlarm()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("저장")
        })
    }
    
    private func saveAlarm() {
        self.userNotifivationCenter.removeAllPendingNotificationRequests()
    
        let alertWeeks = [isSun, isMon, isTue, isWed, isThu, isFir, isSat].enumerated().compactMap { index, value in
            return value ? index+1 : nil
        }
        
        for week in alertWeeks {
            self.userNotifivationCenter.addNotificationRequest(by: week, time: datepk, isAlarm: isAlarm, userRole: user.familyRule)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(user: User(name: "Ocean", date: [false, true, true, true, true, true, false], time: Date(), familyRule: "부모", isAlarm: true))
        }
    }
}
