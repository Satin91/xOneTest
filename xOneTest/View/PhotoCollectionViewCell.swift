//
//  PhotoCollectionViewCell.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "PhotoCell"
    var photoImageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupImageView()
    }
    
    func setupImageView() {
        self.photoImageView = UIImageView(frame: self.bounds)
        self.addSubview(photoImageView)
    }
    func configure() {
        self.layer.cornerRadius = 14
        self.backgroundColor = .systemGray4
        self.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
