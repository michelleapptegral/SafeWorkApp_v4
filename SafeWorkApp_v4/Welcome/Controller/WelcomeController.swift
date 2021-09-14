//
//  WelcomeController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 8/24/21.
//

import UIKit

class WelcomeController : UIViewController {
    
    var welcomeView : WelcomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView()
    {
        let mainView = WelcomeView(frame: self.view.frame)
        self.welcomeView = mainView
        self.view.addSubview(welcomeView)
        welcomeView.setAnchor(top: view.topAnchor, bottom: view.bottomAnchor,
                              left: view.leftAnchor, right: view.rightAnchor,
                              paddingTop: 0, paddingBottom: 0, paddingLeft: 0,
                              paddingRight: 0)
        self.welcomeView.loginAction = logInPressed
        self.welcomeView.signupAction = signUpPressed
    }
    
    func signUpPressed()
    {
        let signUpController = SignUpController()
        self.navigationController?.pushViewController(signUpController, animated: true)
    }
    
    func logInPressed()
    {
        let logInController = LogInController()
        self.navigationController?.pushViewController(logInController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
