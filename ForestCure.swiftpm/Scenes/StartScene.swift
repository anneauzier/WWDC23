//
//  StartScene.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 12/04/23.
//

import Foundation
import SpriteKit

class StartScene: SKScene {
    
    override func sceneDidLoad() {
        
        let startButton = SKButtonNode(imageNamed: "bt", clickAction: {[weak self] in
            let startScene = ForestScene(size: self!.size)
            startScene.scaleMode = self!.scaleMode
            self!.view?.presentScene(startScene)
        })
        startButton.position = CGPoint(x: 0.5, y: 0.5)
        self.addChild(startButton)
    }
}
