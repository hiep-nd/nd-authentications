//
//  ViewController.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 10/12/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

import NDAuthentications
import NDModificationOperators_Swift
import UIKit

class ViewController: UIViewController {
  @IBAction func authButtonTouchUpInside() {
    present(
      NDAuthViewController() • {
        nd_connect(
          viewModel: NDAuthViewModel() • { (avm: inout NDAuthViewModel) in
            avm.signInHandler = {
              print("Auth SignIn")
              $2(nil)
            }

            avm.signUpHandler = {
              print("Auth SignUp")
              $2(nil)
            }
          },
          view: $0
        )
      },
      animated: true
    )
  }

  @IBAction func firebaseAuthButtonTouchUpInside() {
    present(
      NDAuthViewController() • {
        nd_connect(
          viewModel: NDAuthViewModel() • { $0.applyFirebaseAuth() },
          view: $0
        )
      },
      animated: true
    )
  }
}
