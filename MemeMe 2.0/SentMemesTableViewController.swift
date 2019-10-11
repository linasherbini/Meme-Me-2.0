//
//  SentMemesTableViewController.swift
//  MemeMe 2.0
//
//  Created by 🍑 on 09/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import Foundation
import UIKit


class SentMemesTableViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var savedMemes: [MemeMe]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.savedMemes
    }
    //MARK:- View Functions & Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    //MARK:- Setting Up the Table View Delegate
    //numbers of rows in table is the number of items in SavedMemes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.savedMemes.count
    }
    //setting up the table view cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableCell")!
        let meme = self.savedMemes[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = meme.topTextField + " " + meme.bottomTextField
        cell.imageView?.image = meme.memeImage
        return cell
    }
    //when a cell is selected the detail view appears
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeDetailView = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetailView.meme = self.savedMemes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailView, animated: true)
    }
    //MARK:- Add a New Meme
    @IBAction func addMeme(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: "addMeme", sender: self)
    }
}
//MARK:- Table View Cells 
class SentMemeTableViewCell: UITableViewCell {
    @IBOutlet weak var memeImage: UIImageView!
}
