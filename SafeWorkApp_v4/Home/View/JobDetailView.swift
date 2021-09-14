//
//  JobDetailView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/13/21.
//

import UIKit

class JobDetailView : UIView
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
        stackView.addArrangedSubview(jobNameDetailView)
        stackView.addArrangedSubview(riskFactorDetailView)
        stackView.addArrangedSubview(situationDetailView)
        stackView.addArrangedSubview(substanceDetailView)
        stackView.addArrangedSubview(pressureDetailView)
        stackView.addArrangedSubview(lineDetailView)
        stackView.sizeToFit()
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 300)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        print("viewsetup")
    }
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var jobNameDetailView : UITextView = {
        let jobNameDetailView = UITextView()
        jobNameDetailView.font = UIFont.systemFont(ofSize: 18)
        jobNameDetailView.textColor = .black
        jobNameDetailView.text = "Job Name: "
        jobNameDetailView.isScrollEnabled = false
        return jobNameDetailView
    }()
    
    lazy var riskFactorDetailView : UITextView = {
        let riskFactorDetailView = UITextView()
        riskFactorDetailView.font = UIFont.systemFont(ofSize: 18)
        riskFactorDetailView.textColor = .black
        riskFactorDetailView.text = "Risk Factor: "
        riskFactorDetailView.isScrollEnabled = false
        return riskFactorDetailView
    }()
    
    lazy var situationDetailView : UITextView = {
        let situationDetailView = UITextView()
        situationDetailView.font = UIFont.systemFont(ofSize: 18)
        situationDetailView.textColor = .black
        situationDetailView.text = "Situation: "
        situationDetailView.isScrollEnabled = false
        return situationDetailView
    }()
    
    lazy var substanceDetailView : UITextView = {
        let substanceDetailView = UITextView()
        substanceDetailView.font = UIFont.systemFont(ofSize: 18)
        substanceDetailView.textColor = .black
        substanceDetailView.text = "Substance Type: "
        substanceDetailView.isScrollEnabled = false
        return substanceDetailView
    }()
    
    lazy var pressureDetailView : UITextView = {
        let pressureDetailView = UITextView()
        pressureDetailView.font = UIFont.systemFont(ofSize: 18)
        pressureDetailView.textColor = .black
        pressureDetailView.text = "Pressure: "
        pressureDetailView.isScrollEnabled = false
        return pressureDetailView
    }()
    
    lazy var lineDetailView : UITextView = {
        let lineDetailView = UITextView()
        lineDetailView.font = UIFont.systemFont(ofSize: 18)
        lineDetailView.textColor = .black
        lineDetailView.text = "Line size: "
        lineDetailView.isScrollEnabled = false
        return lineDetailView
    }()}
