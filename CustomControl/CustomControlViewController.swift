//
//  CustomControlViewController.swift
//  CustomControl
//
//  Created by David Doswell on 1/8/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class CustomControlViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value < 2 {
            self.title = "User Rating: \(ratingControl.value) star"
        } else {
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
}
