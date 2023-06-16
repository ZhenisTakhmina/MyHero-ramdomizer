//
//  ViewController.swift
//  My hero
//
//  Created by Takhmina on 09.12.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, NetworkManagerDelegate {
    
    @IBOutlet weak var heroLabel : UILabel!
    @IBOutlet weak var text1 : UILabel!
    @IBOutlet weak var text2 : UILabel!
    @IBOutlet weak var heroAppearance : UILabel!
    @IBOutlet weak var heroSkills : UILabel!
    @IBOutlet weak var heroImage : UIImageView!
    

    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
        heroAppearance.text = ""
        heroSkills.text = ""
        text1.text = ""
        text2.text = ""
        heroLabel.text = "Get your hero by randomaizer"
        heroLabel.textColor = .orange
        heroLabel.numberOfLines = 0
        heroLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
       
    }

    @IBAction func ButtonDidTap(_ sender: UIButton) {
        let randomID = Int.random(in: 1...731)
        networkManager.getMyHero(by: randomID )
    }
    
    func updateHeroModel(with version: MyHeroResponseModel) {
        let imageURL = URL(string: version.images.sm)
        heroImage.kf.setImage(with: imageURL)
        heroImage.backgroundColor = .black
        heroLabel.text = version.name
        heroLabel.textColor = .orange
        
        text1.text = "Appearance:"
       
        heroAppearance.text = " Gender: \(version.appearance.gender) \n Race: \(version.appearance.race) \n Eye color: \(version.appearance.eyeColor) \n Hair color: \(version.appearance.hairColor)"
        heroAppearance.numberOfLines = 0
        heroAppearance.lineBreakMode = NSLineBreakMode.byWordWrapping
        heroAppearance.textColor = UIColor.orange
        
        text2.text = "Powerstates:"
        
        heroSkills.text = " Intelligence: \(version.powerstats.intelligence) \n Strength: \(version.powerstats.strength) \n Speed: \(version.powerstats.speed) \n Durability: \(version.powerstats.durability) \n Power: \(version.powerstats.power) \n Combat: \(version.powerstats.combat)"
        heroSkills.numberOfLines = 0
        heroSkills.lineBreakMode = NSLineBreakMode.byWordWrapping
        heroSkills.textColor = UIColor.orange
        
        
    }
}

