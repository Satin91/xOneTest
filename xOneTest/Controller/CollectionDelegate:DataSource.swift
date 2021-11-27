//
//  CollectionDelegate:DataSource.swift
//  xOneTest
//
//  Created by Артур on 27.11.21.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        let photo = imageArray[indexPath.row]
        cell.photoImageView.image = photo
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        guard let image = cell.photoImageView.image else { return }
        presentPhoto(image)
    }
}
