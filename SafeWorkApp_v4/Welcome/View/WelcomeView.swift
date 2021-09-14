//
//  WelcomeView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 8/24/21.
//

import UIKit

class WelcomeView: UIView {
    
    var loginAction: (() -> Void)?
    var signupAction:(() -> Void)?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init?(coder) has not been implemented")
    }
    
    func setupView()
    {
        addSubview(backgroundImageView)
        backgroundImageView.setAnchor(top: self.topAnchor, bottom: self.bottomAnchor,
                                      left: self.leftAnchor, right: self.rightAnchor,
                                      paddingTop: 0, paddingBottom: 0, paddingLeft: 0,
                                      paddingRight: 0)
        
        let signUpButton = createButtons(buttonTitle: "Sign Up")
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        let logInButton = createButtons(buttonTitle: "Log In")
        logInButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        let stackView = createStackView(with: NSLayoutConstraint.Axis.vertical)
        
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(logInButton)
        stackView.sizeToFit()
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 110)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    @objc func handleLogin()
    {
        loginAction?()
    }
    
    @objc func handleSignUp()
    {
        signupAction?()
    }
    
    let backgroundImageView : UIImageView =
    {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bgimg")
        bgimage.contentMode = .scaleToFill
        return bgimage
    }()
    
    private func createButtons(buttonTitle: String) -> UIButton
    {
        let button =  UIButton(type: .custom) 
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.setAnchor(width: 0, height: 50)
        return button
    }
    
    private func createStackView(with layout: NSLayoutConstraint.Axis) -> UIStackView
    {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }
    
}
