//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class LostScene: SKScene {
    var restart: SKButtonNode?
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        backgroundColor = .brown
    }
    override func didMove(to view: SKView) {
        restart = SKButtonNode(imageNamed: "inspect", clickAction: {[weak self] in
//            ForestScene.shared.restart()
        })
        restart?.position = CGPoint(x: 0, y: 0)
        restart?.setScale(2)
        self.addChild(restart!)
    }
}
