//
//  PhotoCollectionView.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

class PhotoCollectionView: UICollectionView {

    var flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setupCollectionView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    func setupLayout() {
        let width: CGFloat = self.bounds.width - (Layout.indent * 2)
        let size: CGFloat = width / 3 - (Layout.indent * 1.4)
        flowLayout.itemSize = CGSize(width: size, height: size)
        flowLayout.minimumInteritemSpacing = Layout.indent
        flowLayout.minimumLineSpacing      = Layout.indent
        // Отступ * 2 по краям для дополнительного отступа равный ширине рамки
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: Layout.indent * 2, bottom: Layout.indent, right: Layout.indent * 2)
        self.collectionViewLayout = self.flowLayout
    }
    
    func setupCollectionView() {
        self.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

