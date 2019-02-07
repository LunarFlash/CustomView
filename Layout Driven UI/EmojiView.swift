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
 */
@IBDesignable
class EmojiView: UIView {

    private static let xibName = "EmojiView"

    @IBInspectable var nibName:String?

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!

    /// Possible states of feeling
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

    /// Setup the xib's view and add it to our current EmojiView
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        // Use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    /// Load the xib file and return in the view
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        changeFeeling(feeling)
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

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView.prepareForInterfaceBuilder()
    }

}





