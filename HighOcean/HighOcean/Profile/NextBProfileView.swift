import SwiftUI

struct NextBProfileView: View {

    let userName: String
    let familyRule: String
    
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
                HStack(){
                    Button(action: {
                        self.isSun.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isSun ? Color("Secondary") : Color.clear )
    
                            Text("일")
                                .foregroundColor(self.isSun ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isMon.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isMon ? Color("Secondary") : Color.clear )
    
                            Text("월")
                                .foregroundColor(self.isMon ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isTue.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isTue ? Color("Secondary") : Color.clear )
                            Text("화")
                                .foregroundColor(self.isTue ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isWed.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isWed ? Color("Secondary") : Color.clear )
                            Text("수")
                                .foregroundColor(self.isWed ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isThu.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isThu ? Color("Secondary") : Color.clear )
                            Text("목")
                                .foregroundColor(self.isThu ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isFir.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isFir ? Color("Secondary") : Color.clear )
                            Text("금")
                                .foregroundColor(self.isFir ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        self.isSat.toggle()
                    }) {
                        ZStack(){
                            Circle()
                                .fill(self.isSat ? Color("Secondary") : Color.clear )
                            Text("토")
                                .foregroundColor(self.isSat ? Color("Accent") : Color("Primary"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 40, height: 40)
                
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
                NavigationLink(destination: HomeView(user: User(name: userName,date: [isSun, isMon, isTue, isWed, isThu, isFir, isSat], time: datepk,familyRule: familyRule))) {
                    Text("시작하기")
                        .frame(width: 354.0, height:54.0)
                        .font(.system(size: 18))
                        .background(Color("Accent"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .onDisappear {
                    saveUser()
                }
            }
            .padding(20)
        }
    }
    
    private func saveUser() {
        let user = User(name: userName,date: [isSun, isMon, isTue, isWed, isThu, isFir, isSat], time: datepk,familyRule: familyRule)
        let encodedSettings = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(encodedSettings, forKey: "User")
    }
}
