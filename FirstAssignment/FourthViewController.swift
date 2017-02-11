//
//  FourthViewController.swift
//  FirstAssignment
//
//  Created by Nebojsa Mihajlovic on 2/11/17.
//  Copyright © 2017 Nebojsa Mihajlovic. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    var name: String?
    let numberOfSmilesString = " number of smiles: "
    var fullString = ""
    var counter = 0
    
    let emotionalFaces = [
        FacialExpression(eyes: .closed, eyeBrows: .furrowed, mouth: .frown),
        FacialExpression(eyes: .open, eyeBrows: .normal, mouth: .smile),
        FacialExpression(eyes: .open, eyeBrows: .relaxed, mouth: .smirk),
        FacialExpression(eyes: .open, eyeBrows: .furrowed, mouth: .grin)
    ]

    @IBOutlet weak var labelNamaAndNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullString = (name ?? "") + numberOfSmilesString
        updateNameAndSmileysLabel()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateNameAndSmileysLabel()
    {
        labelNamaAndNumber.text = fullString + String(counter)
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        // handling code
        print("Tap on FourthViewController")
        
        let location = sender.location(in: view)
        
        let face = FaceView(frame: CGRect(x: location.x - 50, y: location.y - 50, width: 100, height: 100))
        
        let facialExpression = FacialExpression.randomFacialExpression()
        
        createSmileyFace(face: face, facialExpression: facialExpression)
 
        view.addSubview(face)
        
        counter += 1
        updateNameAndSmileysLabel()
    }
    
    func getRandomColor() -> UIColor{
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    func createSmileyFace(face: FaceView, facialExpression: FacialExpression)  {
        
        face.color = getRandomColor()
        face.backgroundColor = UIColor.clear
        face.lineWidth = 2
        
        /////////////////////////////////////////////////////////////////
        // block copied from Aleksandar Ristanovic
        switch facialExpression.eyeBrows {
        case .furrowed:
            face.eyeBrowTilt = -0.5
        case .normal:
            face.eyeBrowTilt = 0
        case .relaxed:
            face.eyeBrowTilt = 0.5
        }
        
        switch facialExpression.eyes {
        case .closed:
            face.eyesOpen = false
        case .open:
            face.eyesOpen = true
        case .squinting:
            break
        }
        
        switch facialExpression.mouth {
        case .frown:
            face.mouthCurvature = -1
        case .grin:
            face.mouthCurvature = -0.5
        case .neutral:
            face.mouthCurvature = 0
        case .smile:
            face.mouthCurvature = 1
        case .smirk:
            face.mouthCurvature = -0.5
        }
        // block copied from Aleksandar Ristanovic
        /////////////////////////////////////////////////////////////////
    }

}

extension Int {
    static func random(upper_bound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upper_bound)))
    }
}

extension FacialExpression {
    static func randomFacialExpression() -> FacialExpression {
        let randomEyes = Int.random(upper_bound: 3)
        let randomBrowes = Int.random(upper_bound: 3)
        let randomMouth = Int.random(upper_bound: 5)
        
        return FacialExpression(
            eyes: FacialExpression.Eyes(rawValue: randomEyes)!,
            eyeBrows: FacialExpression.EyeBrows(rawValue: randomBrowes)!,
            mouth: FacialExpression.Mouth(rawValue: randomMouth)!)
    }
}
