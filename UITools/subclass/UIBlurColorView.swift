//
//  UIBlurColorView.swift
//  UITools
//
//  Created by Antoine FeuFeu on 19/10/2018.
//  Copyright © 2018 z-zero. All rights reserved.
//

import Foundation
import UIKit

public class UIBlurColorView: UIView {
    
    public let blurView: UIVisualEffectView
    public let colorView: UIView
    @IBInspectable public var color: UIColor = .blue {
        didSet {
            self.colorView.backgroundColor = self.color
        }
    }
    public var blur: UIBlurEffect.Style = .extraLight {
        didSet {
            self.blurView.effect = UIBlurEffect.init(style: self.blur)
        }
    }
    @IBInspectable public var duration: TimeInterval = 1
    @IBInspectable public var active: Bool = false {
        didSet {
            self.animate()
        }
    }
    public func animate() {
        if !self.active {
            UIBlurColorView.animate(withDuration: self.duration, animations: {
                self.blurView.effect = nil
                self.colorView.alpha = 0.0
            })
        }
        else {
            UIBlurColorView.animate(withDuration: self.duration, animations: {
                self.blurView.effect = UIBlurEffect.init(style: self.blur)
                self.colorView.alpha = 1.0
            })
        }
    }
    
    public init(frame: CGRect, style: UIBlurEffect.Style, color: UIColor, duration: TimeInterval, active: Bool = false) {
        self.blurView = UIVisualEffectView.init(frame: frame)
        self.colorView = UIView.init(frame: frame)
        self.blur = style
        self.color = color
        self.duration = duration
        if active {
            self.blurView.effect = UIBlurEffect.init(style: self.blur)
        }
        self.colorView.backgroundColor = self.color
        super.init(frame: frame)
        self.addSubview(self.colorView)
        self.addSubview(self.blurView)
        self.active = active
        self.backgroundColor = .clear
        self.animate()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.blurView = UIVisualEffectView.init()
        self.colorView = UIView.init()
        super.init(coder: aDecoder)
        self.addSubview(self.colorView)
        self.addSubview(self.blurView)
        NSLayoutConstraint.init(item: self.blurView, attribute: .leading, relatedBy: .equal,
                                toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.blurView, attribute: .trailing, relatedBy: .equal,
                                toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.blurView, attribute: .top, relatedBy: .equal,
                                toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.blurView, attribute: .bottom, relatedBy: .equal,
                                toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.colorView, attribute: .leading, relatedBy: .equal,
                                toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.colorView, attribute: .trailing, relatedBy: .equal,
                                toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.colorView, attribute: .top, relatedBy: .equal,
                                toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self.colorView, attribute: .bottom, relatedBy: .equal,
                                toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        self.backgroundColor = .clear
        self.animate()
    }
}
