//
//  tabBarController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/3/21.
//

import UIKit

class TabBarController: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView()
    {
        let jobViewController = UINavigationController(rootViewController: JobController())
        jobViewController.title = "My Jobs"
        
        let settingsController = UINavigationController(rootViewController: SettingsController())
        settingsController.title = "Settings"
        setViewControllers([jobViewController, settingsController], animated: false)
        tabBar.items![0].image = UIImage(systemName: "house")
        tabBar.items![1].image = UIImage(systemName: "gear")
        
    }
    
    
    
}
