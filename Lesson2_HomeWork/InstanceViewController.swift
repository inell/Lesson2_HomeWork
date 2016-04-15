//
//  InstanceViewController.swift
//  Lesson2_HomeWork
//
//  Created by PetroKov on 14.04.16.
//  Copyright © 2016 PetroKov. All rights reserved.
//

import UIKit

class InstanceViewController: UIViewController {

    @IBOutlet weak var fontLabel: UILabel!
    
    var fontName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontLabel.font = UIFont(name: self.fontName, size: 14)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
