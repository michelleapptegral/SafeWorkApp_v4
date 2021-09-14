//
//  JobDetailController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/13/21.
//

import UIKit
import Firebase

class JobDetailController : UIViewController
{
    var jobDetailView: JobDetailView!
    private let database = Database.database().reference()
    guard let uid = Auth.auth().currentUser?.uid else {return}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Job Details"
        
        setupView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView()
    {
        let jobDetailView = JobDetailView(frame: self.view.frame)
        self.jobDetailView = jobDetailView
        self.view.addSubview(jobDetailView)
    }
}
