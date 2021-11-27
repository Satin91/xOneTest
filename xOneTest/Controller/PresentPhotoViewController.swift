//
//  PresentImageViewController.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

class PresentPhotoViewController: UIViewController {
    
    var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photo.frame = self.view.bounds
        self.view.addSubview(photo)
        self.view.backgroundColor = .black
    }
    
}
