//
//  FifthViewController.swift
//  FirstAssignment
//
//  Created by Nebojsa Mihajlovic on 2/11/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    var name: String?
    let numberOfBoxesString = " number of boxes: "
    var fullString = ""
    var counter = 0
    
    @IBOutlet weak var labelNameAndNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullString = (name ?? "") + numberOfBoxesString
        updateNameAndBoxesLabel()
                
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateNameAndBoxesLabel()
    {
        labelNameAndNumber.text = fullString + String(counter)
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        // handling code
        print("Tap on FifthViewController")
        
        let location = sender.location(in: view)
        
        let randomColor = Int(arc4random_uniform(4))
        
        let addView = UIView(frame: CGRect(x: location.x, y: location.y, width: 100, height: 100))
        
        switch randomColor {
        case 0:
            addView.backgroundColor = UIColor.red
        case 1:
            addView.backgroundColor = UIColor.green
        case 2:
            addView.backgroundColor = UIColor.blue
        case 3:
            addView.backgroundColor = UIColor.yellow
        default:
            // should not happen
            addView.backgroundColor = UIColor.blue
        }

        addView.layer.borderWidth = 2
        addView.layer.borderColor = UIColor.black.cgColor

        self.view.addSubview(addView)
        
        let tapDeleteBox = UITapGestureRecognizer(target: self, action: #selector(self.handleTapDeleteBox(sender:)))
        addView.addGestureRecognizer(tapDeleteBox)
        
        counter += 1
        updateNameAndBoxesLabel()
    }
    
    func handleTapDeleteBox(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
        counter -= 1
        updateNameAndBoxesLabel()
    }
}
