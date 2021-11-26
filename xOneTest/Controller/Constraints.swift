//
//  Constraints.swift
//  xOneTest
//
//  Created by Артур on 26.11.21.
//

import UIKit

extension ViewController {
    
    func setupConstraints() {
        self.containerView.translatesAutoresizingMaskIntoConstraints  = false
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.textField.translatesAutoresizingMaskIntoConstraints      = false
        self.addImageButton.translatesAutoresizingMaskIntoConstraints = false
        self.imageViewOnTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // container view constraints
            containerView.heightAnchor.constraint(equalToConstant: self.view.bounds.height / 2.5), // Размер навскидку
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            // collection view constraints
            collectionView.topAnchor.constraint(equalTo: textField.bottomAnchor ),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            // text field constraints
            textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Layout.indent ),
            textField.heightAnchor.constraint(equalToConstant: 60),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Layout.indent * 2),
            textField.trailingAnchor.constraint(equalTo: addImageButton.leadingAnchor),
            // add image button constraints
            addImageButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Layout.indent ),
            addImageButton.heightAnchor.constraint(equalToConstant: 60),
            addImageButton.widthAnchor.constraint(equalToConstant: 60),
            addImageButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Layout.indent ),
            // image on top constraints
            imageViewOnTop.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40 ),
            imageViewOnTop.heightAnchor.constraint(equalToConstant: 120),
            imageViewOnTop.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2),
            imageViewOnTop.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
    }
}
