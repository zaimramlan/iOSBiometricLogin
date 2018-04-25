//
//  UILabel+Animations.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 26/04/2018.
//  Copyright © 2018 ZaimRamlan. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
  
  // MARK: Enums
  
  enum PresentationType {
    case withAnimation, withoutAnimation
  }
  
  // MARK: Show
  
  func show(_ presentationType: PresentationType) {
    self.isHidden = false
    
    switch presentationType {
    case .withAnimation:
      UIView.animate(withDuration: 0.5, animations: {
        self.alpha = 1.0
      })
      
    case .withoutAnimation:
      self.alpha = 1.0
    }
  }
  
  // MARK: Hide
  
  func hide(_ presentationType: PresentationType) {
    switch presentationType {
    case .withAnimation:
      UIView.animate(withDuration: 0.5, animations: {
        self.alpha = 0.0
      })
      
    case .withoutAnimation:
      self.alpha = 0.0
    }
    
    self.isHidden = true
  }
}
