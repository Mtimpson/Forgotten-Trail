//
//  HeroInfoController.swift
//  ForgottenTrail
//
//  Created by Matt on 6/23/16.
//  Copyright © 2016 newBorn Software Development Company. All rights reserved.
//

import Foundation
import UIKit

class HeroInfoController : UIViewController {
    
    @IBOutlet weak var bground: UIImageView!
    
    
    override func viewDidLoad() {
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bground.png")!)
        
        
    }
    
    
}