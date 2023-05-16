//
//  CreatePhotoFrontCardView.swift
//  HighOcean
//
//  Created by apple on 2023/05/10.
//

import SwiftUI


struct CreatePhotoFrontCardView: View {
    @State private var position = CGSize.zero
    @State private var isShowingImagePicker: Bool = false
    @State private var isImagePick: Bool = false
    @State private var selectedImage: UIImage = (UIImage(named: "DefaultCover") ?? UIImage())
    @Binding var firstNaviLinkActive: Bool
    @EnvironmentObject var cards: Cards
    @EnvironmentObject var appState: AppState
    let user: User
    
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: 292, height: 480)
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 254, height: 437)
                        .clipped()
                    if !isImagePick {
                        Image("CirclePlus")
                            .resizable()
                            .frame(width: 50,height: 50)
                    }
                }
                .onTapGesture {
                    self.isShowingImagePicker = true
                }
                .padding(40)
                Text(isImagePick ? "사진이 선택되었습니다.\n메세지를 쓰시려면 다음을 누르세요." : "포토카드의 사진을 선택해주세요.")
                    .multilineTextAlignment(.center)
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: $selectedImage, isSelected: $isImagePick)
            }
            .accentColor(Color("Accent"))
            .navigationTitle("사진 선택")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CardContentView(corverImage: selectedImage, firstNaviLinkActive: $firstNaviLinkActive, user: user).environmentObject(cards).environmentObject(appState)) {
                        Text("다음")
                    }
                }
            }
        }
    }
}
//
//struct CreatePhotoFrontCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            CreatePhotoFrontCardView()
//        }
//    }
//}
