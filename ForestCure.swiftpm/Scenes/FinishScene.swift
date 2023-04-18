//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class FinishScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        text()
    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFit
    }
    
    func text(){
        let labelFinish: SKLabelNode = SKLabelNode(text: "")
        labelFinish.verticalAlignmentMode = .center
        labelFinish.fontName = "PixelOperator8"
        labelFinish.fontColor = .black
        labelFinish.fontSize = 14
        labelFinish.position = CGPoint(x: 0, y: 0)
        labelFinish.numberOfLines = 0
        labelFinish.zPosition += 5
        labelFinish.setScale(0.6)
        
        self.addChild(labelFinish)
        
        if ForestScene.shared.plantsCollected.contains("guacoo"){
            backgroundColor = .green
            labelFinish.text = "guacooo"
        }
        if ForestScene.shared.plantsCollected.contains("andirobaa") {
            backgroundColor = .brown
            labelFinish.text = "andirobaaa"
        }
        if ForestScene.shared.plantsCollected.contains("boldoo") {
            backgroundColor = .blue
            labelFinish.text = "boldooo"
        }
        if ForestScene.shared.plantsCollected.contains("canaa") {
            backgroundColor = .red
            labelFinish.text = "cannnaaa"
        }
    }
}


