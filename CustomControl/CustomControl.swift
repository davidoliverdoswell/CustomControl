//
//  CustomControl.swift
//  CustomControl
//
//  Created by David Doswell on 1/8/19.
//  Copyright © 2019 David Doswell. All rights reserved.


import UIKit

class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)

        setUp()
    }
    
    private func setUp() {
        for i in 1...5 {
            let label = UILabel()
            self.addSubview(label)
            labels.append(label)
            label.tag = i
            let x = componentDimension * CGFloat(i-1) + CGFloat(8 * i)
            label.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "★"
            label.textAlignment = .center
            label.textColor = i == 0 ? componentActiveColor : componentInactiveColor
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    private func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: self)
            if label.frame.contains(touchPoint) {
                label.tag = value
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            } else if !label.frame.contains(touchPoint) {
                label.tag = value
                label.textColor = componentInactiveColor
                sendActions(for: .valueChanged)
            }
        }
    }
    
    private var labels: [UILabel] = []
    
    var value: Int = 1

    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
