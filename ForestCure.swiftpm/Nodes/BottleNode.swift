//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit

class BottleNode: SKNode {
    var bottleNode: SKSpriteNode
    
    override init() {
        bottleNode = SKSpriteNode(
            color: .blue,
            size: CGSize(width: 50, height: 50)
    
        )
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottleNode.size.width, height: bottleNode.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        bottleNode.texture?.filteringMode = .nearest
        
        self.physicsBody = physicsBody
        
        self.addChild(bottleNode)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
