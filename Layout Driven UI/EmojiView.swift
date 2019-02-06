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

    private static let xibName = "EmojiView"

    @IBOutlet var contentView: UIView!
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

    override func awakeFromNib() {
        super.awakeFromNib()
        print(emojiLabel)
    }

    // To init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // To init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        print(EmojiView.xibName)
        Bundle.main.loadNibNamed(EmojiView.xibName, owner: self, options: nil)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard emojiLabel != nil, feelingLabel != nil else { return }

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
