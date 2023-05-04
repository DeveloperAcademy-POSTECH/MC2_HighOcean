import SwiftUI

struct NextCProfileView: View {

    @State private var leftToggle = false
    
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("아이에게 초대 링크를")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("공유해주세요")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    
                    
                            Section {
                                Text("근무요일설정")
                                
                                Button("아이") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }

                            }

                                .frame(width: 353, height:212.0)
                                .background(Color.white)
                                .foregroundColor(Color("Primary"))
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: Text("홈 화면")){
                        Text("공유하기")
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
    struct ContentView_NextCPreviews: PreviewProvider {
        static var previews: some View {
            NextCProfileView()
        }
    }
}
