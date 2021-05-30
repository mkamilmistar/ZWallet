//
//  LoginViewController.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Core

class LoginViewController: UIViewController {

    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var backgroundLogin: UIView!
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var showPassword: UIButton!
    @IBOutlet var mailIcon: UIImageView!
    @IBOutlet var passwordIcon: UIImageView!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var lineTop: UIView!
    
    var presenter: LoginPresenter?
    var iconClick: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundLogin.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
        
        self.mailIcon.image = UIImage(named: "mail", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        self.passwordIcon.image = UIImage(named: "lock", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        let eye = UIImage(named: "eye-crossed", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        showPassword.setImage(eye, for: .normal)
        
        disabledMainButton(loginBtn)
        
        emailField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailField.text?.isEmpty ?? false || passwordField.text?.isEmpty ?? false {
            disabledMainButton(loginBtn)
        } else {
           enabledMainButton(loginBtn)
        }
    }

    
    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailText.text ?? ""
        let password: String = passwordText.text ?? ""
        
        
        
        self.presenter?.login(email: email, password: password)
    }
    
    @IBAction func navigateToRegisterAction(_ sender: UIButton) {
        self.presenter?.showRegister(viewController: self)
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        if iconClick == true {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
}

extension LoginViewController: LoginView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username atau password anda salah, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
