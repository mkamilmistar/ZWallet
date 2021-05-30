//
//  RegisterViewController.swift
//  Register
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import NVActivityIndicatorView
import Core

class RegisterViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var usernameStack: UIStackView!
    @IBOutlet var passwordStack: UIStackView!
    @IBOutlet var emailStack: UIStackView!
    @IBOutlet var signUpBG: UIView!
    @IBOutlet var usernameIcon: UIImageView!
    @IBOutlet var emailIcon: UIImageView!
    @IBOutlet var passwordIcon: UIImageView!
    @IBOutlet var showPasswordBtn: UIButton!
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loadingView: NVActivityIndicatorView!
    
    var presenter: RegisterPresenter?
    var iconClick: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBG.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
        
        setupView()
        
        self.loadingView.color = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 1)
        self.loadingView.type = .ballRotateChase
    }
    
    func setupView() {
        usernameIcon.image = UIImage(named: "person", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        passwordIcon.image = UIImage(named: "lock", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        emailIcon.image = UIImage(named: "mail", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        let passwordIcon = UIImage(named: "eye-crossed", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        showPasswordBtn.setImage(passwordIcon, for: .normal)
        
        disabledMainButton(registerBtn)
        
        emailField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        usernameField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if emailField.text?.isEmpty ?? false || passwordField.text?.isEmpty ?? false || usernameField.text?.isEmpty ?? false {
            disabledMainButton(registerBtn)
        } else {
            enabledMainButton(registerBtn)
        }
    }

    @IBAction func showPasswordAction(_ sender: UIButton) {
        if iconClick == true {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        self.loadingView.startAnimating()
        let username: String = usernameField.text ?? ""
        let email: String = emailField.text ?? ""
        let password: String = passwordField.text ?? ""
       
        DispatchQueue.main.async {
            self.presenter?.register(usernmae: username, email: email, password: password)
            self.loadingView.stopAnimating()
        }
    }
    
    @IBAction func backNavigationToLogin(_ sender: UIButton) {
        self.presenter?.backNavigation(viewController: self)
    }
}

extension RegisterViewController: RegisterView {
    func navigateToOTP() {
        self.presenter?.parsingEmail()
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Email salah atau sudah ada",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
