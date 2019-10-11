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
    @IBOutlet weak var memeName: UILabel!
    
    var meme: MemeMe!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memedImage!.image = meme.memeImage
        self.memeName.text = meme.topTextField + " " + meme.bottomTextField
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
}
