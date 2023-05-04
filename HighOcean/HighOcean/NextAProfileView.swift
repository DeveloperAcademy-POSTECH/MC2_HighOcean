import SwiftUI

struct NextAProfileView: View {
    
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
                        
                        HStack(){
                            
                            
                            Text("Name님은")
                                .frame(width: 164.0, height:194.0)
                            Text("Name님은")
                                .frame(width: 164.0, height:194.0)
                               
                        }
                            .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))
                    }
                   
                    Spacer()

                 
                    
                    
                    NavigationLink(destination: Text("호호")){
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
