//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Shivam Maggu on 05/02/19.
//  Copyright © 2019 Shivam Maggu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var round: Int = 0
    var scorer: Int = 0
    var score: Int = 0
    var alertTitle = ""
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scorerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right:14)
        
        let sliderTrackLeftImg = #imageLiteral(resourceName: "SliderTrackLeft")
        let sliderTrackLeftImgresize = sliderTrackLeftImg.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(sliderTrackLeftImgresize, for: .normal)
        
        let sliderTrackRightImg = #imageLiteral(resourceName: "SliderTrackRight")
        let sliderTrackrightImgresize = sliderTrackRightImg.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(sliderTrackrightImgresize, for: .normal)
    }
    
    @IBAction func showAlert() {
        keepScore()
        let message = "You scored \(score) points"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 2...99)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
        scorerLabel.text = String(scoreTab())
    }
    
    func scoreTab() -> Int {
        
        scorer += score
        return scorer
    }
    
    @IBAction func startOver() {
        scorer = 0
        round = 0
        score = 0
        startNewRound()
    }
    
    func keepScore() {
        let difference = abs(currentValue - targetValue)
        score = 100 - difference
        
        
        if difference == 0 {
            alertTitle = "Perfect"
            score += 100
        }
        else if difference > 0 && difference < 10 {
            alertTitle = "Almost Had It"
        }
        else {
            alertTitle = "Not Even Close"
        }
    }
}

