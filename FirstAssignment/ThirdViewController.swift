//
//  ThirdViewController.swift
//  FirstAssignment
//
//  Created by Nebojsa Mihajlovic on 2/11/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var firstName: String?
    var lastName: String?
    var firstNameForNextViewController: String?

    @IBOutlet weak var blueBackView: UIView!
    @IBOutlet weak var buttonBoxing: UIButton!
    @IBOutlet weak var buttonSmileyFace: UIButton!
    @IBOutlet weak var labelHelloNameSurname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        buttonSmileyFace.layer.borderColor = UIColor.black.cgColor
        buttonBoxing.layer.borderColor = UIColor.black.cgColor

        blueBackView.layer.borderWidth = 4
        blueBackView.layer.borderColor = UIColor.black.cgColor

        // concats first and last name if any of these is not empty
        // if both are empty returns Anonymous string
        let fullName = String().combine(firstName: firstName, lastName: lastName)
        labelHelloNameSurname.text = fullName
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        blueBackView.addGestureRecognizer(tap)
        
        // Put Anonymous if first name is empty (even if last name is not)
        if (firstName ?? "").isEmpty
        {
            firstNameForNextViewController = "Anonymous"
        }
        else
        {
            firstNameForNextViewController = firstName!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UILongPressGestureRecognizer) {
        if (sender.state == UIGestureRecognizerState.began)
        {
            print("LongPressGestureRecognizer started")
        }
        if (sender.state == UIGestureRecognizerState.ended)
        {
            performSegue(withIdentifier: ViewControllerSegues.S3toS1Segue.rawValue, sender: nil)
            print("Back button (long press) on ThirdViewController")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let identifier = segue.identifier {
            switch identifier {
            case ViewControllerSegues.S3toS4Segue.rawValue:
                let vc4 = segue.destination as! FourthViewController
                vc4.name = firstNameForNextViewController
            case ViewControllerSegues.S3toS5Segue.rawValue:
                let vc5 = segue.destination as! FifthViewController
                vc5.name = firstNameForNextViewController
            default:
                // should not happen
                print("Default case")
            }
        }
    }
}

extension String {
    func combine(firstName: String?, lastName: String?) -> String {
        return [firstName, lastName].flatMap{$0}.joined(separator: " ")
    }
}
