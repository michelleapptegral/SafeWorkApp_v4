//
//  SettingsController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/3/21.
//

import UIKit
import Firebase

class SettingsController: UIViewController
{
    var settingsView: SettingsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Settings"
        
        setupView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }  
    
    func setupView ()
    {
        let settingsView = SettingsView(frame: self.view.frame)
        self.settingsView = settingsView
        self.settingsView.logOutButton.addTarget(self, action: #selector(LogOutTapped), for: .touchUpInside)
        self.view.addSubview(settingsView)
    }
    
    @objc func LogOutTapped ()
    {
        let welcomeView = UINavigationController(rootViewController: WelcomeController())
        
        do
        {
            try Auth.auth().signOut()
            print("User signed out")
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
            
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate)
            {
                sceneDelegate.window?.rootViewController = welcomeView
            }
        }
        catch let err
        {
            print(err.localizedDescription)
        }
    }
}
