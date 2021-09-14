//
//  SignUpController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 8/31/21.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    var signUpView: SignUpView!
    var defaults = UserDefaults.standard
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        setupView()
    }
    
    func setupView()
    {
        let signUpView = SignUpView(frame: self.view.frame)
        self.signUpView = signUpView
        self.signUpView.signUpButton.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        self.signUpView.cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        self.view.addSubview(signUpView)
        
    }   
    
    @objc func submitPressed()
    {
        guard let email = signUpView.emailTextField.text else {return}
        guard let password = signUpView.passwordTextField.text else {return}
        guard let firstName = signUpView.firstNameTextField.text else {return}
        guard let lastName = signUpView.lastNameTextField.text else {return}
        
        let userData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName
        ]
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err
            {
                print(err.localizedDescription)
            }
            else
            {
                guard let uid = result?.user.uid else {return}
                self.ref.child("users/\(uid)").setValue(userData)
                self.defaults.set(false, forKey: "UserIsLoggedIn")
                print("Successfully created user", uid)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func cancelPressed()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
