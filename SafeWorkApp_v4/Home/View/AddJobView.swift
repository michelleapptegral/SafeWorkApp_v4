//
//  AddJobView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/8/21.
//

import UIKit

class AddJobView : UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder) has not been implemented")
    }
    
    let jobNameTextField: UITextField =
    {
        let tf = UITextField(placeHolder: "Job Name")
        tf.autocapitalizationType = .none
        var placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Job Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        tf.textColor = .black
        return tf
    }()
    
    lazy var situationTextField : UITextField =
    {
        let tf = UITextField(placeHolder: "Situation")
        tf.autocapitalizationType = .none
        var placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Situation", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        tf.textColor = .black
        return tf
    }()
    
    lazy var substanceTextField : UITextField =
    {
        let tf = UITextField(placeHolder: "Substance Type")
        tf.autocapitalizationType = .none
        var placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Substance Type", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        tf.textColor = .black
        return tf
    }()
    
    lazy var pressureTextField : UITextField =
    {
        let tf = UITextField(placeHolder: "System Pressure (Bar(g))")
        tf.autocapitalizationType = .none
        var placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "System Pressure (Bar(g))", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        tf.textColor = .black
        return tf
    }()
    
    lazy var lineTextField : UITextField =
    {
        let tf = UITextField(placeHolder: "Line Size")
        tf.autocapitalizationType = .none
        var placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Line Size", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        tf.textColor = .black
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
    
    func setupView()
    {
        stackView.addArrangedSubview(jobNameTextField)
        stackView.addArrangedSubview(situationTextField)
        stackView.addArrangedSubview(substanceTextField)
        stackView.addArrangedSubview(pressureTextField)
        stackView.addArrangedSubview(lineTextField)
        stackView.sizeToFit()
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 300)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
