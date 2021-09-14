//
//  JobView.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/3/21.
//

import UIKit

class JobView: UIView
{
    let tableView = UITableView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        addSubview(tableView)
        setupTableView()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder) has not been implemented")
    }
    
    func setupTableView()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
