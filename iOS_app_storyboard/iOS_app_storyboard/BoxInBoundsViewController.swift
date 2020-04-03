//
//  BoxInBoundsViewController.swift
//  iOS_app_storyboard
//
//  Created by Lim, Sean Jericson Delas Alas on 18/03/2020.
//  Copyright © 2020 deloitte. All rights reserved.
//

import UIKit

class BoxInBoundsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var boxImg: UIImageView!
//
//    var location = CGPoint(x: 0, y: 0)
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch : UITouch = touches.first!
//        location = touch.location(in: self.view)
//        boxImg.center = location
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//         let touch : UITouch = touches.first!
//        location = touch.location(in: self.view)
//         boxImg.center = location
//     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        imgView.layer.cornerRadius = 5.0
        imgView.contentMode = .scaleAspectFit
        imgView.layer.borderWidth = 4
        
        // Do any additional setup after loading the view.
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(BoxInBoundsViewController.wasDragged(_:)))
        boxImg.isUserInteractionEnabled = true
        boxImg.addGestureRecognizer(gesture)
    }
    
    @objc func wasDragged(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self.view)
        let boxImg = gesture.view!
        
        
        if(boxImg.center.x - boxImg.frame.size.width/2 < imgView.frame.minX){
            boxImg.center = CGPoint(x: imgView.frame.minX + boxImg.frame.size.width/2, y: boxImg.center.y + translation.y)
        } else if(boxImg.center.x + boxImg.frame.size.width/2 > imgView.frame.maxX){
            boxImg.center = CGPoint(x: imgView.frame.maxX - boxImg.frame.size.width/2, y: boxImg.center.y + translation.y)
        } else if(boxImg.center.y - boxImg.frame.size.height/2 < imgView.frame.minY){
            boxImg.center = CGPoint(x: boxImg.center.x + translation.x, y: imgView.frame.minY + boxImg.frame.size.height/2)
        }else if(boxImg.center.y + boxImg.frame.size.height/2 > imgView.frame.maxY){
            boxImg.center = CGPoint(x: boxImg.center.x + translation.x, y: imgView.frame.maxY - boxImg.frame.size.height/2)
        }else {
            print("FRAME \(imgView.frame.minX)")
            print("TRANS \(translation.x)")
            print("CENTER \(boxImg.center.x)")
            print("BEFORE \(boxImg.center.x - boxImg.frame.size.width/2)")
            boxImg.center = CGPoint(x: boxImg.center.x + translation.x, y: boxImg.center.y + translation.y)
        }
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
