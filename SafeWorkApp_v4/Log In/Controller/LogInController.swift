//
//  LogInController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/2/21.
//

import UIKit
import Firebase

class LogInController: UIViewController {

    var logInView: LogInView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView()
    {
        let logInView = LogInView(frame: self.view.frame)
        self.logInView = logInView
        self.logInView.logInButton.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        self.logInView.cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        self.view.addSubview(logInView)
    }
    
    @objc func submitPressed()
    {
        guard let email = logInView.emailTextField.text else {return}
        guard let password = logInView.passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
            if let err = error
            {
                print(err.localizedDescription)
            }
            else
            {
                print("User: \(user!.user.uid) signed in")
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
                let tabBarVC = TabBarController()                
                self.navigationController?.pushViewController(tabBarVC, animated: true)
            }
        }
    }
    
    @objc func cancelPressed ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
