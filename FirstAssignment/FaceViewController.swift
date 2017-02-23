//
//  ViewController.swift
//  FirstAssignment
//
//  Created by Nebojsa Mihajlovic on 2/10/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: ViewControllerSegues.S1toS3Segue.rawValue, sender: nil)
        print("Click on Login button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(sender:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer) {
        // handling code
        performSegue(withIdentifier: ViewControllerSegues.S1toS2Segue.rawValue, sender: nil)
        print("Swipe on FirstViewController")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case ViewControllerSegues.S1toS2Segue.rawValue:
                let vc2 = segue.destination as! SecondViewController
                vc2.name = textFieldFirstName.text
                
            case ViewControllerSegues.S1toS3Segue.rawValue:
                let vc3 = segue.destination as! ThirdViewController
                vc3.firstName = textFieldFirstName.text
                vc3.lastName = textFieldLastName.text
                
            default:
                // should not happen
                print("Default case")
            }
        }
    }
}
