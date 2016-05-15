//
//  ViewController.swift
//  BullsEye
//
//  Created by Shouri on 10/12/15.
//  Copyright © 2015 Shouri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue=0
    var targetValue=0
    var score=0
    var round=0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.newRound()
        self.updateLabel()
        
        let thumbImageNormal=UIImage(named:"SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted=UIImage(named:"SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") { let trackLeftResizable =
            
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            
                let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showAlert(){
        
        var difference=currentValue-targetValue
        if(difference<0){
            difference=difference*(-1)
        }
        let points=100-difference
        score=score+points
        print(String(score)+" "+String(round))
        var title=""
        
        if(difference==0){
            title="Perfect..!"
        }else if(difference<5){
            title="You almost had it..!"
        }else if(difference<10){
            title="Pretty Good..!"
        }else{
            title="Not even close..!"
        }
    
        let message="You scored \(points) points"
        
        let alert=UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action=UIAlertAction(title: "OK", style: .Default, handler: {action in
            self.newRound()
            self.updateLabel()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        
        currentValue=lroundf(slider.value)
    }
    
    @IBAction func reset(){
    
        round=0
        score=0
        newRound()
        updateLabel()
    }
    
    func newRound(){
        
        targetValue=1+Int(arc4random_uniform(100))
        currentValue=50
        slider.value=Float(currentValue)
        round=round+1
    }
    
    func updateLabel(){
        
        targetLabel.text="Put the slider as near as you can to : \(targetValue)"
        roundLabel.text="Round : \(round)"
        scoreLabel.text="Score : \(score)"

    }

}

