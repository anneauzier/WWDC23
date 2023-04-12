//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 04/04/23.
//

import Foundation
import SpriteKit

class PlantsNode: SKNode {
    var spritePlants: SKSpriteNode
    
    override init() {
        spritePlants = SKSpriteNode(imageNamed: "Sword_Stone1")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spritePlants.size.width, height: spritePlants.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        spritePlants.texture?.filteringMode = .nearest
        
        self.physicsBody = physicsBody
        
        self.addChild(spritePlants)
        
        self.spritePlants.run(.repeatForever(.animate(with: .init(withFormat: "Sword_Stone%@", range: 1...6), timePerFrame: 0.2)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
