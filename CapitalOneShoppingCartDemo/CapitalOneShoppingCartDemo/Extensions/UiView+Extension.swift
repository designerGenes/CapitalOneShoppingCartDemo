//
//  UiView+Extension.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import UIKit
import Foundation

public extension UIView {
    
    func constraintsToFillSuperview() -> [NSLayoutConstraint] {
        return self.constraintsToFillSuperview(insets: .zero)
    }
    
    func constrainToFillSuperview() {
        NSLayoutConstraint.activate(self.constraintsToFillSuperview())
    }
    
    func constraintsToFillSuperview(insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        guard let superview = self.superview else { return [] }
        var constraints: [NSLayoutConstraint] = []
        constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top))
        constraints.append(self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left))
        constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom))
        constraints.append(self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right))
        return constraints
    }
    
    
    func constrainToFillSuperview(insets: UIEdgeInsets) {
        NSLayoutConstraint.activate(self.constraintsToFillSuperview(insets: insets))
    }
    
    
}

