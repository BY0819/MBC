//
//  ViewController.swift
//  MBC
//
//  Created by swucomputer on 2017. 12. 14..
//  Copyright © 2017년 swucomputer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "start.png")
        self.view.insertSubview(backgroundImage, at: 0)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

