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
    var storageManager = StorageManager()
    var imageArray: [UIImage] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor().colorFromHexString("212020")
        label.font = UIFont(name: "Oswald-Light",size: 40)
        label.text = "Локации"
        label.frame = .zero
        return label
    }()
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
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.view.addSubview(textField)
    }
    func setupButton() {
        self.addImageButton = UIButton(frame: .zero)
        self.containerView.addSubview(addImageButton)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular, scale: UIImage.SymbolScale(rawValue: 1)!))
        self.addImageButton.setImage(image, for: .normal)
        self.addImageButton.tintColor = .black
        self.addImageButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
        
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
        self.imageViewOnTop.addSubview(self.titleLabel)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        // Здесь текст должен быть записан в память устройства
        
        guard let text = textField.text else { return }
        storageManager.writeText(text: text)
    }
    @objc func addImageButtonTapped() {
        showPickerController()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text , !text.isEmpty {
            storageManager.writeText(text: text)
        }
        textField.resignFirstResponder()
        return true
    }
    func presentPhoto(_ photo: UIImage) {
        let presentedController = PresentPhotoViewController()
        presentedController.photo.image = photo
        present(presentedController, animated: true, completion: nil)
    }
}


