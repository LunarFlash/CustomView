//
//  ViewController.swift
//  Layout Driven UI
//
//  Created by Yi Wang on 2/6/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiView: EmojiView!

    @IBAction func didSelectMood(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            emojiView.feeling = .groovy
        } else {
            emojiView.feeling = .meh
        }
    }

}

