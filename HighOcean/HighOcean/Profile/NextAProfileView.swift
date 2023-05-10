import SwiftUI

struct NextAProfileView: View {
    
    @EnvironmentObject var userName: user
//    @EnvironmentObject var ParentsID: user
    
    @State private var isParents = false
    @State private var isChild = false
    
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("\(userName.name) 님은")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("누구신가요?")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    
                    Text("어떤 역할을 하고 계신지 알려주세요.")
                        .font(.system(size: 16))
                        .foregroundColor(Color("Disabled"))
                        .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack(spacing: 24){
                        
                        
                        
                        //부모 버튼
                        Button(action: {
                            self.isParents.toggle()
                            self.isChild = false
                        }) {
                            ZStack(){
                                RoundedRectangle(cornerRadius: 8).stroke(self.isParents ? Color("Accent") : Color.clear, lineWidth: 4)
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .offset(x: 60, y: -80)
                                    .foregroundColor(self.isParents ? Color("Accent") : Color.clear)
                                
                                Image("ProfileChild")
                                Text("부모")
                                    .foregroundColor(self.isParents ? Color("Accent") : Color("Primary"))
                                    .offset(y: 70)
                            }
                        }
                        .frame(width: 170.0, height:194.0)
                        .background(self.isParents ? Color("Secondary") : Color.white)
                        .cornerRadius(8)

                        //아이 버튼
                        Button(action: {
                            self.isChild.toggle()
                            self.isParents = false
                        }) {
                            ZStack(){
                                RoundedRectangle(cornerRadius: 8).stroke(self.isChild ? Color("Accent") : Color.clear, lineWidth: 4)
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .offset(x: 60, y: -80)
                                    .foregroundColor(self.isChild ? Color("Accent") : Color.clear)
                                
                                Image("ProfileChild")
                                Text("아이")
                                    .foregroundColor(self.isChild ? Color("Accent") : Color("Primary"))
                                    .offset(y: 70)
                            }
                        }
                        .frame(width: 170.0, height:194.0)
                        .background(self.isChild ? Color("Secondary") : Color.white)
                        .cornerRadius(8)
                        
                        
                    }
                    .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color("Disabled"))
                    
                    Spacer()
                    
                    NavigationLink(destination: NextBProfileView()){
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
    struct ContentView_NextAPreviews: PreviewProvider {
        static var previews: some View {
            NextAProfileView()
                .environmentObject(user()) //테스트용 추후 삭제
        }
    }
}
