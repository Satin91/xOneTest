//
//  PickerController.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showPickerController() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageArray.append(image)
            
            // Здесь изображение должно быть записано в память устройства
            
            storageManager.upload(photo: image) { error in }
        }
        dismiss(animated: true, completion: nil)
    }
}
