import SwiftUI

struct NextBProfileView: View {

    @State private var leftToggle = false
    
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
                    
                    VStack(alignment: .center){
                        Form {
                            Section {
                            // 파인 작업 예정
                            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                                Text("퇴근시간설정")
                                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                    /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                                    /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                                    
                                }
                            }
                    
                        }
                    }
                    .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: 350, height:465.0)
                    .foregroundColor(Color("Primary"))
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: NextCProfileView()){
                        Text("다음")
                            .frame(width: 354.0, height:54.0)
                            .font(.system(size: 18))
                            .background(Color("Accent"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
            }
            
        }
    }
    
    // 미리보기
    struct ContentView_NextBPreviews: PreviewProvider {
        static var previews: some View {
            NextBProfileView()
        }
    }
}
