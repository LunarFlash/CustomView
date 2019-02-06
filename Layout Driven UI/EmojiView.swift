//
//  EmojiView.swift
//  Layout Driven UI
//
//  Created by Yi Wang on 2/6/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

@IBDesignable
class EmojiView: UIView {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!

    enum Feeling {
        case groovy
        case meh
    }


    var feeling: Feeling = Feeling.groovy {
        didSet {
            setNeedsLayout()
        }
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()

        switch feeling {
        case .groovy:
            emojiLabel.text = "😎"
            feelingLabel.text = "Feeling Irie"
        case .meh:
            emojiLabel.text = "😐"
            feelingLabel.text = "Meh"
        }
    }



}
