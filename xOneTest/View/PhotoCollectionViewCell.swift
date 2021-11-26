//
//  PhotoCollectionViewCell.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "PhotoCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    func configure() {
        self.layer.cornerRadius = 14
        self.backgroundColor = .systemGray4
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
