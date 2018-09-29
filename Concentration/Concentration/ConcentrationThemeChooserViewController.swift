//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Vaylet on 25.09.2018.
//  Copyright © 2018 Michel Deiman. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sport":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏑🏇🏼",
        "Animals":"🐶🐱🐭🐹🐯🐴🦄🐻🦁🦊",
        "Faces":"😍😘😇😂😅🤯🤩😎😚🤬"
    ]

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }

}
