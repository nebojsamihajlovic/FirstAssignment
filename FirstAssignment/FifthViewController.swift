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
    
    let boxSize = 50
    var viewWidth = 0
    var viewHeight = 0
    var viewRect = CGRect()
    
    var counter = 0 { didSet { labelNameAndNumber.text = fullString + String(counter) } }
    
    @IBOutlet weak var labelNameAndNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullString = (name ?? "") + numberOfBoxesString
        counter = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.view.addGestureRecognizer(tap)
        
        viewWidth = Int(self.view.frame.width) - 2 * boxSize
        viewHeight = Int(self.view.frame.height) - 2 * boxSize
        viewRect = CGRect(x: boxSize, y: boxSize, width: viewWidth, height: viewHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        // handling code
        print("Tap on FifthViewController")
        
        let location = sender.location(in: view)
        
        let randomColor = Int(arc4random_uniform(4))
        
        if viewRect.contains(location)
        {
            let addView = UIView(frame: CGRect(x: location.x - CGFloat(boxSize), y: location.y - CGFloat(boxSize), width: CGFloat(2 * boxSize), height: CGFloat(2 * boxSize)))
            
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
        }
        else{
            print("Too close to the borders!")
        }
        
        
    }
    
    func handleTapDeleteBox(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
        counter -= 1
    }
}
