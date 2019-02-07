//
//  EmojiView.swift
//  Layout Driven UI
//
//  Created by Yi Wang on 2/6/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

/** A view that displays emjoi based on feelings. 🥴
 */
@IBDesignable
class EmojiView: UIView {

    private static let xibName = "EmojiView"

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
        // Using property observer - didSet to dirty the layout everytime the feeling var changes state.
        didSet {
            // Triggers layoutSubViews at the next frame update
            setNeedsLayout()
        }
    }

    // Called after the view and its subviews were allocated and initialized. It is guaranteed that the view will have all its outlet instance variables set. If initWithCoder: is the beginning of the nib unarchiving process, then awakeFromNib is the end.
    override func awakeFromNib() {
        super.awakeFromNib()
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

    /// Shared initlialization code
    private func commonInit() {
        // Load the xib file, after this line contentView would no longer be nil
        Bundle.main.loadNibNamed(EmojiView.xibName, owner: self, options: nil)
        addSubview(contentView)
        // Use bounds not frame or it'll be offset
        contentView.frame = bounds
        // Make the view stretch with containing view
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard emojiLabel != nil, feelingLabel != nil else { return }

        changeFeeling(feeling)
    }

    private func changeFeeling(_ feeling: Feeling) {
        guard emojiLabel != nil, feelingLabel != nil else { return }

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





