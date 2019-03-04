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
    var imageSelected: String = ""
    
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
        self.imageSelected = data.images[indexPath.row]
        performSegue(withIdentifier: "pickerToFeed", sender: Any?.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = self.imagePickerCollectionView.frame.size.width/2.1;
        return CGSize(width: dimension, height: dimension)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "pickerToFeed" {
                if let dest = segue.destination as? FeedPickerViewController {
                    dest.imageName = self.imageSelected
                }
            }
        }
    }
}
