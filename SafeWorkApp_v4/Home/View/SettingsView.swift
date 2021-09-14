//
//  SettingsView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/3/21.
//

import UIKit

class SettingsView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder) has not been implemented")
    }
    
    func setupView()
    {
        stackView.addArrangedSubview(logOutButton)
        stackView.sizeToFit()
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 60)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    lazy var logOutButton: UIButton = {
        let button =  UIButton(type: .custom)
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Log Out", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.blue]))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.blue.cgColor
        button.setAnchor(width: 0, height: 50)
        return button
    }()
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
}
