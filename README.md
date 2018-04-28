# Biometric Logins

[![IDE](https://img.shields.io/badge/Xcode-9-blue.svg)](https://developer.apple.com/xcode/)
[![Platform](https://img.shields.io/badge/platform-iOS%2011-green.svg)](https://developer.apple.com/ios/)
[![Language](https://img.shields.io/badge/swift-4-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A sample iOS app to demonstrate logins using biometrics (Face ID/Touch ID) available.

| ![Face ID](http://g.recordit.co/mGg3QzPd2m.gif) | ![Touch ID](http://g.recordit.co/nr8sNbN8oe.gif) |
|-------------------------------------------------|--------------------------------------------------|
|                     Face ID                     |                     Touch ID                     |

## Features
1. Written in CleanSwift architecture
1. A login page to fallback from biometrics authentication failure
1. A biometrics page to authenticate using biometrics
1. A dashboard page providing the capability to enable/disable biometrics login
1. A `BiometricsWorker.swift` that does all the work to authenticate using Face ID/Touch ID

## Biometrics Worker
- Handles the 3 common use-cases in biometrics authentication:
 1. Success
    - Biometrics authentication is successful
    - Routes user to Dashboard
 1. Cancel
    - User cancels biometrics authentication
    - Routes user back to welcome screen
 1. Error
    - Biometrics authentication unsuccessful due to [any possible reason](https://developer.apple.com/documentation/localauthentication/laerror.code)
    - Routes user to Fallback page (Login)

## Protips/Pitfalls
1. In `info.plist` file, add a description to the key `Privacy - Face ID Usage Description`. This will be the _localizedDescription_ for Face ID (as you may have already set for Touch ID) and it will suppress any 'app not updated to handle Face ID' messages.
1. `LocalAuthentication` framework is used to handle both Face ID and Touch ID.