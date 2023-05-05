import SwiftUI

struct NextAProfileView: View {

    @State private var leftToggle = false
    
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("Name님은")
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
                        Button("부모") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .frame(width: 164.0, height:194.0)
                        .background(Color.white)
                        
                        Button("아이") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .frame(width: 164.0, height:194.0)
                        .background(Color.white)
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
        }
    }
}
