//
//  TextButton.swift
//  imglyKit
//
//  Created by Carsten Przyluczky on 02/02/16.
//  Copyright © 2016 9elements GmbH. All rights reserved.
//

import UIKit

@objc(IMGLYTextButton) public class TextButton: UIButton {

    public var textColor = UIColor.whiteColor()

    public var fontName = "" {
        didSet {
            updateFontLabel()
        }
    }

    public override var frame: CGRect {
        didSet {
            super.frame = frame
            updateFontNameLabelFrame()
        }
    }

    private let fontNameLabel = UILabel()

    public override func setTitleColor(color: UIColor?, forState state: UIControlState) {
        super.setTitleColor(color, forState: state)
        fontNameLabel.textColor = color
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        configureFontLabel()
        updateFontLabel()
    }

    private func configureFontLabel() {
        fontNameLabel.textAlignment = .Center
        addSubview(fontNameLabel)
    }

    private func updateFontLabel() {
        fontNameLabel.font = fontNameLabel.font.fontWithSize(10)
        fontNameLabel.textColor = textColor
        if fontName.characters.count > 0 {
            fontNameLabel.text = fontName
        }
    }

    private func updateFontNameLabelFrame() {
        fontNameLabel.frame = CGRect(x: 0, y: self.bounds.height - 15, width: self.bounds.width, height: 15)
    }
}