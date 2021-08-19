//
//  ViewController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 8/18/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        
        let signUpButton = createButtons(buttonTitle: "Sign Up")
        let logInButton = createButtons(buttonTitle: "Log In")
        let stackView = createStackView(with: NSLayoutConstraint.Axis.vertical)
        
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(logInButton)
        stackView.sizeToFit()
        view.addSubview(stackView)
        self.view = view
        
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
    }

    private func createButtons(buttonTitle: String) -> UIButton
    {
        //var buttons = [UIButton]()
        let button =  UIButton(type: .custom)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }
    
    private func createStackView(with layout: NSLayoutConstraint.Axis) -> UIStackView
    {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = layout
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }
}

