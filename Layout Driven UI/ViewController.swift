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
        emojiView.mood = sender.selectedSegmentIndex == 0 ? .groovy : .meh
    }

}

