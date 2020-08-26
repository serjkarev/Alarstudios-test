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
    
    //MARK: - Instances
    
    weak var presenter: LoginPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - IBActions
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        
    }
    
}

//MARK: - Extensions

extension LoginViewController: LoginViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}

