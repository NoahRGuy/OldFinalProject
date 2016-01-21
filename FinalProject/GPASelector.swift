//
//  GPASelector.swift
//  FinalProject
//
//  Created by Noah Guy on 12/8/15.
//  Copyright © 2015 Noah Guy. All rights reserved.
//

import UIKit

class GPASelector: UIViewController {

    @IBOutlet weak var class1Grade: UISegmentedControl!
    @IBOutlet weak var class1Level: UISegmentedControl!
    @IBOutlet weak var class1Name: UITextField!
    @IBOutlet weak var class2Grade: UISegmentedControl!
    @IBOutlet weak var class2Level: UISegmentedControl!
    @IBOutlet weak var class2Name: UITextField!
    @IBOutlet weak var class3Grade: UISegmentedControl!
    @IBOutlet weak var class3Level: UISegmentedControl!
    @IBOutlet weak var class3Name: UITextField!
    @IBOutlet weak var class4Grade: UISegmentedControl!
    @IBOutlet weak var class4Level: UISegmentedControl!
    @IBOutlet weak var class4Name: UITextField!
    @IBOutlet weak var class5Grade: UISegmentedControl!
    @IBOutlet weak var class5Level: UISegmentedControl!
    @IBOutlet weak var class5Name: UITextField!
    @IBOutlet weak var class6Grade: UISegmentedControl!
    @IBOutlet weak var class6Level: UISegmentedControl!
    @IBOutlet weak var class6Name: UITextField!
    @IBOutlet weak var class7Grade: UISegmentedControl!
    @IBOutlet weak var class7Level: UISegmentedControl!
    @IBOutlet weak var class7Name: UITextField!
    @IBOutlet weak var class8Grade: UISegmentedControl!
    @IBOutlet weak var class8Level: UISegmentedControl!
    @IBOutlet weak var class8Name: UITextField!
    var numberOfClasses = 0
    var summativeGPA = 0
    var gridGrades: [UISegmentedControl] = []
    var gridLevel: [UISegmentedControl] = []
    var gridNames: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GPA Calculator"
        gridGrades = [class1Grade, class2Grade, class3Grade, class4Grade, class5Grade, class6Grade, class7Grade, class8Grade]
        gridLevel = [class1Level, class2Level, class3Level, class4Level, class5Level, class6Level, class7Level, class8Level]
        gridNames = [class1Name, class2Name, class3Name, class4Name, class5Name, class6Name, class7Name, class8Name]
        }

        // Do any additional setup after loading the view.
    

func calculateDivider() -> Int{
    var count = 0
    for each in gridNames{
        if each.text != ""{
            count++
        }
    }
    return count
}
    
    func calculateWeighted() -> Double{
        var cumul = 0.0
        numberOfClasses = calculateDivider()
        for each in 0..<numberOfClasses{
            if gridLevel[each].selectedSegmentIndex == 0{
                switch gridGrades[each].selectedSegmentIndex{
                case 0: cumul += 4.0
                case 1: cumul += 3.0
                case 2: cumul += 2.0
                case 3: cumul += 1.0
                case 4: cumul += 0.0
                default: cumul += 0.0
                }
            }
            else if gridLevel[each].selectedSegmentIndex == 1{
                switch gridGrades[each].selectedSegmentIndex{
                case 0: cumul += 4.5
                case 1: cumul += 3.5
                case 2: cumul += 2.5
                case 3: cumul += 1.5
                case 4: cumul += 0.5
                default: cumul += 0.0
                }
            }
            else if gridLevel[each].selectedSegmentIndex == 2{
                switch gridGrades[each].selectedSegmentIndex{
                case 0: cumul += 5.0
                case 1: cumul += 4.0
                case 2: cumul += 3.0
                case 3: cumul += 2.0
                case 4: cumul += 1.0
                default: cumul += 0.0
                }
            }
            
        }
        return cumul / Double(numberOfClasses)
    }
    func calculateUnweighted()-> Double{
        var cumul = 0.0
        numberOfClasses = calculateDivider()
        for each in 0..<numberOfClasses{
            switch gridGrades[each].selectedSegmentIndex{
            case 0: cumul += 4.0
            case 1: cumul += 3.0
            case 2: cumul += 2.0
            case 3: cumul += 1.0
            case 4: cumul += 0.0
            default: cumul += 0.0
            }
        }
        return cumul / Double(numberOfClasses)
    }
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! GPAResult
    nextVC.weighted = "\(calculateWeighted())"
         nextVC.unweighted = "\(calculateUnweighted())"
    }
}

