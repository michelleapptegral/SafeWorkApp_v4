//
//  LogInView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/2/21.
//

import UIKit

class LogInView: UIView {
    
    let backgroundImageView : UIImageView =
    {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bgimg")
        bgimage.contentMode = .scaleToFill
        return bgimage
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder) has not been implemented")
    }
    
    lazy var logInButton: UIButton = {
        let button =  UIButton(type: .custom)
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.setAnchor(width: 0, height: 50)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button =  UIButton(type: .custom)
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Cancel", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.setAnchor(width: 0, height: 50)
        return button
    }()
    
    let emailTextField: UITextField =
    {
        let tf = UITextField(placeHolder: "Email")
        tf.autocapitalizationType = .none
        return tf
    }()
    let passwordTextField: UITextField = {
        let tf = UITextField(placeHolder: "Password")
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    func setupView ()
    {
        addSubview(backgroundImageView)
        backgroundImageView.setAnchor(top: self.topAnchor, bottom: self.bottomAnchor,
                                      left: self.leftAnchor, right: self.rightAnchor,
                                      paddingTop: 0, paddingBottom: 0, paddingLeft: 0,
                                      paddingRight: 0)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(logInButton)
        stackView.addArrangedSubview(cancelButton)
        stackView.sizeToFit()
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 240)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }

}
