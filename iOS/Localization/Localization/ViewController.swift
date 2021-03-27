//
//  ViewController.swift
//  Localization
//
//  Created by TTN on 25/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var bdayLabel: UILabel!
    
    @IBOutlet weak var lotteryLabel: UILabel!
    
    
    
    @IBOutlet weak var seg: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSelectSegmentClick(_ sender: UISegmentedControl) {
        
        if seg.selectedSegmentIndex == 0 {
            //English
            nameLabel.text = "NameKey".localizableString(loc: "en")
            stateLabel.text = "StateKey".localizableString(loc: "en")
            countryLabel.text = "CountryKey".localizableString(loc: "en")
            bdayLabel.text = "DOBKey".localizableString(loc: "en")
            lotteryLabel.text = "LotteryWonKey".localizableString(loc: "en")
            
    
        }else if seg.selectedSegmentIndex == 1 {
            //German
            nameLabel.text = "NameKey".localizableString(loc: "de-BE")
            stateLabel.text = "StateKey".localizableString(loc: "de-BE")
            countryLabel.text = "CountryKey".localizableString(loc: "de-BE")
            bdayLabel.text = "DOBKey".localizableString(loc: "de-BE")
            lotteryLabel.text = "LotteryWonKey".localizableString(loc: "de-BE")
            
            
        } else {
            //Spanish
            nameLabel.text = "NameKey".localizableString(loc: "es")
            stateLabel.text = "StateKey".localizableString(loc: "es")
            countryLabel.text = "CountryKey".localizableString(loc: "es")
            bdayLabel.text = "DOBKey".localizableString(loc: "es")
            lotteryLabel.text = "LotteryWonKey".localizableString(loc: "es")
            
        }
    }
}

extension String {
    func localizableString(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


