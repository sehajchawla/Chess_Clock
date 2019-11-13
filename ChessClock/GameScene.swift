//
//  GameScene.swift
//  ChessClock
//
//  Created by Sehaj Chawla on 08/09/18.
//  Copyright © 2018 Sehaj Chawla. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var red_bg = SKSpriteNode()
    var blue_bg = SKSpriteNode()
    var red_time = SKLabelNode()
    var blue_time = SKLabelNode()
    
    var startTime = 100
    
    var countDownRed = 10000000
    var countDownBlue = 10000000
    
    var blueTurn = false
    var redTurn = true
    
    override func didMove(to view: SKView) {
       
        setup()
        
        //making a timer for the countdown
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.startCountDownRed), userInfo: nil, repeats: true)
        
    
        //making a timer for the countdown
            Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.startCountDownBlue), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func startCountDownRed() {
        
        if countDownRed == 10000000 {
            countDownRed = startTime
        }
        
        if countDownRed>0 {
            if redTurn {
                red_time.text = String(countDownRed)
                countDownRed -= 1
            }
            
            
        }
        else {
            red_time.text = String("Time's up!")
        }
        
        
    }
    
    @objc func startCountDownBlue() {
        
        if countDownBlue == 10000000 {
            countDownBlue = startTime
        }
    
        if countDownBlue>0 {
            if blueTurn {
                blue_time.text = String(countDownBlue)
                countDownBlue -= 1
            }
            
            
        }
        else {
            blue_time.text = String("Time's up!")
        }
        
    
    }
    
    func setup() {
    
        red_bg = self.childNode(withName: "bg_red") as! SKSpriteNode
        blue_bg = self.childNode(withName: "bg_blue") as! SKSpriteNode
        
        red_time = self.childNode(withName: "time_red") as! SKLabelNode
        blue_time = self.childNode(withName: "time_blue") as! SKLabelNode
    
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLoaction = touch.location(in: self)
            if atPoint(touchLoaction).name == "bg_red" {
                redTurn = false
                blueTurn = true
            }
            if atPoint(touchLoaction).name == "bg_blue" {
                redTurn = true
                blueTurn = false
            }
        
    }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        
    }
}
