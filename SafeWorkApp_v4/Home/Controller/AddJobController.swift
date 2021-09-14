//
//  AddJobController.swift
//  SafeWorkApp_v4
//
//  Created by user203205 on 9/8/21.
//

import UIKit
import Firebase

class AddJobController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    var addJobView : AddJobView!
    private let database = Database.database().reference()
    
    var jobNameSelected: String?
    
    let situations = ["A", "B", "C", "D", "E"]
    var situationPickerView = UIPickerView()
    var situationSelected: String?
    
    let substancetypes = ["1", "2", "3", "4", "5", "6", "7"]
    var substancePickerView = UIPickerView()
    var substanceSelected: String?
    
    let pressure = [">100", ">50", ">20", ">10", "< or =10"]
    var pressurePickerView = UIPickerView()
    var pressureSelected: String?
    
    let lines = ["> or = 8\"", "6\"", "4\"", "2\"", "< or = 1\""]
    var linePickerView = UIPickerView()
    var lineSelected: String?
    
    var riskFactor: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Add Jobs"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Job", style: .done, target: self, action: #selector(addJobPressed))
        
        situationPickerView.delegate = self
        situationPickerView.dataSource = self
        situationPickerView.tag = 1
        substancePickerView.delegate = self
        substancePickerView.dataSource = self
        substancePickerView.tag = 2
        pressurePickerView.delegate = self
        pressurePickerView.dataSource = self
        pressurePickerView.tag = 3
        linePickerView.delegate = self
        linePickerView.dataSource = self
        linePickerView.tag = 4
        
        setupView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView()
    {
        let addJobView = AddJobView(frame: self.view.frame)
        self.addJobView = addJobView
        self.view.addSubview(addJobView)
        
        addJobView.situationTextField.inputView = situationPickerView
        addJobView.substanceTextField.inputView = substancePickerView
        addJobView.pressureTextField.inputView = pressurePickerView
        addJobView.lineTextField.inputView = linePickerView
    }
    
    @objc func addJobPressed ()
    {
        jobNameSelected = addJobView.jobNameTextField.text
        situationSelected = addJobView.situationTextField.text
        substanceSelected = addJobView.substanceTextField.text
        pressureSelected = addJobView.pressureTextField.text
        lineSelected = addJobView.lineTextField.text
        
        riskFactor = calculateRiskFactor(situation: situationSelected!, substance: substanceSelected!, pressure: pressureSelected!, line: lineSelected!)
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let dict = ["jobName": jobNameSelected, "situation": situationSelected, "substance": substanceSelected, "pressure": pressureSelected, "line": lineSelected, "riskFactor": "\(riskFactor!)"]
        self.database.child("jobs/\(uid)").childByAutoId().setValue(dict)
        print("job added")        
        
        self.navigationController?.popViewController(animated: true)
        addJobView.jobNameTextField.text = nil
        addJobView.situationTextField.text = nil
        addJobView.substanceTextField.text = nil
        addJobView.pressureTextField.text = nil
        addJobView.lineTextField.text = nil
    }
    
    func calculateRiskFactor (situation: String, substance: String, pressure: String, line: String) -> Int
    {
        var riskFactor: Int
        riskFactor = 0
        var effectsFactor: Int
        effectsFactor = 0
        var releaseFactor: Int
        releaseFactor = 0
        
        switch situation {
        case "Situation: A":
            switch substance {
            case "Substance Type: 1":
                effectsFactor = 10
            case "Substance Type: 2":
                effectsFactor = 9
            case "Substance Type: 3":
                effectsFactor = 8
            case "Substance Type: 4":
                effectsFactor = 5
            case "Substance Type: 5":
                effectsFactor = 4
            case "Substance Type: 6":
                effectsFactor = 3
            case "Substance Type: 7":
                effectsFactor = 1
            default:
                print("substance error")
            }
        case "Situation: B":
            switch substance {
            case "Substance Type: 1":
                effectsFactor = 10
            case "Substance Type: 2":
                effectsFactor = 8
            case "Substance Type: 3":
                effectsFactor = 6
            case "Substance Type: 4":
                effectsFactor = 4
            case "Substance Type: 5":
                effectsFactor = 3
            case "Substance Type: 6":
                effectsFactor = 2
            case "Substance Type: 7":
                effectsFactor = 1
            default:
                print("substance error")
            }
        case "Situation: C":
            switch substance {
            case "Substance Type: 1":
                effectsFactor = 9
            case "Substance Type: 2":
                effectsFactor = 5
            case "Substance Type: 3":
                effectsFactor = 4
            case "Substance Type: 4":
                effectsFactor = 3
            case "Substance Type: 5":
                effectsFactor = 2
            case "Substance Type: 6":
                effectsFactor = 1
            case "Substance Type: 7":
                effectsFactor = 1
            default:
                print("substance error")
            }
        case "Situation: D":
            switch substance {
            case "Substance Type: 1":
                effectsFactor = 8
            case "Substance Type: 2":
                effectsFactor = 4
            case "Substance Type: 3":
                effectsFactor = 3
            case "Substance Type: 4":
                effectsFactor = 2
            case "Substance Type: 5":
                effectsFactor = 1
            case "Substance Type: 6":
                effectsFactor = 1
            case "Substance Type: 7":
                effectsFactor = 1
            default:
                print("substance error")
            }
        case "Situation: E":
            switch substance {
            case "Substance Type: 1":
                effectsFactor = 7
            case "Substance Type: 2":
                effectsFactor = 3
            case "Substance Type: 3":
                effectsFactor = 2
            case "Substance Type: 4":
                effectsFactor = 1
            case "Substance Type: 5":
                effectsFactor = 1
            case "Substance Type: 6":
                effectsFactor = 1
            case "Substance Type: 7":
                effectsFactor = 1
            default:
                print("substance error")
            }
        default:
            print("situation error")
        }
        
        if substance == "Substance Type: 7"
        {
            if line == "Line size: > or = 8\""
            {
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 8
                case "Pressure: >50":
                    releaseFactor = 6
                case "Pressure: >20":
                    releaseFactor = 4
                case "Pressure: >10":
                    releaseFactor = 2
                case "Pressure: < or = 10":
                    releaseFactor = 1
                default:
                    print("pressure error")
                }
            }
            else
            {
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 3
                case "Pressure: >50":
                    releaseFactor = 3
                case "Pressure: >20":
                    releaseFactor = 2
                case "Pressure: >10":
                    releaseFactor = 2
                case "Pressure: < or = 10":
                    releaseFactor = 1
                default:
                    print("pressure error")
                }
            }
        }
        else
        {
            switch line {
            case "Line size: > or = 8\"":
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 10
                case "Pressure: >50":
                    releaseFactor = 8
                case "Pressure: >20":
                    releaseFactor = 6
                case "Pressure: >10":
                    releaseFactor = 5
                case "Pressure: < or = 10":
                    releaseFactor = 4
                default:
                    print("pressure error")
                }
            case "Line size: 6\"":
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 8
                case "Pressure: >50":
                    releaseFactor = 6
                case "Pressure: >20":
                    releaseFactor = 5
                case "Pressure: >10":
                    releaseFactor = 4
                case "Pressure: < or = 10":
                    releaseFactor = 3
                default:
                    print("pressure error")
                }
            case "Line size: 4\"":
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 6
                case "Pressure: >50":
                    releaseFactor = 4
                case "Pressure: >20":
                    releaseFactor = 3
                case "Pressure: >10":
                    releaseFactor = 3
                case "Pressure: < or = 10":
                    releaseFactor = 2
                default:
                    print("pressure error")
                }
            case "Line size: 2\"":
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 4
                case "Pressure: >50":
                    releaseFactor = 3
                case "Pressure: >20":
                    releaseFactor = 2
                case "Pressure: >10":
                    releaseFactor = 2
                case "Pressure: < or = 10":
                    releaseFactor = 1
                default:
                    print("pressure error")
                }
            case "Line size: < or = 1\"":
                switch pressure {
                case "Pressure: >100":
                    releaseFactor = 3
                case "Pressure: >50":
                    releaseFactor = 2
                case "Pressure: >20":
                    releaseFactor = 2
                case "Pressure: >10":
                    releaseFactor = 1
                case "Pressure: < or = 10":
                    releaseFactor = 1
                default:
                    print("pressure error")
                }
            default:
                print("line error")
            }
            
        }
        
        riskFactor = effectsFactor * releaseFactor
        return riskFactor
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 1
        {
            return situations.count
        }
        else if pickerView.tag == 2
        {
            return substancetypes.count
        }
        else if pickerView.tag == 3
        {
            return pressure.count
        }
        else
        {
            return lines.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView.tag == 1
        {
            return situations[row]
        }
        else if pickerView.tag == 2
        {
            return substancetypes[row]
        }
        else if pickerView.tag == 3
        {
            return pressure[row]
        }
        else
        {
            return lines[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView.tag == 1
        {
            addJobView.situationTextField.text = "Situation: " + situations[row]
            addJobView.situationTextField.resignFirstResponder()
        }
        else if pickerView.tag == 2
        {
            addJobView.substanceTextField.text = "Substance Type: " + substancetypes[row]
            addJobView.substanceTextField.resignFirstResponder()
        }
        else if pickerView.tag == 3
        {
            addJobView.pressureTextField.text = "Pressure: " + pressure[row]
            addJobView.pressureTextField.resignFirstResponder()
        }
        else
        {
            addJobView.lineTextField.text = "Line size: " + lines[row]
            addJobView.lineTextField.resignFirstResponder()
        }
    }
    
}
