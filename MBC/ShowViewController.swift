//
//  ShowViewController.swift
//  MBC
//
//  Created by swucomputer on 2017. 12. 15..
//  Copyright © 2017년 swucomputer. All rights reserved.
//

import UIKit
import CoreData


class ShowViewController: UIViewController {

    @IBOutlet var textName: UILabel!
    @IBOutlet var textPhone: UILabel!
    @IBOutlet var textcompany: UILabel!
    @IBOutlet var textMemo: UILabel!
                                                        
    @IBOutlet var picture: UIImageView!
    @IBOutlet var picturePriority: UIImageView!
    var detailCard: NSManagedObject?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let friend = detailCard {
            if let getSex = friend.value(forKey: "sex") as? Int {
                if getSex == 0 {
                    view.backgroundColor = UIColor(red: 255/255, green: 234/255, blue: 234/255, alpha: 1)
                    picture.image = UIImage(named: "woman.png")
                } else if getSex == 1 {
                    view.backgroundColor = UIColor(red: 235/255, green: 232/255, blue: 255/255, alpha: 1)
                    picture.image = UIImage(named: "man.png")
                } else {
                    view.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
                    picture.image = UIImage(named: "handshake.png")
                }
            }
            
            if let getPriority = friend.value(forKey: "priority") as? Int {
                if getPriority == 0 {
                    picturePriority.image = UIImage(named: "star0.png")
                    
                } else if getPriority == 5 {
                    picturePriority.image = UIImage(named: "star1.png")
                    
                } else if getPriority == 4 {
                    picturePriority.image = UIImage(named: "star2.png")
                    
                } else if getPriority == 3 {
                    picturePriority.image = UIImage(named: "star3.png")
                    
                } else if getPriority == 2 {
                    picturePriority.image = UIImage(named: "star4.png")
                    
                } else if getPriority == 1 {
                    picturePriority.image = UIImage(named: "star5.png")
                    
                }
                
            }
            
            textName.text = friend.value(forKey: "name") as? String
            textPhone.text = friend.value(forKey: "number") as? String
            textcompany.text = friend.value(forKey: "company") as? String
            textMemo.text = friend.value(forKey: "memo") as? String
            }
        // Do any additional setup after loading the view.
        
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
