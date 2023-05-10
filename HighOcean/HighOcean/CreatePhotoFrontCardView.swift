//
//  CreatePhotoFrontCardView.swift
//  HighOcean
//
//  Created by apple on 2023/05/10.
//

import SwiftUI


struct CreatePhotoFrontCardView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage = (UIImage(named: "DefaultCover") ?? UIImage())
    
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
                        .frame(width: 254, height: 437)
                    Image("CirclePlus")
                        .resizable()
                        .frame(width: 50,height: 50)
                }
                .onTapGesture {
                    self.isShowingImagePicker = true
                }
                .padding(40)
                Text("포토카드의 사진을 선택해주세요.")
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
        }
    }
}

struct CreatePhotoFrontCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePhotoFrontCardView()
    }
}
