//
//  InfoController.swift
//  ForgottenTrail
//
//  Created by Matt on 7/26/16.
//  Copyright © 2016 newBorn Software Development Company. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class InfoController : UIViewController {
    
    @IBOutlet weak var bground: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var abilityUsesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var leftChar: UIImageView!
    @IBOutlet weak var midChar: UIImageView!
    @IBOutlet weak var rightChar: UIImageView!
    
    var variant1 : String!
    var variant2 : String!
    var variant3 : String!
    
    var name : String!
    var descrip : String!
    var numVariants : Int!
    var abil : String!
    var abilUses : Int!
    var stepCount : Int!
    
    var var2str : String!
    var var3str : String!
    
    var heroChosen : HeroType!
    
    var indx = 0
    //array to store the images used to animate each hero
    var imageList = [UIImage]()
    
    
    override func viewDidLoad() {
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bground.png")!)
        heroChosen = heroClicked
        name = heroNames[heroChosen]
        descrip = heroDescriptions[heroChosen]
        numVariants = heroVariants[heroChosen]
        abil = heroAbilities[heroChosen]
        abilUses = heroActions[heroChosen]
        stepCount = heroSteps[heroChosen]
        
        
        nameLabel.text = name
        if stepCount != nil {
            stepLabel.text = "Steps: \(stepCount!)"
        } else {
            stepLabel.text = "Steps: ∞"
        }

        if abilUses != nil {
            abilityUsesLabel.text = "Actions: \(abilUses!)"
        } else {
            abilityUsesLabel.text = "Actions: ∞"
        }
        descriptionLabel.text = descrip
        if HeroType.villains.contains(heroChosen) {
            abilityLabel.text = abil
        } else {
            abilityLabel.text = "Ability: \(abil!)"
        }
        
       
        
        if numVariants == 1 {
            variant1 = "\(heroChosen.rawValue)Front"
            //midChar.image = UIImage(named: variant1)
            getAnimation(midChar, variant: variant1)
            midChar.contentMode = .scaleAspectFit
            
            
        } else if numVariants == 3 {
            variant1 = "\(heroChosen.rawValue)Front"
            variant2 = variant1.replacingOccurrences(of: "0", with: "1")
            variant3 = variant1.replacingOccurrences(of: "0", with: "2")
            getAnimation(leftChar, variant: variant1)
            getAnimation(midChar, variant: variant2)
            getAnimation(rightChar, variant: variant3)
            
            leftChar.contentMode = .scaleAspectFit
            midChar.contentMode = .scaleAspectFit
            rightChar.contentMode = .scaleAspectFit
        }
    }
    
    func getAnimation(_ charImage : UIImageView, variant : String) {
        
        //clear array of images
        imageList.removeAll()
        let folderName = SKTextureAtlas(named: variant)
        let numImages = folderName.textureNames.count
        //load each image for the new hero into the array
        for i in 1 ..< numImages {
            let imageName = variant + String(i)
            // grab the original image
            let originalImage = UIImage(named: imageName)
            // scaling set to 2.0 makes the image 1/2 the size.
            let scaledImage = UIImage(cgImage: (originalImage?.cgImage)!, scale: (originalImage?.scale)! * 0.5, orientation: (originalImage?.imageOrientation)!)
            imageList.append(scaledImage)
            
        }
        // start the animation
        charImage.animationImages = imageList
        charImage.animationDuration = 1
        charImage.startAnimating()

    }
    
    
    @IBAction func backAct(_ sender: AnyObject) {
        dismiss(animated: true, completion: {})
    }
    
    
}
