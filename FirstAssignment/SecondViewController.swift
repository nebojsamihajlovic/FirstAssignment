//
//  SecondViewController.swift
//  FirstAssignment
//
//  Created by Nebojsa Mihajlovic on 2/10/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // if name is empty - set Anonymous as name
        if (name ?? "").isEmpty
        {
            name = "Anonymous"
        }
        
        labelName.text = name
        
        // Do any additional setup after loading the view, typically from a nib.
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(sender:)))
        swipe.direction = UISwipeGestureRecognizerDirection.left
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipe)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer) {
        // handling code
        performSegue(withIdentifier: ViewControllerSegues.S2toS1Segue.rawValue, sender: nil)
        print("Swipe on SecondViewController")
    }
}
