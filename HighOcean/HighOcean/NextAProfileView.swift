import SwiftUI

struct NextAProfileView: View {
    
    @EnvironmentObject var userName: user
    
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("님은")
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
                    
                    VStack(spacing: 24){
                        Button("어무이") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ // 엄마
                        }
                        .frame(width: 340.0, height:80.0)
                        .background(Color.white)
                        
                        Button("아뷰지") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/// 아빠
                        }
                        .frame(width: 340.0, height:80.0)
                        .background(Color.white)
                        
                        Button("아이") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*///아이 7
                        }
                        .frame(width: 340.0, height:80.0)
                        .background(Color.white)
                    }
                    .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color("Disabled"))
                    
                    Spacer()
                    
                    //데이터 확인용 테스트 영역 ------
                    Text("아이 이름은 \(userName.name)")
                    //데이터 확인용 테스트 영역 ------
                    
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
