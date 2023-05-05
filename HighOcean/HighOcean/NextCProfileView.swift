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
                        
                    
                    VStack(alignment: .leading){
                        Text("링크생성공간")//밑줄 입력법?
                            .padding(EdgeInsets(top: 40, leading:24, bottom: 0, trailing: 0))
                            .foregroundColor(Color("Primary"))
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("복사하기")
                                .frame(width: 116.0, height: 54.0)
                                .background(Color("Secondary"))
                                .foregroundColor(Color("Accent"))
                                .cornerRadius(1)
//                                .border(Color("Accent"), width: 1) //stroke line Edit
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 27, trailing: 0))
                            
                        }
                        .frame(width: 353)
                        
                        
                    }
                    .frame(height: 212.0)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))
//                            .multilineTextAlignment(.leading)
//
//
//                        Spacer()
//
//                        .frame(width: 304, height:80.0)
//                        .padding(24)
                    
//                    .background(Color.white)
//                    .frame(width: 353, height:212.0)
//
//                    .foregroundColor(Color("Primary"))
//                    .cornerRadius(10)
//                    .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))

                                
                    
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
