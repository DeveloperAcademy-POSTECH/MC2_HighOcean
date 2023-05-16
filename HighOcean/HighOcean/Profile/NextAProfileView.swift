import SwiftUI

struct NextAProfileView: View {
    
    let userName: String
    @State private var isParents: Bool = false
    @State private var isChild: Bool = false
    @State private var familyRule:String = ""
    @EnvironmentObject var appState: AppState
    var body: some View {

        ZStack(){
            Color("Secondary").ignoresSafeArea()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("\(userName) 님은")
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
                            if self.isParents && !self.isChild {
                                self.familyRule = "부모"
                            } else {
                                self.familyRule = ""
                            }
                        }) {
                            ZStack(){
                                RoundedRectangle(cornerRadius: 8).stroke(self.isParents ? Color("Accent") : Color.clear, lineWidth: 4)
                                
                                Image("Oval")
                                    .offset(y: -10)
                                    .opacity(self.isParents ? 1.0 : 0.0)
                                
                                Image("parentsCircle")
                                Text("부모")
                                    .foregroundColor(self.isParents ? Color("Accent") : Color("Primary"))
                                    .offset(y: 70)
                            }
                        }
                        .frame(width: 170.0, height:194.0)
                        .background(Color.white)
                        .cornerRadius(8)

                        //아이 버튼
                        Button(action: {
                            self.isChild.toggle()
                            self.isParents = false
                            if self.isChild && !self.isParents {
                                self.familyRule = "아이"
                            } else {
                                self.familyRule = ""
                            }
                        }) {
                            ZStack(){
                                RoundedRectangle(cornerRadius: 8).stroke(self.isChild ? Color("Accent") : Color.clear, lineWidth: 4)
                                
                                Image("Oval")
                                    .offset(y: -4)
                                    .opacity(self.isChild ? 1.0 : 0.0)
                                
                                Image("childCircle")
                                Text("아이")
                                    .foregroundColor(self.isChild ? Color("Accent") : Color("Primary"))
                                    .offset(y: 70)
                            }
                        }
                        .frame(width: 170.0, height:194.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        
                        
                    }
                    .padding(EdgeInsets(top: 66, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color("Disabled"))
                    
                    Spacer()
                    
                    NavigationLink(destination: NextBProfileView(userName: userName, familyRule: familyRule).environmentObject(appState)) {
                        Text("다음")
                            .frame(width: 354.0, height:54.0)
                            .font(.system(size: 18))
                            .background(familyRule.isEmpty ? Color("Disabled") : Color("Accent"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    .disabled(familyRule.isEmpty)
                }
                .padding(20)
            }
        }
    }
}
