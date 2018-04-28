//
//  WelcomeUserViewController.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 28/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WelcomeUserDisplayLogic: class {
  func displayWelcomeUserResult(with viewModel: WelcomeUserModels.WelcomeUser.ViewModel)
}

class WelcomeUserViewController: UIViewController, WelcomeUserDisplayLogic {

  // MARK: Properties

  var router: (NSObjectProtocol & WelcomeUserRoutingLogic & WelcomeUserDataPassing)?
  var interactor: WelcomeUserBusinessLogic?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = WelcomeUserInteractor()
    let presenter = WelcomeUserPresenter()
    let router = WelcomeUserRouter()

    viewController.router = router
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: Use Case - Welcome User
  
  @IBAction func logInButtonClicked(_ sender: Any) {
    welcomeUser()
  }
  
  func welcomeUser() {
    let request = WelcomeUserModels.WelcomeUser.Request()
    interactor?.WelcomeUser(with: request)
  }

  func displayWelcomeUserResult(with viewModel: WelcomeUserModels.WelcomeUser.ViewModel) {
    if viewModel.useBiometrics {
      router?.routeToUseBiometrics()
    }
    else {
      router?.routeToUseEmailPassword()
    }
  }
}