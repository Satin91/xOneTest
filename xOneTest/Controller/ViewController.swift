//
//  ViewController.swift
//  xOneTest
//
//  Created by Артур on 25.11.21.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
class ViewController: UIViewController, UITextFieldDelegate {

    var textField: UITextField!
    var addImageButton: UIButton!
    var imageViewOnTop: UIImageView!
    let containerView = ContainerView()
    var collectionView: PhotoCollectionView!
    
    
    let database = Firestore.firestore()
    let dataStorage = Storage.storage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupContainerView()
        setupCollectionView()
        setupImageView()
        setupTextfield()
        setupButton()
        setupConstraints()
   
        
    }
    func setupTextfield() {
        textField = UITextField(frame: self.view.bounds)
        textField.placeholder = "Название"
        textField.delegate    = self
        textField.textColor   = UIColor().colorFromHexString("869495")
        textField.font        = UIFont(name: "Ubuntu",size: 26)
        self.view.addSubview(textField)
    }
    
    func writeText(text: String) {
        let docRef = database.document("satin/ff12")
        docRef.setData(["text2":text ])
    }
    
    func setupButton() {
        self.addImageButton = UIButton(frame: .zero)
        self.containerView.addSubview(addImageButton)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular, scale: UIImage.SymbolScale(rawValue: 1)!))
        
        self.addImageButton.setImage(image, for: .normal)
        self.addImageButton.tintColor = .black
        
    }
    func setupCollectionView() {
        self.collectionView = PhotoCollectionView(frame: .zero)
        self.collectionView.delegate   = self
        self.collectionView.dataSource = self
        self.containerView.addSubview(collectionView)
    }
    func setupContainerView() {
        self.view.addSubview(containerView)
    }
    func setupBackground() {
        self.view.backgroundColor = UIColor().colorFromHexString("FAFAFA")
    }
   
    func setupImageView() {
        self.imageViewOnTop = UIImageView(frame: .zero)
        self.imageViewOnTop.image = UIImage(named: "imageViewOnTop")
        self.imageViewOnTop.contentMode = .scaleAspectFit
        self.view.addSubview(imageViewOnTop)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text , !text.isEmpty {
            writeText(text: text)
        }
        
        return true
    }
    
//    let docRef = database.document("satin/ff12")
//    docRef.getDocument { snapshot, error in
//        guard let data = snapshot?.data(), error == nil else { return }
//        print(data)
//    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        
        return cell
    }
    
    
    
}
