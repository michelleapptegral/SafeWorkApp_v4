//
//  JobController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/3/21.
//

import UIKit
import FirebaseDatabase
import Firebase
import Foundation

class JobController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let addJobViewController = AddJobController()
    let jobDetailController = JobDetailController()
    private let database = Database.database().reference()
    var jobs = [Job]()
    var jobView : JobView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "My Jobs"
        
        setupView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getJobs()
    }

    func setupView()
    {
        jobView = JobView(frame: self.view.frame)
        view.addSubview(jobView)
        jobView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "jobCell")
        jobView.tableView.delegate = self
        jobView.tableView.dataSource = self
        jobView.tableView.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Job", style: .plain, target: self, action: #selector(addNewJobPressed))
        
        getJobs()
    }
    
    @objc func addNewJobPressed ()
    {
        self.navigationController?.pushViewController(addJobViewController, animated: true)
    }
    
    
    func getJobs()
    {
        var thisJobArray = [Job]()
        guard let uid = Auth.auth().currentUser?.uid else {return}
        self.database.child("jobs/\(uid)").observeSingleEvent(of: .value, with:{ snapshot in
            for child in snapshot.children
            {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],
                    let jobName = dict["jobName"] as? String,
                    let situation = dict["situation"] as? String,
                    let substance = dict["substance"] as? String,
                    let pressure = dict["pressure"] as? String,
                    let line = dict["line"] as? String,
                    let riskFactor = dict["riskFactor"] as? String
                {
                    let thisJob = Job(jobName: jobName, situation: situation, substance: substance, pressure: pressure, line: line, riskFactor: riskFactor)
                    thisJobArray.append(thisJob)
                }
            }
            self.jobs = thisJobArray
            self.jobView.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath)
        cell.textLabel?.text = jobs[indexPath.row].jobName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(jobDetailController, animated: true)
    }
    
}
