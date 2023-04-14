//
//  TimerNode.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 13/04/23.
//

import Foundation
import SpriteKit

class TimerNode: SKNode {
    
    var label: SKLabelNode = SKLabelNode()
    var lastUpdatedTime: TimeInterval = 0.0
    var changeTime: TimeInterval = 1 // pulsacao
    var seconds: Int = 60
    var minutes: Int = 1
   
    override init() {
        super.init()
        label.text = "0\(minutes):00"
        label.fontName = "Futura"
        label.fontColor = SKColor(.white)
        label.fontSize = 20
//      label.position.y -= 20
        self.addChild(label)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateTimer(currentTime : TimeInterval) {
        if (currentTime > lastUpdatedTime) {
            if lastUpdatedTime > 0 {
                if seconds == 60 {
                    minutes -= 1
                    if minutes < 0 {
                        minutes = 0
                    }
                }
                if seconds != 0 {
                    seconds -= 1
                }
                label.text = (seconds < 10) ? "0\(minutes):0\(seconds)":"0\(minutes):\(seconds)"
            }
            lastUpdatedTime = currentTime + changeTime
        }
    }
}

