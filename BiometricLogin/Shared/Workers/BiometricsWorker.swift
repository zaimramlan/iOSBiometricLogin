//
//  BiometricsWorker.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 26/04/2018.
//  Copyright © 2018 ZaimRamlan. All rights reserved.
//

import Foundation
import LocalAuthentication

class BiometricsWorker {
  
  // MARK: Enums
  
  enum AuthenticationResult {
    case success, error, cancel
  }
  
  // MARK: Main Function
  
  func authenticate(completion: @escaping ((_ result: AuthenticationResult, _ error: NSError?) -> Void)) {
    let context = LAContext()
    context.localizedFallbackTitle = "Use Email & Password"
    context.localizedCancelTitle = "Cancel"
    
    var capibilityError: NSError?
    let authenticationReason = "For faster login ;)"
    
    // check if device supports
    if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &capibilityError) {
      
      // check if can authenticate
      context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationReason, reply: {
        (success, authenticationError) in
        
        // ensure UI-related work is done on the main thread
        DispatchQueue.main.async {
          if success {
            completion(.success, nil)
          }
          else {
            guard let error = authenticationError as NSError? else { return }
            
            let result = self.handleEvaluatePolicyError(code: error.code)
            completion(result, error)
          }
        }
      })
    }
      
    // device doesn't support
    else {
      guard let error = capibilityError else { return }
      
      let result = handleEvaluatePolicyError(code: error.code)
      completion(result, error)
    }
  }
}

// MARK: Private Helpers

private extension BiometricsWorker {
  
  // TODO: Add more error cases

  /// Handle error codes returned by evaluatePolicy
  func handleEvaluatePolicyError(code: Int) -> AuthenticationResult {
    switch code {
    case LAError.userCancel.rawValue:
      return .cancel
      
    default:
      return handleCanEvaluatePolicyError(code: code)
    }
  }
  
  /// Handle error codes returned by canEvaluatePolicy
  func handleCanEvaluatePolicyError(code: Int) -> AuthenticationResult {
    return .error
  }
}
