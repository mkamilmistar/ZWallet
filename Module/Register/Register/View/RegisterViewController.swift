//
//  RegisterViewController.swift
//  Register
//
//  Created by MacBook on 25/05/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var usernameStack: UIStackView!
    @IBOutlet var passwordStack: UIStackView!
    @IBOutlet var emailStack: UIStackView!
    @IBOutlet var signUpBG: UIView!
    
    var presenter: RegisterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBG.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
    }

    @IBAction func registerAction(_ sender: UIButton) {
        let username: String = usernameField.text ?? ""
        let email: String = emailField.text ?? ""
        let password: String = passwordField.text ?? ""
        
        self.presenter?.register(usernmae: username, email: email, password: password)
    }
    
    @IBAction func backNavigationToLogin(_ sender: UIButton) {
        self.presenter?.backNavigation(viewController: self)
    }
}

extension RegisterViewController: RegisterView {
    func parsingEmail() {
        self.presenter?.parsingEmail()
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username sudah ada",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
