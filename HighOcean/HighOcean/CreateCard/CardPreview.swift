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
    
    @State private var showingAlert = false
    @State private var imageURL: String = ""
    @State private var newCard: Card = Card(context: "", image: "", createdDate: "", from: "", to: "", creator: "", isLiked: false, isChecked: false, show: false)
    @State private var uploadimage: Bool = false
    @Binding var firstNaviLinkActive: Bool
    @EnvironmentObject var cards: Cards
    
    let user: User
    
    var body: some View {
        ZStack {
            Color("Secondary")
                .ignoresSafeArea()
            if uploadimage {
                CardView(card: $newCard, isHeartButton: false, isCheckedPreview: true)
                    .environmentObject(cards)
            }
        }
        .onAppear {
            let formatter = DateFormatter()
            formatter.dateFormat = "yy-MM-dd"
            let createDate = formatter.string(from: Date())
            uploadImageToStorage(coverImage)
            newCard = Card(context: content, image: imageURL, createdDate: createDate, from: sendUser, to: reciveUser, creator: user.name, isLiked: false, isChecked: false, show: false)
        }
        .navigationTitle("미리보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .toolbar {
            Button (action: {
                self.showingAlert.toggle()
            }) {
                Text("보내기")
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("진짜 보내용?"),
                            message: Text("마음이가 물어다 드릴게요!"),
                            primaryButton: .default(Text("전송"), action: {
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
        data = image.jpegData(compressionQuality: 0.5)!
        let filePath = UUID().uuidString
        imageURL = filePath
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storage.reference().child(filePath).putData(data, metadata: metaData) { (metaData, error) in
            uploadimage = true
            if let error = error {
                return
            }
        } 
    }
}
