//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit

class LabPlantsNode: SKNode {
    var labPlantsNode: SKSpriteNode
    
    override init() {
        labPlantsNode = SKSpriteNode(
            color: .red,
            size: CGSize(width: 50, height: 50)
        )
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: labPlantsNode.size.width, height: labPlantsNode.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = false
        physicsBody.categoryBitMask = 1
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 2
        
        labPlantsNode.texture?.filteringMode = .nearest
        
        self.physicsBody = physicsBody
        
        self.addChild(labPlantsNode)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
