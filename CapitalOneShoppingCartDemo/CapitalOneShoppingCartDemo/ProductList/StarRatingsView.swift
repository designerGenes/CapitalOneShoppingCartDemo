//
//  StarRatingsView.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-05-03.
//

import Foundation
import UIKit

/// A view that displays a star rating.
public class StarsView: UIView {
  /// The rating to display.
  public var rating: Int = 0 {
    didSet {
      for i in 0..<5 {
        imageViews[i].tintColor = i < rating ? .orange : .gray
      }
    }
  }
  
  private let imageViews: [UIImageView]
  
  public init() {
    imageViews = (0..<5).map { _ in
      UIImageView(image: UIImage(systemName: "star.fill")!)
    }
    
    super.init(frame: .zero)
    
    directionalLayoutMargins = .zero
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    for view in imageViews {
      stackView.addArrangedSubview(view)
    }
    
    addSubview(stackView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

