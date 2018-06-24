//
//  AddTravelScheduleViewController.swift
//  W13
//
//  Created by SWUCOMPUTER on 2018. 6. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class AddTravelScheduleViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var countryName: UITextField!
    @IBOutlet var textStartDate: UILabel!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var textEndDate: UILabel!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartDate(_ sender: UIDatePicker) {
        let startDateFormatter = DateFormatter()
        startDatePicker.datePickerMode = .date
        startDateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.textStartDate.text = startDateFormatter.string(from: self.startDatePicker.date)
    }
    
    @IBAction func getEndDate(_ sender: UIDatePicker) {
        let endDateFormatter = DateFormatter()
        endDatePicker.datePickerMode = .date
        endDateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.textEndDate.text = endDateFormatter.string(from: self.endDatePicker.date)
        
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "TravelInformation", in: context)
        // TravelInformation record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(countryName.text, forKey: "countryName")
        object.setValue(textStartDate.text, forKey: "startDate")
        object.setValue(textEndDate.text, forKey: "endDate")
        
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
