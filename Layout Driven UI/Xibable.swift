//
//  Xibable.swift
//  Layout Driven UI
//
//  Created by Yi Wang on 2/7/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

/**
 Protocol intended for UIView subclasses that are intantiated from Xib, allowing easy integration with Storyboard.
 */
protocol Xibable where Self: UIView {
    /// File name of the xib
    var nibName: String? { get }
}

extension Xibable {

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
    private func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }

}

