//
//  Job.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/7/21.
//

import Foundation

struct Job
{
    var jobName : String
    var situation : String
    var substance: String
    var pressure: String
    var line: String
    var riskFactor: String
    
    init(jobName:String, situation:String, substance:String, pressure:String, line:String, riskFactor: String)
    {
        self.jobName = jobName
        self.situation = situation
        self.substance = substance
        self.pressure = pressure
        self.line = line
        self.riskFactor = riskFactor
    }
}
