//
//  SentMemesCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by 🍑 on 09/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var SavedMemes: [MemeMe]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.SavedMemes
    }
    //MARK:- View functions & Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    //MARK:- Setting Up Collection View
    //numbers of items in collection view depends on numbers of items in SavedMemes
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.SavedMemes.count
    }
    //setting up a collection view cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemesCollectionViewCells
        let meme = self.SavedMemes[(indexPath as NSIndexPath).row]
        cell.memeImage?.image = meme.memeImage
        return cell
    }
    //when a cell is selected the detail view appears
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeDetailView = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetailView.meme = self.SavedMemes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(memeDetailView, animated: true)
    }
    //MARK:- Add New Meme
    @IBAction func addMeme(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: "addMeme", sender: self)
    }
    
}

//MARK:- Collection View Cells
class SentMemesCollectionViewCells: UICollectionViewCell {
    @IBOutlet weak var memeImage: UIImageView!
}
