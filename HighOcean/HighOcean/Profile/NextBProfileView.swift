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
