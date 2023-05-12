import SwiftUI

struct NextBProfileView: View {

    let userName: String
    let familyRule: String
    @State private var isAlarm: Bool = false
    @State private var showAlert = false
    @State private var navigateToHome = false
    
    @State private var isSun = false
    @State private var isMon = false
    @State private var isTue = false
    @State private var isWed = false
    @State private var isThu = false
    @State private var isFir = false
    @State private var isSat = false
    
    @State private var datepk = Date()
    @State var selectedColor = ""
    
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("집에 돌아오는 시간을 선택해 주세요.")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
                Text("카드를 주고받는 시간을 정하기 위해 설정이 필요해요.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("Disabled"))
                    .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                Text("요일")
                    .font(.system(size: 18))
                HStack {
                    WeekButtonView(week: $isSun, weekName: "일")
                    WeekButtonView(week: $isMon, weekName: "월")
                    WeekButtonView(week: $isTue, weekName: "화")
                    WeekButtonView(week: $isWed, weekName: "수")
                    WeekButtonView(week: $isThu, weekName: "목")
                    WeekButtonView(week: $isFir, weekName: "금")
                    WeekButtonView(week: $isSat, weekName: "토")
                }
                .frame(width: 350, height: 97.0)
                .cornerRadius(15)
                .background(Color.white)
                Spacer()
                Text("시간")
                    .font(.system(size: 18))
                    DatePicker("Please enter a date", selection: $datepk,
                                       displayedComponents: .hourAndMinute)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                
                .frame(width: 350, height: 217)
                .background(Color.white)
                .cornerRadius(8)
                Spacer()
                Button(action: {
                    showAlert = true
                }) {
                    Text("시작하기")
                        .frame(width: 354.0, height:54.0)
                        .font(.system(size: 18))
                        .background(Color("Accent"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("알림을 보내겠습니까?"),
                        message: Text("확인을 누르면 알림이 전송됩니다."),
                        primaryButton: .default(Text("승인"), action: {
                            
                            
                            
                            isAlarm = true
                            navigateToHome = true
                        }),
                        secondaryButton: .cancel(Text("비승인"), action: {
                            navigateToHome = true
                        })
                    )
                }
                .background(
                    NavigationLink(destination: HomeView(user: User(name: userName,date: [isSun, isMon, isTue, isWed, isThu, isFir, isSat], time: datepk,familyRule: familyRule, isAlarm: isAlarm)), isActive: $navigateToHome) {
                        EmptyView()
                    }
                    .onDisappear {
                        saveUser()
                    }
                )
            }
            .padding(20)
        }
    }
    
    private func saveUser() {
        let user = User(name: userName,date: [isSun, isMon, isTue, isWed, isThu, isFir, isSat], time: datepk,familyRule: familyRule, isAlarm: true)
        let encodedSettings = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(encodedSettings, forKey: "User")
    }
}
