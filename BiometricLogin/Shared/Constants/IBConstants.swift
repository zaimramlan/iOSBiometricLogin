//
//  IBConstants.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 28/04/2018.
//  Copyright © 2018 ZaimRamlan. All rights reserved.
//

import Foundation

enum IBConstants {
  enum Storyboard {
    static let Login = "Login"
    static let Dashboard = "Dashboard"
  }
  
  enum ViewController {
    enum Login {
      static let UseEmailPassword = "UseEmailPasswordVC"
      static let UseBiometrics = "UseBiometricsVC"
    }
    
    enum Dashboard {
      static let Home = "DashboardHomeVC"
    }
  }
}
