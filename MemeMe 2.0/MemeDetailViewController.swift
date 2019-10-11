//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by 🍑 on 09/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import Foundation
import UIKit


class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memedImage: UIImageView!
    
    var meme: MemeMe!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memedImage!.image = meme.memeImage
        self.tabBarController?.tabBar.isHidden=true
    }
    
    
}
