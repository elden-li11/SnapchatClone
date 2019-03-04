//
//  ImagePickerViewController.swift
//  Snapchat
//
//  Created by Elden Li on 3/3/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerCollectionView.delegate = self
        imagePickerCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var imagePickerCollectionView: UICollectionView!
    let data = Data()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "snapchatCollectionCell", for: indexPath) as? ImagePickerViewCell {
            cell.collectionImage.image = UIImage(named: data.images[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected \(data.images[indexPath.row])")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = self.imagePickerCollectionView.frame.size.width / 4;
        return CGSize(width: dimension, height: dimension)
    }
}
