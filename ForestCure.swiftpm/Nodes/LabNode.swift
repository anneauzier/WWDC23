//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 11/04/23.
//

import Foundation
import SpriteKit

class LabNode: SKNode {
    var spriteLab: SKSpriteNode
    
    override init() {
        spriteLab = SKSpriteNode(imageNamed: "lab")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spriteLab.size.width, height: spriteLab.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        spriteLab.texture?.filteringMode = .nearest
        
        self.physicsBody = physicsBody
        
        self.addChild(spriteLab)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

