//
//  CustomControl.swift
//  CustomControl
//
//  Created by David Doswell on 1/8/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)

        setUp()
    }

    func setUp() {

        let firstLabel = UILabel()
        let secondLabel = UILabel()
        let thirdLabel = UILabel()
        let fourthLabel = UILabel()
        let fifthLabel = UILabel()

        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(thirdLabel)
        addSubview(fourthLabel)
        addSubview(fifthLabel)

        var labels = [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel]
    }
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
}
