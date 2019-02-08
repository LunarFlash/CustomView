//
//  EmojiView.swift
//  Layout Driven UI
//
//  Created by Yi Wang on 2/6/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

/**
 A view that displays emjoi based on feelings. 🥴
 Set the feeling property to change the content in this view.
 - Remark: This view is meant to be instantiated from a xib file: EmojiView.xib
 */
@IBDesignable
class EmojiView: UIView, Xibable {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!

    /// file name of the nib - set in IB
    @IBInspectable var nibName: String?

    /// Possible states of feeling which drives UI changes in this EmojiView.
    enum Feeling {
        case groovy
        case meh
    }

    /// State variable denoting the feeling of this view.
    var feeling: Feeling = Feeling.groovy {
        // didSet is a property observer that triggers when this variable changes
        didSet {
            // Dirty the layout, triggers layoutSubViews at the next frame update
            setNeedsLayout()
        }
    }

    // Called after the view and its subviews were allocated and initialized. It is guaranteed that the view will have all its outlet instance variables set. If initWithCoder: is the beginning of the nib unarchiving process, then awakeFromNib is the end.
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        changeFeeling(feeling)
    }

    // Implement this to allow storyboard to render our custom view.
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
    }

    /**
     Handles UI code to change feeling of this view.
     - Parameters:
        - feeling: The Feeling we are trying to change to.
    */
    private func changeFeeling(_ feeling: Feeling) {
        guard emojiLabel != nil, feelingLabel != nil else { return }
        // Animate the change of text in our labels
        UIView.transition(with: emojiLabel, duration: 1, options: .transitionFlipFromTop, animations: {
            switch feeling {
            case .groovy:
                self.emojiLabel.text = "😎"
                self.feelingLabel.text = "Feeling Irie"
            case .meh:
                self.emojiLabel.text = "😐"
                self.feelingLabel.text = "Meh"
            }
        }, completion: nil)
    }
}





