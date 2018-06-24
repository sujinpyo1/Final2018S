//
//  DetailNoteViewController.swift
//  W13
//
//  Created by SWUCOMPUTER on 2018. 6. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class DetailNoteViewController: UIViewController {

    
    @IBOutlet var textTitle: UILabel!
    @IBOutlet var textDay: UILabel!
    @IBOutlet var textLocation: UILabel!
    @IBOutlet var content: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var detailNote: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let note = detailNote {
            textTitle.text = note.value(forKey: "title") as? String
            textDay.text = note.value(forKey: "date") as? String
            textLocation.text = note.value(forKey: "location") as? String
            content.text = note.value(forKey: "content") as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
