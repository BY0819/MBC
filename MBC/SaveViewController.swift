//
//  SaveViewController.swift
//  MBC
//
//  Created by swucomputer on 2017. 12. 15..
//  Copyright © 2017년 swucomputer. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    @IBOutlet var textCompany: UITextField!
    
    @IBOutlet var prior1: UIButton!
    @IBOutlet var prior2: UIButton!
    @IBOutlet var prior3: UIButton!
    @IBOutlet var prior4: UIButton!
    @IBOutlet var prior5: UIButton!
    
    @IBOutlet var sex: UISegmentedControl!
    
    var priority : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func selectPriority(_ sender: UIButton) {
        if sender == prior1 {
            prior1.isSelected = true
            prior2.isSelected = false
            prior3.isSelected = false
            prior4.isSelected = false
            prior5.isSelected = false
            priority = 5;
            
        } else if sender == prior2 {
            prior1.isSelected = true
            prior2.isSelected = true
            prior3.isSelected = false
            prior4.isSelected = false
            prior5.isSelected = false
            priority = 4;
            
        } else if sender == prior3 {
            prior1.isSelected = true
            prior2.isSelected = true
            prior3.isSelected = true
            prior4.isSelected = false
            prior5.isSelected = false
            priority = 3;

        } else if sender == prior4 {
            prior1.isSelected = true
            prior2.isSelected = true
            prior3.isSelected = true
            prior4.isSelected = true
            prior5.isSelected = false
            priority = 2;
            
        } else if sender == prior5 {
            prior1.isSelected = true
            prior2.isSelected = true
            prior3.isSelected = true
            prior4.isSelected = true
            prior5.isSelected = true
            priority = 1;
        }else {
            priority = 0; 
        }
        
    }
    
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "BusinessCard", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textPhone.text, forKey: "number")
        object.setValue(textMemo.text, forKey: "memo")
        object.setValue(textCompany.text, forKey: "company")
        object.setValue(priority , forKey: "priority")
        object.setValue(sex.selectedSegmentIndex , forKey: "sex")
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
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
