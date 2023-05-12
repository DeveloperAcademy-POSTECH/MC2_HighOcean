//
//  CardPreview.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/10.
//

import SwiftUI
import FirebaseStorage

struct CardPreView: View {
    @Environment(\.presentationMode) var presentationMode
    private let storage = Storage.storage()
    
    let content : String
    let reciveUser : String
    let sendUser : String
    let coverImage: UIImage
    var newCard: Card?
    
    @State private var showingAlert = false
    @State private var imageURL:String = ""
    @Binding var firstNaviLinkActive: Bool
    
    let user: User
    
    var body: some View {
        ZStack {
            Color("Secondary")
                .ignoresSafeArea()
            //            CardView(card: newCard)
        }
        .navigationTitle("미리보기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbarRole(.editor)
        .toolbar {
            Button (action: {
                self.showingAlert.toggle()
            }) {
                Text("보내기")
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("진짜 보내용?"),
                            message: Text("왈왈이가 물어다 드릴게요!"),
                            primaryButton: .default(Text("전송"), action: {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yy-MM-dd"
                                let createDate = formatter.string(from: Date())
                                uploadImageToStorage(coverImage)
                                let newCard = Card(context: content, image: imageURL, createdDate: createDate, from: sendUser, to: reciveUser, creator: user.name, isLiked: false, isChecked: false, show: false)
                                Cards(currentUser: user).addNewCard(card: newCard)
                                firstNaviLinkActive = false
                            }),
                            secondaryButton: .cancel(Text("취소"), action: {})
                        )
                    }
            }
        }
    }
    
    func uploadImageToStorage(_ image: UIImage) {
        var data = Data()
        data = image.jpegData(compressionQuality: 0.8)!
        let filePath = UUID().uuidString
        imageURL = filePath
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storage.reference().child(filePath).putData(data, metadata: metaData) { (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        
    }
}
