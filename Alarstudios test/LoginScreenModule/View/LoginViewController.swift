//
//  LoginViewController.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var loginTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var spinner: UIActivityIndicatorView?
    
    //MARK: - Instances
    
    var presenter: LoginPresenterProtocol?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        spinner?.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Username or Password was entered incorrectly. Please try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func clearTextFields() {
        loginTextField?.text = ""
        passwordTextField?.text = ""
    }
    
    private func showSpinner() {
        spinner?.isHidden = false
        spinner?.startAnimating()
    }
    
    private func hideSpinner() {
        spinner?.isHidden = true
        spinner?.stopAnimating()
    }
    
    //MARK: - IBActions
    
    @IBAction func enterButtonPressed(_ sender: UIButton?) {
        showSpinner()
        presenter?.getEnter(userName: loginTextField?.text, passord: passwordTextField?.text)
    }
    
}

//MARK: - Extensions

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.enterButtonPressed(nil)
        return true
    }
}

extension LoginViewController: LoginViewProtocol {
    func success() {
        presenter?.goToItemsList()
        hideSpinner()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        showAlert()
        clearTextFields()
        hideSpinner()
    }
}

