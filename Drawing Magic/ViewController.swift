//
//  ViewController.swift
//  Drawing Magic
//
//  Created by Stephen Hancocks on 20/04/2017.
//  Copyright © 2017 Twenti3 Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupColoredViews()
        
        coloredView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        coloredView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    func setupColoredViews() {
        let boxDimension = 15
        let width = self.coloredView.frame.size.width
        let height = self.coloredView.frame.size.height
        
        let numberOfColumns = Int(width) / boxDimension
        let numberOfRows = Int(height) / boxDimension
        
        //   var viewCoordinates = [String:UIView]()
        
        for j in 0...numberOfRows {
            for i in 0...numberOfColumns {
                let colorView = UIView()
                colorView.backgroundColor = randomColor()
                colorView.frame = CGRect(x: i * boxDimension, y: j * boxDimension, width: boxDimension, height: boxDimension)
                coloredView.addSubview(colorView)
                //viewCoordinates.["" : colorView]
            }
        }
    }
    
    func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
        for subview in coloredView.subviews{
            if subview.frame.contains(location){
                subview.backgroundColor = .black
            }
        }
    }

    func randomColor() -> UIColor {
        let red = drand48()
        let green = drand48()
        let blue = drand48()
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 0.7 )
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func newButtonPressed(){
        for subview in coloredView.subviews{
            subview.removeFromSuperview()
        }
        setupColoredViews()
    }


}

