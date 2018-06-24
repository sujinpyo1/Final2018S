//
//  AddScheduleViewController.swift
//  W13
//
//  Created by SWUCOMPUTER on 2018. 6. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class AddScheduleViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var schedule: UITextField!
    @IBOutlet var detailSchedule: UITextField!
    @IBOutlet var time: UILabel!
    @IBOutlet var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getTime(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timePicker.datePickerMode = .time
        timeFormatter.dateFormat = "hh시 mm분 a"
        self.time.text = timeFormatter.string(from: self.timePicker.date)
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Schedule", in: context)
        // TravelSchedule record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(schedule.text, forKey: "travelPlan")
        object.setValue(time.text, forKey: "planTime")
        object.setValue(detailSchedule.text, forKey: "detailPlan")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
        
    }
  
    
}
