//
//  File.swift
//  MasterConverge
//
//  Created by MiTu on 2020/6/24.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

// MARK: MasterConverge SnapKit Namespace
extension UIView {
    var mc: ConstraintViewDSL { return snp }
    
    @discardableResult
    func sup(_ fatherView: UIView) -> UIView {
        fatherView.addSubview(self)
        return self
    }
    
    @discardableResult
    func sup(_ fatherView: UIView, below: UIView) -> UIView {
        fatherView.insertSubview(self, belowSubview: below)
        return self
    }
    
    @discardableResult
    func sup(_ fatherView: UIView, above: UIView) -> UIView {
        fatherView.insertSubview(self, aboveSubview: above)
        return self
    }
    
    @discardableResult
    func sup(_ fatherView: UIView, at idx: Int) -> UIView {
        fatherView.insertSubview(self, at: idx)
        return self
    }
    
    @discardableResult
    func frame(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> UIView {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
}

extension UIView {
    convenience init(frame: CGRect = CGRect.zero, tag: Int = 0, backColor: UIColor = .white) {
        self.init()
        self.frame = frame
        self.tag = tag
        self.backgroundColor = backColor
    }
}

