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
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("언제 집에")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                    Text("들어오시나요?")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    Text("데일리 퇴근 시간을 파악하기 위함이에요.")
                        .font(.system(size: 16))
                        .foregroundColor(Color("Disabled"))
                        .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    VStack(alignment: .leading){
                        Text("근무 요일 설정")
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
                        Text("퇴근시간 설정")
                            .font(.system(size: 18))
                            DatePicker("Please enter a date", selection: $datepk,
                                               displayedComponents: .hourAndMinute)
                                        .datePickerStyle(WheelDatePickerStyle())
                                        .labelsHidden()
                        
                        .frame(width: 350, height: 217)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                    
//                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    NavigationLink(destination: HomeView(user: User(name: userName,date: [isSun, isMon, isTue, isWed, isThu, isFir, isSat], time: datepk,familyRule: familyRule))) {
                        Text("시작하기")
                            .frame(width: 354.0, height:54.0)
                            .font(.system(size: 18))
                            .background(Color("Accent"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
                .padding(20)
            }
        }
    }
}
