//
//  Firebase.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class StorageManager {
    let database = Firestore.firestore()
    
    func upload(photo: UIImage, completion: @escaping(Result<URL,Error>)-> Void){
        let uniqName = UUID().uuidString
        let ref = Storage.storage().reference().child("images/" + uniqName)
        
        guard let imageData = photo.jpegData(compressionQuality: 0.3) else { return }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        ref.putData(imageData, metadata: metadata) { metadata, error in
            guard metadata != nil else {
                completion(.failure(error!))
                return }
            ref.downloadURL { url, error in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
            }
    }
    }
    func writeText(text: String) {
        let docRef = database.document("user/folder")
        docRef.setData(["textName":text])
    }
}
