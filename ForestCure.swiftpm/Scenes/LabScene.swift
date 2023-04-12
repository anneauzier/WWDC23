//
//  LabScene.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 11/04/23.
//

import Foundation
import SpriteKit

class LabScene: SKScene {
    private var currentNode: SKNode?
    
    override func didMove(to view: SKView) {
        let node = SKSpriteNode(
            color: .red,
            size: CGSize(width: 50, height: 50)
        )
        node.name = "draggable"
        self.addChild(node)
        
        let blueNode = SKSpriteNode(
            color: .blue,
            size: CGSize(width: 50, height: 50)
        )
        blueNode.name = "draggable"
        self.addChild(blueNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchesNodes = self.nodes(at: location)
            for node in touchesNodes.reversed() {
                if node.name == "draggable" {
                    self.currentNode = node
                }
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
}
