//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit

extension LabScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "plantsLab" || contact.bodyA.node?.name == "plantsLab" && contact.bodyB.node?.name == "bottle" {
            print("TOQUEIII")
            self.bottleNode?.bottleNode.color = .green
            self.plantsLabNode?.removeFromParent()
        }
        
        func didEnd(_ contact: SKPhysicsContact) {
            print("NAOOO TOQUEIII")
        }
    }
}
